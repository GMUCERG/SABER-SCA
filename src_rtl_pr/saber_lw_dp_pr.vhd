--------------------------------------------------------------------------------
--! @file       saber_lw_dp_pr.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;
use work.saber_pr_pkg.all;

entity saber_lw_dp_pr is
    generic (
        CONST_ADD : boolean := true -- do not add constants in both domains
    );
    port (
        clk      : in std_logic;
        rst      : in std_logic;
        --mac unit
        mac_clr  : in std_logic;
        mac_di_sel  : in std_logic_vector(2-1 downto 0);
        add_const_sel : in std_logic_vector(2-1 downto 0);
        --ram
        din : in std_logic_vector(MEM_WIDTH-1 downto 0);
        dout : out std_logic_vector(MEM_WIDTH-1 downto 0);
        mem_din_sel : in std_logic_vector(3-1 downto 0);
        mem_addr : in std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
        mem_we   : in std_logic;
        mem_dout : out std_logic_vector(MEM_WIDTH-1 downto 0);

        --sampler
        sampler_dout : in std_logic_vector(MEM_WIDTH-1 downto 0);
        --sha3
        sha3_out_mux : in std_logic_vector(MEM_WIDTH-1 downto 0);
        --shifters
        mac_do_plus_const : out std_logic_vector(eq-1 downto 0); --to mul shifter

        sub_fifo_do : out std_logic_vector(ep-1 downto 0);
        sub_fifo_do_valid : out std_logic;
        sub_fifo_do_ready : in std_logic;
        wc_sub_do_mux : in std_logic_vector(MEM_WIDTH-1 downto 0);
        -- mac input width converter;
        wc_mac_di_ready : out std_logic;
        wc_mac_di_valid : in std_logic;
        wc_mac_di_empty : out std_logic;
        
        eq_ep_shift_di_valid : out std_logic;
        eq_ep_shift_di_ready : in std_logic;
        wc_ep2mem_do : in std_logic_vector(MEM_WIDTH-1 downto 0);
        
        --polySub
        sub_sel : in std_logic;
        sub_di_sel : in std_logic;
        wc_sub_di_ready : out std_logic;
        wc_sub_di_valid : in std_logic;
        wc_sub_di_empty : out std_logic;

        verif_di_sel : in std_logic;
        verif_do_sel : in std_logic;
        verif_di_wc_empty : out std_logic;
        verif_di_valid : in std_logic;
        verif_di_ready : out std_logic;
        verif_do_ready : in std_logic;
        verif_do_valid : out std_logic
        
     );
end saber_lw_dp_pr;

architecture behav of saber_lw_dp_pr is

attribute dont_touch : string;
attribute dont_touch of behav : architecture is "true";


    signal mem_din_mux : std_logic_vector(MEM_WIDTH-1 downto 0);
    --mac
    signal mac_res : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal mac_di_ready : std_logic;
    signal mac_di_valid : std_logic;
    signal mac_di_mux : std_logic_vector(eq-1 downto 0);
    signal mac_do_ready : std_logic;
    signal mac_do_valid : std_logic;
    signal mac_do : std_logic_vector(eq-1 downto 0);
    signal mac_do_plus_h1 : std_logic_vector(eq-1 downto 0);
    signal mac_do_plus_h2 : std_logic_vector(eq-1 downto 0);
    --width converters
    signal wc_mem2half_mu_en : std_logic;
    signal wc_mem2half_mu_empty : std_logic;
    signal wc_mem2half_mu_do_valid : std_logic;
    signal wc_mem2half_mu_do_ready : std_logic;
    signal wc_mem2half_mu_do : std_logic_vector(MEM_WIDTH-1 downto 0); --changed
    
    signal wc_mem2eq_en : std_logic;
    signal wc_mem2eq_empty : std_logic;
    signal wc_mem2eq_do_valid : std_logic;
    signal wc_mem2eq_do_ready : std_logic;
    signal wc_mem2eq_do : std_logic_vector(eq-1 downto 0);
    
    signal wc_mem2ep_en : std_logic;
    signal wc_mem2ep_empty : std_logic;
    signal wc_mem2ep_do_valid : std_logic;
    signal wc_mem2ep_do_ready : std_logic;
    signal wc_mem2ep_do : std_logic_vector(ep-1 downto 0);
    
    --
    signal wc_mem2half_mu_di_ready : std_logic; 
    signal wc_mem2half_mu_di_valid : std_logic;
    signal wc_mem2eq_di_ready : std_logic;
    signal wc_mem2eq_di_valid : std_logic;
    signal wc_mem2ep_di_ready : std_logic;
    signal wc_mem2ep_di_valid : std_logic;
    
    signal wc_ep2mem_di : std_logic_vector(ep-1 downto 0);
    
    --sign extention for small poly
    signal sign_ext_out : std_logic_vector(eq-1 downto 0);
    
    --PolySub input width conveteres
    signal wc_mem21_en : std_logic;
    signal wc_mem21_empty : std_logic;
    --signal wc_mem21_di_valid : std_logic;
    signal wc_mem21_di_ready : std_logic;
    --signal wc_mem21_di : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal wc_mem21_do_valid : std_logic;
    --signal wc_mem21_do_ready : std_logic;
    signal wc_mem21_do : std_logic_vector(1-1 downto 0);
    
    signal wc_mem2eT_en : std_logic;
    signal wc_mem2eT_empty : std_logic;
    --signal wc_mem2eT_di_valid : std_logic;
    signal wc_mem2eT_di_ready : std_logic;
    --signal wc_mem2eT_di : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal wc_mem2eT_do_valid : std_logic;
    --signal wc_mem2eT_do_ready : std_logic;
    signal wc_mem2eT_di : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal wc_mem2eT_do : std_logic_vector(eT-1 downto 0);
    
    --poly sub
    
    --signal sub_di_a_valid : std_logic;
    signal sub_di_b_valid : std_logic;
    signal sub_di_a_ready : std_logic;
    signal sub_di_b_ready : std_logic;
    signal sub_di_mux : std_logic_vector(ep-1 downto 0);

    
    signal sub_do_valid : std_logic;
    signal sub_do_ready : std_logic;
    signal sub_do : std_logic_vector(ep-1 downto 0);
    
    signal sub_do_shift_ep_eT : std_logic_vector(eT-1 downto 0);
    constant p_minus_1_Zeros : std_logic_vector(ep-1-1 downto 0) := (others=>'0');
    constant p_minus_T_Zeros : std_logic_vector(ep-eT-1 downto 0) := (others=>'0');
    
    signal verif_do : std_logic_vector(MEM_WIDTH-1 downto 0);
    
    --mac fifo
    signal mac_fifo_dout : std_logic_vector(eq-1 downto 0);
    signal mac_fifo_dout_ready : std_logic;
    signal mac_fifo_dout_valid : std_logic;


begin

    --mem mux 
    with mem_din_sel select mem_din_mux <=
        mac_res        when "000",
        sha3_out_mux   when "001",
        din            when "010",
        sampler_dout   when "011",
        wc_sub_do_mux  when "100",
        verif_do      when others;
        
    -- Main memory =========================================================================
    main_mem : entity work.ram(behav)
	generic map(WIDTH => MEM_WIDTH, ADDR_LEN => MEM_ADDR_SIZE)
	port map( clk => clk, addr => mem_addr, din => mem_din_mux, dout => mem_dout, we => mem_we);   
  
    dout <= mem_dout;
        
    --Multiplier==========================================================================
    --from mem witdth to cbd sample size
    widthConv_mem_to_half_mu: entity work.widthConverter(behav) -- change to 16 to 16
    generic map (
        WI => MEM_WIDTH,
        WO => MEM_WIDTH
    )
    port map (
        clk => clk,
        rst => rst,
        en => wc_mem2half_mu_en,
        empty => wc_mem2half_mu_empty,
        di => mem_dout,
        di_ready => wc_mem2half_mu_di_ready,
        di_valid => wc_mac_di_valid,
        do       => wc_mem2half_mu_do,
        do_ready => mac_di_ready,
        do_valid => wc_mem2half_mu_do_valid
    );
    
    widthConv_mem_to_eq: entity work.widthConverter(behav)
    generic map (
        WI => MEM_WIDTH,
        WO => eq
    )
    port map (
        clk => clk,
        rst => rst,
        en => wc_mem2eq_en,
        empty => wc_mem2eq_empty,
        di => mem_dout,
        di_ready => wc_mem2eq_di_ready,
        di_valid => wc_mac_di_valid,
        do       => wc_mem2eq_do,
        do_ready => mac_di_ready,
        do_valid => wc_mem2eq_do_valid
    );

    widthConv_mem_to_ep: entity work.widthConverter(behav)
    generic map (
        WI => MEM_WIDTH,
        WO => ep
    )
    port map (
        clk => clk,
        rst => rst,
        en => wc_mem2ep_en,
        empty => wc_mem2ep_empty,
        di => mem_dout,
        di_ready => wc_mem2ep_di_ready,
        di_valid => wc_mac_di_valid,
        do       => wc_mem2ep_do,
        do_ready => mac_di_ready,
        do_valid => wc_mem2ep_do_valid
    );
    --width conv ctrl signals-- connection to ctrl
    wc_mem2half_mu_en <= '1' when mac_di_sel = "00" else '0';
    wc_mem2eq_en      <= '1' when mac_di_sel = "01" else '0';
    wc_mem2ep_en      <= '1' when mac_di_sel = "10" else '0';
    
    with mac_di_sel select wc_mac_di_ready <=
        wc_mem2half_mu_di_ready when "00",
        wc_mem2eq_di_ready      when "01",
        wc_mem2ep_di_ready      when "10",
        '0'                     when others;
    -----------------------------------------------------------
    --sign extension
    sign_ext_out <= wc_mem2half_mu_do(eq-1 downto 0);
    
    --mac_di_mux
    with mac_di_sel select mac_di_mux <=
        sign_ext_out         when "00",
        wc_mem2eq_do         when "01",
        "000" & wc_mem2ep_do when "10",
        (others=>'0')        when others;

    --wc ctrl sig mux - connectopm to mac
    with mac_di_sel select mac_di_valid <=
        wc_mem2half_mu_do_valid when "00",
        wc_mem2eq_do_valid      when "01",
        wc_mem2ep_do_valid      when "10",
        '0'                     when others;
     
    wc_mac_di_empty <= wc_mem2half_mu_empty and wc_mem2eq_empty and wc_mem2ep_empty;
    --
    mac_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => eq,
        G_LOG2DEPTH => 1
    )
    port map (
        clk        => clk,
        rst        => rst,
        din        => mac_di_mux,
        din_ready  => mac_di_ready,
        din_valid  => mac_di_valid,
        dout       => mac_fifo_dout,
        dout_ready => mac_fifo_dout_ready,
        dout_valid => mac_fifo_dout_valid
    );  
            
    mac: entity work.poly_mac_lw(behav)
    port map ( 
        clk => clk,
        rst => rst,
        clr => mac_clr,
        --polynomial ports
        di  => mac_fifo_dout,
        di_valid => mac_fifo_dout_valid,
        di_ready => mac_fifo_dout_ready,
        do => mac_do,
        do_valid => mac_do_valid,  
        do_ready => mac_do_ready
    );
    
    mac_do_plus_h1 <= std_logic_vector(unsigned(mac_do) + to_unsigned(h1, eq));
    mac_do_plus_h2 <= std_logic_vector(unsigned(mac_do) + to_unsigned(h2, eq));
    
    gen_const_add: if CONST_ADD = true generate
        with add_const_sel select mac_do_plus_const <=
            mac_do         when   "00",
            mac_do_plus_h1 when   "01",
            mac_do_plus_h2 when   "10",
            (others=>'0')  when others;
     else generate
        mac_do_plus_const <= mac_do;
     end generate;
    
    mac_res <=  wc_ep2mem_do;
    
    mac_do_ready <= sub_di_a_ready when sub_sel = '1' else eq_ep_shift_di_ready;
    eq_ep_shift_di_valid <= mac_do_valid;
    
    --PolySub======================================================================
    widthConv_mem_to_1: entity work.widthConverter(behav)
    generic map (
        WI => MEM_WIDTH,
        WO => 1
    )
    port map (
        clk => clk,
        rst => rst,
        en       => wc_mem21_en,
        empty    => wc_mem21_empty,
        di       => mem_dout,
        di_ready => wc_mem21_di_ready,
        di_valid => wc_sub_di_valid,
        do       => wc_mem21_do,
        do_ready => sub_di_b_ready,
        do_valid => wc_mem21_do_valid
    );
    
    gen_sub_cm : if CONST_ADD = true generate --subract cm only in domain0 
        wc_mem2eT_di <= mem_dout;
    else generate
        wc_mem2eT_di <= (others=>'0');
    end generate;

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
            di       => wc_mem2eT_di,
            di_ready => wc_mem2eT_di_ready,
            di_valid => wc_sub_di_valid,
            do       => wc_mem2eT_do,
            do_ready => sub_di_b_ready,
            do_valid => wc_mem2eT_do_valid
        );
    -- polysub width conv ctrl signals
    wc_mem21_en  <= '1' when sub_di_sel = '0' else '0';
    wc_mem2eT_en <= '1' when sub_di_sel = '1' else '0';
    
    with sub_di_sel select wc_sub_di_ready <=
        wc_mem21_di_ready       when    '0',
        wc_mem2eT_di_ready      when others;
    
    --di_ready
    with sub_di_sel select wc_sub_di_empty <=
        wc_mem21_empty       when    '0',
        wc_mem2eT_empty      when others;
    
    --wc ctrl sig mux - connectopm to sub
    with sub_di_sel select sub_di_b_valid <=
        wc_mem21_do_valid   when    '0',
        wc_mem2eT_do_valid  when others;
        
    --sub_di_b_mux
    with sub_di_sel select sub_di_mux <=
        wc_mem21_do & p_minus_1_ZEROS  when    '0', --encode
        wc_mem2eT_do & p_minus_T_ZEROS when others; --encode
        
    sub: entity work.polySub(behav)
    port map (
        di_a       => mac_do_plus_const(ep-1 downto 0),
        di_a_valid => mac_do_valid,
        di_a_ready => sub_di_a_ready,
        di_b       => sub_di_mux,
        di_b_valid => sub_di_b_valid,
        di_b_ready => sub_di_b_ready,
        do         => sub_do,
        do_valid   => sub_do_valid,
        do_ready   => sub_do_ready
    );

    sub_do_shift_ep_eT <= sub_do(ep-1 downto ep-eT);
    
    sub_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => ep,
        G_LOG2DEPTH => log2_ceil(N)
    )
    port map (
        clk        => clk,
        rst        => rst,
        din        => sub_do,
        din_ready  => sub_do_ready,
        din_valid  => sub_do_valid,
        dout       => sub_fifo_do,
        dout_ready => sub_fifo_do_ready,
        dout_valid => sub_fifo_do_valid
    );
    

    gen_verif: if CONST_ADD = true generate
    
    verif: entity work.VerifySub(behav)
    port map(
        clk => clk,
        rst => rst,
        di_sel => verif_di_sel,
        do_sel => verif_do_sel,
        di_wc_empty => verif_di_wc_empty,
        di  => mem_dout,
        di_valid => verif_di_valid,
        di_ready => verif_di_ready,
        do  => verif_do,
        do_ready => verif_do_ready,
        do_valid => verif_do_valid
     );
     
    else generate
     
    end generate;

end behav;
