--------------------------------------------------------------------------------
--! @file       saber_pr_pkg.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.saber_pkg.all;

package saber_pr_pkg is
    constant PR_S_POLY_SIZE_BYTES : natural := 2 * 256; --put every coeff in 2 bytes
    constant PR_S_POLYVEC_SIZE_BYTES : natural := L * PR_S_POLY_SIZE_BYTES;  
    ---base addressses (byte address)=====================================================
    constant BS_b_LOC                  : natural := 0;
    constant BS_b0_LOC                 : natural := BS_b_LOC;
    constant BS_b1_LOC                 : natural := BS_b_LOC + 1*POLYp_SIZE_BYTES;
    constant BS_b2_LOC                 : natural := BS_b_LOC + 2*POLYp_SIZE_BYTES;
    constant SEED_A_LOC                : natural := BS_b_loc + POLYVECp_SIZE_BYTES;
    constant S_LOC                     : natural := SEED_A_LOC + SEED_A_SIZE_BYTES;
    constant S0_LOC                    : natural := S_LOC + 0 * PR_S_POLY_SIZE_BYTES;
    constant S1_LOC                    : natural := S_LOC + 1 * PR_S_POLY_SIZE_BYTES;
    constant S2_LOC                    : natural := S_LOC + 2 * PR_S_POLY_SIZE_BYTES;
    constant PKH_LOC                   : natural := S_LOC + PR_S_POLYVEC_SIZE_BYTES;
    constant Z_LOC                     : natural := PKH_LOC + 256/8;
    
    
    constant CIPHER_Bp_LOC             : natural := Z_LOC + 256/8;
    constant CIPHER_Bp0_LOC            : natural := CIPHER_Bp_LOC;
    constant CIPHER_Bp1_LOC            : natural := CIPHER_Bp_LOC + 1*POLYp_SIZE_BYTES;
    constant CIPHER_Bp2_LOC            : natural := CIPHER_Bp_LOC + 2*POLYp_SIZE_BYTES;
    
    constant CIPHER_CM_LOC             : natural := CIPHER_Bp_LOC + POLYVECp_SIZE_BYTES;

    constant M_LOC                     : natural := CIPHER_CM_LOC + POLYT_SIZE_BYTES;
    constant M_HASH_LOC                : natural := M_LOC;
    constant PK_HASH_LOC               : natural := M_LOC + 256/8;
    constant K_HAT_LOC                 : natural := PK_HASH_LOC + 256/8;
    constant R_h_c_LOC                 : natural := K_HAT_LOC + 256/8;
    constant Sp_LOC                    : natural := R_h_c_LOC + 256/8;
    constant Sp0_LOC                   : natural := Sp_LOC + 0 * PR_S_POLY_SIZE_BYTES; --S'[0]
    constant Sp1_LOC                   : natural := Sp_LOC + 1 * PR_S_POLY_SIZE_BYTES; --S'[1]
    constant Sp2_LOC                   : natural := Sp_LOC + 2 * PR_S_POLY_SIZE_BYTES; --S'[2]
    constant A_POLY_LOC                : natural := Sp_LOC + PR_S_POLYVEC_SIZE_BYTES;
    constant Bp_LOC                    : natural := A_POLY_LOC + POLYq_SIZE_BYTES;
    constant Bp0_LOC                   : natural := Bp_LOC + 0 * POLYp_SIZE_BYTES;
    constant Bp1_LOC                   : natural := Bp_LOC + 1 * POLYp_SIZE_BYTES;
    constant Bp2_LOC                   : natural := Bp_LOC + 2 * POLYp_SIZE_BYTES;
    constant CM_LOC                    : natural := Bp_LOC + POLYVECp_SIZE_BYTES;
    constant K_LOC                     : natural := CM_LOC + POLYT_SIZE_BYTES;
    constant VERIF_HASH_LOC            : natural := K_LOC + 256/8;

    --Base addresses (location=word address)
    --loaded data
    --public key
    constant BS_b : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  BS_b_loc/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     constant BS_b0 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  BS_b0_loc/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                 
     constant BS_b1 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  BS_b1_loc/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     constant BS_b2 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  BS_b2_loc/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     constant SEED_A : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  SEED_A_loc/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
     --secret key         
     constant S : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  S_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
     
     constant S0 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  S0_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     constant S1 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  S1_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     constant S2 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  S2_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     constant PKH : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  PKH_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));

     constant Z : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  Z_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     --ciphertext
     constant CIPHER_Bp : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  CIPHER_Bp_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
     
     constant CIPHER_Bp0 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  CIPHER_Bp0_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     constant CIPHER_Bp1 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  CIPHER_Bp1_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     constant CIPHER_Bp2 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  CIPHER_Bp2_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
                  
     constant CIPHER_CM : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  CIPHER_CM_LOC/MEM_WIDTH_BYTES, --addr
                  MEM_ADDR_SIZE));
                  
     --message
     constant M : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  M_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
     
     --end loaded data           
     constant M_HASH : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  M_HASH_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                  
     constant PK_HASH : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  PK_HASH_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
     
     constant K_HAT : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  K_HAT_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                  
     constant R_h_c : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  R_h_c_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                  
    constant Sp : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  Sp_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
    
    constant Sp0 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  Sp0_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
    
    constant Sp1 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  (Sp1_LOC)/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
    
    constant Sp2 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  Sp2_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
    
                  
    constant A_POLY : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  A_POLY_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                 
    constant Bp : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  Bp_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                  
    constant Bp0 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  Bp0_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                  
    constant Bp1 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  Bp1_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                  
    constant Bp2 : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  Bp2_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                  
    constant CM : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  CM_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
                  
    constant K : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  K_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
    
    constant VERIF_HASH : std_logic_vector(MEM_ADDR_SIZE-1 downto 0):= std_logic_vector(to_unsigned(
                  VERIF_HASH_LOC/MEM_WIDTH_BYTES,     --addr
                  MEM_ADDR_SIZE));
    

    ---End mem map================================================================================
    --prng 
    constant SEED_SIZE : natural := 128;
    constant RW        : natural := 16;

end saber_pr_pkg;

package body saber_pr_pkg is

end package body;
