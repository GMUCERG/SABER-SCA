--------------------------------------------------------------------------------
--! @file       poly_mac_tb.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity poly_mac_tb is
end poly_mac_tb;

architecture behav of poly_mac_tb is

--constant Q : natural := 4;
--constant COEFF_SIZE : natural := 2; --log2(Q) --  must be 13
--constant N : natural := 4;
constant INDEX_SIZE : natural := 2;--log2Q(N)
constant period : time := 10 ns;
--
signal clk :std_logic := '0';
signal rst : std_logic;
signal en_input : std_logic := '0';

-- in_fifo
signal in_fifo_din : std_logic_vector(COEFF_SIZE-1 downto 0);
signal in_fifo_din_valid : std_logic := '0';
signal in_fifo_din_ready : std_logic;

signal in_fifo_dout : std_logic_vector(COEFF_SIZE-1 downto 0);
signal in_fifo_dout_valid : std_logic;
signal in_fifo_dout_ready : std_logic := '0';
-- mac
signal mac_di : std_logic_vector(COEFF_SIZE-1 downto 0) := (others=>'0');
signal mac_di_valid : std_logic := '0';
signal mac_di_ready : std_logic;

signal mac_do : std_logic_vector(COEFF_SIZE-1 downto 0);
signal mac_do_valid : std_logic;
signal mac_do_ready : std_logic := '0';
signal mac_clr : std_logic := '0';

--test data
type poly_type is array(0 to N-1) of natural;
signal a_p : poly_type := (1, 1 ,2, 3, 1, 1 ,2, 3);
signal b_p : poly_type := (3, 2, 1, 0, 1, 1 ,2, 3);

begin

in_fifo : entity work.fwft_fifo(structure)
    generic map(
        G_W    =>  COEFF_SIZE,
        G_LOG2DEPTH => 10
    )
    port map(
        clk             => clk,
        rst             => rst,

        -- Input Port
        din             => in_fifo_din,
        din_valid       => in_fifo_din_valid,
        din_ready       => in_fifo_din_ready,

        -- Output Port
        dout            => in_fifo_dout,
        dout_valid      => in_fifo_dout_valid,
        dout_ready      => in_fifo_dout_ready

        --prog_full_th    : in    std_logic_vector(G_LOG2DEPTH - 1 downto 0);
        --prog_full       : out   std_logic
    );


    dut: entity work.poly_mac_lw(behav)
    port map( 
        clk         => clk,
        rst         => rst,
        clr         => mac_clr,
        --polynomial ports
        di          => mac_di,
        di_valid    => mac_di_valid,
        di_ready    => mac_di_ready,
        do          => mac_do,
        do_valid    => mac_do_valid,  
        do_ready    => mac_do_ready
    );
    
    mac_di <= in_fifo_dout;
 
    mac_di_valid <= '1' when (in_fifo_dout_valid = '1' and en_input = '1') else '0';
    in_fifo_dout_ready <= '1' when (mac_di_ready = '1' and en_input = '1') else '0';

    clk <= not clk after period/2;

    stimulus : 
    process
    begin
        rst <= '1';
        wait for period;
        rst <= '0';
        wait for period;
        for i in 0 to N-1 loop
            ---------------load in_fifo
            in_fifo_din <= std_logic_vector(to_unsigned(a_p(i), COEFF_SIZE));
            in_fifo_din_valid <= '1';
            wait for period; 
            in_fifo_din_valid <= '0';
        end loop;
        for i in 0 to N-1 loop
            ---------------load in_fifo
            in_fifo_din <= std_logic_vector(to_unsigned(b_p(i), COEFF_SIZE));
            in_fifo_din_valid <= '1';
            wait for period; 
            in_fifo_din_valid <= '0';
        end loop;

        --end load
        -- run mul_mac
        wait for 5 * period;
        mac_clr <= '1';
        wait for period;
        mac_clr <= '0';
        
        wait for period;
        -- connect in_fifo to mac
        en_input <= '1';
        
        
        mac_do_ready <= '1';
        
        wait;
    end process;
    
end behav;
