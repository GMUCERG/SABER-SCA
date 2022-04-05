library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity ram is
	generic(
	   WIDTH: integer;
	   ADDR_LEN : integer 
	);
	port(
	   clk  : in std_logic;
	   addr : in std_logic_vector(ADDR_LEN -1 downto 0);
       din  : in std_logic_vector(WIDTH -1 downto 0);
	   dout : out std_logic_vector(WIDTH -1 downto 0);
	   we   : in std_logic
	);
end ram;

architecture behav of ram is
    attribute dont_touch : string;
	attribute dont_touch of behav : architecture is "true";
	
	type ram_array is array (0 to 2** ADDR_LEN -1) of std_logic_vector(WIDTH - 1 downto 0); 
	signal ram: ram_array :=(others => (others => '0'));
	
	begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (we = '1') then
				ram(to_integer(unsigned(addr))) <= din;
			end if;
		end if;
	end process;
	
	dout <= ram(to_integer(unsigned(addr)));
	
end behav;
