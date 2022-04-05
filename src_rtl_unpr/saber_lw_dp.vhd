--------------------------------------------------------------------------------
--! @file       saber_lw_dp.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

entity saber_lw_dp is
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
        --sha3
        sha3_din_ready : out std_logic;
        sha3_din_valid :  in std_logic;
        sha3_din_bits_tlast : in std_logic;
        sha3_dout_ready : in std_logic;
        sha3_dout_valid :  out std_logic;
        sha3_cmd_ready : out std_logic;
        sha3_cmd_valid :  in std_logic;
        sha3_cmd_bits_mode : in std_logic_vector(2-1 downto 0);
        sha3_cmd_bits_numSqueezeWords : in std_logic_vector(12-1 downto 0);
        sha3_in_sipo_en : in std_logic;
        sha3_in_sipo_clr : in std_logic;
        sha3_out_sel : in std_logic_vector(2-1 downto 0);
        --sampler
        sampler_din_ready : out std_logic;
        sampler_din_valid :  in std_logic;
        sampler_din_bits_tlast : in std_logic;
        sampler_dout_ready : in std_logic;
        sampler_dout_valid :  out std_logic;
        -- mac input width converter;
        wc_mac_di_ready : out std_logic;
        wc_mac_di_valid : in std_logic;
        wc_mac_di_empty : out std_logic;
        -- mac out width converter
        wc_ep2mem_en : in std_logic;
        wc_ep2mem_empty : out std_logic;
        wc_ep2mem_do_valid : out std_logic;
        wc_ep2mem_do_ready : in std_logic;
        --polySub
        sub_sel : in std_logic;
        sub_di_sel : in std_logic;
        wc_sub_di_ready : out std_logic;
        wc_sub_di_valid : in std_logic;
        wc_sub_di_empty : out std_logic;
        sub_do_sel : in std_logic;
        wc_sub_do_ready : in std_logic;
        wc_sub_do_valid : out std_logic;
        --verification
        verif_neq   : out std_logic
     );
end saber_lw_dp;

architecture behav of saber_lw_dp is
    --mem================
    signal mem_dout : std_logic_vector(MEM_WIDTH-1 downto 0); 
    --sha3===============
    component sha3Core is
    port (
        clock : in std_logic;
        reset : in std_logic;
        io_din_ready : out std_logic;
        io_din_valid : in std_logic;
        io_din_bits_data_0 : in std_logic_vector(63 downto 0);
        io_din_bits_tlast : in std_logic;
        io_cmd_ready : out std_logic;
        io_cmd_valid : in std_logic;
        io_cmd_bits_mode : in std_logic_vector(1 downto 0);
        io_cmd_bits_numSqueezeWords : in std_logic_vector(11 downto 0);
        io_dout_ready : in std_logic;
        io_dout_valid : out std_logic;
        io_dout_tlast : out std_logic;
        io_dout_bits_0 : out std_logic_vector(63 downto 0);
        io_dout_index : out std_logic_vector(11 downto 0)
    );
    end component;

    signal sha3_dout_bits_0 :  std_logic_vector(63 downto 0);   
    signal sha3_dout_bits_0_fifo :  std_logic_vector(63 downto 0); --to sha3 fifo 
    signal sha3_dout_ready_fifo : std_logic; --to sha3 fifo  
    signal sha3_dout_valid_fifo : std_logic; --to sha3 fifo  
    signal sha3_dout_index :  std_logic_vector(11 downto 0);
    signal sha3_in_sipo :std_logic_vector(SHA3_IO_WIDTH-1 downto 0);
    signal sha3_out_mux :std_logic_vector(MEM_WIDTH-1 downto 0);

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
    signal mac_do_plus_const : std_logic_vector(eq-1 downto 0);
    --CBD Sampler
    signal sampler_dout : std_logic_vector(MEM_WIDTH-1 downto 0);
    --width converters
    signal wc_mem2half_mu_en : std_logic;
    signal wc_mem2half_mu_empty : std_logic;
    signal wc_mem2half_mu_do_valid : std_logic;
    signal wc_mem2half_mu_do_ready : std_logic;
    signal wc_mem2half_mu_do : std_logic_vector(MU/2-1 downto 0);
    
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
    
    --output width converters
    
    signal wc_ep2mem_di_valid : std_logic;
    signal wc_ep2mem_di_ready : std_logic;
    signal wc_ep2mem_di : std_logic_vector(ep-1 downto 0);
    signal wc_ep2mem_do : std_logic_vector(MEM_WIDTH-1 downto 0);
    
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
    
    signal sub_fifo_do_valid : std_logic;
    signal sub_fifo_do_ready : std_logic;
    signal sub_fifo_do : std_logic_vector(ep-1 downto 0);
    
    signal sub_do_shift_ep_eT : std_logic_vector(eT-1 downto 0);
    constant p_minus_1_Zeros : std_logic_vector(ep-1-1 downto 0) := (others=>'0');
    constant p_minus_T_Zeros : std_logic_vector(ep-eT-1 downto 0) := (others=>'0');
    --polySub output width converters
    
    signal wc_sub_eT2mem_en : std_logic;
    signal wc_sub_eT2mem_empty : std_logic;
    signal wc_sub_eT2mem_di_ready : std_logic;
    signal wc_sub_eT2mem_do_ready : std_logic;
    signal wc_sub_eT2mem_do_valid : std_logic;
    signal wc_sub_eT2mem_do : std_logic_vector(MEM_WIDTH-1 downto 0);
    
    
    signal wc_sub_12mem_en : std_logic;
    signal wc_sub_12mem_empty : std_logic;
    signal wc_sub_12mem_di_ready : std_logic;
    signal wc_sub_12mem_do_ready : std_logic;
    signal wc_sub_12mem_do_valid : std_logic;
    signal wc_sub_12mem_do : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal wc_sub_do_mux : std_logic_vector(MEM_WIDTH-1 downto 0);

    signal after_ep_eT_shift : std_logic_vector(eT-1 downto 0);
    signal after_ep_shift : std_logic_vector(0 downto 0);
    --verifcation unit
    signal verif_reg : std_logic_vector(MEM_WIDTH-1downto 0);
    
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
        sampler_dout    when "011",
        wc_sub_do_mux  when others;
        
    -- Main memory =========================================================================
    main_mem : entity work.ram(behav)
	generic map(WIDTH => MEM_WIDTH, ADDR_LEN => MEM_ADDR_SIZE)
	port map( clk => clk, addr => mem_addr, din => mem_din_mux, dout => mem_dout, we => mem_we);   
  
    dout <= mem_dout;
    
    -- SHA3 ================================================================================
    sha3 : sha3Core
    port map(
        clock => clk,
        reset => rst,
        io_din_ready => sha3_din_ready,
        io_din_valid => sha3_din_valid,
        io_din_bits_data_0 => sha3_in_sipo,
        io_din_bits_tlast => sha3_din_bits_tlast,
        io_cmd_ready => sha3_cmd_ready,
        io_cmd_valid => sha3_cmd_valid,
        io_cmd_bits_mode => sha3_cmd_bits_mode,
        io_cmd_bits_numSqueezeWords => sha3_cmd_bits_numSqueezeWords,
        io_dout_ready => sha3_dout_ready_fifo,
        io_dout_valid => sha3_dout_valid_fifo,
        io_dout_tlast => open,
        io_dout_bits_0 => sha3_dout_bits_0_fifo,
        io_dout_index => sha3_dout_index
    );
    
    sha3_fifo: entity work.fwft_fifo(structure)
    generic map (
        G_W => SHA3_IO_WIDTH,
        G_LOG2DEPTH => 5
    )
    port map (
        clk        => clk,
        rst        => rst,
        din        => sha3_dout_bits_0_fifo,
        din_ready  => sha3_dout_ready_fifo,
        din_valid  => sha3_dout_valid_fifo,
        dout       => sha3_dout_bits_0,
        dout_ready => sha3_dout_ready,
        dout_valid => sha3_dout_valid
    );

    inst_sha3_in_sipo: process(clk)
    begin
        if rising_edge(clk) then
            if sha3_in_sipo_clr = '1' then
                sha3_in_sipo <= (others=>'0');
            else
                if sha3_in_sipo_en = '1' then
                    sha3_in_sipo <= mem_dout & sha3_in_sipo(SHA3_IO_WIDTH-1 downto MEM_WIDTH);
                end if;
            end if;
        end if;
    end process;

    --sha3 out mux (piso)
    with sha3_out_sel select sha3_out_mux <=
        sha3_dout_bits_0(  MEM_WIDTH-1 downto         0)   when "00",
        sha3_dout_bits_0(2*MEM_WIDTH-1 downto MEM_WIDTH)   when "01",
        sha3_dout_bits_0(3*MEM_WIDTH-1 downto 2*MEM_WIDTH) when "10",
        sha3_dout_bits_0(4*MEM_WIDTH-1 downto 3*MEM_WIDTH) when others;
 
    --CBD Sampler
    sampler: entity work.CBDSampler(behav)
    port map (
        clk => clk,
        rst => rst,
        di => sha3_dout_bits_0,
        di_ready => sampler_din_ready,
        di_valid => sampler_din_valid,
        do => sampler_dout,
        do_ready => sampler_dout_ready,
        do_valid => sampler_dout_valid
    );
        
    --Multiplier==========================================================================
    --from mem witdth to cbd sample size
    widthConv_mem_to_half_mu: entity work.widthConverter(behav)
    generic map (
        WI => MEM_WIDTH,
        WO => MU/2
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
    sign_ext_out(MU/2-1 downto 0) <= wc_mem2half_mu_do;
    sign_ext_out(eq-1 downto MU/2) <= (others=>wc_mem2half_mu_do(MU/2-1));
    
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
        di  => mac_fifo_dout, -- mac_di_mux,
        di_valid => mac_fifo_dout_valid, --mac_di_valid,
        di_ready => mac_fifo_dout_ready,-- mac_di_ready,
        do => mac_do,
        do_valid => mac_do_valid,  
        do_ready => mac_do_ready
    );
    
    --mac output widthConverter ====================================================
    
    mac_do_plus_h1 <= std_logic_vector(unsigned(mac_do) + to_unsigned(h1, eq));
    mac_do_plus_h2 <= std_logic_vector(unsigned(mac_do) + to_unsigned(h2, eq));
--    wc_ep2mem_di <= mac_do_plus_const(eq-1 downto 3) when add_h1 = '1' 
--                    else mac_do(eq-1 downto 3);
    with add_const_sel select mac_do_plus_const <=
        mac_do         when   "00",
        mac_do_plus_h1 when   "01",
        mac_do_plus_h2 when   "10",
        (others=>'0')  when others;
        
    ---shift     >>(eq-ep)
    wc_ep2mem_di <= mac_do_plus_const(eq-1 downto 3);
    
    
    mac_res <=  wc_ep2mem_do;
    
    mac_do_ready <= sub_di_a_ready when sub_sel = '1' else wc_ep2mem_di_ready;
    wc_ep2mem_di_valid <= mac_do_valid;
   
    
    widthConv_ep_to_mem: entity work.widthConverter(behav)
    generic map (
        WI => ep,
        WO => MEM_WIDTH
    )
    port map (
        clk => clk,
        rst => rst,
        en       => wc_ep2mem_en,
        empty    => wc_ep2mem_empty,
        di       => wc_ep2mem_di,
        di_ready => wc_ep2mem_di_ready,
        di_valid => wc_ep2mem_di_valid,
        do       => wc_ep2mem_do,
        do_ready => wc_ep2mem_do_ready,
        do_valid => wc_ep2mem_do_valid
    );
    
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
        di       => mem_dout,
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
--        clk        => clk,
--        rst        => rst,
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
    
    after_ep_eT_shift <= sub_fifo_do(ep-1 downto ep-eT);
    after_ep_shift <= sub_fifo_do(ep-1 downto ep-1);
    
    --sub output width converters
    widthConv_sub_eT_to_mem: entity work.widthConverter(behav)
    generic map (
        WI => eT,
        WO => MEM_WIDTH
    )
    port map (
        clk      => clk,
        rst      => rst,
        en       => wc_sub_eT2mem_en,
        empty    => wc_sub_eT2mem_empty,
        di       => after_ep_eT_shift,
        di_ready => wc_sub_eT2mem_di_ready,
        di_valid => sub_fifo_do_valid,
        do       => wc_sub_eT2mem_do,
        do_ready => wc_sub_do_ready,
        do_valid => wc_sub_eT2mem_do_valid
    );
    
    widthConv_sub_1_to_mem: entity work.widthConverter(behav)
    generic map (
        WI => 1,
        WO => MEM_WIDTH
    )
    port map (
        clk      => clk,
        rst      => rst,
        en       => wc_sub_12mem_en,
        empty    => wc_sub_12mem_empty,
        di       => after_ep_shift,
        di_ready => wc_sub_12mem_di_ready,
        di_valid => sub_fifo_do_valid,
        do       => wc_sub_12mem_do,
        do_ready => wc_sub_do_ready,
        do_valid => wc_sub_12mem_do_valid
    );
    --input side
    with sub_do_sel select sub_fifo_do_ready <=
        wc_sub_eT2mem_di_ready     when    '0',
        wc_sub_12mem_di_ready      when others;
       
    wc_sub_eT2mem_en  <= '1' when sub_do_sel = '0' else '0';
    wc_sub_12mem_en   <= '1' when sub_do_sel = '1' else '0';
    
    --output side
    --wc_sub_do_mux
    with sub_do_sel select wc_sub_do_mux <=
        wc_sub_eT2mem_do           when    '0',
        wc_sub_12mem_do         when others;
        
    with sub_do_sel select wc_sub_do_valid <=
        wc_sub_eT2mem_do_valid  when    '0',
        wc_sub_12mem_do_valid   when others;
        
    --verification=================================================
    verify_reg: process(clk)
    begin
        if rising_edge(clk) then
            verif_reg <= mem_dout;
        end if;
    end process;
    
    verif_neq <= '1' when verif_reg /= mem_dout else '0';
    --end verification

end behav;
