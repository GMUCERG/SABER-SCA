--------------------------------------------------------------------------------
--! @file       saber_tb.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.saber_pkg.all;

use work.encaps_tv_pkg.all;
use work.decaps_tv_pkg.all;


entity saber_tb is

end saber_tb;

architecture behav of saber_tb is


signal clk : std_logic := '0';
signal rst : std_logic := '0';
constant period : time := 10 ns;
--input fifo
signal in_fifo_din         : std_logic_vector(DIN_FIFO_WIDTH - 1 downto 0);
signal in_fifo_din_valid   : std_logic := '0';
signal in_fifo_din_ready   : std_logic := '0';
signal in_fifo_dout        : std_logic_vector(DIN_FIFO_WIDTH - 1 downto 0);
signal in_fifo_dout_valid  : std_logic := '0';
signal in_fifo_dout_ready  : std_logic := '0';
--output fifo
signal out_fifo_din         : std_logic_vector(DIN_FIFO_WIDTH - 1 downto 0);
signal out_fifo_din_valid   : std_logic := '0';
signal out_fifo_din_ready   : std_logic := '0';
signal out_fifo_dout        : std_logic_vector(DIN_FIFO_WIDTH - 1 downto 0);
signal out_fifo_dout_valid  : std_logic := '0';
signal out_fifo_dout_ready  : std_logic := '0';

signal dout_tlast : std_logic;


signal input_arr : input_arr_type := INPUT_DATA;
--signal input_arr : decaps_input_arr_type := DECAPS_INPUT_DATA;

begin
    
    in_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => DIN_FIFO_WIDTH,
        G_LOG2DEPTH => DIN_FIFO_LOG2DEPTH
    )
    port map (
        clk => clk,
        rst => rst,
        din => in_fifo_din,
        din_ready => in_fifo_din_ready,
        din_valid => in_fifo_din_valid,
        dout => in_fifo_dout,
        dout_ready => in_fifo_dout_ready,
        dout_valid => in_fifo_dout_valid
    );
    
    out_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => DIN_FIFO_WIDTH,
        G_LOG2DEPTH => 10
    )
    port map (
        clk => clk,
        rst => rst,
        din => out_fifo_din,
        din_ready => out_fifo_din_ready,
        din_valid => out_fifo_din_valid,
        dout => out_fifo_dout,
        dout_ready => out_fifo_dout_ready,
        dout_valid => out_fifo_dout_valid
    );
    
    
    inst_saber_lw_top: entity work.saber_lw_top(behav)
    port map (
        clk => clk,
        rst => rst,
        --
        din => in_fifo_dout,
        din_valid => in_fifo_dout_valid,
        din_ready => in_fifo_dout_ready,
        
        dout => out_fifo_din,
        dout_valid => out_fifo_din_valid,
        dout_ready => out_fifo_din_ready,
        dout_tlast => dout_tlast
     );
     
    clk <= not clk after period/2;
    
    stimulus: process
    begin
        rst <= '1';
        wait for 2 * period;
        rst <= '0';
        wait for 5 * period;
        
        ---load input fifo
        for i in 0 to 2**DIN_FIFO_LOG2DEPTH-1 loop
            in_fifo_din <= input_arr(i);
            in_fifo_din_valid <= '1';
            wait for period;
        end loop;
        in_fifo_din_valid <= '0';
        wait for 10 * period;
    
        --drain data
        
        wait;
    end process;

end behav;
