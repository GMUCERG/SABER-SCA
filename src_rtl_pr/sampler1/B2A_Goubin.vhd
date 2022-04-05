--------------------------------------------------------------------------------
--! @file       B2A_Goubin.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use work.Design_pkg.all;

entity B2A_Goubin is
    generic(
        k : natural := 13
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
        start : in std_logic;
        done : out std_logic;
        rnd : in std_logic_vector(k-1 downto 0);
        B0 : in std_logic_vector(k-1 downto 0); -- input x = B0 + B1 
        B1 : in std_logic_vector(k-1 downto 0);
        X0 : out std_logic_vector(k-1 downto 0);
        X1 : out std_logic_vector(k-1 downto 0) --output x = X0+X1
    );
end B2A_Goubin;

architecture behav of B2A_Goubin is
attribute dont_touch : string;
attribute dont_touch of behav : architecture is "true";


signal xp : std_logic_vector(k-1 downto 0);
signal r : std_logic_vector(k-1 downto 0);
signal A : std_logic_vector(k-1 downto 0);
signal gamma : std_logic_vector(k-1 downto 0);

attribute dont_touch of xp, r, A, gamma : signal is "true";

signal xp_xor_gamma : std_logic_vector(k-1 downto 0);
signal xp_xor_gamma_minus_gamma : std_logic_vector(k-1 downto 0);
signal r_xor_gamma : std_logic_vector(k-1 downto 0);
attribute dont_touch of xp_xor_gamma, xp_xor_gamma_minus_gamma, 
                        r_xor_gamma : signal is "true";

signal r_xor_gamma_xor_xp : std_logic_vector(k-1 downto 0);
signal stage0_reg_left : std_logic_vector(k-1 downto 0);
signal stage0_reg_right : std_logic_vector(k-1 downto 0);

attribute dont_touch of r_xor_gamma_xor_xp, stage0_reg_left, 
                          stage0_reg_right : signal is "true";

signal stage1_reg : std_logic_vector(k-1 downto 0);
signal stage2_reg : std_logic_vector(k-1 downto 0);
signal to_stage1_reg : std_logic_vector(k-1 downto 0);
signal to_stage2_reg : std_logic_vector(k-1 downto 0);

attribute dont_touch of stage1_reg, stage2_reg, to_stage1_reg,
                        to_stage2_reg  : signal is "true";


--ctrl
type state_type is (S_S0, S_S1, S_S2, S_DONE);
signal state, nx_state : state_type;

signal en_stage0_reg : std_logic;
signal en_stage1_reg : std_logic;
signal en_stage2_reg : std_logic;

begin
    --REGISTER THESE
    xp <= B0;
    r <= B1;
    gamma <= rnd;
    
    --stage 0=============================================
    xp_xor_gamma <= xp xor gamma;
    xp_xor_gamma_minus_gamma <= std_logic_vector(unsigned(xp_xor_gamma) - unsigned(gamma));
    
    r_xor_gamma <= r xor gamma;
    
    reg0_left : entity work.reg(behav) generic map(W=>k)
    port map (clk=>clk, rst=>'0', en=>en_stage0_reg, d=>xp_xor_gamma_minus_gamma, q=> stage0_reg_left);
    
    reg0_right : entity work.reg(behav) generic map(W=>k)
    port map (clk=>clk, rst=>'0', en=>en_stage0_reg, d=>r_xor_gamma, q=> stage0_reg_right);
    
    reg0_r : entity work.reg(behav) generic map(W=>k)
    port map (clk=>clk, rst=>'0', en=>en_stage0_reg, d=>r, q=> X1);
    
    --stage 1=============================================
    
    to_stage1_reg <= xp xor stage0_reg_right;
    
    reg1 : entity work.reg(behav) generic map(W=>k)
    port map (clk=>clk, rst=>'0', en=>en_stage1_reg, d=>to_stage1_reg, q=> stage1_reg);
    
    --stage 2=============================================
    to_stage2_reg <= std_logic_vector(unsigned(stage1_reg) - unsigned(stage0_reg_right)); 
    
    reg2 : entity work.reg(behav) generic map(W=>k)
    port map (clk=>clk, rst=>'0', en=>en_stage2_reg, d=>to_stage2_reg, q=> stage2_reg);
    
    A <= stage0_reg_left xor xp xor stage2_reg;
    
    X0 <= A;
    
        --ctrl===========================================================================
    state_reg : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_S0;
            else
                state <= nx_state;
            end if;
        end if;
    end process;
    
    comb: process(all)
    begin
        --default values
        nx_state <= state;
        en_stage0_reg <= '0';
        en_stage1_reg <= '0';
        en_stage2_reg <= '0';
        done <= '0';

        case state is
            when S_S0 =>
                if start = '1' then
                    en_stage0_reg <= '1';
                    nx_state <= S_S1;
                else
                    nx_state <= S_S0;
                end if;
        
            when S_S1  =>
                en_stage1_reg <= '1';
                nx_state <= S_S2;
                
            when S_S2 =>
                en_stage2_reg <= '1';
                nx_state <= S_DONE;
            
            when S_DONE =>
                done <= '1';
                nx_state <= S_S0;
                
            when others =>
                nx_state <= S_S0;
            
        end case;
    end process;
    
    
    
end behav;
