--------------------------------------------------------------------------------
--! @file       CBDSampler1.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CBDSampler1 is
    port (
        clk: in std_logic;
        rst: in std_logic;
        rnd : in std_logic_vector(64-1 downto 0);
        rnd_valid : in std_logic;
        rnd_ready : out std_logic;
        di0 : in std_logic_vector(64-1 downto 0);
        di1 : in std_logic_vector(64-1 downto 0);
        di_valid : in std_logic;
        di_ready : out std_logic;
        do0  : out std_logic_vector(13-1 downto 0); --output one sample at a time
        do1  : out std_logic_vector(13-1 downto 0);
        do_valid : out std_logic;
        do_ready : in std_logic
    );
end CBDSampler1;

architecture behav of CBDSampler1 is
attribute dont_touch : string;
attribute dont_touch of behav : architecture is "true";

constant NS : natural := 8;
constant TOTAL_RND : natural := 2*NS*(4*13+4*13);

signal di0_reg : std_logic_vector(64-1 downto 0);
signal di1_reg : std_logic_vector(64-1 downto 0);
attribute dont_touch of di0_reg,di1_reg : signal is "true";


type ns_by_4_arr is array(0 to NS-1) of std_logic_vector(4-1 downto 0);
type ns_by_13_arr is array(0 to NS-1) of std_logic_vector(13-1 downto 0);
type ns_by_52_arr is array(0 to NS-1) of std_logic_vector(52-1 downto 0); --randomness
type ns_by_1_arr is array(0 to NS-1) of std_logic;

signal x0 : ns_by_4_arr;
signal x1 : ns_by_4_arr;
signal y0 : ns_by_4_arr;
signal y1 : ns_by_4_arr;
attribute dont_touch of x0, x1, y0, y1 : signal is "true";

signal x_j0 : ns_by_1_arr;
signal x_j1 : ns_by_1_arr;
signal y_j0 : ns_by_1_arr;
signal y_j1 : ns_by_1_arr;
attribute dont_touch of x_j0, x_j1, y_j0, y_j1 : signal is "true";


signal A0, nx_A0 : ns_by_13_arr;
signal A1, nx_A1 : ns_by_13_arr; 
signal B0 : ns_by_13_arr;
signal B1 : ns_by_13_arr;
signal C0 : ns_by_13_arr;
signal C1 : ns_by_13_arr;

attribute dont_touch of A0, nx_A0, A1, nx_A1 : signal is "true";
attribute dont_touch of B0, B1, C0, C1 : signal is "true";

--randomness
signal rnd_sipo : std_logic_vector(TOTAL_RND-1 downto 0);
signal rnd_reg : std_logic_vector(TOTAL_RND-1 downto 0);

signal en_rnd_sipo : std_logic;
signal en_rnd_reg : std_logic;
signal rnd_cnt, nx_rnd_cnt : unsigned(5-1 downto 0);

signal b2a_x_rnd : ns_by_52_arr;
signal b2a_y_rnd : ns_by_52_arr;
signal b2a_x_rnd_refresh : ns_by_52_arr;
signal b2a_y_rnd_refresh : ns_by_52_arr;

signal b2a_x_rnd_j : ns_by_13_arr;
signal b2a_y_rnd_j : ns_by_13_arr;
signal b2a_x_rnd_refresh_j : ns_by_13_arr;
signal b2a_y_rnd_refresh_j : ns_by_13_arr;


attribute dont_touch of rnd_sipo, rnd_reg, b2a_x_rnd, b2a_y_rnd : signal is "true";
attribute dont_touch of b2a_x_rnd_refresh, b2a_y_rnd_refresh : signal is "true";
attribute dont_touch of b2a_x_rnd_refresh_j, b2a_y_rnd_refresh_j : signal is "true";


--ctrl
signal b2a_start, b2a_done : std_logic;
signal in_reg_en : std_logic;
signal reg_a_en, reg_a_clr : std_logic;
signal rnd_ack : std_logic;
signal rnd_sipo_valid : std_logic;
signal j, nx_j : unsigned(2-1 downto 0);
signal cnt, nx_cnt : unsigned(3-1 downto 0);
type state_type is (S_IDLE, S_WAIT_RND, S_WAIT_IN, S_START_B2A, S_START_B2A1, S_WAIT_B2A, S_ADD, S_OUTPUT);
signal state, nx_state : state_type;
type rnd_state_type is (S_IDLE, S_FILL_SIPO, S_WAIT_ACK);
signal rnd_state, nx_rnd_state : rnd_state_type;

begin

    in_reg_inst : process(clk)
    begin
        if rising_edge(clk) then
            if in_reg_en = '1' then
                di0_reg <= di0;
                di1_reg <= di1;
            end if;
        end if;
    end process;
    
    --input mapping
    in_map: for i in 0 to NS-1 generate
        x0(i) <= di0_reg((2*i+1)*4-1 downto (2*i+0)*4);
        y0(i) <= di0_reg((2*i+2)*4-1 downto (2*i+1)*4);
        
        x1(i) <= di1_reg((2*i+1)*4-1 downto (2*i+0)*4);
        y1(i) <= di1_reg((2*i+2)*4-1 downto (2*i+1)*4);
 
    end generate;
    
    ---randomness mapping=====================================================
        
    r_sipo: process(clk)
    begin
        if rising_edge(clk) then
            if en_rnd_sipo = '1' then
                rnd_sipo <= rnd_sipo(TOTAL_RND-64-1 downto 0) & rnd;
            end if;
        end if;
    end process;
    
    rnd_reg_inst: process(clk)
    begin
        if rising_edge(clk) then
            if en_rnd_reg = '1' then
                rnd_reg <= rnd_sipo;
            end if;
        end if;
    end process;

    b2a_x_rnd_gen : for i in 0 to NS-1 generate
        b2a_x_rnd(i) <= rnd_reg(
                                (i+1)*52-1
                                downto 
                                i*52
                                );
    end generate;
    
    b2a_y_rnd_gen : for i in 0 to NS-1 generate
        b2a_y_rnd(i) <= rnd_reg(
                                (i+1)*52-1 + NS*52
                                downto 
                                i*52       + NS*52
                                );
    end generate;
    
    ---refreshing
    b2a_x_rnd_gen_refresh : for i in 0 to NS-1 generate
        b2a_x_rnd_refresh(i) <= rnd_reg(
                                (i+1)*52-1 + NS*52 + NS*52
                                downto 
                                i*52       + NS*52 + NS*52
                                );
    end generate;
    
    b2a_y_rnd_gen_refresh : for i in 0 to NS-1 generate
        b2a_y_rnd_refresh(i) <= rnd_reg(
                                (i+1)*52-1 + NS*52 + NS*52 + NS*52
                                downto 
                                i*52       + NS*52 + NS*52 + NS*52
                                );
    end generate;

    ----===================================================================================
    --shift by >>j mux
    mux_gen : for i in 0 to NS-1 generate
        ----
        with j select x_j0(i) <=
            x0(i)(0) when "00",
            x0(i)(1) when "01",
            x0(i)(2) when "10",
            x0(i)(3) when others;
        ----
        with j select y_j0(i) <=
            y0(i)(0) when "00",
            y0(i)(1) when "01",
            y0(i)(2) when "10",
            y0(i)(3) when others;
        ----    
        with j select x_j1(i) <=
            x1(i)(0) when "00",
            x1(i)(1) when "01",
            x1(i)(2) when "10",
            x1(i)(3) when others;
        ----
        with j select y_j1(i) <=
            y1(i)(0) when "00",
            y1(i)(1) when "01",
            y1(i)(2) when "10",
            y1(i)(3) when others;
    end generate;

    --rnd mux
    rnd_mux : for i in 0 to NS-1 generate
        ----
        with j select b2a_x_rnd_j(i) <=
            b2a_x_rnd(i)(13-1 downto  0) when "00",
            b2a_x_rnd(i)(26-1 downto 13) when "01",
            b2a_x_rnd(i)(39-1 downto 26) when "10",
            b2a_x_rnd(i)(52-1 downto 39) when others;
        ----
        with j select b2a_y_rnd_j(i) <=
            b2a_y_rnd(i)(13-1 downto  0) when "00",
            b2a_y_rnd(i)(26-1 downto 13) when "01",
            b2a_y_rnd(i)(39-1 downto 26) when "10",
            b2a_y_rnd(i)(52-1 downto 39) when others;
        
        --refresh randomness
        with j select b2a_x_rnd_refresh_j(i) <=
            b2a_x_rnd_refresh(i)(13-1 downto  0) when "00",
            b2a_x_rnd_refresh(i)(26-1 downto 13) when "01",
            b2a_x_rnd_refresh(i)(39-1 downto 26) when "10",
            b2a_x_rnd_refresh(i)(52-1 downto 39) when others;
        ----
        with j select b2a_y_rnd_refresh_j(i) <=
            b2a_y_rnd_refresh(i)(13-1 downto  0) when "00",
            b2a_y_rnd_refresh(i)(26-1 downto 13) when "01",
            b2a_y_rnd_refresh(i)(39-1 downto 26) when "10",
            b2a_y_rnd_refresh(i)(52-1 downto 39) when others;

    end generate;
    
    --b2a
    b2a_x_gen : for i in 0 to 0 generate
    b2a_x_inst: entity work.B2A_Goubin(behav)
        generic map(
            k => 13
        )
        port map(
            clk => clk,
            rst => rst,
            done => b2a_done,
            start => b2a_start,
            rnd => b2a_x_rnd_j(i),
            B0 => (x"000" & x_j0(i)) xor b2a_x_rnd_refresh_j(i), 
            B1 => (x"000" & x_j1(i)) xor b2a_x_rnd_refresh_j(i),
            X0 => B0(i),
            X1 => B1(i)
        );
    end generate;
    
   --b2a
    b2a_x_gen1 : for i in 1 to NS-1 generate
    b2a_x_inst: entity work.B2A_Goubin(behav)
        generic map(
            k => 13
        )
        port map(
            clk => clk,
            rst => rst,
            done => open,
            start => b2a_start,
            rnd => b2a_x_rnd_j(i),
            B0 => (x"000" & x_j0(i)) xor b2a_x_rnd_refresh_j(i), 
            B1 => (x"000" & x_j1(i)) xor b2a_x_rnd_refresh_j(i),
            X0 => B0(i),
            X1 => B1(i)
        );
    end generate;
    
    b2a_y_gen : for i in 0 to NS-1 generate
    b2a_y_inst: entity work.B2A_Goubin(behav)
        generic map(
            k => 13
        )
        port map(
            clk => clk,
            rst => rst,
            start => b2a_start,
            done => open,
            rnd => b2a_y_rnd_j(i),
            B0 => (x"000" & y_j0(i)) xor b2a_y_rnd_refresh_j(i), 
            B1 => (x"000" & y_j1(i)) xor b2a_y_rnd_refresh_j(i),
            X0 => C0(i),
            X1 => C1(i)
        );
    end generate;
    
    gen_add_sub : for i in 0 to NS-1 generate
        nx_A0(i) <= std_logic_vector(unsigned(A0(i)) + unsigned(B0(i)) - unsigned(C0(i)));
        nx_A1(i) <= std_logic_vector(unsigned(A1(i)) + unsigned(B1(i)) - unsigned(C1(i)));
    end generate;
    
    --accumulator reg A
    reg_a : process(clk)
    begin
        if rising_edge(clk) then
            if reg_a_clr = '1' then
                A0 <= (others=>(others=>'0'));
                A1 <= (others=>(others=>'0'));
            else
                if reg_a_en = '1' then
                    A0 <= nx_A0;
                    A1 <= nx_A1;
                end if;
            end if;
        end if;
    end process;
    
    --output mux
    with cnt select do0 <=
        A0(0)(13-1 downto 0) when    "000",
        A0(1)(13-1 downto 0) when    "001",
        A0(2)(13-1 downto 0) when    "010",
        A0(3)(13-1 downto 0) when    "011",
        A0(4)(13-1 downto 0) when    "100",
        A0(5)(13-1 downto 0) when    "101",
        A0(6)(13-1 downto 0) when    "110",
        A0(7)(13-1 downto 0) when   others;
        
    with cnt select do1 <=
        A1(0)(13-1 downto 0) when    "000",
        A1(1)(13-1 downto 0) when    "001",
        A1(2)(13-1 downto 0) when    "010",
        A1(3)(13-1 downto 0) when    "011",
        A1(4)(13-1 downto 0) when    "100",
        A1(5)(13-1 downto 0) when    "101",
        A1(6)(13-1 downto 0) when    "110",
        A1(7)(13-1 downto 0) when   others;
    
    --ctrl===========================================================================
    state_reg : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_IDLE;
                rnd_state <= S_IDLE;
                j <= (others=>'0');
                cnt <= (others=>'0');
                rnd_cnt <= (others=>'0');
            else
                state <= nx_state;
                rnd_state <= nx_rnd_state;
                j <= nx_j;
                cnt <= nx_cnt;
                rnd_cnt <= nx_rnd_cnt;
            end if;
        end if;
    end process;
    
    comb: process(all)
    begin
        --default values
        nx_state <= state;
        nx_j <= j;
        nx_cnt <= cnt;
        in_reg_en <= '0';
        b2a_start <= '0';
        reg_a_en <= '0';
        reg_a_clr <= '0';
        di_ready <= '0';
        do_valid <= '0';
        rnd_ack <= '0';
        en_rnd_reg <= '0';

        case state is
            when S_IDLE =>
                nx_j <= (others=>'0');
                nx_cnt <= (others=>'0');
                reg_a_clr <= '1';
                nx_state <= S_WAIT_IN;
            
            when S_WAIT_IN =>
                di_ready <= '1';
                if di_valid = '1' then
                    in_reg_en <= '1';
                    nx_state <= S_WAIT_RND; 
                else
                    nx_state <= S_WAIT_IN;
                end if;
                
            when S_WAIT_RND =>
                if rnd_sipo_valid = '1' then
                    en_rnd_reg <= '1';
                    rnd_ack <= '1';
                    nx_state <= S_START_B2A1; 
                else
                    nx_state <= S_WAIT_RND;
                end if;
            
            when S_START_B2A1=> --must allow one clk for b2a reagister stage
                nx_state <= S_START_B2A;
            
            when S_START_B2A =>
                b2a_start <= '1';
                nx_state <= S_WAIT_B2A;

            when S_WAIT_B2A =>
                if b2a_done = '1' then
                    nx_state <= S_ADD;
                else
                    nx_state <= S_WAIT_B2A; 
                end if;
                
            when S_ADD =>
                reg_a_en <= '1';
                if j = 3 then
                    nx_j <= (others=>'0');
                    nx_state <= S_OUTPUT;
                else
                    nx_j <= j + 1;
                    nx_state <= S_WAIT_RND;
                end if;
            
            when S_OUTPUT =>
                do_valid <= '1';
                if do_ready = '1' then
                    if cnt = NS-1 then
                        nx_state <= S_IDLE;
                    else
                        nx_cnt <= cnt +1;
                        nx_state <= S_OUTPUT;
                    end if;
                else
                    nx_state <= S_OUTPUT;
                end if;
            
            when others => 
                nx_state <= S_IDLE;
        end case;
    end process;
    
    comb_rnd : process(all)
    begin
        nx_rnd_state <= rnd_state;
        en_rnd_sipo <= '0';
        rnd_ready <= '0';
        rnd_sipo_valid <= '0';
        nx_rnd_cnt <= rnd_cnt;
        
        case rnd_state is
            when S_IDLE =>
                nx_rnd_cnt <= (others=>'0');
                nx_rnd_state <= S_FILL_SIPO;
                
            when S_FILL_SIPO=>
                rnd_ready <= '1';
                if rnd_valid = '1' then
                    en_rnd_sipo <= '1';
                    if rnd_cnt = TOTAL_RND/64-1 then
                        nx_rnd_state <= S_WAIT_ACK;
                    else
                        nx_rnd_cnt <= rnd_cnt + 1;
                        nx_rnd_state <= S_FILL_SIPO;
                    end if;
                else
                    nx_rnd_state <= S_FILL_SIPO;
                end if;

            when S_WAIT_ACK =>
                rnd_sipo_valid <= '1';
                if rnd_ack = '1' then
                    nx_rnd_cnt <= (others=>'0');
                    nx_rnd_state <= S_FILL_SIPO;
                else
                    nx_rnd_state <= S_WAIT_ACK;
                end if;
        end case;
    end process;
    
end behav;