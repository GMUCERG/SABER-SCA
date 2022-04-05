--------------------------------------------------------------------------------
--! @file       VerifyCompare.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity VerifyCompare is
    port (
        clk  : in std_logic;
        rst  : in std_logic;
        en   : in std_logic;
        di0  : in std_logic_vector(MEM_WIDTH-1 downto 0);
        di1  : in std_logic_vector(MEM_WIDTH-1 downto 0);
        verif_neq  : out std_logic
     );
end VerifyCompare;

architecture behav of VerifyCompare is

signal di0_reg : std_logic_vector(MEM_WIDTH-1 downto 0);
signal di1_reg : std_logic_vector(MEM_WIDTH-1 downto 0);

begin

    reg0 : process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                di0_reg <= di0;
            end if;
        end if;
    end process;
    
    reg1 : process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                di1_reg <= di1;
            end if;
        end if;
    end process;
    
    verif_neq <= '1' when di0_reg /= di1_reg else '0';


end behav;
