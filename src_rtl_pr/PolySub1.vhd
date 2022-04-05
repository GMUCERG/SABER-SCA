-- =====================================================================
-- Copyright © 2021 by Cryptographic Engineering Research Group (CERG),
-- ECE Department, George Mason University
-- Fairfax, VA, U.S.A.
-- Author : Abubakr Abdulgadir
-- Purpose : Polynomial subractor. Performs c = a - b
-- Date : Feb 28 2021
-- =====================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity polySub1 is
    port (
        clk          : in std_logic;
        rst          : in std_logic;
        di         : in std_logic_vector(ep-1 downto 0);
        di_valid   : in std_logic;
        di_ready   : out std_logic;
        do           : out std_logic_vector(ep-1 downto 0);
        do_valid     : out std_logic;
        do_ready     : in std_logic
    
    );
end polySub1;

architecture behav of polySub1 is

constant NUM_COEFF : natural := N;

--in fifo
signal in_fifo_din_ready : std_logic;
signal in_fifo_din_valid : std_logic;
signal in_fifo_do : std_logic_vector(ep-1 downto 0);
signal in_fifo_dout_ready : std_logic;
signal in_fifo_dout_valid : std_logic;

--out fifo
signal out_fifo_din : std_logic_vector(ep-1 downto 0);
signal out_fifo_din_ready : std_logic;
signal out_fifo_din_valid : std_logic;

type state_type is (S_RST, S_LOAD_POLY1, S_SUB, S_OUTPUT);
signal state, nx_state : state_type;
signal cnt, nx_cnt : unsigned(8-1 downto 0);

begin

    out_fifo_din <= std_logic_vector(unsigned(in_fifo_do) - unsigned(di));

    in_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => ep,
        G_LOG2DEPTH => log2_ceil(N)
    )
    port map (
        clk        => clk,
        rst        => rst,
        din        => di,
        din_ready  => in_fifo_din_ready,
        din_valid  => in_fifo_din_valid,
        dout       => in_fifo_do,
        dout_ready => in_fifo_dout_ready,
        dout_valid => in_fifo_dout_valid
    );
    
    
    out_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => ep,
        G_LOG2DEPTH => log2_ceil(N)
    )
    port map (
        clk        => clk,
        rst        => rst,
        din        => out_fifo_din,
        din_ready  => out_fifo_din_ready,
        din_valid  => out_fifo_din_valid,
        dout       => do,
        dout_ready => do_ready,
        dout_valid => do_valid
    );
    --ctrl===============================================================================
    state_reg : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_RST;
                cnt <= (others=>'0');
            else
                state <= nx_state; 
                cnt <= nx_cnt;
            end if;       
        end if;
    end process;
    
    comb : process(all)
        begin
            --default values
            di_ready <= '0';
            nx_state <= state;
            nx_cnt <= cnt;
            in_fifo_din_valid <= '0';
            in_fifo_dout_ready <= '0';
            out_fifo_din_valid <= '0';

            case state is
                when S_RST =>
                    nx_state <= S_LOAD_POLY1;
                
                when S_LOAD_POLY1 =>
                    di_ready <= '1';
                    if di_valid = '1' then
                        in_fifo_din_valid <= '1';
                        if cnt = NUM_COEFF-1 then
                            nx_cnt <= (others=>'0');
                            nx_state <= S_SUB;
                        else
                            nx_cnt <= cnt + 1;
                            nx_state <= S_LOAD_POLY1;
                        end if;
                    else
                        nx_state <= S_LOAD_POLY1;
                    end if;
                
                when S_SUB =>
                    di_ready <= '1';
                    if di_valid = '1' then
                        in_fifo_dout_ready <= '1';
                        out_fifo_din_valid <= '1';
                        if cnt = NUM_COEFF-1 then
                            nx_cnt <= (others=>'0');
                            nx_state <= S_RST;
                        else
                            nx_cnt <= cnt + 1;
                            nx_state <= S_SUB;
                        end if;
                    else
                        nx_state <= S_SUB;
                    end if;
                
                when others=>
                    nx_state <= S_RST; 
            end case;
        end process; 

end behav;
