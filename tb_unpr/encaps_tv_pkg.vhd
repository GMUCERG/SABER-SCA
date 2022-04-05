--------------------------------------------------------------------------------
--! @file       decaps_tv_pkg.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

package encaps_tv_pkg is


    type input_arr_type is array (0 to 2**DIN_FIFO_LOG2DEPTH) of std_logic_vector(DIN_FIFO_WIDTH-1 downto 0);
    constant INPUT_DATA : input_arr_type := 
    (
    --opcode =================================================================================================
    OPCODE_ENCAPS,
    --PK======================================================================================================
    --b polycev
    x"aeeb", x"17a9", x"b67a", x"db0c", x"e521", x"dfb6", x"9f96", x"af19", x"0773", x"a31f", x"0b05", x"a84c", 
    x"7e90", x"fe9b", x"5a38", x"e4e7", x"f1e9", x"4ab6", x"3bbf", x"8306", x"9d61", x"4612", x"a7d3", x"ce24", 
    x"932c", x"b5c4", x"6277", x"59d8", x"be47", x"89a2", x"4269", x"aae8", x"7b1e", x"f3b2", x"baff", x"a251", 
    x"d996", x"917f", x"c333", x"c7a8", x"fd4d", x"e318", x"e58d", x"24b5", x"410e", x"85e8", x"6891", x"8405", 
    x"c624", x"df5c", x"d19c", x"5290", x"f802", x"5a8a", x"72f7", x"851f", x"4106", x"f274", x"27f9", x"7db9", 
    x"8169", x"5fce", x"1f26", x"1fa2", x"befa", x"bb74", x"793b", x"23b3", x"48a5", x"a722", x"a605", x"81a6", 
    x"c257", x"d1ee", x"7af3", x"5c9f", x"a169", x"a6d5", x"c167", x"35ba", x"bfd4", x"f16f", x"1fd2", x"bb37", 
    x"0e09", x"5593", x"eedd", x"3a4b", x"a887", x"e8cc", x"a138", x"a7b0", x"a7f6", x"5147", x"484b", x"08b2", 
    x"d398", x"af64", x"a1cc", x"dc32", x"520f", x"12fb", x"3c07", x"5d23", x"1f28", x"037b", x"1b34", x"1b0a", 
    x"a60b", x"64ee", x"d6dc", x"41d6", x"3d38", x"4782", x"881e", x"6a2a", x"9f95", x"a88e", x"7542", x"a557", 
    x"f0a3", x"65ee", x"f005", x"d5d4", x"992c", x"1f05", x"feb6", x"a9c2", x"734e", x"8361", x"2667", x"a9b8", 
    x"f427", x"a858", x"189d", x"58d0", x"9e9f", x"fbc2", x"1928", x"57e1", x"976f", x"ec72", x"620b", x"298c", 
    x"7de8", x"35fc", x"a2ed", x"ba6a", x"d51d", x"a966", x"6dca", x"05ba", x"9c51", x"cfcd", x"0964", x"5b22", 
    x"7618", x"3f15", x"ca43", x"2d0b", x"96ef", x"a597", x"3aa5", x"9b44", x"e146", x"a7ea", x"3fbc", x"4e05", 
    x"a85d", x"b63a", x"088c", x"a06e", x"a9c9", x"328c", x"6529", x"b4e9", x"6d46", x"c652", x"831b", x"23c6", 
    x"ee45", x"8ba2", x"4ce1", x"c9b5", x"456f", x"1e47", x"eff7", x"7660", x"e3af", x"3fdf", x"a8a7", x"9988", 
    x"2ec6", x"bf32", x"bfdc", x"88df", x"6497", x"1345", x"8c80", x"a210", x"bf09", x"38fa", x"eaf7", x"e694", 
    x"0fac", x"9b13", x"b8c3", x"ffad", x"afc4", x"7436", x"3056", x"3dbe", x"50a7", x"7738", x"977e", x"fe9c", 
    x"c4c0", x"19bd", x"0e47", x"dc1c", x"292f", x"dc86", x"42b2", x"70fb", x"567f", x"2e33", x"3b75", x"b90d", 
    x"688e", x"08c1", x"8797", x"f1c2", x"b3db", x"8e3f", x"1c02", x"8952", x"44d6", x"650d", x"2761", x"e64f", 
    x"14ff", x"0186", x"c9bf", x"3a39", x"501a", x"dfa9", x"111a", x"74a2", x"8047", x"f06b", x"1249", x"c2e9", 
    x"3c10", x"e735", x"8eba", x"43c9", x"b432", x"aeda", x"d7a0", x"9a9f", x"ad21", x"457e", x"5709", x"46b1", 
    x"3b8d", x"47a4", x"e677", x"4f5e", x"b434", x"8010", x"90ce", x"3b0d", x"46cb", x"69eb", x"a271", x"4651", 
    x"5bbd", x"1da9", x"ac0c", x"c8e1", x"3b30", x"1062", x"bcf1", x"49e6", x"fdcc", x"ed92", x"6110", x"8ace", 
    x"8f46", x"89e6", x"e5c8", x"e2de", x"2d8c", x"f75c", x"881a", x"b3c1", x"42fd", x"0382", x"979b", x"0d29", 
    x"23e9", x"5adc", x"e002", x"1cce", x"6e6f", x"54af", x"4b50", x"7a22", x"1844", x"193c", x"794a", x"f59c", 
    x"fb70", x"7d01", x"526a", x"88bb", x"f8df", x"c062", x"b3fd", x"df17", x"5bdb", x"4c3a", x"9a57", x"0099", 
    x"4723", x"a005", x"87cd", x"6a8a", x"f123", x"06e9", x"cb4b", x"8e15", x"d792", x"68e4", x"5f75", x"e93c", 
    x"2c6d", x"24d9", x"930e", x"6be9", x"c6ef", x"4273", x"6f23", x"b74b", x"54fe", x"a535", x"f092", x"6d95", 
    x"70f2", x"89d9", x"1cc2", x"6309", x"c65e", x"c95a", x"fbb2", x"ad42", x"d6ab", x"89a4", x"a8e3", x"fbad", 
    x"3bf1", x"5ec5", x"7e96", x"ba72", x"cda5", x"85cc", x"f504", x"5ead", x"80e1", x"ffcc", x"8f56", x"bc0c", 
    x"33cf", x"fe02", x"90d2", x"45db", x"ad11", x"1281", x"cf69", x"ec41", x"ae9c", x"5b0e", x"b192", x"f154", 
    x"d5c6", x"38d2", x"f64d", x"cf29", x"00aa", x"c0da", x"7e54", x"d32f", x"fe7c", x"dae3", x"d5d7", x"33a0", 
    x"37f6", x"cdcc", x"53ae", x"e04d", x"e609", x"2a92", x"873d", x"17d6", x"6676", x"5246", x"5c88", x"5ea5", 
    x"9ab3", x"bbab", x"ecab", x"a966", x"71cd", x"2d82", x"5f48", x"c03d", x"f6a0", x"68dd", x"2559", x"26bf", 
    x"e434", x"5388", x"2cc2", x"7cc0", x"1ab1", x"5e3f", x"3db9", x"db07", x"84b9", x"6397", x"0134", x"eae8", 
    x"0716", x"3fb0", x"770c", x"03d8", x"7eef", x"fd61", x"1f22", x"b2c0", x"853a", x"2436", x"2fd9", x"d695", 
    x"5e06", x"b278", x"47ec", x"90ac", x"c123", x"c0dc", x"276b", x"9ec9", x"4960", x"feb5", x"f667", x"914b", 
    x"e730", x"7641", x"185c", x"a9ad", x"f7be", x"6f29", x"eb4a", x"745c", x"195e", x"a94c", x"bb2d", x"02d6", 
    x"f4f0", x"c636", x"f10c", x"e6e8", x"012d", x"5ef9", x"9fcd", x"a0cb", x"6f4f", x"b53c", x"bfc1", x"397e", 
    --SEED_A
    x"8807", x"a700", x"66a7", x"5ebe", x"4a24", x"fcd3", x"9ee2", x"8339", x"fe9c", x"c982", x"abaa", x"7cf2", 
    x"2fcf", x"53c6", x"2d56", x"8f93",
    --END_PK===================================================================================================

   
    --message (m)==============================================================================================
    x"9778", x"8071", x"ad42", x"0b01", x"8bc9", x"5de9", x"dd13", x"f0de", 
    x"3365", x"95ab", x"6f42", x"c7af", x"7649", x"99cd", x"b7ad", x"6245",
    
    others=>x"0000"
    );
    

end encaps_tv_pkg;

package body encaps_tv_pkg is
end package body;
