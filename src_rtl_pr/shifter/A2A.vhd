--------------------------------------------------------------------------------
--! @file       A2A.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity A2A is
    generic (
        N : natural := 1; -- number of words
        K : natural := 3; -- word width
        M : natural := 10
    );
    port ( 
        clk     : in std_logic;
        rst     : in std_logic;
        init    : in std_logic;
        start   : in std_logic;
        ready   : out std_logic;
        R_in    : in std_logic_vector(M+N*K-1 downto 0);
        A_in    : in std_logic_vector(M+N*K-1 downto 0);
        r_rnd       : in std_logic_vector(K-1 downto 0);
        g_rnd       : in std_logic_vector(M+(N-1)*K-1 downto 0);
        A_out   : out std_logic_vector(M-1 downto 0);
        R_out   : out std_logic_vector(M-1 downto 0);
        done    : out std_logic;
        ack     : in std_logic
    );
end A2A;

architecture behav of A2A is
--    attribute keep : string;
attribute dont_touch : string;
attribute dont_touch of behav : architecture is "true";
    constant E : natural := M + (N-1) * K;
    --ram
    signal ram_din, ram_dout : std_logic_vector(E-1 downto 0);
    signal cnt_plus_g_p :  std_logic_vector(N*K-1 downto 0);
    signal ram_addr : std_logic_vector(K-1 downto 0);
    attribute dont_touch of ram_dout, cnt_plus_g_p   : signal is "true";
    signal ram_we, sel_ram_addr : std_logic;
    --cntr
    signal cnt, nx_cnt : unsigned(K-1 downto 0);
    signal  i, nx_i : unsigned(K-1 downto 0);
    signal gcnt, nx_gcnt : unsigned(5-1 downto 0);
    --
    signal g_p : std_logic_vector(N*K-1 downto 0);
    constant K_ZEROS : std_logic_vector(K-1 downto 0) := (others=>'0');
    
    type state_type is (S_IDLE, S_GAMMA0, S_GAMMA, S_GEN_T_TABLE, S_READY,
                        S_CALC1, S_CALC2, S_CALC3);
    signal state, nx_state : state_type;
    -- Gamma caclucaltion and init
    signal Gamma : unsigned(M+N*K-1 downto 0);
    signal g_reg : std_logic_vector(M+N*K-1 downto 0);
    attribute dont_touch of g_reg  : signal is "true";
    signal g_reg_shiftk, g_reg_ld, Gamma_reg_en, Gamma_reg_ld : std_logic;
    --register input since it may change
    signal r_rnd_reg : std_logic_vector(K-1 downto 0);
    signal g_rnd_reg : std_logic_vector(M+(N-1)*K-1 downto 0);
    attribute dont_touch of r_rnd_reg, g_rnd_reg   : signal is "true";
    signal rnd_regs_ld : std_logic;
    ---x_p calc
    --stage 0
    signal r_conc :std_logic_vector(N*K-1 downto 0);
    signal in_mux_a, in_mux_r :std_logic_vector(M+N*K-1 downto 0);
    signal A0_minus_rconc_minus_G :std_logic_vector(M+N*K-1 downto 0);
    attribute dont_touch of in_mux_a, in_mux_r   : signal is "true";
    signal sel_in : std_logic;
    --stage 1
    signal A1, R1, A1_plus_Rl, A1_plus_Rl_mod : std_logic_vector(M+N*K-1 downto 0);
    signal A1_en, R1_en : std_logic;
    signal A1l, R1l :std_logic_vector(K-1 downto 0);
    signal A1h, R1h :std_logic_vector(M+(N-1)*K-1 downto 0);
    attribute dont_touch of A1, R1, A1_plus_Rl, A1_plus_Rl_mod   : signal is "true";
    attribute dont_touch of A1l, R1l  : signal is "true";
    attribute dont_touch of A1h, R1h  : signal is "true";
    --stage 2
    signal A2 :std_logic_vector(M+N*K-1 downto 0);
    signal Ah2_plus_TA : std_logic_vector(E-1 downto 0);
    signal Ah2_plus_TA_mod : std_logic_vector(E-1 downto 0);
    signal A2l :std_logic_vector(K-1 downto 0);
    signal A2h :std_logic_vector(M+(N-1)*K-1 downto 0);
    attribute dont_touch of A2, Ah2_plus_TA, Ah2_plus_TA_mod, A2l, A2h : signal is "true";
    signal A2_en : std_logic;
    
    --stage 3
--    signal A3, A3h_pad :std_logic_vector(E-1 downto 0);
--    signal A3l :std_logic_vector(K-1 downto 0);
    signal Ah3 :std_logic_vector(E-1 downto 0);
    signal Rh3 :std_logic_vector(E-1 downto 0);
    signal Ah3_pad :std_logic_vector(M+N*K-1 downto 0);
    attribute dont_touch of Ah3, Rh3, Ah3_pad : signal is "true";
    signal R3_en : std_logic;    
    signal A3_en : std_logic;    
    --------
    type A_array is array(0 to N-1) of std_logic_vector(M+N*K-1 downto 0);
    signal A1_arr : A_array;
    attribute dont_touch of A1_arr : signal is "true";
    
    type A_array2 is array(0 to N-1) of std_logic_vector(E-1 downto 0);
    signal A2_arr : A_array2;
    attribute dont_touch of A2_arr : signal is "true";

begin
    --  Initialization:  CA table generation and Gamma calculation
    CA_table: entity work.ram(behav)
    generic map (
        WIDTH    => E,
        ADDR_LEN => K
    )
    port map (
        clk  => clk,
        addr => ram_addr,
        din  => ram_din,
        dout => ram_dout,
        we   => ram_we
    );
        
    
    ram_din <=  g_rnd_reg when (('0' & cnt)+unsigned(r_rnd_reg) < 2**K) else 
                std_logic_vector(unsigned(g_rnd_reg) + 1);
    ram_addr <= std_logic_vector(cnt) when sel_ram_addr='1' else A2l;
    
    --Gamma calc =================================================================
    Gamma_reg : process(clk)
    begin
        if rising_edge(clk) then
            if Gamma_reg_ld = '1' then
                Gamma <= (others=>'0'); 
            else
                if Gamma_reg_en = '1' then
                    Gamma <= Gamma + unsigned(g_reg);
                end if;
            end if;
        end if;
    end process;
    
    g_reg_inst: process(clk)
    begin
        if rising_edge(clk) then
            if g_reg_ld = '1' then
                g_reg(K-1 downto 0) <= (others=>'0');
                g_reg(M+(N-1)*K+K-1 downto K) <= g_rnd_reg;
                g_reg(M+N*K-1 downto M+(N-1)*K+K) <= (others=>'0');
            else
                if g_reg_shiftk = '1' then
                    g_reg <= g_reg(M+N*K-1-K downto 0) & K_ZEROS;
                end if;
            end if;
        end if;
    end process;
    
    --end initialization
    
    --rand regs--save input apon initialization
    rnd_regs : process(clk)
    begin
        if rising_edge(clk) then
            if rnd_regs_ld = '1' then
                r_rnd_reg <= r_rnd;
                g_rnd_reg <= g_rnd;
            end if;
        end if;
    end process;
    
    -- calc x_p ===================================================================================
    
--    --============================Stage 0
--    --line 1 and 2
    concat_r : for i in 0 to N-1 generate
        r_conc((i+1)*K-1 downto i*K) <= r_rnd_reg;
    end generate;
    
    A0_minus_rconc_minus_G <= std_logic_vector(unsigned(A_in) - unsigned(r_conc) - unsigned(Gamma));
    
    in_mux_a <= A0_minus_rconc_minus_G when sel_in='1' else  Ah3_pad;
    in_mux_r <= R_in when sel_in='1' else K_ZEROS & R1h;
    
    reg_a1: entity work.reg(behav) generic map (W=>M+N*K)
    port map (clk=>clk, rst=>rst, en=> A1_en, d=> in_mux_a, q=> A1);
    
    reg_r1: entity work.reg(behav) generic map (W=>M+N*K)
    port map (clk=>clk, rst=>rst, en=> R1_en, d=> in_mux_r, q=> R1);
    R1l <= R1(K-1 downto 0); R1h <= R1(M+N*K-1 downto K);
    
    ---=============stage 1
    --line A.val = (A.val + R.l) % 2**(m+(n-i)*k)
    A1l <= A1(K-1 downto 0); A1h <= A1(M+N*K-1 downto K);
    A1_plus_Rl <= std_logic_vector(unsigned(A1) + unsigned(R1l));
    --mod 2^((n-i)*k)
    gen_mod: for j in 0 to N-1 generate
        A1_arr(j)(M+(N-j)*K-1 downto 0) <= A1_plus_Rl(M+(N-j)*K-1 downto 0);
        A1_arr(j)(M+N*K-1 downto M+(N-j)*K) <= (others=>'0');
    end generate;
    A1_plus_Rl_mod <= A1_arr(to_integer(unsigned(i))); --mux
    
    reg_a2: entity work.reg(behav) generic map (W=>M+N*K)
    port map (clk=>clk, rst=>rst, en=> A2_en, d=> A1_plus_Rl_mod, q=> A2);
    
    --==============Stage 2
    --Ah = Ah + CA[Al] mod 2**(m+(n-i-1)*k) 
    A2l <= A2(K-1 downto 0); A2h <= A2(M+N*K-1 downto K);

    Ah2_plus_TA <= std_logic_vector(unsigned(A2h) + unsigned(ram_dout));
    
    gen_mod2: for j in 0 to N-1 generate
        A2_arr(j)(M+(N-j-1)*K-1 downto 0) <= Ah2_plus_TA(M+(N-j-1)*K-1 downto 0);
        A2_arr(j)(M+(N-1)*K-1 downto M+(N-j-1)*K) <= (others=>'0');
    end generate;
    Ah2_plus_TA_mod <= A2_arr(to_integer(unsigned(i))); --mux
    
    -- A = Ah 
    reg_a3: entity work.reg(behav) generic map (W=>E)
    port map (clk=>clk,rst=>rst, en=> A3_en, d=> Ah2_plus_TA, q=> Ah3);
    -- R = Rh
    reg_r3: entity work.reg(behav) generic map (W=>E)
    port map (clk=>clk,rst=>rst, en=> R3_en, d=> R1h, q=> Rh3);
    

    Ah3_pad <= K_ZEROS & Ah3;
    
    A_out <= Ah3(M-1 downto 0);
    R_out <= Rh3(M-1 downto 0);
    


    --ctrl ========================================================================
    state_reg : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_IDLE; 
                cnt <= (others=>'0');
                gcnt <= (others=>'0');
                i <= (others=>'0');
            else
                state <= nx_state;
                cnt <= nx_cnt;
                gcnt <= nx_gcnt;
                i <= nx_i;
            end if;
        end if;
    end process;
    
    comd: process(all)
    begin

        Gamma_reg_en <= '0';
        Gamma_reg_ld <= '0';
        g_reg_ld <= '0';
        g_reg_shiftk <= '0';
        sel_ram_addr <= '0';
        ram_we  <= '0';
        sel_in <= '0';
        nx_state <= state;
        nx_cnt <= cnt;
        nx_gcnt <= gcnt;
        A1_en <= '0';
        A2_en <= '0';
        A3_en <= '0';
        R3_en <= '0';
        nx_i <= i;
        R1_en <= '0';
        done <= '0';
        ready<= '0';
        rnd_regs_ld <= '0';
       
        case state is
            
            when S_IDLE =>
                rnd_regs_ld <= '1';
                if init = '1' then
                    nx_state <= S_GAMMA0;
                else
                    nx_state <= S_IDLE;
                end if;
                
            when S_GAMMA0 =>
                Gamma_reg_ld <= '1';
                g_reg_ld <= '1';
                nx_gcnt <= to_unsigned(1, nx_gcnt'length);
                nx_cnt <= (others=>'0');
                nx_state <= S_GAMMA;
            
            when S_GAMMA =>
                nx_cnt <= (others=>'0');
                g_reg_shiftk <= '1';
                Gamma_reg_en <= '1';
                nx_gcnt <= gcnt + 1;
                if gcnt = N then
                    nx_state <= S_GEN_T_TABLE;
                else
                    nx_state <= S_GAMMA;
                end if; 
            
            when S_GEN_T_TABLE =>
                sel_ram_addr <= '1';
                nx_cnt <= cnt + 1;
                ram_we <= '1';
                if cnt = 2**K -1 then
                    nx_state <= S_READY;
                else
                    nx_state <= S_GEN_T_TABLE;
                end if;
            
            when S_READY =>
                ready <= '1';
                if start = '1' then
                    nx_state <= S_CALC1;
                    nx_i <= (others=>'0');
                    sel_in <= '1';
                    A1_en <= '1';
                    R1_en <= '1';
                else
                    nx_state <= S_READY;
                end if;
            
            when S_CALC1 =>
                A2_en <= '1';           
                nx_state <= S_CALC2;
            
            when S_CALC2 =>
                A3_en <= '1';
                R3_en <= '1';
                nx_state <= S_CALC3;
          
            when S_CALC3 =>
                if i = N-1 then
                    done <= '1';
                    if ack = '1' then
                        nx_state <= S_READY;
                    else
                        nx_state<= S_CALC3;
                    end if;    
                else
                    A1_en <= '1';
                    R1_en <= '1';
                    nx_state <= S_CALC1;
                    nx_i <= i + 1;
                end if;
                
            when others =>
                nx_state <= S_IDLE;
            
        end case;
    end process;   

end behav;
