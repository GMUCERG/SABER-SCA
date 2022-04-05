--------------------------------------------------------------------------------
--! @file       saber_pkg.vhd
--! @author     Abubakr Abdulgadir
--! @copyright  Copyright (c) 2021 Cryptographic Engineering Research Group
--!             ECE Department, George Mason University Fairfax, VA, U.S.A.
--!             All rights Reserved.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package saber_pkg is
    --Saber parameters
    constant eq            : natural := 13;
    constant ep            : natural := 10;
    constant eT            : natural := 4;
    constant N             : natural := 256;
    --for Saber
    constant L             : natural := 3;
    constant MU            : natural := 8;
    constant h1            : natural := 2**(eq-ep-1);
    constant h2            : natural := 2**(ep-2) - 2**(ep-eT-1) + 2**(eq-ep-1);
    
    --Implementation specific=======================================================================
    constant COEFF_SIZE    : natural := 13;
    constant ROLL          : natural :=  8;  -- Polynomail multiplier rolling factor: 2, 4 .. ,N/2

    --! functions
    function log2_ceil (N: natural) return natural;

    constant INDEX_SIZE      : natural := log2_ceil(N);
    constant MEM_ADDR_SIZE   : natural := 12;
    constant MEM_WIDTH       : natural := 16;
    constant MEM_WIDTH_BYTES : natural := MEM_WIDTH/8;
    constant DIN_FIFO_WIDTH  : natural := 16;
    constant DIN_FIFO_LOG2DEPTH  : natural := 12;
    --opcodes
    constant OPCODE_ENCAPS : std_logic_vector(DIN_FIFO_WIDTH-1 downto 0) := x"EEEE";
    constant OPCODE_DECAPS : std_logic_vector(DIN_FIFO_WIDTH-1 downto 0) := x"DDDD";

    ---Object sizes in bytes
    constant POLYq_SIZE_BYTES     : natural := N*eq/8;
    constant POLYVECq_SIZE_BYTES  : natural := L*N*eq/8; 
    constant POLYp_SIZE_BYTES     : natural := N*ep/8; 
    constant POLYVECp_SIZE_BYTES  : natural := L*N*ep/8;
    constant POLYT_SIZE_BYTES     : natural := N*eT/8;
    constant POLYVECT_SIZE_BYTES  : natural := L*N*eT/8;
    constant SEED_A_SIZE_BYTES    : natural := 256/8;
    constant M_SIZE_BYTES         : natural := 256/8;
    constant CBD_SAMPLE_SIZE      : natural := MU/2; --double check
    constant S_POLY_SIZE_BYTES    : natural := CBD_SAMPLE_SIZE * N /8;
    constant S_POLYVEC_SIZE_BYTES : natural := L * CBD_SAMPLE_SIZE * N /8;
    constant CBD_SHAKE_BYTES      : natural := 2*S_POLYVEC_SIZE_BYTES;


    ---sha3
    --sha3 modes
    constant HASH_MODE_SHA3_256      : std_logic_vector(1 downto 0) := "00";
    constant HASH_MODE_SHA3_512      : std_logic_vector(1 downto 0) := "01";
    constant HASH_MODE_SHA3_SHAKE128 : std_logic_vector(1 downto 0) := "10";
    
    constant SHA3_IO_WIDTH : natural := 64;
    
    --CBD sampler
    constant CBD_SAMPLER_DI_WIDTH : natural := 64;
    constant CBD_SAMPLER_DO_WIDTH : natural := 16;

end saber_pkg;

package body saber_pkg is

    --! Log of base 2
    function log2_ceil (N: natural) return natural is
    begin
         if ( N = 0 ) then
             return 0;
         elsif N <= 2 then
             return 1;
         else
            if (N mod 2 = 0) then
                return 1 + log2_ceil(N/2);
            else
                return 1 + log2_ceil((N+1)/2);
            end if;
         end if;
    end function log2_ceil;

end package body;
