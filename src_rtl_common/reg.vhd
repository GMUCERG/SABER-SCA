library ieee;
use ieee.std_logic_1164.ALL;

entity reg is
    generic (
        W : natural
    );
    port ( clk    : in std_logic;
           rst    : in std_logic;
           en     : in std_logic;
           d      : in std_logic_vector(W-1 downto 0);
           q      : out std_logic_vector(W-1 downto 0)
     );
end reg;

architecture behav of reg is
begin
    g_reg_inst: process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                q <= (others=>'0');
            else
                if en = '1' then
                    q <= d;
                end if;
            end if;
        end if;
    end process;
end behav;