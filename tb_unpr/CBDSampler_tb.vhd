--------------------------------------------------------------------------------
--! @file       CBDSampler.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.design_pkg.all;

entity CBDSampler_tb is
end CBDSampler_tb;

architecture behav of CBDSampler_tb is

signal clk : std_logic := '0';
signal rst : std_logic := '0';
constant period : time := 10 ns;

-- in_fifo
signal in_fifo_din         : std_logic_vector(CBD_SAMPLER_DI_WIDTH - 1 downto 0);
signal in_fifo_din_valid   : std_logic := '0';
signal in_fifo_din_ready   : std_logic := '0';
-- Output Port
signal in_fifo_dout        : std_logic_vector(CBD_SAMPLER_DI_WIDTH - 1 downto 0);
signal in_fifo_dout_valid  : std_logic := '0';
signal in_fifo_dout_ready  : std_logic := '0';

-- out_fifo

-- Output Port
signal out_fifo_din        : std_logic_vector(CBD_SAMPLER_DO_WIDTH - 1 downto 0);
signal out_fifo_din_valid  : std_logic := '0';
signal out_fifo_din_ready  : std_logic := '0';
signal out_fifo_dout        : std_logic_vector(CBD_SAMPLER_DO_WIDTH - 1 downto 0);
signal out_fifo_dout_valid  : std_logic := '0';
signal out_fifo_dout_ready  : std_logic := '0';

type input_arr_type is array (0 to 15) of std_logic_vector(CBD_SAMPLER_DI_WIDTH-1 downto 0);
signal input_arr : input_arr_type := (x"12243648_62839463",
                                      x"14749628_62839463",
                                      x"12243648_62839463", 
                                      others=>x"00000000_00000000");

begin
    
    in_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => CBD_SAMPLER_DI_WIDTH,
        G_LOG2DEPTH => 4
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
    
    sampler: entity work.CBDSampler(behav)
 
    port map (
        clk => clk,
        rst => rst,
        di => in_fifo_dout,
        di_ready => in_fifo_dout_ready,
        di_valid => in_fifo_dout_valid,
        do => out_fifo_din,
        do_ready => out_fifo_din_ready,
        do_valid => out_fifo_din_valid
    );
    
    out_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => CBD_SAMPLER_DO_WIDTH,
        G_LOG2DEPTH => 0
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

    clk <= not clk after period/2;
    
    stimulus: process
    begin
        rst <= '1';
        wait for 2 * period;
        rst <= '0';
        wait for 5 * period;
        
        ---load input fifo
        for i in 0 to 15 loop
            in_fifo_din <= input_arr(i);
            in_fifo_din_valid <= '1';
            wait for period;
        end loop;
        in_fifo_din_valid <= '0';
        wait for 20 * period;
    
        --drain data
        out_fifo_dout_ready <= '1';
        
        wait;
    end process;

end behav;
