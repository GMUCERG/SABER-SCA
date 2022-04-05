--------------------------------------------------------------------------------
--! @file       widthConverter.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity widthConverter is
    generic(
        WI : natural := 16; --input witdth
        WO : natural := 13--output witdth
          
    );
    port ( 
        clk      : in  std_logic;
        rst      : in  std_logic;
        en       : in  std_logic;
        empty    : out  std_logic;
        di       : in  std_logic_vector(WI-1 downto 0);
        di_valid : in  std_logic;
        di_ready : out std_logic;
        do       : out std_logic_vector(WO-1 downto 0);
        do_valid : out std_logic;
        do_ready : in  std_logic    
    );
end widthConverter;

architecture behav of widthConverter is
    constant BUFF_SIZE : natural := WI*WO; --default. If WO divides WI or WI divides WO set to max(WI, WO) FIX code
    signal buff : std_logic_vector(BUFF_SIZE-1 downto 0);
    signal bit_cnt, nx_bit_cnt : unsigned(log2_ceil(WI*WO) downto 0);

    type buff_in_type is array(0 to WO-1) of std_logic_vector(WI-1 downto 0);
    type buff_out_type is array(0 to WI-1) of std_logic_vector(WO-1 downto 0);

    signal buff_in  : buff_in_type;
    signal buff_out : buff_out_type;
    
    signal in_index : unsigned(log2_ceil(WO)-1 downto 0);
    signal out_index : unsigned(log2_ceil(WI)-1 downto 0);
    signal enc_in_index : std_logic;
    signal enc_out_index : std_logic;

begin
    -- bffer mapping
    gen_in_map: for i in 0 to WO-1 generate
        buff((i+1)*WI-1 downto WI*i) <= buff_in(i);
    end generate;
    
    gen_out_map: for i in 0 to WI-1 generate
        buff_out(i) <= buff((i+1)*WO-1 downto WO*i);
    end generate; 
    
    empty <= '1' when bit_cnt = 0 else '0';
    
    -- state regs
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                bit_cnt <= (others=>'0');
                in_index <= (others=>'0');
                out_index <= (others=>'0');
            else
                if en = '1' then
                    bit_cnt <= nx_bit_cnt;
                    if enc_in_index = '1' then
                        if in_index = WO-1 then
                            in_index <= (others=>'0');
                        else
                            in_index <= in_index +1;
                        end if;
                    end if;
                    if enc_out_index = '1' then
                        if out_index = WI-1 then
                            out_index <= (others=>'0');
                        else
                            out_index <= out_index +1;
                        end if;
                    end if;
                    if di_valid = '1' and di_ready = '1' then
                        buff_in(to_integer(unsigned(in_index))) <= di;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    --read from ram
    do <= buff_out(to_integer(unsigned(out_index)));
    
   
    comb: process(all)
    begin
        --default values
        di_ready <= '0';
        do_valid <= '0';
        nx_bit_cnt <= bit_cnt;
        enc_in_index <= '0';
        enc_out_index <= '0';
       
        --internal control
        --write only
        if en = '1' then
            if di_valid = '1' and do_ready = '0' then
                if bit_cnt <= BUFF_SIZE-WI then --enough space?
                    di_ready <= '1';
                    enc_in_index <= '1';
                    nx_bit_cnt <= bit_cnt + WI; 
                end if;
                if bit_cnt >= WO then --data to read 
                    do_valid <= '1';
                end if;
            
            --read only
            elsif di_valid = '0' and do_ready = '1' then
                if bit_cnt >= WO then --enough data?
                    do_valid <= '1';
                    enc_out_index <= '1';
                    nx_bit_cnt <= bit_cnt - WO;
                end if;
                if bit_cnt <= BUFF_SIZE-WI then --enough space to write
                    di_ready <= '1'; 
                end if;
            
            --read/write
            elsif di_valid = '1' and do_ready = '1' then
                if bit_cnt >= WO and bit_cnt <= BUFF_SIZE-WI+WO then 
                --enough to read, enouph space to write after read
                    di_ready <= '1';
                    do_valid <= '1';
                    enc_in_index <= '1';
                    enc_out_index <= '1';
                    nx_bit_cnt <= bit_cnt + WI - WO;                
                
                elsif bit_cnt >= WO and bit_cnt > BUFF_SIZE-WI+WO then 
                --enough to read,  no space to write after read
                    do_valid <= '1';
                    enc_out_index <= '1';
                    nx_bit_cnt <= bit_cnt - WO;
                
                elsif bit_cnt < WO and bit_cnt <= BUFF_SIZE-WI then --we will not read 
                -- not enough to read, enouph space to write after read
                    di_ready <= '1';
                    nx_bit_cnt <= bit_cnt + WI;
                    enc_in_index <= '1';
                
                else
                -- not enough to read, no space to write after read
                    null;
                end if;
            
            else
                --nothing to do. but signal the status
                if bit_cnt >= WO then --data to read 
                    do_valid <= '1';
                end if;
                
                if bit_cnt <= BUFF_SIZE-WI then --enough space to write
                    di_ready <= '1'; 
                end if;
            end if;
        else --not enabled
            null;
        end if;
    end process;
    
end behav;
