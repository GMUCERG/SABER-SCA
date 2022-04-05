--------------------------------------------------------------------------------
--! @file       mul_add.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------

--if negate = 1
--    res = c - a*b
--else
--    res = c + a*b
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity mul_add is
    generic (
        W : natural := 13
    );
    port ( a      : in  std_logic_vector(W-1 downto 0);
           b      : in std_logic_vector(W-1 downto 0);
           c      : in std_logic_vector(W-1 downto 0);
           negate : in std_logic;
           res    : out std_logic_vector(W-1 downto 0)
     );
end mul_add;

architecture behav of mul_add is
    signal a_mul_b : unsigned(2*W-1 downto 0);
    signal a_mul_b_trunc : unsigned(W-1 downto 0);
    
    signal tmp_res : std_logic_vector(W-1 downto 0);
begin

    a_mul_b <= unsigned(a) * unsigned(b);
    a_mul_b_trunc <= a_mul_b(W-1 downto 0);
    res <= std_logic_vector(unsigned(c) - a_mul_b_trunc) when negate = '1' else 
           std_logic_vector(unsigned(c) + a_mul_b_trunc);
    
end behav;