--------------------------------------------------------------------------------
--! @file       widthConverter_tb.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity widthConverter_tb is

end widthConverter_tb;

architecture behav of widthConverter_tb is


signal clk : std_logic := '0';
signal rst : std_logic := '0';
constant period : time := 10 ns;
constant WI : natural := 16;
constant WO : natural := 13;
constant FIFO_LOG2DEPTH : natural := 4;

--width converter1
signal wc_do       :  std_logic_vector(WO-1 downto 0);
signal wc_do_valid :  std_logic := '0';
signal wc_do_ready :  std_logic := '0';  

--width converter 2
signal wc2_do       :  std_logic_vector(WI-1 downto 0);
signal wc2_do_valid :  std_logic := '0';
signal wc2_do_ready :  std_logic := '0'; 

---
-- in_fifo
signal in_fifo_din         : std_logic_vector(WI - 1 downto 0);
signal in_fifo_din_valid   : std_logic := '0';
signal in_fifo_din_ready   : std_logic := '0';
-- Output Port
signal in_fifo_dout        : std_logic_vector(WI - 1 downto 0);
signal in_fifo_dout_valid  : std_logic := '0';
signal in_fifo_dout_ready  : std_logic := '0';

-- out_fifo

-- Output Port
signal out_fifo_dout        : std_logic_vector(WO - 1 downto 0);
signal out_fifo_dout_valid  : std_logic := '0';
signal out_fifo_dout_ready  : std_logic := '0';

type input_arr_type is array (0 to FIFO_LOG2DEPTH**2) of natural;
signal input_arr : input_arr_type := (223, 4444 , 6288, 7999, 1, 334, 2333, 222, others=> 5555);

begin
    
    in_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => WI,
        G_LOG2DEPTH => FIFO_LOG2DEPTH
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
    
    widthConv: entity work.widthConverter(behav)
    generic map (
        WI => WI,
        WO => WO
    )
    port map (
        clk => clk,
        rst => rst,
        di => in_fifo_dout,
        di_ready => in_fifo_dout_ready,
        di_valid => in_fifo_dout_valid,
        do => wc_do,
        do_ready => wc_do_ready,
        do_valid => wc_do_valid
    );
    
    out_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => WO,
        G_LOG2DEPTH => FIFO_LOG2DEPTH
    )
    port map (
        clk => clk,
        rst => rst,
        din => wc_do,
        din_ready => wc_do_ready,
        din_valid => wc_do_valid,
        dout => out_fifo_dout,
        dout_ready => out_fifo_dout_ready,
        dout_valid => out_fifo_dout_valid
    );
    
    widthConv2: entity work.widthConverter(behav)
    generic map (
        WI => WO,
        WO => WI
    )
    port map (
        clk => clk,
        rst => rst,
        di => out_fifo_dout,
        di_ready => out_fifo_dout_ready,
        di_valid => out_fifo_dout_valid,
        do => wc2_do,
        do_ready => wc2_do_ready,
        do_valid => wc2_do_valid
    );

    clk <= not clk after period/2;
    
    stimulus: process
    begin
        rst <= '1';
        wait for 2 * period;
        rst <= '0';
        wait for 5 * period;
        
        ---load input fifo
        for i in 0 to 10 loop
            in_fifo_din <= std_logic_vector(to_unsigned(input_arr(i),WI));
            in_fifo_din_valid <= '1';
            wait for period;
        end loop;
        in_fifo_din_valid <= '0';
        wait for 10 * period;
    
        --drain data
        wc2_do_ready <= '1';
        
        wait;
    end process;

end behav;
