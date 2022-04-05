--------------------------------------------------------------------------------
--! @file       shareMixer.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
-- ShareMixer.vhd
-- Purpose : add shares together when needed
-- Used to add sha3 output shares when generating matrix A which is
-- not sensitive to SCA
-- Need to use blocker registers to prevent data from mixing when not enabled
-- Author : Abubakr Abdulgadir
-- Date : 5/2/2021

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ShareMixer is
    generic(
        W : natural := 64 --input witdth
    );
    port ( 
        clk      : in  std_logic;
        rst      : in  std_logic;
        en       : in  std_logic;
        di0      : in  std_logic_vector(W-1 downto 0);
        di1      : in  std_logic_vector(W-1 downto 0);
        di_valid : in  std_logic;
        di_ready : out std_logic;
        do       : out std_logic_vector(W-1 downto 0);
        do_valid : out std_logic;
        do_ready : in  std_logic    
    );
end ShareMixer;

architecture behav of ShareMixer is
attribute dont_touch : string;
attribute dont_touch of behav : architecture is "true";

signal di0_reg : std_logic_vector(W-1 downto 0);
signal di1_reg : std_logic_vector(W-1 downto 0);

--ctrl
signal en_in_regs : std_logic;
type state_type is (S_EMPTY, S_FULL);
signal state, nx_state : state_type; 
  
begin

    reg_di0: entity work.reg(behav) generic map (W=>W)
    port map (clk=>clk,rst=>rst, en=> en_in_regs, d=> di0, q=> di0_reg);
    
    reg_di1: entity work.reg(behav) generic map (W=>W)
    port map (clk=>clk,rst=>rst, en=> en_in_regs, d=> di1, q=> di1_reg);
  
    do <= di0_reg xor di1_reg;
    
    --ctrl ========================================================================
    state_reg : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_EMPTY; 
            else
                state <= nx_state;
            end if;
        end if;
    end process;
    
    comb: process(all)
    begin
        nx_state <= state;
        en_in_regs <= '0';
        di_ready <= '0';
        do_valid <= '0';
        
        case state is
        
            when S_EMPTY =>
                if en = '1' then --can accept data
                    di_ready <= '1';
                    if di_valid = '1' then
                        en_in_regs <= '1';
                        nx_state <= S_FULL;
                    else
                        nx_state <= S_EMPTY;
                    end if;        
                else
                    nx_state <= S_EMPTY;
                end if;
            
            when S_FULL =>
                do_valid <= '1';
                if en = '1' then  --can accept data
                    if do_ready = '1' then --data read
                        di_ready <= '1';
                        if di_valid = '1' then --new data
                            en_in_regs <= '1';
                            nx_state <= S_FULL;
                        else
                            nx_state <= S_EMPTY;
                        end if;
                    else
                        nx_state <= S_FULL;
                    end if;
                else
                    if do_ready = '1' then
                        nx_state <= S_EMPTY;
                    else
                        nx_state <= S_FULL;
                    end if;
                end if;
                 
            when others =>
                nx_state <= S_EMPTY;
                
        end case;
   end process;
   
    
end behav;