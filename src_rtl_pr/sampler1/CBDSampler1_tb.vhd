
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

USE ieee.std_logic_textio.all;

LIBRARY std;
USE std.textio.all;


entity CBDSampler1_tb is

end CBDSampler1_tb;

architecture behav of CBDSampler1_tb is

FILE outFile0: TEXT OPEN WRITE_MODE is "doutFile0.txt";

--constant eq : natural := 13;
--constant mu : natural := 4;
constant period : time := 10 ns;

signal clk : std_logic := '0';
signal rst : std_logic := '0';

signal rnd : std_logic_vector(64-1 downto 0);
signal rnd_valid : std_logic;
signal prng_reseed : std_logic :='0';
signal di0, di1 : std_logic_vector(64-1 downto 0);
signal xt0, yt0 : std_logic_vector(64-1 downto 0);
signal do0, do1 : std_logic_vector(13-1 downto 0);
signal di_valid : std_logic:='0';
signal di_ready : std_logic;
signal do_valid : std_logic;
signal do_ready : std_logic:='0';

type in_arr_type is array (0 to 1) of std_logic_vector(64-1 downto 0);
--signal in_arr0 : in_arr_type :=  (x"8070_6050_4030_2010", x"0807_0605_0403_0201");
--signal in_arr1 : in_arr_type :=  (x"0000_0000_0000_0000", x"0000_0000_0000_0000");

signal in_arr0 : in_arr_type :=  (x"0807_0605_0403_0201", x"8070_6050_4030_2010");
signal in_arr1 : in_arr_type :=  (x"0000_0000_0000_0000", x"0000_0000_0000_0000");

begin
    
   clk <= not clk after period/2;  
   
   --
   cbd: entity work.CBDSampler1(behav)
    port map (
        clk => clk,
        rst => rst,
        rnd => rnd,
        rnd_valid => rnd_valid,
        di0  => di0,
        di1  => di1,
        di_valid => di_valid,
        di_ready => di_ready,
        do0  => do0,
        do1  => do1,
        do_valid => do_valid,
        do_ready => do_ready
    );
    
    trivium_inst : entity work.prng_trivium_enhanced(structural)
    generic map (N => 1)
    port map(
		clk         => clk,
        rst         => rst,
		en_prng     => '1',
        seed        => (others=>'0'),--seed,
		reseed      => prng_reseed,
		reseed_ack  => open,
		rdi_data    => rnd,
		rdi_ready   => '1',
		rdi_valid   => rnd_valid
	);

    stim: process
    begin
        rst <= '1';
        wait for period;
        rst <= '0';
        --resead rng
        wait for 5*period;
        prng_reseed <= '1';
        wait for period;
        prng_reseed <= '0';
        ---
        di_valid <= '0';
        do_ready <= '0';
        wait for 20*period;
        di0 <= in_arr0(0);
        di1 <= in_arr1(0);
        di_valid <= '1';
        wait for period;
        di_valid <= '0';
        wait for 20 * period;
        do_ready <= '1';
        wait for 200 * period;
        --tv 2
        di_valid <= '0';
        do_ready <= '0';
        wait for 20*period;
        di0 <= in_arr0(1);
        di1 <= in_arr1(1);
        di_valid <= '1';
        wait for period;
        di_valid <= '0';
        wait for 20 * period;
        do_ready <= '1';
        
        wait;

    end process;
    
    -------
    
--    writeVec: PROCESS(clk)
    
--    VARIABLE VectorLine0: LINE;
--    VARIABLE VectorLine_sampler: LINE;
    
--    BEGIN
    
--    IF (rising_edge(CLK)) THEN
--         IF (do_valid = '1' and do_ready = '1') then
--              hwrite(VectorLine0, s);        
--              writeline(outFile0, VectorLine0);
--        END IF;
--    END IF;
    
--    ASSERT False
--    Report "Writing Result"
--    SEVERITY NOTE;
--    end process;

        
end behav;