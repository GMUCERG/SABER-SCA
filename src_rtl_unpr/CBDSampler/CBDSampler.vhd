--------------------------------------------------------------------------------
--! @file       CBDSampler.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity CBDSampler is
    --Warning works only for 64 bit input and 16 bit output

    port ( 
        clk : in std_logic;
        rst : in std_logic;
        di : in std_logic_vector(CBD_SAMPLER_DI_WIDTH-1 downto 0);
        di_valid : in std_logic;
        di_ready : out std_logic;
        do : out std_logic_vector(CBD_SAMPLER_DO_WIDTH-1 downto 0);
        do_valid : out std_logic;  
        do_ready : in std_logic
    );
end CBDSampler;

architecture behav of CBDSampler is
    type state_type is (S_S0, S_S1);
    signal state, nx_state : state_type;
    signal in_sel : std_logic;
    signal in_mux : std_logic_vector(CBD_SAMPLER_DI_WIDTH/2-1 downto 0);
    
    signal d0, d1, d2, d3 : std_logic_vector(8-1 downto 0);
    signal a0, a1, a2, a3 : std_logic_vector(4-1 downto 0);
    signal b0, b1, b2, b3 : std_logic_vector(4-1 downto 0);
    signal s0, s1, s2, s3 : std_logic_vector(4-1 downto 0);

begin
    --Warning works only for 64 bit input
    --input mux
    with in_sel select in_mux <=
        di(32-1 downto  0) when    '0',
        di(64-1 downto 32) when others;
        
    d0 <= in_mux(8 -1 downto  0);
    d1 <= in_mux(16-1 downto  8);
    d2 <= in_mux(24-1 downto 16);
    d3 <= in_mux(32-1 downto 24);

    hw0: entity work.HW(behav) generic map (W=>4) port map (di=> d0(3 downto 0), do => a0);
    hw1: entity work.HW(behav) generic map (W=>4) port map (di=> d0(7 downto 4), do => b0);
    hw2: entity work.HW(behav) generic map (W=>4) port map (di=> d1(3 downto 0), do => a1);
    hw3: entity work.HW(behav) generic map (W=>4) port map (di=> d1(7 downto 4), do => b1);
    hw4: entity work.HW(behav) generic map (W=>4) port map (di=> d2(3 downto 0), do => a2);
    hw5: entity work.HW(behav) generic map (W=>4) port map (di=> d2(7 downto 4), do => b2);
    hw6: entity work.HW(behav) generic map (W=>4) port map (di=> d3(3 downto 0), do => a3);
    hw7: entity work.HW(behav) generic map (W=>4) port map (di=> d3(7 downto 4), do => b3);
    
    s0 <= std_logic_vector(unsigned(a0) - unsigned(b0));
    s1 <= std_logic_vector(unsigned(a1) - unsigned(b1));
    s2 <= std_logic_vector(unsigned(a2) - unsigned(b2));
    s3 <= std_logic_vector(unsigned(a3) - unsigned(b3));
    
    do <= s3 & s2 & s1 & s0;
    
    --ctrl===============================================================================
    state_reg: process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= S_S0;
            else
                state <= nx_state;
            end if;
        end if;
    end process;
    
    comb: process(all)
    begin
        --default values
        in_sel <= '0';
        di_ready <= '0';
       
        case state is
              
            when S_S0 =>
                if di_valid = '1' then
                    if do_ready = '1' then
                        nx_state <= S_S1;
                    else
                        nx_state <= S_S0;
                    end if;
                else
                    nx_state <= S_S0;
                    di_ready <= '1';
                end if;
           
            when S_S1 =>
                in_sel <= '1';
                if di_valid = '1' then
                    if do_ready = '1' then
                        di_ready <= '1';
                        nx_state <= S_S0;
                    else
                        nx_state <= S_S1;
                    end if;
                else
                    nx_state <= S_S1;
                    di_ready <= '1';
                end if;         
        
            when others =>
                nx_state <= S_S0;
 
        end case;
    
    end process;
    do_valid <= di_valid;    
    

end behav;
