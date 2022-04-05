--------------------------------------------------------------------------------
--! @file       poly_mac_lw.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
-- polynomail multiplier
-- performs --res <= res + a*b

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity poly_mac_lw is
    port ( 
        clk : in std_logic;
        rst : in std_logic;
        clr : in std_logic;
        --polynomial ports
        di : in std_logic_vector(COEFF_SIZE-1 downto 0);
        di_valid : in std_logic;
        di_ready : out std_logic;
        do : out std_logic_vector(COEFF_SIZE-1 downto 0);
        do_valid : out std_logic;  
        do_ready : in std_logic
    );
end poly_mac_lw;

architecture behav of poly_mac_lw is
    constant ROWS : natural := N/ROLL;
    constant COLS : natural := ROLL;
    
    type buff_2D_type is array(0 to ROWS-1, 0 to COLS-1) of std_logic_vector(COEFF_SIZE-1 downto 0);
    signal in_buff : buff_2D_type;
    signal in_buff_en : std_logic;
    
    type poly_type is array(0 to N-1) of std_logic_vector(COEFF_SIZE-1 downto 0);
    type poly_seg_type is array(0 to ROWS-1) of std_logic_vector(COEFF_SIZE-1 downto 0);
    signal in_store, in_buff_mux : poly_seg_type;
    signal in_store_we : std_logic;
    signal in_index, nx_in_index : unsigned(INDEX_SIZE downto 0);
    signal out_index, nx_out_index : unsigned(INDEX_SIZE downto 0);
    signal sel_in : std_logic;
    ---out_buff
    signal out_buff : buff_2D_type;
    signal out_buff_en, out_buff_clr : std_logic;
    signal top_coeff_reg : std_logic_vector(COEFF_SIZE-1 downto 0);
    signal top_coeff_reg_en : std_logic;
    --mul and acc
    signal mac_res : poly_seg_type;
    signal mac_res_prev : poly_seg_type;
    --negation
    type negation_sum_type is array(0 to ROWS-1) of std_logic_vector(INDEX_SIZE downto 0); --allow carry bit
    signal neg_sum : negation_sum_type;
    --out mux
    signal to_out_mux : poly_type; 
    ---ctrl
    type state_type is (S_RST, S_IDLE, S_LD_COL, S_PUSH_COL, 
                        S_MUL, S_MUL_DONE,
                        S_OUTPUT);
                        
    signal state, nx_state : state_type;
    signal row_cnt, nx_row_cnt : unsigned(log2_ceil(ROWS)-1 downto 0);
    signal col_cnt, nx_col_cnt : unsigned(log2_ceil(COLS)-1 downto 0);
    signal comp_col_cnt, nx_comp_col_cnt : unsigned(log2_ceil(COLS)-1 downto 0);
    
begin
    
    --input logic =====================================================================
    proc_in_store: process(clk)
    begin
        if rising_edge(clk) then
            if in_store_we = '1' then
                in_store(to_integer(unsigned(row_cnt))) <= di;
            end if;
        end if;
    end process;
    
    gen_in_buff_0: for i in 0 to ROWS-1 generate
        in_buff_mux(i) <= in_store(i) when sel_in = '1' else in_buff(i, COLS-1);
        
        inst_in_buff_0: entity work.reg(behav)
        generic map(W=>COEFF_SIZE)
        port map(clk=>clk, rst=> '0', en=> in_buff_en, d=> in_buff_mux(i), q=> in_buff(i,0));
    end generate;
    
    gen_in_buff: for i in 0 to ROWS-1 generate
        gen_in_buff_row: for j in 1 to COLS-1 generate
            inst_in_buff: entity work.reg(behav)
            generic map(W=>COEFF_SIZE)
            port map(clk=>clk, rst=> '0', en=> in_buff_en, d=> in_buff(i,j-1), q=> in_buff(i,j));
        end generate;
    end generate;
    
    --output logic ======================================================================================
    gen_out_buff_0: for i in 0 to ROWS-1 generate        
        inst_out_buff_0: entity work.reg(behav)
        generic map(W=>COEFF_SIZE)
        port map(clk=>clk, rst=> out_buff_clr , en=> out_buff_en, d=> mac_res(i), q=> out_buff(i,0));
    end generate;
    
    gen_out_buff: for i in 0 to ROWS-1 generate
        gen_out_buff_row: for j in 1 to COLS-1 generate
            inst_out_buff: entity work.reg(behav)
            generic map(W=>COEFF_SIZE)
            port map(clk=>clk, rst=> out_buff_clr, en=> out_buff_en, d=> out_buff(i,j-1), q=> out_buff(i,j));
        end generate;
    end generate;
    
    --feedback logic: rotate out_buff=====================================================================
    gen_feed : for i in 0 to ROWS-2 generate
        mac_res_prev(i) <= out_buff(i+1, COLS-1);
    end generate;    
    
    mac_res_prev(ROWS-1) <= top_coeff_reg when comp_col_cnt = COLS-1 else out_buff(0, COLS-2);
    
    top_coeff: entity work.reg(behav)
    generic map(W=>COEFF_SIZE)
    port map(clk=>clk, rst=> out_buff_clr, en=> top_coeff_reg_en, d=> out_buff(0, COLS-1), q=> top_coeff_reg);
    
    top_coeff_reg_en <= '1' when (out_buff_en = '1' and comp_col_cnt = 0) else '0';
    
    --macs===============================================================================
    gen_macs: for i in 0 to ROWS-1 generate
        mac : entity work.mul_add(behav)
        generic map(W=>COEFF_SIZE)
        port map(a => in_buff(i, COLS-1), b=> di, c=> mac_res_prev(i), 
        negate=> neg_sum(i)(INDEX_SIZE), 
        res=> mac_res(i)); 
    end generate;
    
    -- neagtion logic====================================================================
    gen_neg: for i in 0 to ROWS-1 generate
        neg_sum(i) <= std_logic_vector(comp_col_cnt * to_unsigned(ROWS,log2_ceil(ROWS)+1) 
                      + in_index + to_unsigned(i, log2_ceil(ROWS)));
    end generate;
    
    -- output logic =====================================================================
    gen_to_out_mux_row : for i in COLS-2 downto 0 generate
        gen_to_out_mux_col: for j in 0 to ROWS-1 generate
                to_out_mux((COLS-1-i)*ROWS + j -1) <= out_buff(j, i); 
            end generate;
    end generate;
    
    gen_to_out_mux_last_col : for i in 1 to ROWS-1 generate
        to_out_mux(i-1) <= out_buff(i, COLS-1);
    end generate;
    to_out_mux(N-1) <= out_buff(0, COLS-1);
    --out_mux
    do <= to_out_mux(to_integer(unsigned(out_index)));
    --ctrl===============================================================================
    state_reg: process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_RST;
                in_index <= (others=>'0');
                out_index <= (others=>'0');
                row_cnt <= (others=>'0');
                col_cnt <= (others=>'0');
                comp_col_cnt <= (others=>'0');
            else
                state <= nx_state;
                in_index <= nx_in_index;
                out_index <= nx_out_index;
                row_cnt <= nx_row_cnt;
                col_cnt <= nx_col_cnt;
                comp_col_cnt <= nx_comp_col_cnt;
            end if;
        end if;
    end process;
    
    comb: process(all)
    begin
        --! default values
        nx_state <= state;
        nx_in_index <= in_index;
        nx_out_index <= out_index;
        nx_col_cnt <= col_cnt;
        nx_row_cnt <= row_cnt;
        di_ready <= '0';
        do_valid <= '0';
        in_buff_en <= '0';
        out_buff_en <= '0';
        out_buff_clr <= '0';
        in_store_we <= '0';
        sel_in <= '0';
        nx_comp_col_cnt <= (others=>'0');
        
        case state is
            when S_RST =>
                nx_state <= S_IDLE;
                out_buff_clr <= '1';
            
            when S_IDLE =>
                nx_in_index <= (others=>'0');
                nx_out_index <= (others=>'0');
                nx_row_cnt <= (others=>'0');
                nx_col_cnt <= (others=>'0');
                if clr = '1' then
                    out_buff_clr <= '1';
                end if;
                di_ready <= '1';
                    if di_valid = '1' then
                        in_store_we <= '1';
                        nx_row_cnt <= row_cnt + 1;
                        nx_state <= S_LD_COL;
                    else
                        nx_state <= S_IDLE;
                    end if;
                            
            when S_LD_COL =>
                --read poly1
                di_ready <= '1';
                if di_valid = '1' then
                    in_store_we <= '1';
                    if row_cnt = ROWS-1 then
                        nx_state <= S_PUSH_COL;
                        nx_row_cnt <= (others=>'0');
                    else
                        nx_row_cnt <= row_cnt + 1;
                    end if;
                else 
                    nx_state <= S_LD_COL;
                    nx_row_cnt <= (others=>'0');
                end if;
            
            when S_PUSH_COL=>
                sel_in <= '1';
                in_buff_en <= '1';
                if col_cnt = COLS-1 then
                    nx_state <= S_MUL;
                else
                    nx_col_cnt <= col_cnt + 1;
                    nx_state <= S_LD_COL;
                end if;
                
            when S_MUL =>

                if comp_col_cnt = COLS-1 then
                    di_ready <= '1';
                    if di_valid = '1' then
                        in_buff_en <= '1';
                        out_buff_en <= '1';
                        if in_index = N-1 then
                            nx_state <= S_MUL_DONE;
                        else
                            nx_state <= S_MUL;
                            nx_in_index <= in_index + 1;
                        end if;
                    else
                        nx_state <= S_MUL;
                    end if;
                else
                    if di_valid = '1' then
                        in_buff_en <= '1';
                        out_buff_en <= '1';
                        nx_comp_col_cnt <= comp_col_cnt + 1;
                        nx_state <= S_MUL;
                    end if;
                end if;
            
            when S_MUL_DONE =>
                nx_in_index <= (others=>'0');
                nx_out_index <= (others=>'0');
                nx_row_cnt <= (others=>'0');
                nx_col_cnt <= (others=>'0');
                di_ready <= '1';
                do_valid <= '1';
                if do_ready = '1' then
                    nx_out_index <= out_index + 1;
                    nx_state <= S_OUTPUT;
                else
                    if di_valid = '1' then
                        in_store_we <= '1';
                        nx_row_cnt <= row_cnt + 1;
                        nx_state <= S_LD_COL;
                    else
                        nx_state <= S_MUL_DONE;
                    end if;
                end if;
            
            when S_OUTPUT =>
                do_valid <= '1';
                if do_ready = '1' then
                    if out_index = N-1 then
                        nx_state <= S_IDLE;
                    else
                        nx_out_index <= out_index + 1;
                        nx_state <= S_OUTPUT;
                    end if;
                else
                    nx_state <= S_OUTPUT;
                end if;
            
            when others =>
                nx_state <= S_IDLE;           
        
        end case;
    
    end process;

end behav;
