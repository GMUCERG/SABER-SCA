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

package decaps_tv_pkg is


    type decaps_input_arr_type is array (0 to 2**DIN_FIFO_LOG2DEPTH) of std_logic_vector(DIN_FIFO_WIDTH-1 downto 0);
    constant DECAPS_INPUT_DATA : decaps_input_arr_type := 
    (
    --opcode =================================================================================================
    OPCODE_DECAPS,
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
    
    --SK=======================================================================================================
    --S polyvec
    x"00f1",x"012e",x"101f",x"f3fe",x"3fde",x"1021",x"0f22",x"01f0",
    x"0c0e",x"0f01",x"e01f",x"de0d",x"0fff",x"1eff",x"ff00",x"2110",
    x"2110",x"000f",x"3111",x"ff11",x"1f1d",x"1e0f",x"0e1f",x"01ee",
    x"1000",x"0ff1",x"1f01",x"0ed1",x"20e3",x"310e",x"1110",x"0edf",
    x"f10e",x"01ef",x"0f2f",x"3e14",x"212f",x"0f03",x"0fe0",x"f20f",
    x"fe11",x"020d",x"1202",x"0efe",x"e3f0",x"1e00",x"0111",x"f200",
    x"101f",x"101f",x"00ed",x"0ffe",x"1f11",x"ee21",x"02e1",x"0f1e",
    x"f1ff",x"1e2e",x"f001",x"1ff0",x"0f12",x"1f21",x"f112",x"1f00",
    
    x"100f",x"100f",x"01f3",x"1e01",x"fe11",x"1df2",x"001f",x"de31",
    x"f000",x"10e0",x"0000",x"1021",x"2f0d",x"12ee",x"0221",x"e00e",
    x"2111",x"e111",x"f210",x"ff22",x"003f",x"001e",x"1010",x"0ff0",
    x"ff11",x"f2e0",x"2f0e",x"0002",x"0f00",x"f010",x"1200",x"11f1",
    x"1f30",x"2ff3",x"0100",x"e03f",x"2e0e",x"12d1",x"00f1",x"11f0",
    x"f22e",x"0013",x"e112",x"011f",x"f1f0",x"ef2d",x"d1ef",x"0211",
    x"0011",x"fff1",x"3011",x"0001",x"f20f",x"2f1e",x"1220",x"10d1",
    x"2000",x"2110",x"1100",x"1ff0",x"4e20",x"efef",x"12f0",x"e0f1",
    
    x"f20e",x"eee0",x"f020",x"01ff",x"e032",x"22d1",x"ff11",x"000f",
    x"1100",x"fee1",x"1d20",x"1110",x"d1ff",x"eff2",x"e02f",x"1f11",
    x"21fc",x"f001",x"0101",x"1d1e",x"ef01",x"f2f1",x"e20e",x"10f0",
    x"f2c1",x"111e",x"ff01",x"0ef0",x"031e",x"f02e",x"f0f0",x"fe2e",
    x"0e2f",x"d0fd",x"ff11",x"ef00",x"1d1e",x"ffee",x"10f1",x"f000",
    x"1210",x"113f",x"0e11",x"e0fe",x"fffe",x"f101",x"0111",x"110f",
    x"2f1f",x"1021",x"011e",x"e011",x"2012",x"01f3",x"1110",x"0201",
    x"2e1f",x"10f1",x"ffe0",x"efee",x"ef02",x"1fe0",x"01ff",x"21ef",

    --pkh
    x"79ba", x"7314", x"cebe", x"e997", x"f1ac", x"e68b", x"3987", x"187b", 
    x"7660", x"aa4b", x"974e", x"55f3", x"a7df", x"c8f0", x"00ca", x"c33a",
   
    --z
    x"f0b2", x"f504", x"5f43", x"c410", x"45cd", x"4811", x"7a44", x"9bfd", 
    x"b299", x"7709", x"e00d", x"3ad0", x"b7cd", x"6bbc", x"71e5", x"8c68",
   
    --cipher = (Bp, cm)=========================================================
    --Bp
    -----Bp0
    x"5d4d", x"4b2b", x"29bf", x"93ef", x"4362", x"3017", x"470f", x"7c76", 
    x"a8a3", x"0a2a", x"1cf0", x"63cd", x"57f2", x"6440", x"ef29", x"ee31", 
    x"6b39", x"1367", x"0b76", x"84bb", x"05b4", x"a944", x"c640", x"1090", 
    x"11ad", x"07c6", x"320d", x"fac0", x"2a8d", x"60bc", x"0dc5", x"f351", 
    x"06e6", x"09c5", x"f254", x"cf60", x"0bbb", x"1dfd", x"d797", x"7543", 
    x"26e6", x"7eb8", x"9b05", x"fc42", x"bedf", x"08e2", x"a01e", x"7020", 
    x"633b", x"0dce", x"e876", x"05ca", x"1927", x"a0db", x"92db", x"feb4", 
    x"9059", x"baab", x"8562", x"1f7a", x"19aa", x"ff63", x"fa63", x"b212", 
    x"3f3f", x"1072", x"c5f2", x"802c", x"5029", x"4309", x"74d6", x"233f", 
    x"8731", x"e3d7", x"9c98", x"03f8", x"862f", x"f4d3", x"523b", x"f556", 
    x"50c2", x"c0ba", x"2708", x"5e45", x"54d8", x"ddf7", x"c705", x"1a5f", 
    x"b37c", x"573f", x"1f1c", x"e276", x"4c0d", x"12f9", x"0ce7", x"bde4", 
    x"754a", x"4894", x"ddea", x"1161", x"fe9b", x"0f27", x"3c8b", x"eba5", 
    x"4a80", x"8054", x"1ffc", x"e844", x"014b", x"6df2", x"ba76", x"6eb8", 
    x"75ff", x"aeeb", x"8a65", x"f5f2", x"8c8a", x"623e", x"f35a", x"b231", 
    x"3439", x"655f", x"63af", x"eb21", x"45cd", x"18dc", x"e07a", x"694e", 
    x"72ab", x"0288", x"1c6c", x"c6d0", x"3786", x"3391", x"62b6", x"7700", 
    x"5cc9", x"f859", x"849c", x"0351", x"5153", x"2d2c", x"dc32", x"c092", 
    x"1214", x"d456", x"e2b6", x"574c", x"c244", x"86bf", x"5766", x"52e5", 
    x"f509", x"067a", x"ce33", x"44c6", x"bd3e", x"910f", x"fea9", x"c454",
    ------Bp1
    x"1a43", x"979b", x"f4cf", x"e140", x"077d", x"b04f", x"e0b3", x"d6cb", 
    x"0447", x"50b4", x"178d", x"4b85", x"913a", x"70af", x"5b74", x"2c5f", 
    x"ab0a", x"5968", x"4219", x"dd0c", x"4850", x"d460", x"ae14", x"d975", 
    x"d21f", x"0e9d", x"839e", x"a924", x"e1d0", x"8b44", x"2ccb", x"1c7d", 
    x"1225", x"c76d", x"9425", x"d858", x"52f0", x"ca2a", x"b725", x"6a17", 
    x"b515", x"6638", x"fa63", x"5563", x"8189", x"8ced", x"7536", x"6be4", 
    x"1785", x"c827", x"5704", x"d157", x"3d25", x"1e2a", x"4718", x"4683", 
    x"6272", x"4649", x"0b4c", x"4de3", x"15a7", x"5d98", x"5376", x"b42c", 
    x"d4c7", x"a2b9", x"d6b3", x"08f8", x"546b", x"2870", x"7e99", x"eba8", 
    x"e47e", x"538b", x"b82e", x"50d9", x"e37b", x"04e8", x"d315", x"f0d8", 
    x"8b2b", x"34bf", x"56ee", x"39fa", x"1b9f", x"7e0e", x"2bd5", x"b700", 
    x"6bf6", x"1398", x"d0e4", x"31a3", x"8a98", x"1d73", x"1141", x"c095", 
    x"9711", x"520e", x"4d9e", x"ca35", x"1486", x"5036", x"82b6", x"050a", 
    x"d6a3", x"e606", x"1e72", x"0643", x"5927", x"0d64", x"4340", x"c927", 
    x"5b28", x"669f", x"95fd", x"6c8d", x"39ad", x"9b44", x"15f4", x"3621", 
    x"be44", x"25c5", x"6dd8", x"6152", x"d1f2", x"2bd1", x"b384", x"e72d", 
    x"a039", x"8df0", x"0f75", x"0ca2", x"f8d1", x"074a", x"0949", x"b20e", 
    x"9fa7", x"6295", x"d5f8", x"1ccd", x"48c6", x"3c11", x"981e", x"f6e9", 
    x"4326", x"de2d", x"c5c5", x"4b7b", x"ff17", x"71f7", x"e7d7", x"b954", 
    x"18b0", x"0b8f", x"70b8", x"280b", x"97cc", x"cb1d", x"b8aa", x"c0e4",
    ------Bp2
    x"f456", x"8c24", x"97ee", x"3018", x"7b35", x"3185", x"66d7", x"ebe2", 
    x"8d95", x"3349", x"ac78", x"1d24", x"1205", x"c80b", x"4e05", x"b767", 
    x"a450", x"16d8", x"7883", x"28d7", x"d61e", x"cb74", x"f416", x"a1f4", 
    x"5ab4", x"3c5d", x"9f04", x"eaf2", x"5b52", x"494a", x"5c1f", x"7c71", 
    x"4c11", x"4060", x"3677", x"cc31", x"2955", x"1054", x"2d23", x"5847", 
    x"748d", x"f65a", x"66f3", x"119a", x"eee9", x"c731", x"5ac5", x"1214", 
    x"5a30", x"283d", x"df7d", x"59f2", x"a71d", x"865a", x"8b0f", x"8926", 
    x"bd3b", x"8799", x"ed72", x"dbd7", x"1357", x"0bf4", x"4bd8", x"c65c", 
    x"fa1b", x"82c8", x"e4cf", x"0b5b", x"c3b8", x"1d6f", x"8251", x"df47", 
    x"6c72", x"9ba6", x"9bdc", x"7e5e", x"cc9c", x"7940", x"e397", x"72c0", 
    x"a787", x"da03", x"e7ec", x"708b", x"b422", x"5729", x"3eca", x"59ba", 
    x"cf19", x"6c8f", x"1e44", x"bcd0", x"4f57", x"75b4", x"77dc", x"1fe7", 
    x"693e", x"980b", x"14c6", x"5ffb", x"1549", x"ebbf", x"5f00", x"a3cb", 
    x"b6ba", x"e180", x"44c9", x"a495", x"d1b8", x"15ab", x"c400", x"6c87", 
    x"3219", x"782c", x"5eb8", x"3c69", x"9736", x"f36d", x"e34d", x"16f2", 
    x"0eec", x"a8d1", x"f3be", x"52fa", x"ac57", x"395f", x"0946", x"0634", 
    x"c4ee", x"aebf", x"757c", x"a21a", x"2521", x"3203", x"8f7b", x"0b0f", 
    x"278b", x"b7b3", x"193d", x"4a14", x"217c", x"28da", x"594d", x"8d67", 
    x"71cd", x"0615", x"435b", x"9f93", x"ddfd", x"1647", x"88e5", x"1059", 
    x"26c6", x"a330", x"501d", x"dc28", x"de04", x"b534", x"d7b8", x"c9ff",
    
    --cm
    x"0405", x"1812", x"b0fe", x"d0fd", x"234c", x"9051", x"20e6", x"f845", 
    x"ef72", x"212e", x"1ad5", x"eea4", x"ad8f", x"82d1", x"eee0", x"1d63", 
    x"5e13", x"5453", x"e907", x"fa0a", x"2432", x"92f6", x"e436", x"bfa3", 
    x"23ee", x"9f9a", x"1d50", x"d8a2", x"8507", x"fd07", x"ee21", x"52ce", 
    x"4f5e", x"e6b4", x"4046", x"d9f1", x"dd95", x"263c", x"6093", x"8b41", 
    x"88ff", x"92ee", x"6665", x"8d30", x"55fa", x"1dea", x"77b7", x"d231", 
    x"54eb", x"9bb2", x"7a8c", x"29c8", x"4a5e", x"e92f", x"c527", x"c00d", 
    x"ddbb", x"2da6", x"5ee8", x"c709", x"1c3a", x"62be", x"7e2d", x"0c19",
    --end chipertext
    
    others=>x"0000"
    );
    

end decaps_tv_pkg;

package body decaps_tv_pkg is
end package body;
