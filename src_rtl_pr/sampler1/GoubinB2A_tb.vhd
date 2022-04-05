library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.sec_sampler_pkg.all;

entity GoubinB2A_tb is
end GoubinB2A_tb;

architecture behav of GoubinB2A_tb is

constant period : time := 10 ns;
constant W : natural := 4;


signal clk     : std_logic := '0';
signal rst     : std_logic := '0';
signal start : std_logic := '0';
signal ready   : std_logic := '0';
signal done    : std_logic := '0';
signal ack    : std_logic := '0';


--signal g : std_logic_vector(W-1 downto 0);
--signal xp : std_logic_vector(W-1 downto 0);
--signal r : std_logic_vector(W-1 downto 0);
--signal A : std_logic_vector(W-1 downto 0);
--signal r_out : std_logic_vector(W-1 downto 0);

signal g : rnd_arr_4bit;
signal xp : sample_arr;
signal r : sample_arr;
signal A : sample_arr;
signal r_out : sample_arr;

begin

    uut: entity work.GoubinB2A(behav)
    generic map(
        W => W --mu --Warning: Only supported value
    )
    port map(
        clk    => clk,
        rst    => rst,
        start  => start,
        ready  => ready,
        done   => done,
        ack   => ack,
        g      => g,
        xp_in     => xp,
        r_in      => r,
        A_out      => A,
        r_out => r_out
    );
    
    clk <= not clk after period/2;
    
    stimulus: process
    begin
        rst <= '1';
        wait for 2* period;
        rst <= '0';
        wait for 2* period;
        --
        g(0)     <= "1101";
        xp(0)    <= "1111";
        r(0)     <= "0001";
        
        g(1)     <= "1101";
        xp(1)    <= "1111";
        r(1)     <= "0001";
        start <= '1';
        
        wait for period;
        start<= '0';
        wait for 20 * period;
        ack <= '1';
        wait for period;
        ack <= '0';
        
        wait;
    
    end process;

end behav;

