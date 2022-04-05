--------------------------------------------------------------------------------
--! @file       poly_sub.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity polySub is
    port (
        di_a         : in std_logic_vector(ep-1 downto 0);
        di_a_valid   : in std_logic;
        di_a_ready   : out std_logic;
        di_b         : in std_logic_vector(ep-1 downto 0);
        di_b_valid   : in std_logic;
        di_b_ready   : out std_logic;
        do           : out std_logic_vector(ep-1 downto 0);
        do_valid     : out std_logic;
        do_ready     : in std_logic
    
    );
end polySub;

architecture behav of polySub is

begin

    do <= std_logic_vector(unsigned(di_a) - unsigned(di_b));
    
    do_valid <= di_a_valid and di_b_valid;
    
    di_a_ready <= do_ready and do_valid;
    di_b_ready <= do_ready and do_valid;
    

end behav;
