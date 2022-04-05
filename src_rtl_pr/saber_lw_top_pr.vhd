--------------------------------------------------------------------------------
--! @file       saber_lw_top_pr.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.saber_pkg.all; 
use work.saber_pr_pkg.all; 

entity saber_lw_top_pr is
    port (
        clk : in std_logic;
        rst : in std_logic;
        --
        din : in std_logic_vector(DIN_FIFO_WIDTH-1 downto 0);
        din_valid : in std_logic;
        din_ready : out std_logic;
        
        dout0 : out std_logic_vector(DIN_FIFO_WIDTH-1 downto 0);
        dout1 : out std_logic_vector(DIN_FIFO_WIDTH-1 downto 0);
        dout_valid : out std_logic;
        dout_ready : in std_logic;
        dout_tlast : out std_logic;
        --rdi data to seed PRNG
        rdi_valid           : in   std_logic;
        rdi_ready           : out  std_logic;
        rdi_data            : in   std_logic_vector(RW -1 downto 0)
     );
end saber_lw_top_pr;

architecture behav of saber_lw_top_pr is
    
    type state_type is (
                        --Top-level states
                        ST_RST,
                        ST_LOAD_SEED,
                        ST_START_PRNG,
                        ST_WAIT_PRNG,
                        ST_IDLE,
                        ST_CHECK_OPCODE,
                        ST_UNDEFINED_OPCODE,
                        ST_PAUSE,
                        --KEM_ENCAPS
                        SKE_ENCAPS,
                        SKE_LOAD_PK,
                        SKE_LOAD_SEED_A,
                        SKE_LOAD_M,
                        SKE_SHA3_256_M,
                        SKE_SHA3_256_PK,
                        SKE_SHA3_512_HASH_OF_M_PK,
                        SKE_SHA3_256_C,
                        SKE_SHA3_256_K_hat_h_c,
                        SKE_OUTPUT_SHARED_KEY,
                        SKE_OUTPUT_CIPHER,
                        --KEM_DECAPS
                        SKD_DECAPS,
                        SKD_LOAD_PK,
                        --SEED_A second share 
                        --(no need to share but this is just a work around since SHA3 needs 2 shares).
                        SKD_LOAD_SEED_A_SHARE0, 
                        SKD_LOAD_SEED_A_SHARE1,
                        SKD_LOAD_SK_SHARE0,
                        SKD_LOAD_SK_SHARE1,
                        SKD_LOAD_CIPHER,
                        SKD_SHA3_512_Mp_PKH_1,
                        SKD_SHA3_512_Mp_PKH_2,
                        SKD_SHA3_512_Mp_PKH_3,
                        SKD_SHA3_512_Mp_PKH_4,
                        SKD_SHA3_512_Mp_PKH_5,
                        SKD_CALL_PKE_ENC,
                        SKD_SHA3_256_C,
                        SKD_VERIF_CIPHER0,
                        SKD_VERIF_CIPHER1,
                        SKD_VERIF_CIPHER2,
                        SKD_VERIF_CIPHER3,
                        SKD_VERIF_CIPHER4,
                        SKD_SHA3_256_VERIF0,
                        SKD_SHA3_256_VERIF1,
                        SKD_VERIF_COMPARE,
                        SKD_SHA3_256_K_hat,
                        SKD_SHA3_256_Z,
                        SKD_SHA3_256_h_c,
                        SKD_SHA3_SAVE_SHARED_KEY,
                        SKD_OUTPUT_SHARED_KEY,
                        --PKE_DEC
                        SPD_Bp_MUL_S_VECT_BY_VECT,
                        SPD_CALC_M,
                        --PKE_ENC
                        SPE_GEN_S_p,
                        SPE_A_MUL_Sp,
                        SPE_GEN_A_POLY,
                        SPE_GEN_A_SND_SEED_A,
                        SPE_GEN_A_SND_SEED_A_TLAST,
                        SPE_A_MUL_Sp_VECT_BY_VECT,
                        SPE_A_MUL_Sp_MAT_BY_VECT,
                        SPE_A_POLY_MUL_Sp_POLY,
                        SPE_B_MUL_Sp_VECT_BY_VECT,
                        SPE_CALC_CM,
                        --low-level (direct datapath control)
                        --low-level polynomial mac control
                        S_POLY_MUL_LD0, --load first poly
                        S_POLY_MUL_LD1, --read second poly and mulitiply
                        S_POLY_MUL_SAVE_RES,
                        S_WAIT_MAC_DI_WC0,
                        S_WAIT_MAC_DI_WC1,
                        --low leve poly sub control
                        S_POLY_SUB,
                        S_WAIT_SUB,
                        S_POLY_SUB_SAVE_RES,
                        --low-level sha3 control
                        S_DO_SHA3_256,
                        S_DO_SHA3_512,
                        S_DO_SHAKE128,
                        S_SHA3_SND_MSG,
                        S_SHA3_SND_TLAST,
                        --general purpose
                        S_SHA3_256_CONFIG,
                        S_SHA3_512_CONFIG,
                        S_SHA3_256_CONFIG_SND,
                        S_SHA3_SND_DATA,
                        S_SHA3_SND_DATA_LAST,
                        S_SHA3_ISSUE_TLAST,
                        S_SHA3_GET_RES,
                        S_SHA3_GET_WORD,
                        S_SHA3_GET_WORD_FROM_MIXER,
                        ---gen cbd s'
                        S_GEN_CBD_SHAKE,
                        S_GEN_CBD_SND_SEED,
                        S_GEN_CBD_SND_TLAST,
                        S_GEN_CBD_GET_SAMPLES,
                        -- gen A
                        S_GEN_A_SHAKE,
                        S_GEN_A_POLY_LOW, --deals with sha3
                        S_GEN_A_POLY_GET_WORD,
                        --io low-level
                        S_LOAD_INPUT,
                        S_EMMIT_OUTPUT,
                        --verification low-level
                        S_VERIF_REGISTER,
                        S_VERIF_COMPARE,
                        S_VERIF_SUB_POLY1,
                        S_VERIF_SUB_POLY2,
                        S_VERIF_SUB_SAVE_RES
                        
    );--states
    --sha3===============
    component sha3Core is
    port (
        clock : in std_logic;
        reset : in std_logic;
        io_din_ready : out std_logic;
        io_din_valid : in std_logic;
        io_din_bits_data_0 : in std_logic_vector(63 downto 0);
        io_din_bits_data_1 : in std_logic_vector(63 downto 0);
        io_din_bits_tlast : in std_logic;
        io_cmd_ready : out std_logic;
        io_cmd_valid : in std_logic;
        io_cmd_bits_mode : in std_logic_vector(1 downto 0);
        io_cmd_bits_numSqueezeWords : in std_logic_vector(11 downto 0);
        io_dout_ready : in std_logic;
        io_dout_valid : out std_logic;
        io_dout_tlast : out std_logic;
        io_dout_bits_0 : out std_logic_vector(63 downto 0);
        io_dout_bits_1 : out std_logic_vector(63 downto 0);
        io_dout_index : out std_logic_vector(11 downto 0)
    );
    end component;
   attribute dont_touch : string;

    
    signal state, nx_state : state_type;
    signal ret_state, nx_ret_state : state_type;
    signal decaps, nx_decaps: std_logic; --set to 1 when decaps
    signal base : std_logic_vector(MEM_ADDR_SIZE-1 downto 0); --base registers for data
    --Base registers for data
    signal base_addr0, nx_base_addr0 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
    signal base_addr1, nx_base_addr1 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
    signal base_addr2, nx_base_addr2 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
    --word_num register
    signal word_num0, nx_word_num0     : unsigned(MEM_ADDR_SIZE-1 downto 0);
    signal word_num1, nx_word_num1     : unsigned(MEM_ADDR_SIZE-1 downto 0);
    --general purpose counter
    signal cnt0, nx_cnt0               : unsigned(MEM_ADDR_SIZE-1 downto 0);
    signal cnt1, nx_cnt1               : unsigned(MEM_ADDR_SIZE-1 downto 0);
    signal cnt2, nx_cnt2               : unsigned(MEM_ADDR_SIZE-1 downto 0);
    --offset register
    signal offset, nx_offset     : unsigned(MEM_ADDR_SIZE-1 downto 0);

    --dp control
    signal mac_clr : std_logic;
    signal add_const_sel_reg, nx_add_const_sel_reg : std_logic_vector(2-1 downto 0);
    signal mac_di_sel : std_logic_vector(2-1 downto 0);
    signal mac_di_sel_reg0, nx_mac_di_sel_reg0 : std_logic_vector(2-1 downto 0);
    signal mac_di_sel_reg1, nx_mac_di_sel_reg1 : std_logic_vector(2-1 downto 0);
    
    signal wc_mac_di_valid :  std_logic;
    signal wc_mac_di_ready : std_logic;
    signal wc_mac_di_empty : std_logic;
    signal mac_do_valid : std_logic;

    signal DEBUG_mac_din_mux :  std_logic_vector(eq-1 downto 0);
    signal DEBUG_mac_do0 :  std_logic_vector(eq-1 downto 0);
    signal DEBUG_mac_do1 :  std_logic_vector(eq-1 downto 0);
    signal DEBUG_mac_do :  std_logic_vector(eq-1 downto 0);
    
    signal comp_do_valid : std_logic;
    signal comp_do_ready : std_logic;
    
    signal mem_din_sel : std_logic_vector(3-1 downto 0);
    signal mem_addr : std_logic_vector(MEM_ADDR_SIZE-1 downto 0) ;
    signal mem_we : std_logic;
    signal mem_we0 : std_logic; --after enable is considered
    signal mem_we1 : std_logic; --after enable is considered
    signal mem0_en_reg, nx_mem0_en_reg : std_logic; --selective data loading for shared data
    signal mem1_en_reg, nx_mem1_en_reg : std_logic;
    signal mixer_en_reg, nx_mixer_en_reg : std_logic;
    --===============================================
    signal mem_dout0 : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal mem_dout1 : std_logic_vector(MEM_WIDTH-1 downto 0);
    attribute dont_touch of mem_dout0, mem_dout1   : signal is "true";
    signal DEBUG_mem_dout : std_logic_vector(MEM_WIDTH-1 downto 0);
    
    --sha3 control
    signal sha3_din_ready : std_logic;
    signal sha3_din_valid : std_logic;
    signal sha3_din_bits_tlast : std_logic;
    signal sha3_cmd_ready :  std_logic;
    signal sha3_cmd_valid :  std_logic;
    signal sha3_cmd_bits_mode :  std_logic_vector(1 downto 0);
    signal sha3_cmd_bits_numSqueezeWords :  std_logic_vector(12-1 downto 0);
    signal sha3_in_sipo_en : std_logic;
    signal sha3_in_sipo_clr : std_logic;
    signal sha3_out_sel :  std_logic_vector(2-1 downto 0);
    --sha3 to fifo
    signal sha3_dout_ready_fifo : std_logic;
    signal sha3_dout_valid_fifo :  std_logic;
    signal sha3_dout_bits_0_fifo :  std_logic_vector(63 downto 0);   
    signal sha3_dout_bits_1_fifo :  std_logic_vector(63 downto 0);
    --from fifo to the sha3 users
    signal sha3_dout_ready : std_logic;
    signal sha3_dout_valid :  std_logic;
    signal sha3_dout_bits_0 :  std_logic_vector(63 downto 0);   
    signal sha3_dout_bits_1 :  std_logic_vector(63 downto 0);
    
    attribute dont_touch of sha3_dout_bits_0, sha3_dout_bits_1   : signal is "true";
     signal sha3_do0 :std_logic_vector(MEM_WIDTH-1 downto 0);
     signal sha3_do1 :std_logic_vector(MEM_WIDTH-1 downto 0);
    attribute dont_touch of sha3_do0, sha3_do1   : signal is "true";
--    signal sha3_dout_bits_0_DEBUG :  std_logic_vector(63 downto 0);   
--    signal sha3_dout_bits_1_DEBUG :  std_logic_vector(63 downto 0);   
    signal sha3_dout_index :  std_logic_vector(11 downto 0);
    signal sha3_in_sipo0 :std_logic_vector(SHA3_IO_WIDTH-1 downto 0);
    signal sha3_in_sipo1 :std_logic_vector(SHA3_IO_WIDTH-1 downto 0);
    attribute dont_touch of sha3_in_sipo0, sha3_in_sipo1   : signal is "true";
    signal sha3_out_mux0 :std_logic_vector(MEM_WIDTH-1 downto 0);
    signal sha3_out_mux1 :std_logic_vector(MEM_WIDTH-1 downto 0);
    attribute dont_touch of sha3_out_mux0, sha3_out_mux1   : signal is "true";
    signal mem_dout0_mux : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal mem_dout1_mux : std_logic_vector(MEM_WIDTH-1 downto 0);
    attribute dont_touch of mem_dout0_mux, mem_dout1_mux   : signal is "true";
    signal clr_mem_dout0_reg, nx_clr_mem_dout0_reg : std_logic;
    signal clr_mem_dout1_reg, nx_clr_mem_dout1_reg : std_logic;
    signal sha3_output_DEBUG :std_logic_vector(MEM_WIDTH-1 downto 0);
    --sampler
    signal sampler_din_ready : std_logic;
    signal sampler_din_valid : std_logic;
    signal sampler_din_bits_tlast : std_logic;
    signal sampler_dout_ready : std_logic;
    signal sampler_dout_valid :  std_logic;
--    signal sampler_dout : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal sampler_dout0 : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal sampler_dout1 : std_logic_vector(MEM_WIDTH-1 downto 0);
    attribute dont_touch of sampler_dout0, sampler_dout1   : signal is "true";
    --shifters
    --mul
    
    --sub
    signal sub_fifo_do0 : std_logic_vector(ep-1 downto 0);
    signal sub_fifo_do1 : std_logic_vector(ep-1 downto 0);
    attribute dont_touch of sub_fifo_do0, sub_fifo_do1   : signal is "true";
    --mac out width converter
    signal wc_ep2mem_en : std_logic;
    signal wc_ep2mem_empty : std_logic;
    signal wc_ep2mem_do_valid : std_logic;
    signal wc_ep2mem_do_ready : std_logic;
    signal eq_ep_shift_init : std_logic;
    signal eq_ep_shift_di_valid : std_logic;
    signal eq_ep_shift_di_ready : std_logic;
    signal eq_ep_shift_do_valid : std_logic;
    signal eq_ep_shift_do_ready : std_logic;
    signal eq_ep_shift_di0 : std_logic_vector(eq-1 downto 0); --to mul shifter
    signal eq_ep_shift_di1 : std_logic_vector(eq-1 downto 0); --to mul shifter
    attribute dont_touch of eq_ep_shift_di0, eq_ep_shift_di1   : signal is "true";
--    signal from_eq_ep_shift : std_logic_vector(ep-1 downto 0); --to mul shifter
    signal eq_ep_shift_do0 : std_logic_vector(ep-1 downto 0);
    signal eq_ep_shift_do1 : std_logic_vector(ep-1 downto 0);
    attribute dont_touch of eq_ep_shift_do0, eq_ep_shift_do1   : signal is "true";
    signal wc_ep2mem_do0 : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal wc_ep2mem_do1 : std_logic_vector(MEM_WIDTH-1 downto 0);
    attribute dont_touch of wc_ep2mem_do0, wc_ep2mem_do1  : signal is "true";
    --polySub
    signal sub_sel : std_logic;
    signal sub_di_sel_reg, nx_sub_di_sel_reg : std_logic;
    signal wc_sub_di_ready : std_logic;
    signal wc_sub_di_valid : std_logic;
    signal wc_sub_di_empty : std_logic;
    
    signal sub_do_sel_reg, nx_sub_do_sel_reg : std_logic;
    signal wc_sub_do_ready : std_logic;
    signal wc_sub_do_valid : std_logic;
    signal sub_fifo_do_valid : std_logic;
    signal sub_fifo_do_ready : std_logic;
    ----
     --polySub output width converters
    
    signal wc_sub_eT2mem_en : std_logic;
    signal wc_sub_eT2mem_empty : std_logic;
    signal wc_sub_eT2mem_di_ready : std_logic;
    signal wc_sub_eT2mem_do_ready : std_logic;
    signal wc_sub_eT2mem_do_valid : std_logic;
    signal wc_sub_eT2mem_do0 : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal wc_sub_eT2mem_do1 : std_logic_vector(MEM_WIDTH-1 downto 0);
    attribute dont_touch of wc_sub_eT2mem_do0, wc_sub_eT2mem_do1   : signal is "true";
    signal wc_sub_eT2mem_do_DEBUG : std_logic_vector(MEM_WIDTH-1 downto 0);
    
    
    signal wc_sub_12mem_en : std_logic;
    signal wc_sub_12mem_empty : std_logic;
    signal wc_sub_12mem_di_ready : std_logic;
    signal wc_sub_12mem_do_ready : std_logic;
    signal wc_sub_12mem_do_valid : std_logic;
    signal wc_sub_12mem_do0 : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal wc_sub_12mem_do1 : std_logic_vector(MEM_WIDTH-1 downto 0);
    attribute dont_touch of wc_sub_12mem_do0, wc_sub_12mem_do1   : signal is "true";
    signal wc_sub_12mem_do_DEBUG : std_logic_vector(MEM_WIDTH-1 downto 0);
    
    signal wc_sub_do_mux0 : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal wc_sub_do_mux1 : std_logic_vector(MEM_WIDTH-1 downto 0);
    
    signal ep_eT_shift_init : std_logic;
    signal ep_eT_shift_di_ready : std_logic;
    signal ep_eT_shift_do_valid : std_logic;
    signal ep_eT_shift_do0 : std_logic_vector(eT-1 downto 0);
    signal ep_eT_shift_do1 : std_logic_vector(eT-1 downto 0);
    attribute dont_touch of ep_eT_shift_do0, ep_eT_shift_do1   : signal is "true";
    signal ep_eT_shift_do_DEBUG : std_logic_vector(eT-1 downto 0);
    
    signal ep_1_shift_init : std_logic;
    signal ep_1_shift_di_ready : std_logic;
    signal ep_1_shift_do_valid : std_logic;
    signal ep_1_shift_do0 : std_logic_vector(0 downto 0);
    signal ep_1_shift_do1 : std_logic_vector(0 downto 0);
    attribute dont_touch of ep_1_shift_do0, ep_1_shift_do1   : signal is "true";
    --verifcation
    signal verif_compare_en : std_logic;
    signal verif_neq : std_logic;
    signal dec_failed, nx_dec_failed : std_logic;
    signal verif_reg : std_logic_vector(MEM_WIDTH-1 downto 0);
    
    signal verif_di_sel_reg, nx_verif_di_sel_reg : std_logic;
    signal verif_do_sel_reg, nx_verif_do_sel_reg : std_logic;
    signal verif_di_wc_empty : std_logic;
    signal verif_di_valid : std_logic;
    signal verif_di_ready : std_logic;
    signal verif_do_ready : std_logic;
    signal verif_do_valid : std_logic;
    ---
--    signal gen_A_sel_reg, nx_gen_A_sel_reg : std_logic; --select unshared SHA3 output for A matrix generation
    signal unshared_sha3_do : std_logic_vector(MEM_WIDTH-1 downto 0);
     -- PRNG signals
    signal prng_reseed, prng_rdi_valid : std_logic;
    signal prng_rdi_data : std_logic_vector(64 - 1 downto 0);
    signal seed : std_logic_vector(128 - 1 downto 0); --6 instances of Trivuim each needs 128 bit seed
    signal en_seed_sipo : std_logic;
    
    --SHA3 share mixer
    signal sha3_mixer_do : std_logic_vector(SHA3_IO_WIDTH-1 downto 0);
    signal sha3_mixer_do_piso : std_logic_vector(MEM_WIDTH-1 downto 0);
    signal sha3_mixer_do_valid : std_logic;
    signal sha3_mixer_do_ready : std_logic;
    signal sha3_mixer_di_ready : std_logic;
    
    
    
begin
    --datapath ==========================================================================
    saber_dp0: entity work.saber_lw_dp_pr(behav)
    generic map (
        CONST_ADD => true
    )
    port map (
        clk =>clk,
        rst => rst,
        --mac unit
        mac_clr  => mac_clr,
        mac_di_sel  => mac_di_sel,
        add_const_sel => add_const_sel_reg,
        --ram
        din => din,
        dout => dout0,
        mem_din_sel => mem_din_sel,
        mem_addr => mem_addr,
        mem_we   => mem_we0,
        mem_dout => mem_dout0,
        --SHA3
        sha3_out_mux => sha3_do0,
        --sampler
        sampler_dout => sampler_dout0,
        --shifters
        mac_do_plus_const => eq_ep_shift_di0,
        --sub
        sub_fifo_do => sub_fifo_do0,
        sub_fifo_do_valid => sub_fifo_do_valid,
        sub_fifo_do_ready => sub_fifo_do_ready,
        wc_sub_do_mux => wc_sub_do_mux0,
        --mac input width converter
        wc_mac_di_ready => wc_mac_di_ready,
        wc_mac_di_valid => wc_mac_di_valid,
        wc_mac_di_empty => wc_mac_di_empty,
        --mac output width converter
        eq_ep_shift_di_valid => eq_ep_shift_di_valid,
        eq_ep_shift_di_ready => eq_ep_shift_di_ready,
        wc_ep2mem_do => wc_ep2mem_do0,
        sub_sel => sub_sel,
        sub_di_sel => sub_di_sel_reg,
        wc_sub_di_ready => wc_sub_di_ready,
        wc_sub_di_valid => wc_sub_di_valid,
        wc_sub_di_empty => wc_sub_di_empty,
        
        verif_di_sel => verif_di_sel_reg,
        verif_do_sel => verif_do_sel_reg,
        verif_di_wc_empty => verif_di_wc_empty,
        verif_di_valid => verif_di_valid,
        verif_di_ready => verif_di_ready,
        verif_do_ready => verif_do_ready,
        verif_do_valid => verif_do_valid

     );
     
    saber_dp1: entity work.saber_lw_dp_pr(behav)
    generic map (
        CONST_ADD => false
    )
    port map (
        clk =>clk,
        rst => rst,
        --mac unit
        mac_clr  => mac_clr,
        mac_di_sel  => mac_di_sel,
        add_const_sel => add_const_sel_reg,
        --ram
        din => din,
        dout => dout1,
        mem_din_sel => mem_din_sel,
        mem_addr => mem_addr,
        mem_we   => mem_we1,
        mem_dout => mem_dout1,
        --SHA3
        sha3_out_mux => sha3_do1,
        --sampler
        sampler_dout => sampler_dout1,
        --shifters
        mac_do_plus_const => eq_ep_shift_di1,
        --sub
        sub_fifo_do => sub_fifo_do1,
        sub_fifo_do_valid => open,--sub_fifo_do_valid,
        sub_fifo_do_ready => sub_fifo_do_ready,
        wc_sub_do_mux => wc_sub_do_mux1,
        --mac input width converter
        wc_mac_di_ready => open, --wc_mac_di_ready,
        wc_mac_di_valid => wc_mac_di_valid,
        wc_mac_di_empty => open, --wc_mac_di_empty,
        --mac output width converter
        eq_ep_shift_di_valid => open, --eq_ep_shift_di_valid,
        eq_ep_shift_di_ready => eq_ep_shift_di_ready,
        wc_ep2mem_do => wc_ep2mem_do1,
        sub_sel => sub_sel,
        sub_di_sel => sub_di_sel_reg,
        wc_sub_di_ready => open, --wc_sub_di_ready,
        wc_sub_di_valid => wc_sub_di_valid,
        wc_sub_di_empty => open, --wc_sub_di_empty,        
        --unused
        verif_di_sel => verif_di_sel_reg,
        verif_do_sel => verif_do_sel_reg,
        verif_di_wc_empty => open,
        verif_di_valid => verif_di_valid,
        verif_di_ready => open,
        verif_do_ready => verif_do_ready,
        verif_do_valid => open
        

     );
    -- SHA3 ================================================================================
    sha3 : sha3Core
    port map(
        clock => clk,
        reset => rst,
        io_din_ready => sha3_din_ready,
        io_din_valid => sha3_din_valid,
        io_din_bits_data_0 => sha3_in_sipo0,
        io_din_bits_data_1 => sha3_in_sipo1,
        io_din_bits_tlast => sha3_din_bits_tlast,
        io_cmd_ready => sha3_cmd_ready,
        io_cmd_valid => sha3_cmd_valid,
        io_cmd_bits_mode => sha3_cmd_bits_mode,
        io_cmd_bits_numSqueezeWords => sha3_cmd_bits_numSqueezeWords,
        io_dout_ready => sha3_dout_ready_fifo,
        io_dout_valid => sha3_dout_valid_fifo,
        io_dout_tlast => open,
        io_dout_bits_0 => sha3_dout_bits_0_fifo,
        io_dout_bits_1 => sha3_dout_bits_1_fifo,
        io_dout_index => sha3_dout_index
    );
    
    sha3_fifo0: entity work.fwft_fifo(structure)
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
    sha3_fifo1: entity work.fwft_fifo(structure)
    generic map (
        G_W => SHA3_IO_WIDTH,
        G_LOG2DEPTH => 5
    )
    port map (
        clk        => clk,
        rst        => rst,
        din        => sha3_dout_bits_1_fifo,
        din_ready  => open,
        din_valid  => sha3_dout_valid_fifo,
        dout       => sha3_dout_bits_1,
        dout_ready => sha3_dout_ready,
        dout_valid => open
    );

    inst_sha3_in_sipo0: process(clk)
    begin
        if rising_edge(clk) then
            if sha3_in_sipo_clr = '1' then
                sha3_in_sipo0 <= (others=>'0');
            else
                if sha3_in_sipo_en = '1' then
                    sha3_in_sipo0 <= mem_dout0_mux & sha3_in_sipo0(SHA3_IO_WIDTH-1 downto MEM_WIDTH);
                end if;
            end if;
        end if;
    end process;
    
    inst_sha3_in_sipo1: process(clk)
    begin
        if rising_edge(clk) then
            if sha3_in_sipo_clr = '1' then
                sha3_in_sipo1 <= (others=>'0');
            else
                if sha3_in_sipo_en = '1' then
                    sha3_in_sipo1 <= mem_dout1_mux & sha3_in_sipo1(SHA3_IO_WIDTH-1 downto MEM_WIDTH);
                end if;
            end if;
        end if;
    end process;
    
    --clear second share to hash unshared ciphertext
    mem_dout0_mux <= (others=>'0') when clr_mem_dout0_reg ='1' else mem_dout0;
    mem_dout1_mux <= (others=>'0') when clr_mem_dout1_reg ='1' else mem_dout1;

    --sha3 out mux (piso)
    with sha3_out_sel select sha3_out_mux0 <=
        sha3_dout_bits_0(  MEM_WIDTH-1 downto         0)   when "00",
        sha3_dout_bits_0(2*MEM_WIDTH-1 downto MEM_WIDTH)   when "01",
        sha3_dout_bits_0(3*MEM_WIDTH-1 downto 2*MEM_WIDTH) when "10",
        sha3_dout_bits_0(4*MEM_WIDTH-1 downto 3*MEM_WIDTH) when others;
        
    with sha3_out_sel select sha3_out_mux1 <=
        sha3_dout_bits_1(  MEM_WIDTH-1 downto         0)   when "00",
        sha3_dout_bits_1(2*MEM_WIDTH-1 downto MEM_WIDTH)   when "01",
        sha3_dout_bits_1(3*MEM_WIDTH-1 downto 2*MEM_WIDTH) when "10",
        sha3_dout_bits_1(4*MEM_WIDTH-1 downto 3*MEM_WIDTH) when others;
    
    mixer : entity work.ShareMixer(behav)
    generic map(
        W => 64 --input witdth
    )
    port map ( 
        clk       => clk,
        rst       => rst,
        en        => mixer_en_reg,
        di0       => sha3_dout_bits_0,
        di1       => sha3_dout_bits_1,
        di_valid  => sha3_dout_valid,
        di_ready  => sha3_mixer_di_ready,
        do        => sha3_mixer_do,
        do_valid  => sha3_mixer_do_valid,
        do_ready  => sha3_mixer_do_ready
    );

    with sha3_out_sel select sha3_mixer_do_piso <=
        sha3_mixer_do(  MEM_WIDTH-1 downto         0)   when "00",
        sha3_mixer_do(2*MEM_WIDTH-1 downto MEM_WIDTH)   when "01",
        sha3_mixer_do(3*MEM_WIDTH-1 downto 2*MEM_WIDTH) when "10",
        sha3_mixer_do(4*MEM_WIDTH-1 downto 3*MEM_WIDTH) when others;
    
    
   
    sha3_do0 <= sha3_mixer_do_piso when mixer_en_reg = '1' else sha3_out_mux0;
    sha3_do1 <= sha3_mixer_do_piso when mixer_en_reg = '1' else sha3_out_mux1;
    --CBD Sampler ========================================================================
    sampler_pr: entity work.CBDSampler1(behav)
    port map (
        clk      => clk,
        rst      => rst,
        rnd       => prng_rdi_data,
        rnd_valid => prng_rdi_valid,
        rnd_ready => open,
        di0      => sha3_dout_bits_0,
        di1      => sha3_dout_bits_1,
        di_ready => sampler_din_ready,
        di_valid => sampler_din_valid,
        do0      => sampler_dout0(eq-1 downto 0),
        do1      => sampler_dout1(eq-1 downto 0),
        do_ready => sampler_dout_ready,
        do_valid => sampler_dout_valid
    );
    sampler_dout0(16-1 downto eq) <= (others=>'0');
    sampler_dout1(16-1 downto eq) <= (others=>'0');

   --MAC Shifter ========================================================================
     
    eq_ep_shifter: entity work.A2AShifter(behav)
    generic map(
        N => 1,
        K => 3,
        M => 10
    )
    port map(
        clk => clk,
        rst => rst,
        input_en => wc_ep2mem_en,
        init => eq_ep_shift_init,
        r => prng_rdi_data(3-1 downto 0), 
        g => prng_rdi_data(10-1 downto 0),
        x0 => eq_ep_shift_di0,
        x1 => eq_ep_shift_di1,
        x_valid => eq_ep_shift_di_valid,
        x_ready => eq_ep_shift_di_ready,
        y0 => eq_ep_shift_do0,
        y1 => eq_ep_shift_do1,
        y_valid => eq_ep_shift_do_valid,
        y_ready => eq_ep_shift_do_ready
    );
    
    widthConv_ep_to_mem0: entity work.widthConverter(behav)
    generic map (
        WI => ep,
        WO => MEM_WIDTH
    )
    port map (
        clk => clk,
        rst => rst,
        en       => wc_ep2mem_en,
        empty    => wc_ep2mem_empty,
        di       => eq_ep_shift_do0,
        di_ready => eq_ep_shift_do_ready,
        di_valid => eq_ep_shift_do_valid,
        do       => wc_ep2mem_do0,
        do_ready => wc_ep2mem_do_ready,
        do_valid => wc_ep2mem_do_valid
    );
    
    widthConv_ep_to_mem1: entity work.widthConverter(behav)
    generic map (
        WI => ep,
        WO => MEM_WIDTH
    )
    port map (
        clk => clk,
        rst => rst,
        en       => wc_ep2mem_en,
        empty    => wc_ep2mem_empty,
        di       => eq_ep_shift_do1,
        di_ready => open,
        di_valid => eq_ep_shift_do_valid,
        do       => wc_ep2mem_do1,
        do_ready => wc_ep2mem_do_ready,
        do_valid => open
    );
   
    --sub shifters============================================================
       
    ep_eT_shifter: entity work.A2AShifter(behav)
    generic map(
        N => 2,
        K => 3,
        M => 4
    )
    port map(
        clk => clk,
        rst => rst,
        input_en => wc_sub_eT2mem_en,
        init => ep_eT_shift_init,
        r => prng_rdi_data(3-1 downto 0),
        g => prng_rdi_data(7-1 downto 0),
        x0 => sub_fifo_do0,
        x1 => sub_fifo_do1,
        x_valid => sub_fifo_do_valid,
        x_ready => ep_eT_shift_di_ready,
        y0 => ep_eT_shift_do0,
        y1 => ep_eT_shift_do1,
        y_valid => ep_eT_shift_do_valid,
        y_ready => wc_sub_eT2mem_di_ready
    );
    
    ep_1_shifter: entity work.A2AShifter(behav)
    generic map(
        N => 3,
        K => 3,
        M => 1
    )
    port map(
        clk => clk,
        rst => rst,
        input_en => wc_sub_12mem_en,
        init => ep_1_shift_init,
        r => prng_rdi_data(3-1 downto 0),
        g => prng_rdi_data(7-1 downto 0),
        x0 => sub_fifo_do0,
        x1 => sub_fifo_do1,
        x_valid => sub_fifo_do_valid,
        x_ready => ep_1_shift_di_ready,
        y0 => ep_1_shift_do0,
        y1 => ep_1_shift_do1,
        y_valid => ep_1_shift_do_valid,
        y_ready => wc_sub_12mem_di_ready

    );
    
    widthConv_sub_eT_to_mem0: entity work.widthConverter(behav)
    generic map (
        WI => eT,
        WO => MEM_WIDTH
    )
    port map (
        clk      => clk,
        rst      => rst,
        en       => wc_sub_eT2mem_en,
        empty    => wc_sub_eT2mem_empty,
        di       => ep_eT_shift_do0,
        di_ready => wc_sub_eT2mem_di_ready,
        di_valid => ep_eT_shift_do_valid,
        do       => wc_sub_eT2mem_do0,
        do_ready => wc_sub_do_ready,
        do_valid => wc_sub_eT2mem_do_valid
    );
    
    widthConv_sub_eT_to_mem1: entity work.widthConverter(behav)
    generic map (
        WI => eT,
        WO => MEM_WIDTH
    )
    port map (
        clk      => clk,
        rst      => rst,
        en       => wc_sub_eT2mem_en,
        empty    => wc_sub_eT2mem_empty,
        di       => ep_eT_shift_do1,
        di_ready => open,
        di_valid => ep_eT_shift_do_valid,
        do       => wc_sub_eT2mem_do1,
        do_ready => wc_sub_do_ready,
        do_valid => open
    );
    
    
    widthConv_sub_1_to_mem0: entity work.widthConverter(behav)
    generic map (
        WI => 1,
        WO => MEM_WIDTH
    )
    port map (
        clk      => clk,
        rst      => rst,
        en       => wc_sub_12mem_en,
        empty    => wc_sub_12mem_empty,
        di       => ep_1_shift_do0,
        di_ready => open,
        di_valid => ep_1_shift_do_valid,
        do       => wc_sub_12mem_do0,
        do_ready => wc_sub_do_ready,
        do_valid => open
    );
    
    widthConv_sub_1_to_mem1: entity work.widthConverter(behav)
    generic map (
        WI => 1,
        WO => MEM_WIDTH
    )
    port map (
        clk      => clk,
        rst      => rst,
        en       => wc_sub_12mem_en,
        empty    => wc_sub_12mem_empty,
        di       => ep_1_shift_do1,
        di_ready => wc_sub_12mem_di_ready,
        di_valid => ep_1_shift_do_valid,
        do       => wc_sub_12mem_do1,
        do_ready => wc_sub_do_ready,
        do_valid => wc_sub_12mem_do_valid
    );

    --input side
    with sub_do_sel_reg select sub_fifo_do_ready <=
        ep_eT_shift_di_ready     when    '0',
        ep_1_shift_di_ready      when others;
       
    wc_sub_eT2mem_en  <= '1' when sub_do_sel_reg = '0' else '0';
    wc_sub_12mem_en   <= '1' when sub_do_sel_reg = '1' else '0';
    
    --output side
    --wc_sub_do_mux
    with sub_do_sel_reg select wc_sub_do_valid <=
        wc_sub_eT2mem_do_valid  when    '0',
        wc_sub_12mem_do_valid   when others;
        
    with sub_do_sel_reg select wc_sub_do_mux0 <=
        wc_sub_eT2mem_do0           when    '0',
        wc_sub_12mem_do0         when others;
    
    with sub_do_sel_reg select wc_sub_do_mux1 <=
        wc_sub_eT2mem_do1           when  '0',
        wc_sub_12mem_do1         when others;
    --verification Comparison -comapre hash(c-c*0) =? hash(c*1) =================================================
    verif_comp : entity work.VerifyCompare(behav)
    port map(
        clk => clk,
        rst => rst,
        en  => verif_compare_en,
        di0 => mem_dout0,
        di1 => mem_dout1,
        verif_neq  => verif_neq
     );
    --PRGN===============================================================================
    trivium_inst : entity work.prng_trivium_enhanced(structural)
    generic map (N => 1)
    port map(
		clk         => clk,
        rst         => rst,
		en_prng     => '1',
        seed        => seed,
		reseed      => prng_reseed,
		reseed_ack  => open,
		rdi_data    => prng_rdi_data,
		rdi_ready   => '1',
		rdi_valid   => prng_rdi_valid
	);
	
	--! seed SIPO
	seed_sipo : process(clk)
	begin
	   if rising_edge(clk) then
	       if en_seed_sipo = '1' then
	           seed <= seed(SEED_SIZE - RW - 1 downto 0) & rdi_data;
	       end if;
	   end if;
	end process;
    --ctrl===============================================================================
    mem_addr <= std_logic_vector(unsigned(base) + (offset));
    mem_we0 <= mem0_en_reg and mem_we;
    mem_we1 <= mem1_en_reg and mem_we;
    
    state_reg: process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                 state       <= ST_RST;
                ret_state   <= ST_RST;
                decaps       <= '0';
                dec_failed  <= '0';
                offset      <= (others=>'0');
                base_addr0  <= (others=>'0');
                base_addr1  <= (others=>'0');
                base_addr2  <= (others=>'0');
                word_num0   <= (others=>'0');
                word_num1   <= (others=>'0');
                cnt0         <= (others=>'0');
                cnt1         <= (others=>'0');
                cnt2         <= (others=>'0');
                mac_di_sel_reg0 <= (others=>'0'); --first poly wconv
                mac_di_sel_reg1 <= (others=>'0'); --second poly wconc
                add_const_sel_reg   <= (others=>'0');
                sub_di_sel_reg <= '0';
                sub_do_sel_reg <= '0';
                mixer_en_reg <= '0';
                mem0_en_reg <= '0';
                mem1_en_reg <= '0';
                clr_mem_dout0_reg <= '0';
                clr_mem_dout1_reg <= '0';
                verif_di_sel_reg <= '0';
                verif_do_sel_reg <= '0';
            else
                state       <= nx_state;
                ret_state   <= nx_ret_state;
                decaps      <= nx_decaps;
                dec_failed  <= nx_dec_failed;
                offset      <= nx_offset;
                base_addr0  <= nx_base_addr0;
                base_addr1  <= nx_base_addr1;
                base_addr2  <= nx_base_addr2;
                word_num0   <= nx_word_num0;
                word_num1   <= nx_word_num1;
                cnt0         <= nx_cnt0;
                cnt1         <= nx_cnt1;
                cnt2         <= nx_cnt2;
                mac_di_sel_reg0  <= nx_mac_di_sel_reg0;
                mac_di_sel_reg1  <= nx_mac_di_sel_reg1;
                add_const_sel_reg   <= nx_add_const_sel_reg;
                sub_di_sel_reg <= nx_sub_di_sel_reg;
                sub_do_sel_reg <= nx_sub_do_sel_reg;
                mixer_en_reg <= nx_mixer_en_reg;
                mem0_en_reg <= nx_mem0_en_reg;
                mem1_en_reg <= nx_mem1_en_reg;
                clr_mem_dout0_reg <= nx_clr_mem_dout0_reg;
                clr_mem_dout1_reg <= nx_clr_mem_dout1_reg;
                verif_di_sel_reg <= nx_verif_di_sel_reg;
                verif_do_sel_reg <= nx_verif_do_sel_reg;
            end if;
        end if;
    end process;
    
    comb: process(all)
    begin

        --! default values
        --state
        nx_state  <= state;
        nx_ret_state  <= ret_state;
        nx_decaps <= decaps;
        nx_dec_failed <= dec_failed;
        -- external io
        din_ready <= '0';
        --mac unit
        mac_clr <= '0';
        nx_mac_di_sel_reg0 <= mac_di_sel_reg0;
        nx_mac_di_sel_reg1 <= mac_di_sel_reg1;
        mac_di_sel <= (others=>'0');
        --width converters
        wc_mac_di_valid <= '0';
        wc_ep2mem_do_ready <= '0';
        wc_ep2mem_en <= '0';
        --main mem
        nx_offset     <= offset;
        base     <= (others=>'0');
        nx_base_addr0 <= base_addr0;
        nx_base_addr1 <= base_addr1;
        nx_base_addr2 <= base_addr2;
        mem_we <= '0';
        nx_mem0_en_reg <= mem0_en_reg;
        nx_mem1_en_reg <= mem1_en_reg;
        nx_word_num0 <= word_num0;
        nx_word_num1 <= word_num1;
        mem_din_sel <= (others=>'0');
        --
        nx_cnt0 <= cnt0;
        nx_cnt1 <= cnt1;
        nx_cnt2 <= cnt2;
        --sha3 
        sha3_din_valid <= '0';
        sha3_dout_ready <= '0';
        sha3_din_bits_tlast <= '0'; 
        sha3_cmd_valid <= '0';
        sha3_cmd_bits_mode <= (others=>'0');
        sha3_cmd_bits_numSqueezeWords <= (others=>'0');
        sha3_in_sipo_en <= '0';
        sha3_in_sipo_clr <= '0';
        sha3_out_sel <= (others=>'0');
        nx_mixer_en_reg <= mixer_en_reg;
        nx_clr_mem_dout0_reg <= clr_mem_dout0_reg;
        nx_clr_mem_dout1_reg <= clr_mem_dout1_reg;
        --sampler
        sampler_din_valid <= '0';
        sampler_dout_ready <= '0';
        --polySub in width converters
        sub_sel <= '0';
        wc_sub_di_valid <= '0';
        nx_sub_do_sel_reg <= sub_do_sel_reg;
        nx_sub_di_sel_reg <= sub_di_sel_reg;
        wc_sub_do_ready <= '0';
        --
        dout_valid <= '0';
        dout_tlast <= '0';
        nx_add_const_sel_reg <= add_const_sel_reg;
        --
        eq_ep_shift_init <= '0';
        ep_eT_shift_init <= '0';
        ep_1_shift_init <= '0';
        --prng
        prng_reseed <= '0';
        --mixer
        sha3_mixer_do_ready <= '0';
        rdi_ready <= '0';
        en_seed_sipo <= '0';
        
        --verification
        nx_verif_di_sel_reg <= verif_di_sel_reg;
        nx_verif_do_sel_reg <= verif_do_sel_reg;
        verif_di_valid <= '0';
        verif_do_ready <= '0';
        verif_compare_en <= '0';
        
        case state is
            -- Top-level states=================================================
            when ST_RST =>
                nx_state <= ST_LOAD_SEED;
                nx_word_num0 <= (others=>'0');
                nx_mem0_en_reg <= '1'; --enable mem0
                nx_mem1_en_reg <= '1'; --enable mem1
                
            --setup prng
            when ST_LOAD_SEED =>
                rdi_ready <= '1';
                if rdi_valid = '1' then
                    en_seed_sipo <= '1';
                    if word_num0 = SEED_SIZE / RW -1 then
                        nx_state <= ST_START_PRNG;
                    else
                        nx_state <= ST_LOAD_SEED;
                    end if;
                    nx_word_num0 <= word_num0 + 1;
                else
                    nx_state <= ST_START_PRNG;
                end if;
            
            when ST_START_PRNG =>
                prng_reseed <= '1';
                nx_state <= ST_WAIT_PRNG;
            
            when ST_WAIT_PRNG =>
                if prng_rdi_valid = '1' then
                    nx_state <= ST_IDLE;
                else
                    nx_state <= ST_WAIT_PRNG;
                end if;
                
            when ST_IDLE =>
                nx_state <= ST_CHECK_OPCODE;
                nx_offset <= (others=>'0');
                mac_clr <= '1';
                nx_dec_failed <= '0';
                nx_mixer_en_reg <= '0';
                nx_mem0_en_reg <='1'; --both memories enabled by default
                nx_clr_mem_dout0_reg <= '0'; --allow second input share for sha3
                nx_clr_mem_dout1_reg <= '0'; --allow second input share for sha3
                nx_mem1_en_reg <='1';

                                
            when ST_CHECK_OPCODE => --the first word in fifo is the operation
                                      --opcode len = DIN_FIFO_WIDTH
                                      --pull the fifo top element
                din_ready <= '1';
                if din_valid = '1' then
                    if din = OPCODE_ENCAPS then
                        nx_decaps <= '0';
                        nx_state <= SKE_ENCAPS;
                    elsif din = OPCODE_DECAPS then
                        nx_decaps <= '1';
                        nx_state <= SKD_DECAPS;
                    else
                        nx_state <= ST_UNDEFINED_OPCODE;
                    end if;
                else
                    nx_state <= ST_CHECK_OPCODE;
                end if;
                
            when ST_UNDEFINED_OPCODE =>
                nx_state <= ST_UNDEFINED_OPCODE;
             
            when ST_PAUSE =>
                nx_state <= ST_PAUSE;
            
            -- KEM_ENCAPS (KE) states+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            when SKE_ENCAPS =>
                --kem.encaps entry point
                nx_state <= SKE_LOAD_PK;
                
            when SKE_LOAD_PK =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= BS_b;
                nx_word_num0 <= to_unsigned(POLYVECp_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SKE_LOAD_SEED_A;
                --go
                nx_state <= S_LOAD_INPUT;
            
            when SKE_LOAD_SEED_A =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= SEED_A;
                nx_word_num0 <= to_unsigned(SEED_A_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SKE_LOAD_M;
                --go
                nx_state <= S_LOAD_INPUT;
            
            when SKE_LOAD_M =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= M;
                nx_word_num0 <= to_unsigned(M_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SKE_SHA3_256_M;
                --go
                nx_state <= S_LOAD_INPUT;
                
            when SKE_SHA3_256_M =>
                --prep params
                nx_base_addr0 <= M; --src
                nx_word_num0 <= to_unsigned(M_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num0'length); --num of input words
                nx_base_addr1 <= M_HASH; --dest
                --set return state
                nx_ret_state <= SKE_SHA3_256_PK;
                --go
                nx_state <= S_DO_SHA3_256;
                
            when SKE_SHA3_256_PK =>
                --prep params
                nx_base_addr0 <= BS_b; --src
                nx_word_num0 <= to_unsigned((POLYVECp_SIZE_BYTES + SEED_A_SIZE_BYTES)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_base_addr1 <= PK_HASH; --dest
                --set return state
                nx_ret_state <= SKE_SHA3_512_HASH_OF_M_PK;
                --go
                nx_state <= S_DO_SHA3_256;
            
            when SKE_SHA3_512_HASH_OF_M_PK =>
                --prep params
                nx_base_addr0 <= M_HASH; --src
                nx_word_num0 <= to_unsigned(64/(MEM_WIDTH/8), nx_word_num0'length); --num of input words
                nx_base_addr1 <= K_HAT; --dest
                --set return state
                nx_ret_state <= SPE_GEN_S_p;  --call pke.enc
                --go
                nx_state <= S_DO_SHA3_512;
                
            when SKE_SHA3_256_C =>
                --prep params
                nx_base_addr0 <= Bp; --src c= (Bp, cm)
                nx_word_num0 <= to_unsigned((POLYVECp_SIZE_BYTES+POLYT_SIZE_BYTES)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_base_addr1 <= R_h_c; --put it after K_hat to hash them together
                --set return state
                nx_ret_state <= SKE_SHA3_256_K_hat_h_c;
                --go
                nx_state <= S_DO_SHA3_256;
                
            when SKE_SHA3_256_K_hat_h_c =>
                --prep params
                nx_base_addr0 <= K_hat; --src
                nx_word_num0 <= to_unsigned((256/8+256/8)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words, size of K_hat + size of h_c
                nx_base_addr1 <= K; --put it after K_hat to hash them together
                --set return state
                nx_ret_state <= SKE_OUTPUT_CIPHER;
                --go
                nx_state <= S_DO_SHA3_256;
                
            when SKE_OUTPUT_CIPHER =>
                --prep params
                nx_offset <= (others=>'0');
                nx_base_addr0 <= Bp; --src
                nx_word_num0 <= to_unsigned((POLYVECp_SIZE_BYTES+POLYT_SIZE_BYTES)
                            /(MEM_WIDTH/8), nx_word_num0'length); --num of  words
                --set return state
                nx_ret_state <= SKE_OUTPUT_SHARED_KEY;
                --go
                nx_state <= S_EMMIT_OUTPUT;
                
            when SKE_OUTPUT_SHARED_KEY =>
                --prep params
                nx_offset <= (others=>'0');
                nx_base_addr0 <= K; --src
                nx_word_num0 <= to_unsigned((256/8)
                            /(MEM_WIDTH/8), nx_word_num0'length); --num of  words
                --set return state
                nx_ret_state <= ST_IDLE;
                --go
                nx_state <= S_EMMIT_OUTPUT;
                
            -- KEM_DECAPS (KD) states+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            --kem.decaps entry point
            when SKD_DECAPS => 
                nx_state <= SKD_LOAD_PK;
                
            when SKD_LOAD_PK =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= BS_b;
                nx_word_num0 <= to_unsigned(POLYVECp_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SKD_LOAD_SEED_A_SHARE0;
                --go
                nx_state <= S_LOAD_INPUT;
           
            when SKD_LOAD_SEED_A_SHARE0 =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= SEED_A;
                nx_word_num0 <= to_unsigned(SEED_A_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SKD_LOAD_SEED_A_SHARE1;
                nx_mem1_en_reg <= '0'; --disable mem1
                --go
                nx_state <= S_LOAD_INPUT;
            
            when SKD_LOAD_SEED_A_SHARE1 =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= SEED_A;
                nx_word_num0 <= to_unsigned(SEED_A_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SKD_LOAD_SK_SHARE0;
                nx_mem0_en_reg <= '0'; --disable mem0
                --go
                nx_state <= S_LOAD_INPUT;
                
            when SKD_LOAD_SK_SHARE0 =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= S;
                nx_word_num0 <= to_unsigned((PR_S_POLYVEC_SIZE_BYTES+256/8+256/8)/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SKD_LOAD_SK_SHARE1;
                nx_mem1_en_reg <= '0'; --disable mem1
                --go
                nx_state <= S_LOAD_INPUT;
             
             when SKD_LOAD_SK_SHARE1 =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= S;
                nx_word_num0 <= to_unsigned((PR_S_POLYVEC_SIZE_BYTES+256/8+256/8)/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SKD_LOAD_CIPHER;
                nx_mem0_en_reg <= '0'; --disable mem0
                --go
                nx_state <= S_LOAD_INPUT;
                      
             when SKD_LOAD_CIPHER =>
                nx_offset <= (others=>'0');
                nx_base_addr0 <= CIPHER_Bp;
                nx_word_num0 <= to_unsigned((POLYVECp_SIZE_BYTES+POLYT_SIZE_BYTES)/(MEM_WIDTH/8), 
                                    nx_word_num0'length);
                nx_ret_state <= SPD_Bp_MUL_S_VECT_BY_VECT; --call pke.dec
                --go
                nx_state <= S_LOAD_INPUT;

            --sha3-512(m, pkh)    
            when SKD_SHA3_512_Mp_PKH_1 =>
                --config sha3
                nx_ret_state <= SKD_SHA3_512_Mp_PKH_2;
                nx_state <= S_SHA3_512_CONFIG;
            
            when SKD_SHA3_512_Mp_PKH_2 =>
                --send message
                nx_base_addr0 <= M; --src
                nx_word_num0 <= to_unsigned(M_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num0'length); --num of input words
                nx_ret_state <= SKD_SHA3_512_Mp_PKH_3;
                --go
                nx_state <= S_SHA3_SND_DATA;
                
            when SKD_SHA3_512_Mp_PKH_3 =>
                --send pkh
                nx_base_addr0 <= PKH; --src
                nx_word_num0 <= to_unsigned((256/8)/(MEM_WIDTH/8), nx_word_num0'length); --num of input words
                nx_ret_state <= SKD_SHA3_512_Mp_PKH_4;
                --go
                nx_state <= S_SHA3_SND_DATA;
                
            when SKD_SHA3_512_Mp_PKH_4 =>
                nx_ret_state <= SKD_SHA3_512_Mp_PKH_5;
                --go 
                nx_state <= S_SHA3_ISSUE_TLAST;
            
            when SKD_SHA3_512_Mp_PKH_5 =>
                --save result
                nx_base_addr1 <= K_hat; --dest
                nx_word_num1 <= to_unsigned((512/8)/(MEM_WIDTH/8), nx_word_num1'length); --num of words
                nx_ret_state <= SKD_CALL_PKE_ENC;
                --go
                nx_state <= S_SHA3_GET_RES;
            
            when SKD_CALL_PKE_ENC =>
                nx_state <= SPE_GEN_S_p;

            when SKD_VERIF_CIPHER0 =>
                nx_base_addr0 <= CIPHER_Bp0; --comparison src0          
                nx_base_addr1 <= Bp0; --comparison src1
                nx_word_num0 <= to_unsigned(POLYp_SIZE_BYTES/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_verif_di_sel_reg <= '0'; --select ep coeff width
                nx_verif_do_sel_reg <= '0'; --select ep coeff width
                nx_mem1_en_reg <= '0'; --disable mem1
                nx_ret_state <= SKD_VERIF_CIPHER1;
                --go
                nx_state <= S_VERIF_SUB_POLY1;
            
            when SKD_VERIF_CIPHER1 =>
                nx_base_addr0 <= CIPHER_Bp1; --comparison src0          
                nx_base_addr1 <= Bp1; --comparison src1
                nx_word_num0 <= to_unsigned(POLYp_SIZE_BYTES/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_verif_di_sel_reg <= '0'; --select ep coeff width
                nx_verif_do_sel_reg <= '0'; --select ep coeff width
                nx_mem1_en_reg <= '0'; --disable mem1
                nx_ret_state <= SKD_VERIF_CIPHER2;
                --go
                nx_state <= S_VERIF_SUB_POLY1;
                
           when SKD_VERIF_CIPHER2 =>
                nx_base_addr0 <= CIPHER_Bp2; --comparison src0          
                nx_base_addr1 <= Bp2; --comparison src1
                nx_word_num0 <= to_unsigned(POLYp_SIZE_BYTES/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_verif_di_sel_reg <= '0'; --select ep coeff width
                nx_verif_do_sel_reg <= '0'; --select ep coeff width
                nx_mem1_en_reg <= '0'; --disable mem1
                nx_ret_state <= SKD_VERIF_CIPHER3;
                --go
                nx_state <= S_VERIF_SUB_POLY1;
                
            when SKD_VERIF_CIPHER3 =>
                nx_base_addr0 <= CIPHER_CM; --comparison src0          
                nx_base_addr1 <= CM; --comparison src1
                nx_word_num0 <= to_unsigned(POLYT_SIZE_BYTES/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_verif_di_sel_reg <= '1'; --select eT coeff width
                nx_verif_do_sel_reg <= '1'; --select eT coeff width
                nx_mem1_en_reg <= '0'; --disable mem1
                nx_ret_state <= SKD_SHA3_256_VERIF0;
                --go
                nx_state <= S_VERIF_SUB_POLY1;
                
            when SKD_SHA3_256_VERIF0 => --hash(c-c*0)
                --prep params
                nx_base_addr0 <= Bp; --src = c-c*0
                nx_word_num0 <= to_unsigned((POLYVECp_SIZE_BYTES+POLYT_SIZE_BYTES)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_clr_mem_dout1_reg <= '1'; --clear sha3 input share2
                nx_mem1_en_reg <= '0'; --disable mem1
                nx_base_addr1 <= VERIF_HASH; --put it after K_hat to hash them together
                nx_ret_state <= SKD_SHA3_256_VERIF1;
                --go
                nx_state <= S_DO_SHA3_256;
                
            when SKD_SHA3_256_VERIF1 => --hash(c*1)
                --prep params
                nx_base_addr0 <= Bp; --src = c*1
                nx_word_num0 <= to_unsigned((POLYVECp_SIZE_BYTES+POLYT_SIZE_BYTES)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_clr_mem_dout0_reg <= '1'; --clear sha3 input share1
                nx_mem0_en_reg <= '0'; --disable mem0
                nx_mixer_en_reg <= '1';
                nx_base_addr1 <= VERIF_HASH; --put it after K_hat to hash them together
                nx_ret_state <= SKD_VERIF_COMPARE;
                --go
                nx_state <= S_DO_SHA3_256;
            
            when SKD_VERIF_COMPARE =>
                nx_base_addr0 <= VERIF_HASH;
                nx_word_num0 <= to_unsigned((256/8)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_ret_state <= SKD_SHA3_256_C;
                --go
                nx_state <= S_VERIF_COMPARE;
            
            when SKD_SHA3_256_C =>
                --prep params
                nx_base_addr0 <= CIPHER_Bp; --src c= (Bp, cm)
                nx_word_num0 <= to_unsigned((POLYVECp_SIZE_BYTES+POLYT_SIZE_BYTES)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words
                nx_clr_mem_dout1_reg <= '1'; --clear sha3 input share2
                nx_base_addr1 <= R_h_c; --put it after K_hat to hash them together
                nx_mixer_en_reg <= '0';
                --set return state
                if dec_failed = '1' then
                    nx_ret_state <= SKD_SHA3_256_Z;
                else
                    nx_ret_state <= SKD_SHA3_256_K_hat;
                end if;
                --go
                nx_state <= S_DO_SHA3_256;
                
            --SHA3-256 K_hat and h_C or z when failed decryption is found
            --done only on dec success
            when SKD_SHA3_256_K_hat =>
                --prep params
                nx_base_addr0 <= K_hat; --src
                nx_word_num0 <= to_unsigned((256/8)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words, size of K_hat + size of h_c
                --set return state
                nx_ret_state <= SKD_SHA3_256_h_C;
                --go
                nx_state <= S_SHA3_256_CONFIG_SND;
            
            --done only on dec failure
            when SKD_SHA3_256_Z =>
                --prep params
                nx_base_addr0 <= Z; --src
                nx_word_num0 <= to_unsigned((256/8)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words, size of K_hat + size of h_c
                --set return state
                nx_ret_state <= SKD_SHA3_256_h_C;
                --go
                nx_state <= S_SHA3_256_CONFIG_SND;
                
            when SKD_SHA3_256_h_C =>
                --prep params
                nx_base_addr0 <= R_h_C; --src
                nx_word_num0 <= to_unsigned((256/8)/(MEM_WIDTH/8), 
                                nx_word_num0'length); --num of input words, size of K_hat + size of h_c
                --set return state
                nx_ret_state <= SKD_SHA3_SAVE_SHARED_KEY;
                --go
                nx_state <= S_SHA3_SND_DATA_LAST;
                
            when SKD_SHA3_SAVE_SHARED_KEY =>
                --save result
                nx_base_addr1 <= K; --dest
                nx_word_num1 <= to_unsigned((256/8)/(MEM_WIDTH/8), nx_word_num1'length); --num of words
                nx_ret_state <= SKD_OUTPUT_SHARED_KEY;
                --go
                nx_state <= S_SHA3_GET_RES;
                
                
            when SKD_OUTPUT_SHARED_KEY =>
                --prep params
                nx_offset <= (others=>'0');
                nx_base_addr0 <= K; --src
                nx_word_num0 <= to_unsigned((256/8)
                            /(MEM_WIDTH/8), nx_word_num0'length); --num of  words
                --set return state
                nx_ret_state <= ST_IDLE;
                --go
                nx_state <= S_EMMIT_OUTPUT;
                
            --PKE_DEC states =====================================================
            when SPD_Bp_MUL_S_VECT_BY_VECT => 
                --do l time
                if cnt1 = L then
                    --save result
                    --prep params
                    nx_state <= SPD_CALC_M;
                else
                    nx_offset <= (others=>'0');
                    nx_cnt1 <= cnt1 + 1;
                    if cnt1 = 0 then
                        nx_base_addr0 <= S0; --poly0
                        nx_base_addr1 <= CIPHER_Bp0; --poly1
                    elsif cnt1 = 1 then
                        nx_base_addr0 <= S1;
                        nx_base_addr1 <= CIPHER_Bp1;
                    else
                        nx_base_addr0 <= S2;
                        nx_base_addr1 <= CIPHER_Bp2;
                    end if;
                    nx_word_num0 <= to_unsigned(PR_S_POLY_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num0'length); --poly0 len
                    nx_mac_di_sel_reg0 <= "00"; --poly0 width converter = mem2half_mu

                    nx_word_num1 <= to_unsigned(POLYp_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num1'length); --poly1 len
                    nx_mac_di_sel_reg1 <= "10"; --poly0 width converter = mem2ep
                    
                    nx_ret_state <= SPD_Bp_MUL_S_VECT_BY_VECT;
                    --go
                    nx_state <= S_POLY_MUL_LD0;
                end if;
            
            when SPD_CALC_M =>
                --prep params
                nx_base_addr0 <= CIPHER_CM; --src addr
                nx_word_num0 <= to_unsigned(POLYT_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num0'length); --num of words
                nx_sub_di_sel_reg <= '1'; --input using mem2eT width converter
                nx_add_const_sel_reg <= "10"; --add h2 while pulling data
                
                nx_base_addr1 <= M; --dest addr
                nx_word_num1 <= to_unsigned((256/8)/(MEM_WIDTH/8), nx_word_num1'length); --num of words
                nx_sub_do_sel_reg <= '1'; --output using mem2eT width converter
                nx_ret_state <= SKD_SHA3_512_Mp_PKH_1;
                ep_1_shift_init <= '1'; --init shifter
                --go
                nx_state <= S_POLY_SUB;
            
            --PKE_ENC states ======================================================            
            when SPE_GEN_S_p =>
                --prep params
                nx_base_addr0 <= R_h_c; --src
                nx_word_num0 <= to_unsigned(32/(MEM_WIDTH/8), nx_word_num0'length); --num of input words
                nx_base_addr1 <= Sp; --cbd samples destination
                nx_word_num1 <= to_unsigned(PR_S_POLYVEC_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num1'length); --sampler output size
                --set return state
                nx_ret_state <= SPE_A_MUL_Sp;
                --go
                nx_state <= S_GEN_CBD_SHAKE;
                
            -- A*Sp + h =================================================================    
            when SPE_A_MUL_Sp =>
                nx_cnt0 <= (others=>'0'); -- for low-level functions
                nx_cnt1 <= (others=>'0'); -- row index
                nx_cnt2 <= (others=>'0'); -- colomn index
                --prep params
                nx_ret_state <= SPE_GEN_A_SND_SEED_A;
                --go
                nx_state <= S_GEN_A_SHAKE;
                
            when SPE_GEN_A_SND_SEED_A =>
                --prep params
                nx_base_addr0 <= SEED_A; --src
                nx_word_num0 <= to_unsigned(SEED_A_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num0'length); --num of input words
                --set return state
                nx_ret_state <= SPE_GEN_A_SND_SEED_A_TLAST;
                --go
                nx_state <= S_SHA3_SND_DATA;
            
            when SPE_GEN_A_SND_SEED_A_TLAST =>
                nx_mixer_en_reg <= '1'; --select unshared sha3 output
                nx_ret_state <= SPE_A_MUL_Sp_MAT_BY_VECT;
                nx_state <= S_SHA3_ISSUE_TLAST;
            
            when SPE_A_MUL_Sp_MAT_BY_VECT =>
                --do l time
                --mul a row of A with vector Sp
                if cnt1 = L then
                    nx_cnt1 <= (others=>'0');
                    mac_clr <= '1';
                    nx_mixer_en_reg <= '0';
                    nx_state <= SPE_B_MUL_Sp_VECT_BY_VECT;
                else
                    mac_clr <= '1';
                    nx_cnt1 <= cnt1 + 1;
                    nx_cnt2 <= (others=>'0');
                    eq_ep_shift_init <= '1'; --init shifter
                    nx_state <= SPE_A_MUL_Sp_VECT_BY_VECT;
                end if;
            
            when SPE_A_MUL_Sp_VECT_BY_VECT => --- one row from A by S_p
                --do l time
                if cnt2 = L then
                    --save result
                    --prep params
                    if cnt1 = 1 then
                        nx_base_addr0 <= Bp0; --poly0
                    elsif cnt1 = 2 then
                        nx_base_addr0 <= Bp1;
                    else
                        nx_base_addr0 <= Bp2;
                    end if;
                    nx_offset <= (others=>'0');
                    nx_word_num0 <= to_unsigned(POLYp_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num0'length); --num of words
                    nx_add_const_sel_reg <= "01"; --add h1 while pulling data
                    nx_ret_state <= SPE_A_MUL_Sp_MAT_BY_VECT;
                    nx_state <= S_POLY_MUL_SAVE_RES;
                else
                    nx_cnt2 <= cnt2 + 1;
                    nx_state <= SPE_GEN_A_POLY;
                end if;
            
            when SPE_GEN_A_POLY =>
                --prep params
                nx_base_addr1 <=A_POLY; --dest
                nx_word_num1 <= to_unsigned(POLYq_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num1'length); --num of input words                
                --set return state
                nx_ret_state <= SPE_A_POLY_MUL_Sp_POLY;
                --go
                nx_state <= S_GEN_A_POLY_LOW;
            
            when SPE_A_POLY_MUL_Sp_POLY =>
                --set param registers for poly mul
                --set poly addresses base2 = base0 * base1
                --index in polyvec
                if cnt2 = 1 then
                    nx_base_addr0 <= Sp0; --poly0
                elsif cnt2 = 2 then
                    nx_base_addr0 <= Sp1;
                else
                    nx_base_addr0 <= Sp2;
                end if;
                nx_word_num0 <= to_unsigned(PR_S_POLY_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num0'length); --poly0 len
                nx_mac_di_sel_reg0 <= "00"; --poly0 width converter
                
                nx_base_addr1 <= A_POLY; --poly1
                nx_word_num1 <= to_unsigned(POLYq_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num1'length); --poly1 len
                nx_mac_di_sel_reg1 <= "01"; --poly0 width converter
                
                nx_ret_state <= SPE_A_MUL_Sp_VECT_BY_VECT;
                --go
                nx_state <= S_POLY_MUL_LD0;
                
            when SPE_B_MUL_Sp_VECT_BY_VECT =>
                --do l time
                if cnt1 = L then
                    --save result
                    --prep params
                    nx_state <= SPE_CALC_CM;
                else
                    nx_offset <= (others=>'0');
                    nx_cnt1 <= cnt1 + 1;
                    if cnt1 = 0 then
                        nx_base_addr0 <= Sp0; --poly0
                        nx_base_addr1 <= BS_b0; --poly1
                    elsif cnt1 = 1 then
                        nx_base_addr0 <= Sp1;
                        nx_base_addr1 <= BS_b1;
                    else
                        nx_base_addr0 <= Sp2;
                        nx_base_addr1 <= BS_b2;
                    end if;
                    nx_word_num0 <= to_unsigned(PR_S_POLY_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num0'length); --poly0 len
                    nx_mac_di_sel_reg0 <= "00"; --poly0 width converter = mem2half_mu
                    
                    nx_word_num1 <= to_unsigned(POLYp_SIZE_BYTES/(MEM_WIDTH/8), 
                                    nx_word_num1'length); --poly1 len
                    nx_mac_di_sel_reg1 <= "10"; --poly0 width converter = mem2ep
                    
                    nx_ret_state <= SPE_B_MUL_Sp_VECT_BY_VECT;
                    --go
                    nx_state <= S_POLY_MUL_LD0;
                end if;
                             
            when SPE_CALC_CM =>
                --prep params
                nx_base_addr0 <= M; --src addr
                nx_word_num0 <= to_unsigned(M_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num0'length); --num of words
                nx_sub_di_sel_reg <= '0'; --input using mem21 width converter
                
                nx_base_addr1 <= CM; --dest addr
                nx_word_num1 <= to_unsigned(POLYT_SIZE_BYTES/(MEM_WIDTH/8), nx_word_num1'length); --num of words
                nx_sub_do_sel_reg <= '0'; --output using mem2eT width converter
                --return tp caller kem.encap or kem decap
                if decaps = '1' then
                    nx_ret_state <= SKD_VERIF_CIPHER0;
                else
                    nx_ret_state <= SKE_SHA3_256_C;
                end if;
                nx_add_const_sel_reg <= "01"; --add h1 while pulling data
                ep_eT_shift_init <= '1'; --init shifter
                --go
                nx_state <= S_POLY_SUB; 


            -- Low-level control =============================================================
            --Polynomial arithmetic   
            when S_POLY_MUL_LD0 => --entry point
                --base_addr0 = src, base_addr1 = src2, base_addr2 = dest
                -- perform acc <- src1 * src2 + acc if dest <>0
                --         dest <- acc
                --         acc <- 0 (clear mac) 
                -- perform des <- src1 * src2 + acc if dst == 0 
                --read first polynomail
                base <= base_addr0;
                mac_di_sel <= mac_di_sel_reg0;
                wc_mac_di_valid <= '1'; 
                if wc_mac_di_ready = '1' then
                    if offset = word_num0-1 then
                        nx_offset <= (others=>'0');
                        nx_state <= S_WAIT_MAC_DI_WC0;
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_POLY_MUL_LD0;
                    end if;
                else
                    nx_state <= S_POLY_MUL_LD0;
                end if;
                
            when S_WAIT_MAC_DI_WC0 =>
                mac_di_sel <= mac_di_sel_reg0; --keep selector
                if wc_mac_di_empty = '1' then
                    nx_state <= S_POLY_MUL_LD1;
                else
                    nx_state <= S_WAIT_MAC_DI_WC0;
                end if;
            
            when S_POLY_MUL_LD1 =>
                mac_di_sel <= mac_di_sel_reg1;
                base <= base_addr1;
                wc_mac_di_valid <= '1';
                if wc_mac_di_ready = '1' then
                    if offset = word_num1-1 then
                        nx_state <= S_WAIT_MAC_DI_WC1;
                        nx_offset <= (others=>'0');
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_POLY_MUL_LD1;
                    end if;
                else
                    nx_state <= S_POLY_MUL_LD1;
                end if;
            
            when S_WAIT_MAC_DI_WC1 =>
                mac_di_sel <= mac_di_sel_reg1; --keep selector
                if wc_mac_di_empty = '1' then
                    nx_state <= ret_state;
                else
                    nx_state <= S_WAIT_MAC_DI_WC1;
                end if;
                
            when S_POLY_MUL_SAVE_RES =>
                base <= base_addr0;
                wc_ep2mem_en <= '1';
                wc_ep2mem_do_ready <= '1';
                if wc_ep2mem_do_valid = '1' then
                    mem_we <= '1';
                    if offset = word_num0-1 then
                        nx_offset <= (others=>'0');
                        nx_state <= ret_state;
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_POLY_MUL_SAVE_RES;
                    end if;
                else
                    nx_state <= S_POLY_MUL_SAVE_RES;
                end if;
                
            --PolySub control===================================================================
            when S_POLY_SUB =>
                sub_sel <= '1';
                base <= base_addr0;
                wc_sub_di_valid <= '1';
                if wc_sub_di_ready = '1' then
                    if offset = word_num0-1 then
                        nx_state <= S_WAIT_SUB;
                        nx_offset <= (others=>'0');
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_POLY_SUB;
                    end if;
                else
                    nx_state <= S_POLY_SUB;
                end if;
                
             when S_WAIT_SUB =>
                sub_sel <= '1';
                if wc_sub_di_empty = '1' then
                    nx_state <= S_POLY_SUB_SAVE_RES;
                else
                    nx_state <= S_WAIT_SUB;
                end if;
                
            when S_POLY_SUB_SAVE_RES =>
                mem_din_sel <= "100";
                base <= base_addr1; -- dest addr
                wc_sub_do_ready <= '1';
                if wc_sub_do_valid = '1' then
                    mem_we <= '1';
                    if offset = word_num1-1 then -- num of words
                        nx_offset <= (others=>'0');
                        nx_state <= ret_state;
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_POLY_SUB_SAVE_RES;
                    end if;
                else
                    nx_state <= S_POLY_SUB_SAVE_RES;
                end if;
            
            --=================================================================================
            -- SHA3 control
            when S_DO_SHA3_256 =>
                --base_addr0 = src, base_addr1 = dest, word_num = length of input
                nx_offset <= (others=>'0');
                nx_cnt0 <= (others=>'0');
                nx_word_num1 <= to_unsigned((256/8)/(MEM_WIDTH/8), 
                                nx_word_num1'length); --set number of result words
                sha3_cmd_valid <= '1';
                sha3_cmd_bits_mode <= HASH_MODE_SHA3_256;
                if sha3_cmd_ready = '1' then
                    nx_state <= S_SHA3_SND_MSG;
                else
                    nx_state <= S_DO_SHA3_256;
                end if;
                
            when S_DO_SHA3_512 =>
                --base_addr0 = src, base_addr1 = dest, word_num = length of input
                nx_offset <= (others=>'0');
                nx_cnt0 <= (others=>'0');
                nx_word_num1 <= to_unsigned((512/8)/(MEM_WIDTH/8), nx_word_num1'length); --set number of result words
                sha3_cmd_valid <= '1';
                sha3_cmd_bits_mode <= HASH_MODE_SHA3_512;
                if sha3_cmd_ready = '1' then
                    nx_state <= S_SHA3_SND_MSG;
                else
                    nx_state <= S_DO_SHA3_512;
                end if;
            
            when S_SHA3_SND_MSG =>
                base <= base_addr0;
                if cnt0 = SHA3_IO_WIDTH/MEM_WIDTH then
                    sha3_din_valid <= '1';
                    if sha3_din_ready = '1' then
                        --nx_state <= S_SHA3_SND_MSG;
                        --check if msg ended
                         nx_cnt0 <= (others=>'0');
                         if offset = word_num0 then
                            sha3_in_sipo_clr <= '1'; --clear input befor t_last
                            nx_state <= S_SHA3_SND_TLAST;
                            nx_offset <= (others=>'0');
                            nx_cnt0 <= (others=>'0');
                        else
                            nx_state <= S_SHA3_SND_MSG;
                        end if;
                    else
                        nx_state <= S_SHA3_SND_MSG;
                    end if;
                else
                    nx_state <= S_SHA3_SND_MSG;
                    nx_cnt0 <= cnt0 + 1;
                    nx_offset <= offset + 1;
                    sha3_in_sipo_en <= '1';
                end if;
            
            when S_SHA3_SND_TLAST =>
                if sha3_din_ready = '1' then
                    sha3_din_valid <= '1';
                    sha3_din_bits_tlast <= '1';
                    nx_state <= S_SHA3_GET_RES;
                    nx_clr_mem_dout0_reg <= '0'; --allow
                    nx_clr_mem_dout1_reg <= '0'; --allow
                else
                    nx_state <=S_SHA3_SND_TLAST;
                end if;
            
            --sample s_p low-level since it directly controls datapath
            when S_GEN_CBD_SHAKE =>
                --run SHAKE128
                nx_offset <= (others=>'0');
                nx_cnt0 <= (others=>'0');
                
                sha3_cmd_valid <= '1';
                sha3_cmd_bits_mode <= HASH_MODE_SHA3_SHAKE128;
                sha3_cmd_bits_numSqueezeWords <= std_logic_vector(
                                to_unsigned(CBD_SHAKE_BYTES/(SHA3_IO_WIDTH/8),
                                sha3_cmd_bits_numSqueezeWords'length )); --number of shake words
                if sha3_cmd_ready = '1' then
                    nx_state <= S_GEN_CBD_SND_SEED;
                else
                    nx_state <= S_GEN_CBD_SHAKE;
                end if;
             
            when S_GEN_CBD_SND_SEED =>
                base <= base_addr0; --seed addr
                if cnt0 = SHA3_IO_WIDTH/MEM_WIDTH then
                    sha3_din_valid <= '1';
                    if sha3_din_ready = '1' then
                        --check if msg ended
                         nx_cnt0 <= (others=>'0');
                         if offset = word_num0 then --seed size
                            sha3_in_sipo_clr <= '1'; --clear input befor t_last
                            nx_state <= S_GEN_CBD_SND_TLAST;
                            nx_offset <= (others=>'0');
                            nx_cnt0 <= (others=>'0');
                        else
                            nx_state <= S_GEN_CBD_SND_SEED;
                        end if;
                    else
                        nx_state <= S_GEN_CBD_SND_SEED;
                    end if;
                else
                    nx_state <= S_GEN_CBD_SND_SEED;
                    nx_cnt0 <= cnt0 + 1;
                    nx_offset <= offset + 1;
                    sha3_in_sipo_en <= '1';
                end if;
            
            when S_GEN_CBD_SND_TLAST =>
                if sha3_din_ready = '1' then
                    sha3_din_valid <= '1';
                    sha3_din_bits_tlast <= '1';
                    nx_state <= S_GEN_CBD_GET_SAMPLES;
                else
                    nx_state <=S_GEN_CBD_SND_TLAST;
                end if;
                
            when S_GEN_CBD_GET_SAMPLES =>
                --simple connections
                mem_din_sel <= "011";
                if sha3_dout_valid = '1' then
                    sampler_din_valid <= '1';
                end if;
                if sampler_din_ready = '1' then
                    sha3_dout_ready <= '1';
                end if;
                ---
                base <= base_addr1; --sample destination
                sampler_dout_ready <= '1';
                if sampler_dout_valid = '1' then
                    mem_we <= '1';
                    if offset = word_num1-1 then --output size
                        nx_state <= ret_state;
                        nx_offset <= (others=>'0');
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_GEN_CBD_GET_SAMPLES;
                    end if;
                else
                    nx_state <= S_GEN_CBD_GET_SAMPLES;
                end if;
                
            --! Gen A====================================================
            when S_GEN_A_SHAKE =>
                --run SHAKE128
                sha3_cmd_valid <= '1';
                sha3_cmd_bits_mode <= HASH_MODE_SHA3_SHAKE128;
                sha3_cmd_bits_numSqueezeWords <= std_logic_vector(
                                to_unsigned(POLYq_SIZE_BYTES*L*L/(SHA3_IO_WIDTH/8),
                                sha3_cmd_bits_numSqueezeWords'length )); --number of shake words
                if sha3_cmd_ready = '1' then
                    nx_state <= ret_state;
                else
                    nx_state <= S_GEN_A_SHAKE;
                end if;
            
            --general purpose sha3=======================================
            when S_SHA3_256_CONFIG =>
                sha3_cmd_valid <= '1';
                sha3_cmd_bits_mode <= HASH_MODE_SHA3_256;
                if sha3_cmd_ready = '1' then
                    nx_state <= ret_state;
                else
                    nx_state <= S_SHA3_256_CONFIG;
                end if;
            
            when S_SHA3_512_CONFIG =>
                sha3_cmd_valid <= '1';
                sha3_cmd_bits_mode <= HASH_MODE_SHA3_512;
                if sha3_cmd_ready = '1' then
                    nx_state <= ret_state;
                else
                    nx_state <= S_SHA3_512_CONFIG;
                end if;
            
            when S_SHA3_256_CONFIG_SND =>
                sha3_cmd_valid <= '1';
                sha3_cmd_bits_mode <= HASH_MODE_SHA3_256;
                if sha3_cmd_ready = '1' then
                    nx_state <= S_SHA3_SND_DATA;
                else
                    nx_state <= S_SHA3_256_CONFIG_SND;
                end if;
                
            when S_SHA3_SND_DATA_LAST =>
                base <= base_addr0; --data address
                if cnt0 = SHA3_IO_WIDTH/MEM_WIDTH then
                    sha3_din_valid <= '1';
                    if sha3_din_ready = '1' then
                        --check if msg ended
                         nx_cnt0 <= (others=>'0');
                         if offset = word_num0 then --seed size
                            sha3_in_sipo_clr <= '1'; --clear input befor t_last
                            nx_state <= S_SHA3_ISSUE_TLAST;
                            nx_offset <= (others=>'0');
                            nx_cnt0 <= (others=>'0');
                        else
                            nx_state <= S_SHA3_SND_DATA_LAST;
                        end if;
                    else
                        nx_state <= S_SHA3_SND_DATA_LAST;
                    end if;
                else
                    nx_state <= S_SHA3_SND_DATA_LAST;
                    nx_cnt0 <= cnt0 + 1;
                    nx_offset <= offset + 1;
                    sha3_in_sipo_en <= '1';
                end if;
                  
            when S_SHA3_SND_DATA =>
                base <= base_addr0; --data address
                if cnt0 = SHA3_IO_WIDTH/MEM_WIDTH then
                    sha3_din_valid <= '1';
                    if sha3_din_ready = '1' then
                        --check if msg ended
                         nx_cnt0 <= (others=>'0');
                         if offset = word_num0 then --seed size
                            sha3_in_sipo_clr <= '1'; --clear input befor t_last
                            nx_state <= ret_state;
                            nx_offset <= (others=>'0');
                            nx_cnt0 <= (others=>'0');
                        else
                            nx_state <= S_SHA3_SND_DATA;
                        end if;
                    else
                        nx_state <= S_SHA3_SND_DATA;
                    end if;
                else
                    nx_state <= S_SHA3_SND_DATA;
                    nx_cnt0 <= cnt0 + 1;
                    nx_offset <= offset + 1;
                    sha3_in_sipo_en <= '1';
                end if;
                
            when S_SHA3_ISSUE_TLAST =>
                if sha3_din_ready = '1' then
                    sha3_din_valid <= '1';
                    sha3_din_bits_tlast <= '1';
--                    nx_clr_mem_dout1_reg <= '0'; --allow sha3 input share2
                    nx_state <= ret_state;
                else
                    nx_state <=S_SHA3_ISSUE_TLAST;
                end if;
                
            when S_SHA3_GET_RES =>
                nx_cnt0 <= (others=>'0');
                if offset = word_num1 then
                    nx_mem0_en_reg <= '1'; --enable mem0
                    nx_mem1_en_reg <= '1'; --enable mem1
                    nx_state <= ret_state;
                    nx_offset <= (others=>'0');
                    nx_cnt0 <= (others=>'0');
                else
                    if mixer_en_reg = '1' then
                        nx_state <= S_SHA3_GET_WORD_FROM_MIXER;
                    else
                        nx_state <= S_SHA3_GET_WORD;
                    end if;
                end if;
                
            when S_SHA3_GET_WORD =>
                mem_din_sel <= "001";
                base <= base_addr1; --destination
                sha3_out_sel <= std_logic_vector(cnt0(1 downto 0));
                if sha3_dout_valid = '1' then
                    mem_we <= '1';
                    nx_offset <= offset + 1;
                    if cnt0 = 3 then
                        sha3_dout_ready <= '1';
                        nx_cnt0 <= (others=>'0');
                        nx_state <= S_SHA3_GET_RES;
                    else
                        nx_cnt0 <= cnt0 + 1;
                        if mixer_en_reg = '1' then
                            nx_state <= S_SHA3_GET_WORD_FROM_MIXER;
                        else
                            nx_state <= S_SHA3_GET_WORD;
                        end if;
                    end if;
                else
                    if mixer_en_reg = '1' then
                        nx_state <= S_SHA3_GET_WORD_FROM_MIXER;
                    else
                        nx_state <= S_SHA3_GET_WORD;
                    end if;
                end if;
            
            when S_SHA3_GET_WORD_FROM_MIXER =>
                mem_din_sel <= "001";
                base <= base_addr1; --destination
                sha3_out_sel <= std_logic_vector(cnt0(1 downto 0));
                if sha3_mixer_di_ready = '1' then
                    sha3_dout_ready <= '1';
                end if;
                if sha3_mixer_do_valid = '1' then
                    mem_we <= '1';
                    nx_offset <= offset + 1;
                    if cnt0 = 3 then
                        sha3_mixer_do_ready <= '1';
                        nx_cnt0 <= (others=>'0');
                        nx_state <= S_SHA3_GET_RES;
                    else
                        nx_cnt0 <= cnt0 + 1;
                        nx_state <= S_SHA3_GET_WORD_FROM_MIXER;
                    end if;
                else
                    nx_state <= S_SHA3_GET_WORD_FROM_MIXER;
                end if; 
            --end sha3=======================================================
                
            when S_GEN_A_POLY_LOW =>
                nx_cnt0 <= (others=>'0');
                if offset = word_num1 then
                    nx_state <= ret_state;
                    nx_offset <= (others=>'0');
                    nx_cnt0 <= (others=>'0');
                else
                    nx_state <= S_GEN_A_POLY_GET_WORD;
                end if;
                        
            when S_GEN_A_POLY_GET_WORD =>
                mem_din_sel <= "001";
                base <= base_addr1; --destination
                sha3_out_sel <= std_logic_vector(cnt0(1 downto 0));
                if sha3_mixer_di_ready = '1' then
                    sha3_dout_ready <= '1';
                end if;
                if sha3_mixer_do_valid = '1' then
                    mem_we <= '1';
                    nx_offset <= offset + 1;
                    if cnt0 = 3 then
                        sha3_mixer_do_ready <= '1';
                        nx_cnt0 <= (others=>'0');
                        nx_state <= S_GEN_A_POLY_LOW;
                    else
                        nx_cnt0 <= cnt0 + 1;
                        nx_state <= S_GEN_A_POLY_GET_WORD;
                    end if;
                else
                    nx_state <= S_GEN_A_POLY_GET_WORD;
                end if;
            
            --load input data states
            when S_LOAD_INPUT =>
                mem_din_sel <= "010";
                base <= base_addr0; --dest addr
                din_ready <= '1';
                if din_valid = '1' then
                    mem_we <= '1';
                    if offset = word_num0-1 then --number of words
                        --prep params
                        nx_offset <= (others=>'0');
                        nx_cnt1 <= (others=>'0');
                        nx_mem0_en_reg <= '1'; --re-enable all memories
                        nx_mem1_en_reg <= '1';
                        nx_state <= ret_state;
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_LOAD_INPUT;
                    end if;
                else
                    nx_state <= S_LOAD_INPUT;
                end if;
            
            when S_EMMIT_OUTPUT =>
                dout_valid <= '1';
                base <= base_addr0;
                if dout_ready = '1' then
                    if offset = word_num0-1 then
                        nx_state <= ret_state;
                        nx_offset <= (others=>'0');
                    else
                        nx_offset <= offset + 1;
                    end if;
                else
                    nx_state <= S_EMMIT_OUTPUT;
                end if;
            
            --verification low-level
            when S_VERIF_REGISTER =>
            --save in datapath register
                base <= base_addr0; --src0
                nx_state <= S_VERIF_COMPARE;
                
            when S_VERIF_COMPARE =>
                base <= base_addr0; --src1
                verif_compare_en <= '1';
                if offset > 0 then --allow one clk for data to pass registers
                    if verif_neq = '1' then
                        nx_dec_failed <= '1';
                    end if;
                end if;
                if offset = word_num0 then --one clk delay
                    nx_offset <= (others=>'0');
                    nx_state <= ret_state;
                else
                    nx_offset <= offset + 1;
                    nx_state <= S_VERIF_COMPARE;
                end if;
            
            when S_VERIF_SUB_POLY1 =>
                base <= base_addr0;
                verif_di_valid <= '1';
                if verif_di_ready = '1' then
                    if offset = word_num0-1 then
                        nx_state <= S_VERIF_SUB_POLY2;
                        nx_offset <= (others=>'0');
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_VERIF_SUB_POLY1;
                    end if;
                else
                    nx_state <= S_VERIF_SUB_POLY1;
                end if;
                
            when S_VERIF_SUB_POLY2 =>
                base <= base_addr1;
                verif_di_valid <= '1';
                if verif_di_ready = '1' then
                    if offset = word_num0-1 then
                        nx_state <= S_VERIF_SUB_SAVE_RES;
                        nx_offset <= (others=>'0');
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_VERIF_SUB_POLY2;
                    end if;
                else
                    nx_state <= S_VERIF_SUB_POLY2;
                end if;
                
            when S_VERIF_SUB_SAVE_RES =>
                mem_din_sel <= "101"; --from verif
                base <= base_addr1; -- dest addr
                verif_do_ready <= '1';
                if verif_do_valid = '1' then
                    mem_we <= '1';
                    if offset = word_num0-1 then -- num of words
                        nx_offset <= (others=>'0');
                        nx_mem1_en_reg <= '1'; --re-enable mem1
                        nx_state <= ret_state;
                    else
                        nx_offset <= offset + 1;
                        nx_state <= S_VERIF_SUB_SAVE_RES;
                    end if;
                else
                    nx_state <= S_VERIF_SUB_SAVE_RES;
                end if;
                
            when others =>
                nx_state <= ST_IDLE;           

        end case;

    end process;

end behav;
