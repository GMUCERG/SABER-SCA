library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sha3Core_tb is
end sha3Core_tb;

architecture behav of sha3Core_tb is

signal clock :  std_logic := '0';
signal reset :  std_logic := '0';
signal io_din_ready :  std_logic;
signal io_din_valid :  std_logic := '0';
signal io_din_bits_data_0 :  std_logic_vector(63 downto 0) := (others=>'0');
signal io_din_bits_tlast :  std_logic := '0';
signal io_command_ready :  std_logic;
signal io_command_valid :  std_logic := '0';
signal io_command_bits_mode :  std_logic_vector(1 downto 0) := (others=>'0');
signal io_command_bits_numSqueezeWords :  std_logic_vector(11 downto 0) := (others=>'0');
signal io_dout_ready :  std_logic := '0';
signal io_dout_valid :  std_logic;
signal io_dout_bits_0 :  std_logic_vector(63 downto 0);
signal io_dout_index : std_logic_vector(11 downto 0);
----
constant period : time := 10 ns;
    
component sha3Core is
  port (
    clock : in std_logic;
    reset : in std_logic;
    io_din_ready : out std_logic;
    io_din_valid : in std_logic;
    io_din_bits_data_0 : in std_logic_vector(63 downto 0);
    io_din_bits_tlast : in std_logic;
    io_command_ready : out std_logic;
    io_command_valid : in std_logic;
    io_command_bits_mode : in std_logic_vector(1 downto 0);
    io_command_bits_numSqueezeWords : in std_logic_vector(11 downto 0);
    io_dout_ready : in std_logic;
    io_dout_valid : out std_logic;
    io_dout_bits_0 : out std_logic_vector(63 downto 0);
    io_dout_index : out std_logic_vector(11 downto 0)

  );
 end component;

    
begin

    sha3 : sha3Core
    port map(
        clock => clock,
        reset => reset,
        io_din_ready => io_din_ready,
        io_din_valid => io_din_valid,
        io_din_bits_data_0 => io_din_bits_data_0,
        io_din_bits_tlast => io_din_bits_tlast,
        io_command_ready => io_command_ready,
        io_command_valid => io_command_valid,
        io_command_bits_mode => io_command_bits_mode,
        io_command_bits_numSqueezeWords => io_command_bits_numSqueezeWords,
        io_dout_ready => io_dout_ready,
        io_dout_valid => io_dout_valid,
        io_dout_bits_0 => io_dout_bits_0,
        io_dout_index => io_dout_index 
    );
    
    clock <= not clock after period/2;
    
    stimulus: process
    begin
                reset <= '1';
        wait for 2 * period;
        reset <= '0';
        io_dout_ready <= '1';
        wait for 10 * period;
        -- send cmd
        io_command_valid <= '1';
        wait for period;
        io_command_valid <= '0';
        wait for 5 * period;
        ---- send data

        --blk1
        wait for period;
--        io_din_bits_data_0 <= x"0000000000000000";
        io_din_bits_data_0 <= x"1111111111111111";
--        io_din_bits_data_0 <= x"0806040204030201";
--        io_din_bits_data_0 <= x"0102030402040608";
        io_din_valid <= '1';
        wait for period;
        io_din_valid <= '0';
--      --finalize
        wait for period;
        io_din_valid <= '1';
        io_din_bits_tlast <= '1';
        wait for period;
        io_din_bits_tlast <= '0';
        io_din_valid <= '0';       
        
        
        wait;
    end process;

end behav;
