--------------------------------------------------------------------------------
--! @file       HW.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
-- Hamming Weight module
-- Author Abubakr Abdulgadir

-- 2/20/2021
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity HW is
    generic (
        W : natural :=4 --WARNING 4 is the oly valid value
    );
    port ( 
        
        di : in  std_logic_vector(W-1 downto 0);
        do : out std_logic_vector(W-1 downto 0)
    );
end HW;

architecture behav of HW is

    
begin
    
    do <= std_logic_vector(unsigned("000" & di(0 downto 0)) + unsigned(di(1 downto 1)) + 
                           unsigned(di(2 downto 2)) + unsigned(di(3 downto 3))   ); 

end behav;
