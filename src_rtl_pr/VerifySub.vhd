--------------------------------------------------------------------------------
--! @file       verifySub.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity VerifySub is
    port (
        clk : in std_logic;
        rst : in std_logic;
        di_sel : in std_logic;
        do_sel : in std_logic;
        di_wc_empty : out std_logic;
        di  : in std_logic_vector(MEM_WIDTH-1 downto 0);
        di_valid : in std_logic;
        di_ready : out std_logic;
        do  : out std_logic_vector(MEM_WIDTH-1 downto 0);
        do_ready : in std_logic;
        do_valid : out std_logic
     );
end VerifySub;

architecture behav of VerifySub is

signal sub_di : std_logic_vector(ep-1 downto 0);
signal sub_di_valid : std_logic;
signal sub_di_ready : std_logic;

signal sub_do : std_logic_vector(ep-1 downto 0);
signal sub_do_valid : std_logic;
signal sub_do_ready : std_logic;

signal sub_di_mux : std_logic_vector(ep-1 downto 0);


---mem2ep
signal wc_mem2ep_en : std_logic;
signal wc_mem2ep_empty : std_logic;
signal wc_mem2ep_di : std_logic_vector(ep-1 downto 0);
signal wc_mem2ep_di_ready : std_logic;
signal wc_mem2ep_di_valid : std_logic;
signal wc_mem2ep_do : std_logic_vector(ep-1 downto 0);
signal wc_mem2ep_do_ready : std_logic;
signal wc_mem2ep_do_valid : std_logic;

---mem2eT
signal wc_mem2eT_en : std_logic;
signal wc_mem2eT_empty : std_logic;
signal wc_mem2eT_di : std_logic_vector(eT-1 downto 0);
signal wc_mem2eT_di_ready : std_logic;
signal wc_mem2eT_di_valid : std_logic;
signal wc_mem2eT_do : std_logic_vector(eT-1 downto 0);
signal wc_mem2eT_do_ready : std_logic;
signal wc_mem2eT_do_valid : std_logic;

--output side
signal wc_ep2mem_en : std_logic;
signal wc_ep2mem_empty : std_logic;
signal wc_ep2mem_di_ready : std_logic;
signal wc_ep2mem_do : std_logic_vector(MEM_WIDTH-1 downto 0);
signal wc_ep2mem_do_valid : std_logic;

signal wc_eT2mem_en : std_logic;
signal wc_eT2mem_empty : std_logic;
signal wc_eT2mem_di_ready : std_logic;
signal wc_eT2mem_do : std_logic_vector(MEM_WIDTH-1 downto 0);
signal wc_eT2mem_do_valid : std_logic;

begin
    --input side
    widthConv_mem_to_ep: entity work.widthConverter(behav)
    generic map (
        WI => MEM_WIDTH,
        WO => ep
    )
    port map (
        clk => clk,
        rst => rst,
        en       => wc_mem2ep_en,
        empty    => wc_mem2ep_empty,
        di       => di,
        di_ready => wc_mem2ep_di_ready,
        di_valid => di_valid,
        do       => wc_mem2ep_do,
        do_ready => sub_di_ready,
        do_valid => wc_mem2ep_do_valid
    );

    widthConv_mem_to_eT: entity work.widthConverter(behav)
        generic map (
            WI => MEM_WIDTH,
            WO => eT
        )
        port map (
            clk => clk,
            rst => rst,
            en       => wc_mem2eT_en,
            empty    => wc_mem2eT_empty,
            di       => di,
            di_ready => wc_mem2eT_di_ready,
            di_valid => di_valid,
            do       => wc_mem2eT_do,
            do_ready => sub_di_ready,
            do_valid => wc_mem2eT_do_valid
        );
        
    -- polysub width conv ctrl signals
    wc_mem2ep_en  <= '1' when di_sel = '0' else '0';
    wc_mem2eT_en <= '1' when di_sel = '1' else '0';
    
    with di_sel select di_ready <=
        wc_mem2ep_di_ready       when    '0',
        wc_mem2eT_di_ready      when others;
    
    --di_ready
    with di_sel select di_wc_empty <=
        wc_mem2ep_empty       when    '0',
        wc_mem2eT_empty      when others;
    
    --wc ctrl sig mux - connectopm to sub
    with di_sel select sub_di_valid <=
        wc_mem2ep_do_valid   when    '0',
        wc_mem2eT_do_valid  when others;
        
    --sub_di_b_mux
    with di_sel select sub_di_mux <=
        wc_mem2ep_do            when    '0',
        "000000" & wc_mem2eT_do when others;
    

    --subtractor
    sub: entity work.polySub1(behav)
    port map (
        clk        => clk,
        rst        => rst,
        di         => sub_di_mux,
        di_valid   => sub_di_valid,
        di_ready   => sub_di_ready,
        do         => sub_do,
        do_valid   => sub_do_valid,
        do_ready   => sub_do_ready
    );
    
    --output side
    widthConv_ep_to_mem: entity work.widthConverter(behav)
    generic map (
        WI => ep,
        WO => MEM_WIDTH
    )
    port map (
        clk      => clk,
        rst      => rst,
        en       => wc_ep2mem_en,
        empty    => wc_ep2mem_empty,
        di       => sub_do,
        di_ready => wc_ep2mem_di_ready,
        di_valid => sub_do_valid,
        do       => wc_ep2mem_do,
        do_ready => do_ready,
        do_valid => wc_ep2mem_do_valid
    );

    widthConv_eT_to_mem: entity work.widthConverter(behav)
    generic map (
        WI => eT,
        WO => MEM_WIDTH
    )
    port map (
        clk      => clk,
        rst      => rst,
        en       => wc_eT2mem_en,
        empty    => wc_eT2mem_empty,
        di       => sub_do(eT-1 downto 0),
        di_ready => wc_eT2mem_di_ready,
        di_valid => sub_do_valid,
        do       => wc_eT2mem_do,
        do_ready => do_ready,
        do_valid => wc_eT2mem_do_valid
    );
    --input side
    with do_sel select sub_do_ready <=
        wc_ep2mem_di_ready     when    '0',
        wc_eT2mem_di_ready     when others;
       
    wc_ep2mem_en  <= '1' when do_sel = '0' else '0';
    wc_eT2mem_en  <= '1' when do_sel = '1' else '0';
    
    --output side
    --wc_sub_do_mux
    with do_sel select do <=
        wc_ep2mem_do         when    '0',
        wc_eT2mem_do         when others;
        
    with do_sel select do_valid <=
        wc_ep2mem_do_valid  when    '0',
        wc_eT2mem_do_valid   when others;


end behav;
