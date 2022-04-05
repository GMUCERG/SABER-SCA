--------------------------------------------------------------------------------
--! @file       saber_lw_top_pr.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity A2AShifter is
    generic(
        N : natural := 1;
        K : natural := 3;
        M : natural := 10 
    );
    port(
        clk : in std_logic;
        rst : in std_logic;
        input_en   : in std_logic;
        init : in std_logic;
        r    : in std_logic_vector(K-1 downto 0);
        g    : in std_logic_vector(M+(N-1)*K-1 downto 0);
        --
        x0 : in std_logic_vector(M+N*K-1 downto 0);
        x1 : in std_logic_vector(M+N*K-1 downto 0);
        x_valid : in std_logic;
        x_ready : out std_logic;
        y0 : out std_logic_vector(M-1 downto 0);
        y1 : out std_logic_vector(M-1 downto 0);
        y_valid : out std_logic;
        y_ready : in std_logic
        ;
        DEBUG_out : out std_logic_vector(M-1 downto 0)
  
    );
end A2AShifter;

architecture behav of A2AShifter is
--    attribute keep_hierarchy : string;
--    attribute keep_hierarchy of behav : architecture is "true";
attribute dont_touch : string;
attribute dont_touch of behav : architecture is "true";
    
    type state_type is (S_IDLE, S_WAIT_INIT, S_READY, S_WAIT_DONE, S_DONE);
    signal state, nx_state : state_type;
    
    --A2B unit
    
    signal a2a_init    : std_logic;
    signal a2a_start : std_logic;
    signal a2a_ready : std_logic;
    signal a2a_done : std_logic;
    signal a2a_ack : std_logic;
    signal R_in    : std_logic_vector(M+N*K-1 downto 0);
    signal A_in    : std_logic_vector(M+N*K-1 downto 0);
    
    signal A_out : std_logic_vector(M-1 downto 0);
    signal R_out   : std_logic_vector(M-1 downto 0);
    attribute dont_touch of A_in, R_in, A_out, R_out : signal is "true";
begin

    a2a_inst: entity work.A2A(behav)
        generic map (
        N => N,
        K => K,
        M => M
    )
    port map( 
        clk      => clk,
        rst      => rst,
        init     => a2a_init,
        start    => a2a_start,
        ready    => a2a_ready,
        R_in     => x1,
        A_in     => x0,
        r_rnd        => r,
        g_rnd        => g,
        A_out    => y0,
        R_out    => y1,
        done     => a2a_done,
        ack      => a2a_ack
    );
 --ctrl ========================================================================
    state_reg : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_IDLE; 
            else
                state <= nx_state;
            end if;
        end if;
    end process;
    
    comb: process(all)
    begin
        nx_state <= state;
        x_ready <= '0';
        y_valid <= '0';
        --to a2b
        a2a_init <= '0';
        a2a_start <= '0';
        a2a_ack <= '0';
       
        case state is
            
            when S_IDLE =>
                if init = '1' then
                    a2a_init <= '1';
                    nx_state <= S_WAIT_INIT;
                else
                    nx_state <= S_IDLE;
                end if;
         
            when S_WAIT_INIT =>
                if a2a_ready = '1' then
                    nx_state <= S_READY;
                else
                    nx_state <= S_WAIT_INIT;
                end if;
            
            when S_READY =>
                if input_en = '1' then
                    x_ready <= '1';
                end if;
                if init = '1' then
                    nx_state <= S_WAIT_INIT;
                else
                    if x_valid = '1' and input_en = '1' then
                        a2a_start <= '1';
                        nx_state <= S_WAIT_DONE;
                    else
                        nx_state <= S_READY;
                    end if;
                end if;
            
            when S_WAIT_DONE =>
                if a2a_done = '1' then
                    nx_state <= S_DONE;
                else
                    nx_state <= S_WAIT_DONE;
                end if;
            
            when S_DONE =>
                y_valid <= '1';
                if y_ready = '1' then
                    a2a_ack <= '1';
                    nx_state <= S_READY;
                else
                    nx_state <= S_DONE;
                end if;
                 
            when others =>
                nx_state <= S_IDLE;
                
        end case;
   end process;

end behav;
