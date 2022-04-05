module KeccakCore(
  input         clock,
  input         reset,
  output        io_din_ready,
  input         io_din_valid,
  input  [63:0] io_din_bits_0,
  input  [4:0]  io_ctrl_rateLanesMinusOne,
  input         io_ctrl_absorb,
  input         io_ctrl_absorbFin,
  input         io_ctrl_squeeze,
  input         io_dout_ready,
  output        io_dout_valid,
  output [63:0] io_dout_bits_0
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] keccakStateRegShares_0_0; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_1; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_2; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_3; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_4; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_5; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_6; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_7; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_8; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_9; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_10; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_11; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_12; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_13; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_14; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_15; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_16; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_17; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_18; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_19; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_20; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_21; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_22; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_23; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_0_24; // @[KeccakCore.scala 77:49]
  reg [2:0] state; // @[KeccakCore.scala 101:34]
  wire  _T_460 = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_463 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_472 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire  _GEN_263 = _T_463 ? 1'h0 : _T_472; // @[Conditional.scala 39:67]
  wire  selectLastSlice = _T_460 ? 1'h0 : _GEN_263; // @[Conditional.scala 40:58]
  wire  xCols_uiCols_cols_0__0 = selectLastSlice ? keccakStateRegShares_0_0[56] : keccakStateRegShares_0_0[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0__2 = selectLastSlice ? keccakStateRegShares_0_1[56] : keccakStateRegShares_0_1[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0__4 = selectLastSlice ? keccakStateRegShares_0_2[56] : keccakStateRegShares_0_2[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0__1 = selectLastSlice ? keccakStateRegShares_0_3[56] : keccakStateRegShares_0_3[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0__3 = selectLastSlice ? keccakStateRegShares_0_4[56] : keccakStateRegShares_0_4[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1__3 = selectLastSlice ? keccakStateRegShares_0_5[56] : keccakStateRegShares_0_5[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1__0 = selectLastSlice ? keccakStateRegShares_0_6[56] : keccakStateRegShares_0_6[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1__2 = selectLastSlice ? keccakStateRegShares_0_7[56] : keccakStateRegShares_0_7[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1__4 = selectLastSlice ? keccakStateRegShares_0_8[56] : keccakStateRegShares_0_8[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1__1 = selectLastSlice ? keccakStateRegShares_0_9[56] : keccakStateRegShares_0_9[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2__1 = selectLastSlice ? keccakStateRegShares_0_10[56] : keccakStateRegShares_0_10[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2__3 = selectLastSlice ? keccakStateRegShares_0_11[56] : keccakStateRegShares_0_11[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2__0 = selectLastSlice ? keccakStateRegShares_0_12[56] : keccakStateRegShares_0_12[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2__2 = selectLastSlice ? keccakStateRegShares_0_13[56] : keccakStateRegShares_0_13[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2__4 = selectLastSlice ? keccakStateRegShares_0_14[56] : keccakStateRegShares_0_14[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3__4 = selectLastSlice ? keccakStateRegShares_0_15[56] : keccakStateRegShares_0_15[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3__1 = selectLastSlice ? keccakStateRegShares_0_16[56] : keccakStateRegShares_0_16[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3__3 = selectLastSlice ? keccakStateRegShares_0_17[56] : keccakStateRegShares_0_17[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3__0 = selectLastSlice ? keccakStateRegShares_0_18[56] : keccakStateRegShares_0_18[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3__2 = selectLastSlice ? keccakStateRegShares_0_19[56] : keccakStateRegShares_0_19[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4__2 = selectLastSlice ? keccakStateRegShares_0_20[56] : keccakStateRegShares_0_20[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4__4 = selectLastSlice ? keccakStateRegShares_0_21[56] : keccakStateRegShares_0_21[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4__1 = selectLastSlice ? keccakStateRegShares_0_22[56] : keccakStateRegShares_0_22[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4__3 = selectLastSlice ? keccakStateRegShares_0_23[56] : keccakStateRegShares_0_23[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4__0 = selectLastSlice ? keccakStateRegShares_0_24[56] : keccakStateRegShares_0_24[0]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_1_0 = selectLastSlice ? keccakStateRegShares_0_0[57] : keccakStateRegShares_0_0[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_1_2 = selectLastSlice ? keccakStateRegShares_0_1[57] : keccakStateRegShares_0_1[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_1_4 = selectLastSlice ? keccakStateRegShares_0_2[57] : keccakStateRegShares_0_2[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_1_1 = selectLastSlice ? keccakStateRegShares_0_3[57] : keccakStateRegShares_0_3[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_1_3 = selectLastSlice ? keccakStateRegShares_0_4[57] : keccakStateRegShares_0_4[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_1_3 = selectLastSlice ? keccakStateRegShares_0_5[57] : keccakStateRegShares_0_5[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_1_0 = selectLastSlice ? keccakStateRegShares_0_6[57] : keccakStateRegShares_0_6[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_1_2 = selectLastSlice ? keccakStateRegShares_0_7[57] : keccakStateRegShares_0_7[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_1_4 = selectLastSlice ? keccakStateRegShares_0_8[57] : keccakStateRegShares_0_8[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_1_1 = selectLastSlice ? keccakStateRegShares_0_9[57] : keccakStateRegShares_0_9[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_1_1 = selectLastSlice ? keccakStateRegShares_0_10[57] : keccakStateRegShares_0_10[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_1_3 = selectLastSlice ? keccakStateRegShares_0_11[57] : keccakStateRegShares_0_11[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_1_0 = selectLastSlice ? keccakStateRegShares_0_12[57] : keccakStateRegShares_0_12[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_1_2 = selectLastSlice ? keccakStateRegShares_0_13[57] : keccakStateRegShares_0_13[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_1_4 = selectLastSlice ? keccakStateRegShares_0_14[57] : keccakStateRegShares_0_14[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_1_4 = selectLastSlice ? keccakStateRegShares_0_15[57] : keccakStateRegShares_0_15[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_1_1 = selectLastSlice ? keccakStateRegShares_0_16[57] : keccakStateRegShares_0_16[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_1_3 = selectLastSlice ? keccakStateRegShares_0_17[57] : keccakStateRegShares_0_17[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_1_0 = selectLastSlice ? keccakStateRegShares_0_18[57] : keccakStateRegShares_0_18[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_1_2 = selectLastSlice ? keccakStateRegShares_0_19[57] : keccakStateRegShares_0_19[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_1_2 = selectLastSlice ? keccakStateRegShares_0_20[57] : keccakStateRegShares_0_20[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_1_4 = selectLastSlice ? keccakStateRegShares_0_21[57] : keccakStateRegShares_0_21[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_1_1 = selectLastSlice ? keccakStateRegShares_0_22[57] : keccakStateRegShares_0_22[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_1_3 = selectLastSlice ? keccakStateRegShares_0_23[57] : keccakStateRegShares_0_23[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_1_0 = selectLastSlice ? keccakStateRegShares_0_24[57] : keccakStateRegShares_0_24[1]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_2_0 = selectLastSlice ? keccakStateRegShares_0_0[58] : keccakStateRegShares_0_0[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_2_2 = selectLastSlice ? keccakStateRegShares_0_1[58] : keccakStateRegShares_0_1[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_2_4 = selectLastSlice ? keccakStateRegShares_0_2[58] : keccakStateRegShares_0_2[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_2_1 = selectLastSlice ? keccakStateRegShares_0_3[58] : keccakStateRegShares_0_3[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_2_3 = selectLastSlice ? keccakStateRegShares_0_4[58] : keccakStateRegShares_0_4[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_2_3 = selectLastSlice ? keccakStateRegShares_0_5[58] : keccakStateRegShares_0_5[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_2_0 = selectLastSlice ? keccakStateRegShares_0_6[58] : keccakStateRegShares_0_6[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_2_2 = selectLastSlice ? keccakStateRegShares_0_7[58] : keccakStateRegShares_0_7[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_2_4 = selectLastSlice ? keccakStateRegShares_0_8[58] : keccakStateRegShares_0_8[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_2_1 = selectLastSlice ? keccakStateRegShares_0_9[58] : keccakStateRegShares_0_9[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_2_1 = selectLastSlice ? keccakStateRegShares_0_10[58] : keccakStateRegShares_0_10[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_2_3 = selectLastSlice ? keccakStateRegShares_0_11[58] : keccakStateRegShares_0_11[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_2_0 = selectLastSlice ? keccakStateRegShares_0_12[58] : keccakStateRegShares_0_12[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_2_2 = selectLastSlice ? keccakStateRegShares_0_13[58] : keccakStateRegShares_0_13[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_2_4 = selectLastSlice ? keccakStateRegShares_0_14[58] : keccakStateRegShares_0_14[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_2_4 = selectLastSlice ? keccakStateRegShares_0_15[58] : keccakStateRegShares_0_15[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_2_1 = selectLastSlice ? keccakStateRegShares_0_16[58] : keccakStateRegShares_0_16[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_2_3 = selectLastSlice ? keccakStateRegShares_0_17[58] : keccakStateRegShares_0_17[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_2_0 = selectLastSlice ? keccakStateRegShares_0_18[58] : keccakStateRegShares_0_18[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_2_2 = selectLastSlice ? keccakStateRegShares_0_19[58] : keccakStateRegShares_0_19[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_2_2 = selectLastSlice ? keccakStateRegShares_0_20[58] : keccakStateRegShares_0_20[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_2_4 = selectLastSlice ? keccakStateRegShares_0_21[58] : keccakStateRegShares_0_21[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_2_1 = selectLastSlice ? keccakStateRegShares_0_22[58] : keccakStateRegShares_0_22[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_2_3 = selectLastSlice ? keccakStateRegShares_0_23[58] : keccakStateRegShares_0_23[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_2_0 = selectLastSlice ? keccakStateRegShares_0_24[58] : keccakStateRegShares_0_24[2]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_3_0 = selectLastSlice ? keccakStateRegShares_0_0[59] : keccakStateRegShares_0_0[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_3_2 = selectLastSlice ? keccakStateRegShares_0_1[59] : keccakStateRegShares_0_1[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_3_4 = selectLastSlice ? keccakStateRegShares_0_2[59] : keccakStateRegShares_0_2[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_3_1 = selectLastSlice ? keccakStateRegShares_0_3[59] : keccakStateRegShares_0_3[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_3_3 = selectLastSlice ? keccakStateRegShares_0_4[59] : keccakStateRegShares_0_4[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_3_3 = selectLastSlice ? keccakStateRegShares_0_5[59] : keccakStateRegShares_0_5[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_3_0 = selectLastSlice ? keccakStateRegShares_0_6[59] : keccakStateRegShares_0_6[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_3_2 = selectLastSlice ? keccakStateRegShares_0_7[59] : keccakStateRegShares_0_7[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_3_4 = selectLastSlice ? keccakStateRegShares_0_8[59] : keccakStateRegShares_0_8[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_3_1 = selectLastSlice ? keccakStateRegShares_0_9[59] : keccakStateRegShares_0_9[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_3_1 = selectLastSlice ? keccakStateRegShares_0_10[59] : keccakStateRegShares_0_10[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_3_3 = selectLastSlice ? keccakStateRegShares_0_11[59] : keccakStateRegShares_0_11[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_3_0 = selectLastSlice ? keccakStateRegShares_0_12[59] : keccakStateRegShares_0_12[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_3_2 = selectLastSlice ? keccakStateRegShares_0_13[59] : keccakStateRegShares_0_13[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_3_4 = selectLastSlice ? keccakStateRegShares_0_14[59] : keccakStateRegShares_0_14[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_3_4 = selectLastSlice ? keccakStateRegShares_0_15[59] : keccakStateRegShares_0_15[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_3_1 = selectLastSlice ? keccakStateRegShares_0_16[59] : keccakStateRegShares_0_16[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_3_3 = selectLastSlice ? keccakStateRegShares_0_17[59] : keccakStateRegShares_0_17[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_3_0 = selectLastSlice ? keccakStateRegShares_0_18[59] : keccakStateRegShares_0_18[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_3_2 = selectLastSlice ? keccakStateRegShares_0_19[59] : keccakStateRegShares_0_19[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_3_2 = selectLastSlice ? keccakStateRegShares_0_20[59] : keccakStateRegShares_0_20[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_3_4 = selectLastSlice ? keccakStateRegShares_0_21[59] : keccakStateRegShares_0_21[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_3_1 = selectLastSlice ? keccakStateRegShares_0_22[59] : keccakStateRegShares_0_22[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_3_3 = selectLastSlice ? keccakStateRegShares_0_23[59] : keccakStateRegShares_0_23[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_3_0 = selectLastSlice ? keccakStateRegShares_0_24[59] : keccakStateRegShares_0_24[3]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_4_0 = selectLastSlice ? keccakStateRegShares_0_0[60] : keccakStateRegShares_0_0[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_4_2 = selectLastSlice ? keccakStateRegShares_0_1[60] : keccakStateRegShares_0_1[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_4_4 = selectLastSlice ? keccakStateRegShares_0_2[60] : keccakStateRegShares_0_2[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_4_1 = selectLastSlice ? keccakStateRegShares_0_3[60] : keccakStateRegShares_0_3[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_4_3 = selectLastSlice ? keccakStateRegShares_0_4[60] : keccakStateRegShares_0_4[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_4_3 = selectLastSlice ? keccakStateRegShares_0_5[60] : keccakStateRegShares_0_5[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_4_0 = selectLastSlice ? keccakStateRegShares_0_6[60] : keccakStateRegShares_0_6[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_4_2 = selectLastSlice ? keccakStateRegShares_0_7[60] : keccakStateRegShares_0_7[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_4_4 = selectLastSlice ? keccakStateRegShares_0_8[60] : keccakStateRegShares_0_8[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_4_1 = selectLastSlice ? keccakStateRegShares_0_9[60] : keccakStateRegShares_0_9[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_4_1 = selectLastSlice ? keccakStateRegShares_0_10[60] : keccakStateRegShares_0_10[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_4_3 = selectLastSlice ? keccakStateRegShares_0_11[60] : keccakStateRegShares_0_11[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_4_0 = selectLastSlice ? keccakStateRegShares_0_12[60] : keccakStateRegShares_0_12[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_4_2 = selectLastSlice ? keccakStateRegShares_0_13[60] : keccakStateRegShares_0_13[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_4_4 = selectLastSlice ? keccakStateRegShares_0_14[60] : keccakStateRegShares_0_14[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_4_4 = selectLastSlice ? keccakStateRegShares_0_15[60] : keccakStateRegShares_0_15[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_4_1 = selectLastSlice ? keccakStateRegShares_0_16[60] : keccakStateRegShares_0_16[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_4_3 = selectLastSlice ? keccakStateRegShares_0_17[60] : keccakStateRegShares_0_17[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_4_0 = selectLastSlice ? keccakStateRegShares_0_18[60] : keccakStateRegShares_0_18[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_4_2 = selectLastSlice ? keccakStateRegShares_0_19[60] : keccakStateRegShares_0_19[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_4_2 = selectLastSlice ? keccakStateRegShares_0_20[60] : keccakStateRegShares_0_20[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_4_4 = selectLastSlice ? keccakStateRegShares_0_21[60] : keccakStateRegShares_0_21[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_4_1 = selectLastSlice ? keccakStateRegShares_0_22[60] : keccakStateRegShares_0_22[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_4_3 = selectLastSlice ? keccakStateRegShares_0_23[60] : keccakStateRegShares_0_23[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_4_0 = selectLastSlice ? keccakStateRegShares_0_24[60] : keccakStateRegShares_0_24[4]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_5_0 = selectLastSlice ? keccakStateRegShares_0_0[61] : keccakStateRegShares_0_0[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_5_2 = selectLastSlice ? keccakStateRegShares_0_1[61] : keccakStateRegShares_0_1[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_5_4 = selectLastSlice ? keccakStateRegShares_0_2[61] : keccakStateRegShares_0_2[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_5_1 = selectLastSlice ? keccakStateRegShares_0_3[61] : keccakStateRegShares_0_3[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_5_3 = selectLastSlice ? keccakStateRegShares_0_4[61] : keccakStateRegShares_0_4[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_5_3 = selectLastSlice ? keccakStateRegShares_0_5[61] : keccakStateRegShares_0_5[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_5_0 = selectLastSlice ? keccakStateRegShares_0_6[61] : keccakStateRegShares_0_6[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_5_2 = selectLastSlice ? keccakStateRegShares_0_7[61] : keccakStateRegShares_0_7[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_5_4 = selectLastSlice ? keccakStateRegShares_0_8[61] : keccakStateRegShares_0_8[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_5_1 = selectLastSlice ? keccakStateRegShares_0_9[61] : keccakStateRegShares_0_9[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_5_1 = selectLastSlice ? keccakStateRegShares_0_10[61] : keccakStateRegShares_0_10[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_5_3 = selectLastSlice ? keccakStateRegShares_0_11[61] : keccakStateRegShares_0_11[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_5_0 = selectLastSlice ? keccakStateRegShares_0_12[61] : keccakStateRegShares_0_12[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_5_2 = selectLastSlice ? keccakStateRegShares_0_13[61] : keccakStateRegShares_0_13[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_5_4 = selectLastSlice ? keccakStateRegShares_0_14[61] : keccakStateRegShares_0_14[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_5_4 = selectLastSlice ? keccakStateRegShares_0_15[61] : keccakStateRegShares_0_15[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_5_1 = selectLastSlice ? keccakStateRegShares_0_16[61] : keccakStateRegShares_0_16[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_5_3 = selectLastSlice ? keccakStateRegShares_0_17[61] : keccakStateRegShares_0_17[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_5_0 = selectLastSlice ? keccakStateRegShares_0_18[61] : keccakStateRegShares_0_18[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_5_2 = selectLastSlice ? keccakStateRegShares_0_19[61] : keccakStateRegShares_0_19[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_5_2 = selectLastSlice ? keccakStateRegShares_0_20[61] : keccakStateRegShares_0_20[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_5_4 = selectLastSlice ? keccakStateRegShares_0_21[61] : keccakStateRegShares_0_21[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_5_1 = selectLastSlice ? keccakStateRegShares_0_22[61] : keccakStateRegShares_0_22[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_5_3 = selectLastSlice ? keccakStateRegShares_0_23[61] : keccakStateRegShares_0_23[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_5_0 = selectLastSlice ? keccakStateRegShares_0_24[61] : keccakStateRegShares_0_24[5]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_6_0 = selectLastSlice ? keccakStateRegShares_0_0[62] : keccakStateRegShares_0_0[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_6_2 = selectLastSlice ? keccakStateRegShares_0_1[62] : keccakStateRegShares_0_1[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_6_4 = selectLastSlice ? keccakStateRegShares_0_2[62] : keccakStateRegShares_0_2[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_6_1 = selectLastSlice ? keccakStateRegShares_0_3[62] : keccakStateRegShares_0_3[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_6_3 = selectLastSlice ? keccakStateRegShares_0_4[62] : keccakStateRegShares_0_4[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_6_3 = selectLastSlice ? keccakStateRegShares_0_5[62] : keccakStateRegShares_0_5[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_6_0 = selectLastSlice ? keccakStateRegShares_0_6[62] : keccakStateRegShares_0_6[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_6_2 = selectLastSlice ? keccakStateRegShares_0_7[62] : keccakStateRegShares_0_7[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_6_4 = selectLastSlice ? keccakStateRegShares_0_8[62] : keccakStateRegShares_0_8[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_6_1 = selectLastSlice ? keccakStateRegShares_0_9[62] : keccakStateRegShares_0_9[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_6_1 = selectLastSlice ? keccakStateRegShares_0_10[62] : keccakStateRegShares_0_10[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_6_3 = selectLastSlice ? keccakStateRegShares_0_11[62] : keccakStateRegShares_0_11[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_6_0 = selectLastSlice ? keccakStateRegShares_0_12[62] : keccakStateRegShares_0_12[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_6_2 = selectLastSlice ? keccakStateRegShares_0_13[62] : keccakStateRegShares_0_13[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_6_4 = selectLastSlice ? keccakStateRegShares_0_14[62] : keccakStateRegShares_0_14[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_6_4 = selectLastSlice ? keccakStateRegShares_0_15[62] : keccakStateRegShares_0_15[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_6_1 = selectLastSlice ? keccakStateRegShares_0_16[62] : keccakStateRegShares_0_16[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_6_3 = selectLastSlice ? keccakStateRegShares_0_17[62] : keccakStateRegShares_0_17[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_6_0 = selectLastSlice ? keccakStateRegShares_0_18[62] : keccakStateRegShares_0_18[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_6_2 = selectLastSlice ? keccakStateRegShares_0_19[62] : keccakStateRegShares_0_19[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_6_2 = selectLastSlice ? keccakStateRegShares_0_20[62] : keccakStateRegShares_0_20[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_6_4 = selectLastSlice ? keccakStateRegShares_0_21[62] : keccakStateRegShares_0_21[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_6_1 = selectLastSlice ? keccakStateRegShares_0_22[62] : keccakStateRegShares_0_22[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_6_3 = selectLastSlice ? keccakStateRegShares_0_23[62] : keccakStateRegShares_0_23[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_6_0 = selectLastSlice ? keccakStateRegShares_0_24[62] : keccakStateRegShares_0_24[6]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_7_0 = selectLastSlice ? keccakStateRegShares_0_0[63] : keccakStateRegShares_0_0[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_7_2 = selectLastSlice ? keccakStateRegShares_0_1[63] : keccakStateRegShares_0_1[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_7_4 = selectLastSlice ? keccakStateRegShares_0_2[63] : keccakStateRegShares_0_2[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_7_1 = selectLastSlice ? keccakStateRegShares_0_3[63] : keccakStateRegShares_0_3[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_0_7_3 = selectLastSlice ? keccakStateRegShares_0_4[63] : keccakStateRegShares_0_4[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_7_3 = selectLastSlice ? keccakStateRegShares_0_5[63] : keccakStateRegShares_0_5[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_7_0 = selectLastSlice ? keccakStateRegShares_0_6[63] : keccakStateRegShares_0_6[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_7_2 = selectLastSlice ? keccakStateRegShares_0_7[63] : keccakStateRegShares_0_7[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_7_4 = selectLastSlice ? keccakStateRegShares_0_8[63] : keccakStateRegShares_0_8[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_1_7_1 = selectLastSlice ? keccakStateRegShares_0_9[63] : keccakStateRegShares_0_9[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_7_1 = selectLastSlice ? keccakStateRegShares_0_10[63] : keccakStateRegShares_0_10[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_7_3 = selectLastSlice ? keccakStateRegShares_0_11[63] : keccakStateRegShares_0_11[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_7_0 = selectLastSlice ? keccakStateRegShares_0_12[63] : keccakStateRegShares_0_12[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_7_2 = selectLastSlice ? keccakStateRegShares_0_13[63] : keccakStateRegShares_0_13[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_2_7_4 = selectLastSlice ? keccakStateRegShares_0_14[63] : keccakStateRegShares_0_14[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_7_4 = selectLastSlice ? keccakStateRegShares_0_15[63] : keccakStateRegShares_0_15[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_7_1 = selectLastSlice ? keccakStateRegShares_0_16[63] : keccakStateRegShares_0_16[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_7_3 = selectLastSlice ? keccakStateRegShares_0_17[63] : keccakStateRegShares_0_17[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_7_0 = selectLastSlice ? keccakStateRegShares_0_18[63] : keccakStateRegShares_0_18[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_3_7_2 = selectLastSlice ? keccakStateRegShares_0_19[63] : keccakStateRegShares_0_19[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_7_2 = selectLastSlice ? keccakStateRegShares_0_20[63] : keccakStateRegShares_0_20[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_7_4 = selectLastSlice ? keccakStateRegShares_0_21[63] : keccakStateRegShares_0_21[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_7_1 = selectLastSlice ? keccakStateRegShares_0_22[63] : keccakStateRegShares_0_22[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_7_3 = selectLastSlice ? keccakStateRegShares_0_23[63] : keccakStateRegShares_0_23[7]; // @[KeccakCore.scala 447:31]
  wire  xCols_uiCols_cols_4_7_0 = selectLastSlice ? keccakStateRegShares_0_24[63] : keccakStateRegShares_0_24[7]; // @[KeccakCore.scala 447:31]
  reg [4:0] roundCtr; // @[KeccakCore.scala 102:27]
  reg [4:0] shiftCtr; // @[KeccakCore.scala 103:27]
  reg  isRateLineFlag; // @[KeccakCore.scala 105:33]
  reg  absorbInitFlag; // @[KeccakCore.scala 106:33]
  reg  absorbFinalizeFlag; // @[KeccakCore.scala 107:37]
  wire  absorbFinalize = absorbFinalizeFlag | io_ctrl_absorbFin; // @[KeccakCore.scala 108:49]
  wire  lastRateLine = shiftCtr == io_ctrl_rateLanesMinusOne; // @[KeccakCore.scala 110:37]
  wire  lastLaneRotate = shiftCtr == 5'h18; // @[KeccakCore.scala 111:39]
  wire  _gateBitMask_T_1 = ~absorbFinalizeFlag; // @[KeccakCore.scala 119:88]
  wire  _gateBitMask_T_3 = isRateLineFlag & (state == 3'h1 & ~absorbFinalizeFlag); // @[KeccakCore.scala 119:57]
  wire [63:0] gateBitMask = _gateBitMask_T_3 ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] gatedIn = gateBitMask & io_din_bits_0; // @[KeccakCore.scala 120:33]
  wire  _bitPaddedGatedIn_T = lastRateLine & absorbFinalize; // @[KeccakCore.scala 123:26]
  wire [63:0] _bitPaddedGatedIn_T_1 = {_bitPaddedGatedIn_T, 63'h0}; // @[KeccakCore.scala 123:44]
  wire [63:0] bitPaddedGatedIn = _bitPaddedGatedIn_T_1 | gatedIn; // @[KeccakCore.scala 123:65]
  wire  _keccakStateRegShares_0_24_T = ~absorbInitFlag; // @[KeccakCore.scala 126:78]
  wire [63:0] _keccakStateRegShares_0_24_T_2 = _keccakStateRegShares_0_24_T ? 64'hffffffffffffffff : 64'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _keccakStateRegShares_0_24_T_3 = keccakStateRegShares_0_0 & _keccakStateRegShares_0_24_T_2; // @[KeccakCore.scala 126:59]
  wire [63:0] _keccakStateRegShares_0_24_T_4 = _keccakStateRegShares_0_24_T_3 ^ bitPaddedGatedIn; // @[KeccakCore.scala 126:96]
  wire  _T_469 = ~io_din_ready | io_din_valid; // @[KeccakCore.scala 189:26]
  wire  _T_475 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire  _T_1064 = 3'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_1139 = 3'h6 == state; // @[Conditional.scala 37:30]
  wire  _T_1141 = ~io_dout_valid | io_dout_ready; // @[KeccakCore.scala 251:27]
  wire  _GEN_183 = _T_1064 ? 1'h0 : _T_1139 & _T_1141; // @[Conditional.scala 39:67]
  wire  _GEN_218 = _T_475 ? 1'h0 : _GEN_183; // @[Conditional.scala 39:67]
  wire  _GEN_254 = _T_472 ? 1'h0 : _GEN_218; // @[Conditional.scala 39:67]
  wire  _GEN_259 = _T_463 ? _T_469 : _GEN_254; // @[Conditional.scala 39:67]
  wire  laneRotate = _T_460 ? 1'h0 : _GEN_259; // @[Conditional.scala 40:58]
  wire [63:0] _GEN_0 = laneRotate ? keccakStateRegShares_0_1 : keccakStateRegShares_0_0; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_1 = laneRotate ? keccakStateRegShares_0_2 : keccakStateRegShares_0_1; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_2 = laneRotate ? keccakStateRegShares_0_3 : keccakStateRegShares_0_2; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_3 = laneRotate ? keccakStateRegShares_0_4 : keccakStateRegShares_0_3; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_4 = laneRotate ? keccakStateRegShares_0_5 : keccakStateRegShares_0_4; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_5 = laneRotate ? keccakStateRegShares_0_6 : keccakStateRegShares_0_5; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_6 = laneRotate ? keccakStateRegShares_0_7 : keccakStateRegShares_0_6; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_7 = laneRotate ? keccakStateRegShares_0_8 : keccakStateRegShares_0_7; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_8 = laneRotate ? keccakStateRegShares_0_9 : keccakStateRegShares_0_8; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_9 = laneRotate ? keccakStateRegShares_0_10 : keccakStateRegShares_0_9; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_10 = laneRotate ? keccakStateRegShares_0_11 : keccakStateRegShares_0_10; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_11 = laneRotate ? keccakStateRegShares_0_12 : keccakStateRegShares_0_11; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_12 = laneRotate ? keccakStateRegShares_0_13 : keccakStateRegShares_0_12; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_13 = laneRotate ? keccakStateRegShares_0_14 : keccakStateRegShares_0_13; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_14 = laneRotate ? keccakStateRegShares_0_15 : keccakStateRegShares_0_14; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_15 = laneRotate ? keccakStateRegShares_0_16 : keccakStateRegShares_0_15; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_16 = laneRotate ? keccakStateRegShares_0_17 : keccakStateRegShares_0_16; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_17 = laneRotate ? keccakStateRegShares_0_18 : keccakStateRegShares_0_17; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_18 = laneRotate ? keccakStateRegShares_0_19 : keccakStateRegShares_0_18; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_19 = laneRotate ? keccakStateRegShares_0_20 : keccakStateRegShares_0_19; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_20 = laneRotate ? keccakStateRegShares_0_21 : keccakStateRegShares_0_20; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_21 = laneRotate ? keccakStateRegShares_0_22 : keccakStateRegShares_0_21; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_22 = laneRotate ? keccakStateRegShares_0_23 : keccakStateRegShares_0_22; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_23 = laneRotate ? keccakStateRegShares_0_24 : keccakStateRegShares_0_23; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_24 = laneRotate ? _keccakStateRegShares_0_24_T_4 : keccakStateRegShares_0_24; // @[KeccakCore.scala 114:20 KeccakCore.scala 126:37 KeccakCore.scala 77:49]
  wire  isLastRound = roundCtr == 5'h18; // @[KeccakCore.scala 130:36]
  wire  zerothRound = roundCtr == 5'h0; // @[KeccakCore.scala 131:36]
  reg  lastSliceProcFlag; // @[KeccakCore.scala 168:36]
  wire  _T_464 = io_din_ready & io_din_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_26 = _T_464 & lastRateLine ? 1'h0 : isRateLineFlag; // @[KeccakCore.scala 181:43 KeccakCore.scala 182:24 KeccakCore.scala 105:33]
  wire  _GEN_27 = _T_464 & io_ctrl_absorbFin | absorbFinalizeFlag; // @[KeccakCore.scala 186:48 KeccakCore.scala 187:28 KeccakCore.scala 107:37]
  wire [4:0] _shiftCtr_T_1 = shiftCtr + 5'h1; // @[KeccakCore.scala 191:30]
  wire  _GEN_29 = lastLaneRotate | _GEN_26; // @[KeccakCore.scala 192:30 KeccakCore.scala 194:26]
  wire [2:0] _GEN_31 = lastLaneRotate ? 3'h3 : state; // @[KeccakCore.scala 192:30 KeccakCore.scala 196:17 KeccakCore.scala 101:34]
  wire  _GEN_35 = ~io_din_ready | io_din_valid ? _GEN_29 : _GEN_26; // @[KeccakCore.scala 189:43]
  wire [4:0] xCols__0 = {xCols_uiCols_cols_0__4,xCols_uiCols_cols_0__3,xCols_uiCols_cols_0__2,xCols_uiCols_cols_0__1,
    xCols_uiCols_cols_0__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols__1 = {xCols_uiCols_cols_1__4,xCols_uiCols_cols_1__3,xCols_uiCols_cols_1__2,xCols_uiCols_cols_1__1,
    xCols_uiCols_cols_1__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols__2 = {xCols_uiCols_cols_2__4,xCols_uiCols_cols_2__3,xCols_uiCols_cols_2__2,xCols_uiCols_cols_2__1,
    xCols_uiCols_cols_2__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols__3 = {xCols_uiCols_cols_3__4,xCols_uiCols_cols_3__3,xCols_uiCols_cols_3__2,xCols_uiCols_cols_3__1,
    xCols_uiCols_cols_3__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols__4 = {xCols_uiCols_cols_4__4,xCols_uiCols_cols_4__3,xCols_uiCols_cols_4__2,xCols_uiCols_cols_4__1,
    xCols_uiCols_cols_4__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _t_T = ~xCols__1; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_1 = _t_T & xCols__2; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_2 = ~xCols__2; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_3 = _t_T_2 & xCols__3; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_1; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_4 = ~xCols__3; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_5 = _t_T_4 & xCols__4; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_2; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_6 = ~xCols__4; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_7 = _t_T_6 & xCols__0; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_3; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_8 = ~xCols__0; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_9 = _t_T_8 & xCols__1; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_4; // @[KeccakCore.scala 362:38]
  wire [4:0] xCols_1_0 = {xCols_uiCols_cols_0_1_4,xCols_uiCols_cols_0_1_3,xCols_uiCols_cols_0_1_2,
    xCols_uiCols_cols_0_1_1,xCols_uiCols_cols_0_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_1_1 = {xCols_uiCols_cols_1_1_4,xCols_uiCols_cols_1_1_3,xCols_uiCols_cols_1_1_2,
    xCols_uiCols_cols_1_1_1,xCols_uiCols_cols_1_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_1_2 = {xCols_uiCols_cols_2_1_4,xCols_uiCols_cols_2_1_3,xCols_uiCols_cols_2_1_2,
    xCols_uiCols_cols_2_1_1,xCols_uiCols_cols_2_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_1_3 = {xCols_uiCols_cols_3_1_4,xCols_uiCols_cols_3_1_3,xCols_uiCols_cols_3_1_2,
    xCols_uiCols_cols_3_1_1,xCols_uiCols_cols_3_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_1_4 = {xCols_uiCols_cols_4_1_4,xCols_uiCols_cols_4_1_3,xCols_uiCols_cols_4_1_2,
    xCols_uiCols_cols_4_1_1,xCols_uiCols_cols_4_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _t_T_10 = ~xCols_1_1; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_11 = _t_T_10 & xCols_1_2; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_5; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_12 = ~xCols_1_2; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_13 = _t_T_12 & xCols_1_3; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_6; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_14 = ~xCols_1_3; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_15 = _t_T_14 & xCols_1_4; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_7; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_16 = ~xCols_1_4; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_17 = _t_T_16 & xCols_1_0; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_8; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_18 = ~xCols_1_0; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_19 = _t_T_18 & xCols_1_1; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_9; // @[KeccakCore.scala 362:38]
  wire [4:0] xCols_2_0 = {xCols_uiCols_cols_0_2_4,xCols_uiCols_cols_0_2_3,xCols_uiCols_cols_0_2_2,
    xCols_uiCols_cols_0_2_1,xCols_uiCols_cols_0_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_2_1 = {xCols_uiCols_cols_1_2_4,xCols_uiCols_cols_1_2_3,xCols_uiCols_cols_1_2_2,
    xCols_uiCols_cols_1_2_1,xCols_uiCols_cols_1_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_2_2 = {xCols_uiCols_cols_2_2_4,xCols_uiCols_cols_2_2_3,xCols_uiCols_cols_2_2_2,
    xCols_uiCols_cols_2_2_1,xCols_uiCols_cols_2_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_2_3 = {xCols_uiCols_cols_3_2_4,xCols_uiCols_cols_3_2_3,xCols_uiCols_cols_3_2_2,
    xCols_uiCols_cols_3_2_1,xCols_uiCols_cols_3_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_2_4 = {xCols_uiCols_cols_4_2_4,xCols_uiCols_cols_4_2_3,xCols_uiCols_cols_4_2_2,
    xCols_uiCols_cols_4_2_1,xCols_uiCols_cols_4_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _t_T_20 = ~xCols_2_1; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_21 = _t_T_20 & xCols_2_2; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_10; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_22 = ~xCols_2_2; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_23 = _t_T_22 & xCols_2_3; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_11; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_24 = ~xCols_2_3; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_25 = _t_T_24 & xCols_2_4; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_12; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_26 = ~xCols_2_4; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_27 = _t_T_26 & xCols_2_0; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_13; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_28 = ~xCols_2_0; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_29 = _t_T_28 & xCols_2_1; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_14; // @[KeccakCore.scala 362:38]
  wire [4:0] xCols_3_0 = {xCols_uiCols_cols_0_3_4,xCols_uiCols_cols_0_3_3,xCols_uiCols_cols_0_3_2,
    xCols_uiCols_cols_0_3_1,xCols_uiCols_cols_0_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_3_1 = {xCols_uiCols_cols_1_3_4,xCols_uiCols_cols_1_3_3,xCols_uiCols_cols_1_3_2,
    xCols_uiCols_cols_1_3_1,xCols_uiCols_cols_1_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_3_2 = {xCols_uiCols_cols_2_3_4,xCols_uiCols_cols_2_3_3,xCols_uiCols_cols_2_3_2,
    xCols_uiCols_cols_2_3_1,xCols_uiCols_cols_2_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_3_3 = {xCols_uiCols_cols_3_3_4,xCols_uiCols_cols_3_3_3,xCols_uiCols_cols_3_3_2,
    xCols_uiCols_cols_3_3_1,xCols_uiCols_cols_3_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_3_4 = {xCols_uiCols_cols_4_3_4,xCols_uiCols_cols_4_3_3,xCols_uiCols_cols_4_3_2,
    xCols_uiCols_cols_4_3_1,xCols_uiCols_cols_4_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _t_T_30 = ~xCols_3_1; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_31 = _t_T_30 & xCols_3_2; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_15; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_32 = ~xCols_3_2; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_33 = _t_T_32 & xCols_3_3; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_16; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_34 = ~xCols_3_3; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_35 = _t_T_34 & xCols_3_4; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_17; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_36 = ~xCols_3_4; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_37 = _t_T_36 & xCols_3_0; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_18; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_38 = ~xCols_3_0; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_39 = _t_T_38 & xCols_3_1; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_19; // @[KeccakCore.scala 362:38]
  wire [4:0] xCols_4_0 = {xCols_uiCols_cols_0_4_4,xCols_uiCols_cols_0_4_3,xCols_uiCols_cols_0_4_2,
    xCols_uiCols_cols_0_4_1,xCols_uiCols_cols_0_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_4_1 = {xCols_uiCols_cols_1_4_4,xCols_uiCols_cols_1_4_3,xCols_uiCols_cols_1_4_2,
    xCols_uiCols_cols_1_4_1,xCols_uiCols_cols_1_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_4_2 = {xCols_uiCols_cols_2_4_4,xCols_uiCols_cols_2_4_3,xCols_uiCols_cols_2_4_2,
    xCols_uiCols_cols_2_4_1,xCols_uiCols_cols_2_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_4_3 = {xCols_uiCols_cols_3_4_4,xCols_uiCols_cols_3_4_3,xCols_uiCols_cols_3_4_2,
    xCols_uiCols_cols_3_4_1,xCols_uiCols_cols_3_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_4_4 = {xCols_uiCols_cols_4_4_4,xCols_uiCols_cols_4_4_3,xCols_uiCols_cols_4_4_2,
    xCols_uiCols_cols_4_4_1,xCols_uiCols_cols_4_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _t_T_40 = ~xCols_4_1; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_41 = _t_T_40 & xCols_4_2; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_20; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_42 = ~xCols_4_2; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_43 = _t_T_42 & xCols_4_3; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_21; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_44 = ~xCols_4_3; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_45 = _t_T_44 & xCols_4_4; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_22; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_46 = ~xCols_4_4; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_47 = _t_T_46 & xCols_4_0; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_23; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_48 = ~xCols_4_0; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_49 = _t_T_48 & xCols_4_1; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_24; // @[KeccakCore.scala 362:38]
  wire [4:0] xCols_5_0 = {xCols_uiCols_cols_0_5_4,xCols_uiCols_cols_0_5_3,xCols_uiCols_cols_0_5_2,
    xCols_uiCols_cols_0_5_1,xCols_uiCols_cols_0_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_5_1 = {xCols_uiCols_cols_1_5_4,xCols_uiCols_cols_1_5_3,xCols_uiCols_cols_1_5_2,
    xCols_uiCols_cols_1_5_1,xCols_uiCols_cols_1_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_5_2 = {xCols_uiCols_cols_2_5_4,xCols_uiCols_cols_2_5_3,xCols_uiCols_cols_2_5_2,
    xCols_uiCols_cols_2_5_1,xCols_uiCols_cols_2_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_5_3 = {xCols_uiCols_cols_3_5_4,xCols_uiCols_cols_3_5_3,xCols_uiCols_cols_3_5_2,
    xCols_uiCols_cols_3_5_1,xCols_uiCols_cols_3_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_5_4 = {xCols_uiCols_cols_4_5_4,xCols_uiCols_cols_4_5_3,xCols_uiCols_cols_4_5_2,
    xCols_uiCols_cols_4_5_1,xCols_uiCols_cols_4_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _t_T_50 = ~xCols_5_1; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_51 = _t_T_50 & xCols_5_2; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_25; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_52 = ~xCols_5_2; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_53 = _t_T_52 & xCols_5_3; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_26; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_54 = ~xCols_5_3; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_55 = _t_T_54 & xCols_5_4; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_27; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_56 = ~xCols_5_4; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_57 = _t_T_56 & xCols_5_0; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_28; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_58 = ~xCols_5_0; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_59 = _t_T_58 & xCols_5_1; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_29; // @[KeccakCore.scala 362:38]
  wire [4:0] xCols_6_0 = {xCols_uiCols_cols_0_6_4,xCols_uiCols_cols_0_6_3,xCols_uiCols_cols_0_6_2,
    xCols_uiCols_cols_0_6_1,xCols_uiCols_cols_0_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_6_1 = {xCols_uiCols_cols_1_6_4,xCols_uiCols_cols_1_6_3,xCols_uiCols_cols_1_6_2,
    xCols_uiCols_cols_1_6_1,xCols_uiCols_cols_1_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_6_2 = {xCols_uiCols_cols_2_6_4,xCols_uiCols_cols_2_6_3,xCols_uiCols_cols_2_6_2,
    xCols_uiCols_cols_2_6_1,xCols_uiCols_cols_2_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_6_3 = {xCols_uiCols_cols_3_6_4,xCols_uiCols_cols_3_6_3,xCols_uiCols_cols_3_6_2,
    xCols_uiCols_cols_3_6_1,xCols_uiCols_cols_3_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_6_4 = {xCols_uiCols_cols_4_6_4,xCols_uiCols_cols_4_6_3,xCols_uiCols_cols_4_6_2,
    xCols_uiCols_cols_4_6_1,xCols_uiCols_cols_4_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _t_T_60 = ~xCols_6_1; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_61 = _t_T_60 & xCols_6_2; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_30; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_62 = ~xCols_6_2; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_63 = _t_T_62 & xCols_6_3; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_31; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_64 = ~xCols_6_3; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_65 = _t_T_64 & xCols_6_4; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_32; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_66 = ~xCols_6_4; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_67 = _t_T_66 & xCols_6_0; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_33; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_68 = ~xCols_6_0; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_69 = _t_T_68 & xCols_6_1; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_34; // @[KeccakCore.scala 362:38]
  wire [4:0] xCols_7_0 = {xCols_uiCols_cols_0_7_4,xCols_uiCols_cols_0_7_3,xCols_uiCols_cols_0_7_2,
    xCols_uiCols_cols_0_7_1,xCols_uiCols_cols_0_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_7_1 = {xCols_uiCols_cols_1_7_4,xCols_uiCols_cols_1_7_3,xCols_uiCols_cols_1_7_2,
    xCols_uiCols_cols_1_7_1,xCols_uiCols_cols_1_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_7_2 = {xCols_uiCols_cols_2_7_4,xCols_uiCols_cols_2_7_3,xCols_uiCols_cols_2_7_2,
    xCols_uiCols_cols_2_7_1,xCols_uiCols_cols_2_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_7_3 = {xCols_uiCols_cols_3_7_4,xCols_uiCols_cols_3_7_3,xCols_uiCols_cols_3_7_2,
    xCols_uiCols_cols_3_7_1,xCols_uiCols_cols_3_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xCols_7_4 = {xCols_uiCols_cols_4_7_4,xCols_uiCols_cols_4_7_3,xCols_uiCols_cols_4_7_2,
    xCols_uiCols_cols_4_7_1,xCols_uiCols_cols_4_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _t_T_70 = ~xCols_7_1; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_71 = _t_T_70 & xCols_7_2; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_35; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_72 = ~xCols_7_2; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_73 = _t_T_72 & xCols_7_3; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_36; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_74 = ~xCols_7_3; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_75 = _t_T_74 & xCols_7_4; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_37; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_76 = ~xCols_7_4; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_77 = _t_T_76 & xCols_7_0; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_38; // @[KeccakCore.scala 362:38]
  wire [4:0] _t_T_78 = ~xCols_7_0; // @[KeccakCore.scala 361:24]
  wire [4:0] _t_T_79 = _t_T_78 & xCols_7_1; // @[KeccakCore.scala 361:27]
  reg [4:0] reg_39; // @[KeccakCore.scala 362:38]
  wire [63:0] _GEN_39 = 5'h1 == roundCtr ? 64'h1 : 64'h0; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_40 = 5'h2 == roundCtr ? 64'h8082 : _GEN_39; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_41 = 5'h3 == roundCtr ? 64'h800000000000808a : _GEN_40; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_42 = 5'h4 == roundCtr ? 64'h8000000080008000 : _GEN_41; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_43 = 5'h5 == roundCtr ? 64'h808b : _GEN_42; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_44 = 5'h6 == roundCtr ? 64'h80000001 : _GEN_43; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_45 = 5'h7 == roundCtr ? 64'h8000000080008081 : _GEN_44; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_46 = 5'h8 == roundCtr ? 64'h8000000000008009 : _GEN_45; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_47 = 5'h9 == roundCtr ? 64'h8a : _GEN_46; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_48 = 5'ha == roundCtr ? 64'h88 : _GEN_47; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_49 = 5'hb == roundCtr ? 64'h80008009 : _GEN_48; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_50 = 5'hc == roundCtr ? 64'h8000000a : _GEN_49; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_51 = 5'hd == roundCtr ? 64'h8000808b : _GEN_50; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_52 = 5'he == roundCtr ? 64'h800000000000008b : _GEN_51; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_53 = 5'hf == roundCtr ? 64'h8000000000008089 : _GEN_52; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_54 = 5'h10 == roundCtr ? 64'h8000000000008003 : _GEN_53; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_55 = 5'h11 == roundCtr ? 64'h8000000000008002 : _GEN_54; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_56 = 5'h12 == roundCtr ? 64'h8000000000000080 : _GEN_55; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_57 = 5'h13 == roundCtr ? 64'h800a : _GEN_56; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_58 = 5'h14 == roundCtr ? 64'h800000008000000a : _GEN_57; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_59 = 5'h15 == roundCtr ? 64'h8000000080008081 : _GEN_58; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_60 = 5'h16 == roundCtr ? 64'h8000000000008080 : _GEN_59; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_61 = 5'h17 == roundCtr ? 64'h80000001 : _GEN_60; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_62 = 5'h18 == roundCtr ? 64'h8000000080008008 : _GEN_61; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _rcBits_T_2 = {_GEN_62[55:0],_GEN_62[63:56]}; // @[KeccakCore.scala 417:43]
  wire  rcBits_0_0 = _rcBits_T_2[0]; // @[KeccakCore.scala 417:59]
  wire  rcBits_0_1 = _rcBits_T_2[1]; // @[KeccakCore.scala 417:59]
  wire  rcBits_0_2 = _rcBits_T_2[2]; // @[KeccakCore.scala 417:59]
  wire  rcBits_0_3 = _rcBits_T_2[3]; // @[KeccakCore.scala 417:59]
  wire  rcBits_0_4 = _rcBits_T_2[4]; // @[KeccakCore.scala 417:59]
  wire  rcBits_0_5 = _rcBits_T_2[5]; // @[KeccakCore.scala 417:59]
  wire  rcBits_0_6 = _rcBits_T_2[6]; // @[KeccakCore.scala 417:59]
  wire  rcBits_0_7 = _rcBits_T_2[7]; // @[KeccakCore.scala 417:59]
  wire  rcBits_1_0 = _rcBits_T_2[8]; // @[KeccakCore.scala 417:59]
  wire  rcBits_1_1 = _rcBits_T_2[9]; // @[KeccakCore.scala 417:59]
  wire  rcBits_1_2 = _rcBits_T_2[10]; // @[KeccakCore.scala 417:59]
  wire  rcBits_1_3 = _rcBits_T_2[11]; // @[KeccakCore.scala 417:59]
  wire  rcBits_1_4 = _rcBits_T_2[12]; // @[KeccakCore.scala 417:59]
  wire  rcBits_1_5 = _rcBits_T_2[13]; // @[KeccakCore.scala 417:59]
  wire  rcBits_1_6 = _rcBits_T_2[14]; // @[KeccakCore.scala 417:59]
  wire  rcBits_1_7 = _rcBits_T_2[15]; // @[KeccakCore.scala 417:59]
  wire  rcBits_2_0 = _rcBits_T_2[16]; // @[KeccakCore.scala 417:59]
  wire  rcBits_2_1 = _rcBits_T_2[17]; // @[KeccakCore.scala 417:59]
  wire  rcBits_2_2 = _rcBits_T_2[18]; // @[KeccakCore.scala 417:59]
  wire  rcBits_2_3 = _rcBits_T_2[19]; // @[KeccakCore.scala 417:59]
  wire  rcBits_2_4 = _rcBits_T_2[20]; // @[KeccakCore.scala 417:59]
  wire  rcBits_2_5 = _rcBits_T_2[21]; // @[KeccakCore.scala 417:59]
  wire  rcBits_2_6 = _rcBits_T_2[22]; // @[KeccakCore.scala 417:59]
  wire  rcBits_2_7 = _rcBits_T_2[23]; // @[KeccakCore.scala 417:59]
  wire  rcBits_3_0 = _rcBits_T_2[24]; // @[KeccakCore.scala 417:59]
  wire  rcBits_3_1 = _rcBits_T_2[25]; // @[KeccakCore.scala 417:59]
  wire  rcBits_3_2 = _rcBits_T_2[26]; // @[KeccakCore.scala 417:59]
  wire  rcBits_3_3 = _rcBits_T_2[27]; // @[KeccakCore.scala 417:59]
  wire  rcBits_3_4 = _rcBits_T_2[28]; // @[KeccakCore.scala 417:59]
  wire  rcBits_3_5 = _rcBits_T_2[29]; // @[KeccakCore.scala 417:59]
  wire  rcBits_3_6 = _rcBits_T_2[30]; // @[KeccakCore.scala 417:59]
  wire  rcBits_3_7 = _rcBits_T_2[31]; // @[KeccakCore.scala 417:59]
  wire  rcBits_4_0 = _rcBits_T_2[32]; // @[KeccakCore.scala 417:59]
  wire  rcBits_4_1 = _rcBits_T_2[33]; // @[KeccakCore.scala 417:59]
  wire  rcBits_4_2 = _rcBits_T_2[34]; // @[KeccakCore.scala 417:59]
  wire  rcBits_4_3 = _rcBits_T_2[35]; // @[KeccakCore.scala 417:59]
  wire  rcBits_4_4 = _rcBits_T_2[36]; // @[KeccakCore.scala 417:59]
  wire  rcBits_4_5 = _rcBits_T_2[37]; // @[KeccakCore.scala 417:59]
  wire  rcBits_4_6 = _rcBits_T_2[38]; // @[KeccakCore.scala 417:59]
  wire  rcBits_4_7 = _rcBits_T_2[39]; // @[KeccakCore.scala 417:59]
  wire  rcBits_5_0 = _rcBits_T_2[40]; // @[KeccakCore.scala 417:59]
  wire  rcBits_5_1 = _rcBits_T_2[41]; // @[KeccakCore.scala 417:59]
  wire  rcBits_5_2 = _rcBits_T_2[42]; // @[KeccakCore.scala 417:59]
  wire  rcBits_5_3 = _rcBits_T_2[43]; // @[KeccakCore.scala 417:59]
  wire  rcBits_5_4 = _rcBits_T_2[44]; // @[KeccakCore.scala 417:59]
  wire  rcBits_5_5 = _rcBits_T_2[45]; // @[KeccakCore.scala 417:59]
  wire  rcBits_5_6 = _rcBits_T_2[46]; // @[KeccakCore.scala 417:59]
  wire  rcBits_5_7 = _rcBits_T_2[47]; // @[KeccakCore.scala 417:59]
  wire  rcBits_6_0 = _rcBits_T_2[48]; // @[KeccakCore.scala 417:59]
  wire  rcBits_6_1 = _rcBits_T_2[49]; // @[KeccakCore.scala 417:59]
  wire  rcBits_6_2 = _rcBits_T_2[50]; // @[KeccakCore.scala 417:59]
  wire  rcBits_6_3 = _rcBits_T_2[51]; // @[KeccakCore.scala 417:59]
  wire  rcBits_6_4 = _rcBits_T_2[52]; // @[KeccakCore.scala 417:59]
  wire  rcBits_6_5 = _rcBits_T_2[53]; // @[KeccakCore.scala 417:59]
  wire  rcBits_6_6 = _rcBits_T_2[54]; // @[KeccakCore.scala 417:59]
  wire  rcBits_6_7 = _rcBits_T_2[55]; // @[KeccakCore.scala 417:59]
  wire  rcBits_7_0 = _rcBits_T_2[56]; // @[KeccakCore.scala 417:59]
  wire  rcBits_7_1 = _rcBits_T_2[57]; // @[KeccakCore.scala 417:59]
  wire  rcBits_7_2 = _rcBits_T_2[58]; // @[KeccakCore.scala 417:59]
  wire  rcBits_7_3 = _rcBits_T_2[59]; // @[KeccakCore.scala 417:59]
  wire  rcBits_7_4 = _rcBits_T_2[60]; // @[KeccakCore.scala 417:59]
  wire  rcBits_7_5 = _rcBits_T_2[61]; // @[KeccakCore.scala 417:59]
  wire  rcBits_7_6 = _rcBits_T_2[62]; // @[KeccakCore.scala 417:59]
  wire  rcBits_7_7 = _rcBits_T_2[63]; // @[KeccakCore.scala 417:59]
  wire  _GEN_71 = 3'h1 == shiftCtr[2:0] ? rcBits_1_0 : rcBits_0_0; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_72 = 3'h1 == shiftCtr[2:0] ? rcBits_1_1 : rcBits_0_1; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_73 = 3'h1 == shiftCtr[2:0] ? rcBits_1_2 : rcBits_0_2; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_74 = 3'h1 == shiftCtr[2:0] ? rcBits_1_3 : rcBits_0_3; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_75 = 3'h1 == shiftCtr[2:0] ? rcBits_1_4 : rcBits_0_4; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_76 = 3'h1 == shiftCtr[2:0] ? rcBits_1_5 : rcBits_0_5; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_77 = 3'h1 == shiftCtr[2:0] ? rcBits_1_6 : rcBits_0_6; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_78 = 3'h1 == shiftCtr[2:0] ? rcBits_1_7 : rcBits_0_7; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_79 = 3'h2 == shiftCtr[2:0] ? rcBits_2_0 : _GEN_71; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_80 = 3'h2 == shiftCtr[2:0] ? rcBits_2_1 : _GEN_72; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_81 = 3'h2 == shiftCtr[2:0] ? rcBits_2_2 : _GEN_73; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_82 = 3'h2 == shiftCtr[2:0] ? rcBits_2_3 : _GEN_74; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_83 = 3'h2 == shiftCtr[2:0] ? rcBits_2_4 : _GEN_75; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_84 = 3'h2 == shiftCtr[2:0] ? rcBits_2_5 : _GEN_76; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_85 = 3'h2 == shiftCtr[2:0] ? rcBits_2_6 : _GEN_77; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_86 = 3'h2 == shiftCtr[2:0] ? rcBits_2_7 : _GEN_78; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_87 = 3'h3 == shiftCtr[2:0] ? rcBits_3_0 : _GEN_79; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_88 = 3'h3 == shiftCtr[2:0] ? rcBits_3_1 : _GEN_80; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_89 = 3'h3 == shiftCtr[2:0] ? rcBits_3_2 : _GEN_81; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_90 = 3'h3 == shiftCtr[2:0] ? rcBits_3_3 : _GEN_82; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_91 = 3'h3 == shiftCtr[2:0] ? rcBits_3_4 : _GEN_83; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_92 = 3'h3 == shiftCtr[2:0] ? rcBits_3_5 : _GEN_84; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_93 = 3'h3 == shiftCtr[2:0] ? rcBits_3_6 : _GEN_85; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_94 = 3'h3 == shiftCtr[2:0] ? rcBits_3_7 : _GEN_86; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_95 = 3'h4 == shiftCtr[2:0] ? rcBits_4_0 : _GEN_87; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_96 = 3'h4 == shiftCtr[2:0] ? rcBits_4_1 : _GEN_88; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_97 = 3'h4 == shiftCtr[2:0] ? rcBits_4_2 : _GEN_89; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_98 = 3'h4 == shiftCtr[2:0] ? rcBits_4_3 : _GEN_90; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_99 = 3'h4 == shiftCtr[2:0] ? rcBits_4_4 : _GEN_91; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_100 = 3'h4 == shiftCtr[2:0] ? rcBits_4_5 : _GEN_92; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_101 = 3'h4 == shiftCtr[2:0] ? rcBits_4_6 : _GEN_93; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_102 = 3'h4 == shiftCtr[2:0] ? rcBits_4_7 : _GEN_94; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_103 = 3'h5 == shiftCtr[2:0] ? rcBits_5_0 : _GEN_95; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_104 = 3'h5 == shiftCtr[2:0] ? rcBits_5_1 : _GEN_96; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_105 = 3'h5 == shiftCtr[2:0] ? rcBits_5_2 : _GEN_97; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_106 = 3'h5 == shiftCtr[2:0] ? rcBits_5_3 : _GEN_98; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_107 = 3'h5 == shiftCtr[2:0] ? rcBits_5_4 : _GEN_99; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_108 = 3'h5 == shiftCtr[2:0] ? rcBits_5_5 : _GEN_100; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_109 = 3'h5 == shiftCtr[2:0] ? rcBits_5_6 : _GEN_101; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_110 = 3'h5 == shiftCtr[2:0] ? rcBits_5_7 : _GEN_102; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_111 = 3'h6 == shiftCtr[2:0] ? rcBits_6_0 : _GEN_103; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_112 = 3'h6 == shiftCtr[2:0] ? rcBits_6_1 : _GEN_104; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_113 = 3'h6 == shiftCtr[2:0] ? rcBits_6_2 : _GEN_105; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_114 = 3'h6 == shiftCtr[2:0] ? rcBits_6_3 : _GEN_106; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_115 = 3'h6 == shiftCtr[2:0] ? rcBits_6_4 : _GEN_107; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_116 = 3'h6 == shiftCtr[2:0] ? rcBits_6_5 : _GEN_108; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_117 = 3'h6 == shiftCtr[2:0] ? rcBits_6_6 : _GEN_109; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_118 = 3'h6 == shiftCtr[2:0] ? rcBits_6_7 : _GEN_110; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_119 = 3'h7 == shiftCtr[2:0] ? rcBits_7_0 : _GEN_111; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_120 = 3'h7 == shiftCtr[2:0] ? rcBits_7_1 : _GEN_112; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_121 = 3'h7 == shiftCtr[2:0] ? rcBits_7_2 : _GEN_113; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_122 = 3'h7 == shiftCtr[2:0] ? rcBits_7_3 : _GEN_114; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_123 = 3'h7 == shiftCtr[2:0] ? rcBits_7_4 : _GEN_115; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_124 = 3'h7 == shiftCtr[2:0] ? rcBits_7_5 : _GEN_116; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_125 = 3'h7 == shiftCtr[2:0] ? rcBits_7_6 : _GEN_117; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_126 = 3'h7 == shiftCtr[2:0] ? rcBits_7_7 : _GEN_118; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _T_677 = reg_[0] ^ _GEN_119; // @[KeccakCore.scala 423:58]
  wire  _T_678 = reg_5[0] ^ _GEN_120; // @[KeccakCore.scala 423:58]
  wire  _T_679 = reg_10[0] ^ _GEN_121; // @[KeccakCore.scala 423:58]
  wire  _T_680 = reg_15[0] ^ _GEN_122; // @[KeccakCore.scala 423:58]
  wire  _T_681 = reg_20[0] ^ _GEN_123; // @[KeccakCore.scala 423:58]
  wire  _T_682 = reg_25[0] ^ _GEN_124; // @[KeccakCore.scala 423:58]
  wire  _T_683 = reg_30[0] ^ _GEN_125; // @[KeccakCore.scala 423:58]
  wire  _T_684 = reg_35[0] ^ _GEN_126; // @[KeccakCore.scala 423:58]
  wire  nextParity_cols_0__0 = zerothRound ? xCols_uiCols_cols_0__0 : _T_677; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__0 = zerothRound ? xCols_uiCols_cols_0__2 : reg_1[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__0 = zerothRound ? xCols_uiCols_cols_0__4 : reg_2[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__0 = zerothRound ? xCols_uiCols_cols_0__1 : reg_3[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__0 = zerothRound ? xCols_uiCols_cols_0__3 : reg_4[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0__1 = zerothRound ? xCols_uiCols_cols_1__3 : reg_[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__1 = zerothRound ? xCols_uiCols_cols_1__0 : reg_1[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__1 = zerothRound ? xCols_uiCols_cols_1__2 : reg_2[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__1 = zerothRound ? xCols_uiCols_cols_1__4 : reg_3[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__1 = zerothRound ? xCols_uiCols_cols_1__1 : reg_4[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0__2 = zerothRound ? xCols_uiCols_cols_2__1 : reg_[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__2 = zerothRound ? xCols_uiCols_cols_2__3 : reg_1[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__2 = zerothRound ? xCols_uiCols_cols_2__0 : reg_2[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__2 = zerothRound ? xCols_uiCols_cols_2__2 : reg_3[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__2 = zerothRound ? xCols_uiCols_cols_2__4 : reg_4[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0__3 = zerothRound ? xCols_uiCols_cols_3__4 : reg_[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__3 = zerothRound ? xCols_uiCols_cols_3__1 : reg_1[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__3 = zerothRound ? xCols_uiCols_cols_3__3 : reg_2[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__3 = zerothRound ? xCols_uiCols_cols_3__0 : reg_3[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__3 = zerothRound ? xCols_uiCols_cols_3__2 : reg_4[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0__4 = zerothRound ? xCols_uiCols_cols_4__2 : reg_[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__4 = zerothRound ? xCols_uiCols_cols_4__4 : reg_1[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__4 = zerothRound ? xCols_uiCols_cols_4__1 : reg_2[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__4 = zerothRound ? xCols_uiCols_cols_4__3 : reg_3[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__4 = zerothRound ? xCols_uiCols_cols_4__0 : reg_4[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_0 = zerothRound ? xCols_uiCols_cols_0_1_0 : _T_678; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_0 = zerothRound ? xCols_uiCols_cols_0_1_2 : reg_6[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_0 = zerothRound ? xCols_uiCols_cols_0_1_4 : reg_7[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_0 = zerothRound ? xCols_uiCols_cols_0_1_1 : reg_8[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_0 = zerothRound ? xCols_uiCols_cols_0_1_3 : reg_9[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_1 = zerothRound ? xCols_uiCols_cols_1_1_3 : reg_5[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_1 = zerothRound ? xCols_uiCols_cols_1_1_0 : reg_6[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_1 = zerothRound ? xCols_uiCols_cols_1_1_2 : reg_7[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_1 = zerothRound ? xCols_uiCols_cols_1_1_4 : reg_8[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_1 = zerothRound ? xCols_uiCols_cols_1_1_1 : reg_9[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_2 = zerothRound ? xCols_uiCols_cols_2_1_1 : reg_5[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_2 = zerothRound ? xCols_uiCols_cols_2_1_3 : reg_6[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_2 = zerothRound ? xCols_uiCols_cols_2_1_0 : reg_7[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_2 = zerothRound ? xCols_uiCols_cols_2_1_2 : reg_8[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_2 = zerothRound ? xCols_uiCols_cols_2_1_4 : reg_9[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_3 = zerothRound ? xCols_uiCols_cols_3_1_4 : reg_5[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_3 = zerothRound ? xCols_uiCols_cols_3_1_1 : reg_6[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_3 = zerothRound ? xCols_uiCols_cols_3_1_3 : reg_7[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_3 = zerothRound ? xCols_uiCols_cols_3_1_0 : reg_8[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_3 = zerothRound ? xCols_uiCols_cols_3_1_2 : reg_9[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_4 = zerothRound ? xCols_uiCols_cols_4_1_2 : reg_5[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_4 = zerothRound ? xCols_uiCols_cols_4_1_4 : reg_6[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_4 = zerothRound ? xCols_uiCols_cols_4_1_1 : reg_7[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_4 = zerothRound ? xCols_uiCols_cols_4_1_3 : reg_8[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_4 = zerothRound ? xCols_uiCols_cols_4_1_0 : reg_9[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_0 = zerothRound ? xCols_uiCols_cols_0_2_0 : _T_679; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_0 = zerothRound ? xCols_uiCols_cols_0_2_2 : reg_11[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_0 = zerothRound ? xCols_uiCols_cols_0_2_4 : reg_12[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_0 = zerothRound ? xCols_uiCols_cols_0_2_1 : reg_13[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_0 = zerothRound ? xCols_uiCols_cols_0_2_3 : reg_14[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_1 = zerothRound ? xCols_uiCols_cols_1_2_3 : reg_10[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_1 = zerothRound ? xCols_uiCols_cols_1_2_0 : reg_11[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_1 = zerothRound ? xCols_uiCols_cols_1_2_2 : reg_12[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_1 = zerothRound ? xCols_uiCols_cols_1_2_4 : reg_13[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_1 = zerothRound ? xCols_uiCols_cols_1_2_1 : reg_14[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_2 = zerothRound ? xCols_uiCols_cols_2_2_1 : reg_10[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_2 = zerothRound ? xCols_uiCols_cols_2_2_3 : reg_11[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_2 = zerothRound ? xCols_uiCols_cols_2_2_0 : reg_12[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_2 = zerothRound ? xCols_uiCols_cols_2_2_2 : reg_13[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_2 = zerothRound ? xCols_uiCols_cols_2_2_4 : reg_14[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_3 = zerothRound ? xCols_uiCols_cols_3_2_4 : reg_10[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_3 = zerothRound ? xCols_uiCols_cols_3_2_1 : reg_11[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_3 = zerothRound ? xCols_uiCols_cols_3_2_3 : reg_12[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_3 = zerothRound ? xCols_uiCols_cols_3_2_0 : reg_13[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_3 = zerothRound ? xCols_uiCols_cols_3_2_2 : reg_14[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_4 = zerothRound ? xCols_uiCols_cols_4_2_2 : reg_10[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_4 = zerothRound ? xCols_uiCols_cols_4_2_4 : reg_11[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_4 = zerothRound ? xCols_uiCols_cols_4_2_1 : reg_12[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_4 = zerothRound ? xCols_uiCols_cols_4_2_3 : reg_13[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_4 = zerothRound ? xCols_uiCols_cols_4_2_0 : reg_14[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_0 = zerothRound ? xCols_uiCols_cols_0_3_0 : _T_680; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_0 = zerothRound ? xCols_uiCols_cols_0_3_2 : reg_16[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_0 = zerothRound ? xCols_uiCols_cols_0_3_4 : reg_17[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_0 = zerothRound ? xCols_uiCols_cols_0_3_1 : reg_18[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_0 = zerothRound ? xCols_uiCols_cols_0_3_3 : reg_19[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_1 = zerothRound ? xCols_uiCols_cols_1_3_3 : reg_15[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_1 = zerothRound ? xCols_uiCols_cols_1_3_0 : reg_16[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_1 = zerothRound ? xCols_uiCols_cols_1_3_2 : reg_17[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_1 = zerothRound ? xCols_uiCols_cols_1_3_4 : reg_18[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_1 = zerothRound ? xCols_uiCols_cols_1_3_1 : reg_19[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_2 = zerothRound ? xCols_uiCols_cols_2_3_1 : reg_15[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_2 = zerothRound ? xCols_uiCols_cols_2_3_3 : reg_16[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_2 = zerothRound ? xCols_uiCols_cols_2_3_0 : reg_17[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_2 = zerothRound ? xCols_uiCols_cols_2_3_2 : reg_18[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_2 = zerothRound ? xCols_uiCols_cols_2_3_4 : reg_19[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_3 = zerothRound ? xCols_uiCols_cols_3_3_4 : reg_15[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_3 = zerothRound ? xCols_uiCols_cols_3_3_1 : reg_16[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_3 = zerothRound ? xCols_uiCols_cols_3_3_3 : reg_17[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_3 = zerothRound ? xCols_uiCols_cols_3_3_0 : reg_18[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_3 = zerothRound ? xCols_uiCols_cols_3_3_2 : reg_19[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_4 = zerothRound ? xCols_uiCols_cols_4_3_2 : reg_15[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_4 = zerothRound ? xCols_uiCols_cols_4_3_4 : reg_16[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_4 = zerothRound ? xCols_uiCols_cols_4_3_1 : reg_17[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_4 = zerothRound ? xCols_uiCols_cols_4_3_3 : reg_18[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_4 = zerothRound ? xCols_uiCols_cols_4_3_0 : reg_19[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_0 = zerothRound ? xCols_uiCols_cols_0_4_0 : _T_681; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_0 = zerothRound ? xCols_uiCols_cols_0_4_2 : reg_21[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_0 = zerothRound ? xCols_uiCols_cols_0_4_4 : reg_22[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_0 = zerothRound ? xCols_uiCols_cols_0_4_1 : reg_23[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_0 = zerothRound ? xCols_uiCols_cols_0_4_3 : reg_24[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_1 = zerothRound ? xCols_uiCols_cols_1_4_3 : reg_20[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_1 = zerothRound ? xCols_uiCols_cols_1_4_0 : reg_21[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_1 = zerothRound ? xCols_uiCols_cols_1_4_2 : reg_22[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_1 = zerothRound ? xCols_uiCols_cols_1_4_4 : reg_23[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_1 = zerothRound ? xCols_uiCols_cols_1_4_1 : reg_24[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_2 = zerothRound ? xCols_uiCols_cols_2_4_1 : reg_20[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_2 = zerothRound ? xCols_uiCols_cols_2_4_3 : reg_21[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_2 = zerothRound ? xCols_uiCols_cols_2_4_0 : reg_22[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_2 = zerothRound ? xCols_uiCols_cols_2_4_2 : reg_23[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_2 = zerothRound ? xCols_uiCols_cols_2_4_4 : reg_24[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_3 = zerothRound ? xCols_uiCols_cols_3_4_4 : reg_20[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_3 = zerothRound ? xCols_uiCols_cols_3_4_1 : reg_21[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_3 = zerothRound ? xCols_uiCols_cols_3_4_3 : reg_22[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_3 = zerothRound ? xCols_uiCols_cols_3_4_0 : reg_23[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_3 = zerothRound ? xCols_uiCols_cols_3_4_2 : reg_24[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_4 = zerothRound ? xCols_uiCols_cols_4_4_2 : reg_20[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_4 = zerothRound ? xCols_uiCols_cols_4_4_4 : reg_21[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_4 = zerothRound ? xCols_uiCols_cols_4_4_1 : reg_22[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_4 = zerothRound ? xCols_uiCols_cols_4_4_3 : reg_23[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_4 = zerothRound ? xCols_uiCols_cols_4_4_0 : reg_24[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_0 = zerothRound ? xCols_uiCols_cols_0_5_0 : _T_682; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_0 = zerothRound ? xCols_uiCols_cols_0_5_2 : reg_26[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_0 = zerothRound ? xCols_uiCols_cols_0_5_4 : reg_27[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_0 = zerothRound ? xCols_uiCols_cols_0_5_1 : reg_28[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_0 = zerothRound ? xCols_uiCols_cols_0_5_3 : reg_29[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_1 = zerothRound ? xCols_uiCols_cols_1_5_3 : reg_25[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_1 = zerothRound ? xCols_uiCols_cols_1_5_0 : reg_26[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_1 = zerothRound ? xCols_uiCols_cols_1_5_2 : reg_27[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_1 = zerothRound ? xCols_uiCols_cols_1_5_4 : reg_28[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_1 = zerothRound ? xCols_uiCols_cols_1_5_1 : reg_29[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_2 = zerothRound ? xCols_uiCols_cols_2_5_1 : reg_25[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_2 = zerothRound ? xCols_uiCols_cols_2_5_3 : reg_26[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_2 = zerothRound ? xCols_uiCols_cols_2_5_0 : reg_27[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_2 = zerothRound ? xCols_uiCols_cols_2_5_2 : reg_28[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_2 = zerothRound ? xCols_uiCols_cols_2_5_4 : reg_29[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_3 = zerothRound ? xCols_uiCols_cols_3_5_4 : reg_25[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_3 = zerothRound ? xCols_uiCols_cols_3_5_1 : reg_26[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_3 = zerothRound ? xCols_uiCols_cols_3_5_3 : reg_27[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_3 = zerothRound ? xCols_uiCols_cols_3_5_0 : reg_28[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_3 = zerothRound ? xCols_uiCols_cols_3_5_2 : reg_29[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_4 = zerothRound ? xCols_uiCols_cols_4_5_2 : reg_25[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_4 = zerothRound ? xCols_uiCols_cols_4_5_4 : reg_26[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_4 = zerothRound ? xCols_uiCols_cols_4_5_1 : reg_27[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_4 = zerothRound ? xCols_uiCols_cols_4_5_3 : reg_28[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_4 = zerothRound ? xCols_uiCols_cols_4_5_0 : reg_29[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_0 = zerothRound ? xCols_uiCols_cols_0_6_0 : _T_683; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_0 = zerothRound ? xCols_uiCols_cols_0_6_2 : reg_31[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_0 = zerothRound ? xCols_uiCols_cols_0_6_4 : reg_32[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_0 = zerothRound ? xCols_uiCols_cols_0_6_1 : reg_33[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_0 = zerothRound ? xCols_uiCols_cols_0_6_3 : reg_34[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_1 = zerothRound ? xCols_uiCols_cols_1_6_3 : reg_30[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_1 = zerothRound ? xCols_uiCols_cols_1_6_0 : reg_31[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_1 = zerothRound ? xCols_uiCols_cols_1_6_2 : reg_32[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_1 = zerothRound ? xCols_uiCols_cols_1_6_4 : reg_33[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_1 = zerothRound ? xCols_uiCols_cols_1_6_1 : reg_34[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_2 = zerothRound ? xCols_uiCols_cols_2_6_1 : reg_30[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_2 = zerothRound ? xCols_uiCols_cols_2_6_3 : reg_31[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_2 = zerothRound ? xCols_uiCols_cols_2_6_0 : reg_32[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_2 = zerothRound ? xCols_uiCols_cols_2_6_2 : reg_33[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_2 = zerothRound ? xCols_uiCols_cols_2_6_4 : reg_34[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_3 = zerothRound ? xCols_uiCols_cols_3_6_4 : reg_30[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_3 = zerothRound ? xCols_uiCols_cols_3_6_1 : reg_31[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_3 = zerothRound ? xCols_uiCols_cols_3_6_3 : reg_32[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_3 = zerothRound ? xCols_uiCols_cols_3_6_0 : reg_33[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_3 = zerothRound ? xCols_uiCols_cols_3_6_2 : reg_34[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_4 = zerothRound ? xCols_uiCols_cols_4_6_2 : reg_30[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_4 = zerothRound ? xCols_uiCols_cols_4_6_4 : reg_31[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_4 = zerothRound ? xCols_uiCols_cols_4_6_1 : reg_32[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_4 = zerothRound ? xCols_uiCols_cols_4_6_3 : reg_33[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_4 = zerothRound ? xCols_uiCols_cols_4_6_0 : reg_34[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_0 = zerothRound ? xCols_uiCols_cols_0_7_0 : _T_684; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_0 = zerothRound ? xCols_uiCols_cols_0_7_2 : reg_36[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_0 = zerothRound ? xCols_uiCols_cols_0_7_4 : reg_37[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_0 = zerothRound ? xCols_uiCols_cols_0_7_1 : reg_38[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_0 = zerothRound ? xCols_uiCols_cols_0_7_3 : reg_39[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_1 = zerothRound ? xCols_uiCols_cols_1_7_3 : reg_35[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_1 = zerothRound ? xCols_uiCols_cols_1_7_0 : reg_36[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_1 = zerothRound ? xCols_uiCols_cols_1_7_2 : reg_37[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_1 = zerothRound ? xCols_uiCols_cols_1_7_4 : reg_38[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_1 = zerothRound ? xCols_uiCols_cols_1_7_1 : reg_39[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_2 = zerothRound ? xCols_uiCols_cols_2_7_1 : reg_35[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_2 = zerothRound ? xCols_uiCols_cols_2_7_3 : reg_36[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_2 = zerothRound ? xCols_uiCols_cols_2_7_0 : reg_37[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_2 = zerothRound ? xCols_uiCols_cols_2_7_2 : reg_38[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_2 = zerothRound ? xCols_uiCols_cols_2_7_4 : reg_39[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_3 = zerothRound ? xCols_uiCols_cols_3_7_4 : reg_35[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_3 = zerothRound ? xCols_uiCols_cols_3_7_1 : reg_36[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_3 = zerothRound ? xCols_uiCols_cols_3_7_3 : reg_37[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_3 = zerothRound ? xCols_uiCols_cols_3_7_0 : reg_38[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_3 = zerothRound ? xCols_uiCols_cols_3_7_2 : reg_39[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_4 = zerothRound ? xCols_uiCols_cols_4_7_2 : reg_35[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_4 = zerothRound ? xCols_uiCols_cols_4_7_4 : reg_36[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_4 = zerothRound ? xCols_uiCols_cols_4_7_1 : reg_37[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_4 = zerothRound ? xCols_uiCols_cols_4_7_3 : reg_38[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_4 = zerothRound ? xCols_uiCols_cols_4_7_0 : reg_39[4]; // @[KeccakCore.scala 447:31]
  reg [4:0] prevSliceParity; // @[KeccakCore.scala 144:32]
  wire  _nextParity_T_3 = nextParity_cols_0__0 ^ nextParity_cols_0__1 ^ nextParity_cols_0__2 ^ nextParity_cols_0__3 ^
    nextParity_cols_0__4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_7 = nextParity_cols_1__0 ^ nextParity_cols_1__1 ^ nextParity_cols_1__2 ^ nextParity_cols_1__3 ^
    nextParity_cols_1__4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_11 = nextParity_cols_2__0 ^ nextParity_cols_2__1 ^ nextParity_cols_2__2 ^ nextParity_cols_2__3 ^
    nextParity_cols_2__4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_15 = nextParity_cols_3__0 ^ nextParity_cols_3__1 ^ nextParity_cols_3__2 ^ nextParity_cols_3__3 ^
    nextParity_cols_3__4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_19 = nextParity_cols_4__0 ^ nextParity_cols_4__1 ^ nextParity_cols_4__2 ^ nextParity_cols_4__3 ^
    nextParity_cols_4__4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity = {_nextParity_T_19,_nextParity_T_15,_nextParity_T_11,_nextParity_T_7,_nextParity_T_3}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_2 = {parity[3:0],parity[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_5 = {prevSliceParity[0],prevSliceParity[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_6 = _thetaXor_T_2 ^ _thetaXor_T_5; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0 = _thetaXor_T_6[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1 = _thetaXor_T_6[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2 = _thetaXor_T_6[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3 = _thetaXor_T_6[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4 = _thetaXor_T_6[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_693 = {nextParity_cols_0__4,nextParity_cols_0__3,nextParity_cols_0__2,nextParity_cols_0__1,
    nextParity_cols_0__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_695 = thetaXor_0 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_696 = _T_693 ^ _T_695; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_702 = {nextParity_cols_1__4,nextParity_cols_1__3,nextParity_cols_1__2,nextParity_cols_1__1,
    nextParity_cols_1__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_704 = thetaXor_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_705 = _T_702 ^ _T_704; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_711 = {nextParity_cols_2__4,nextParity_cols_2__3,nextParity_cols_2__2,nextParity_cols_2__1,
    nextParity_cols_2__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_713 = thetaXor_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_714 = _T_711 ^ _T_713; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_720 = {nextParity_cols_3__4,nextParity_cols_3__3,nextParity_cols_3__2,nextParity_cols_3__1,
    nextParity_cols_3__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_722 = thetaXor_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_723 = _T_720 ^ _T_722; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_729 = {nextParity_cols_4__4,nextParity_cols_4__3,nextParity_cols_4__2,nextParity_cols_4__1,
    nextParity_cols_4__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_731 = thetaXor_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_732 = _T_729 ^ _T_731; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_23 = nextParity_cols_0_1_0 ^ nextParity_cols_0_1_1 ^ nextParity_cols_0_1_2 ^ nextParity_cols_0_1_3
     ^ nextParity_cols_0_1_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_27 = nextParity_cols_1_1_0 ^ nextParity_cols_1_1_1 ^ nextParity_cols_1_1_2 ^ nextParity_cols_1_1_3
     ^ nextParity_cols_1_1_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_31 = nextParity_cols_2_1_0 ^ nextParity_cols_2_1_1 ^ nextParity_cols_2_1_2 ^ nextParity_cols_2_1_3
     ^ nextParity_cols_2_1_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_35 = nextParity_cols_3_1_0 ^ nextParity_cols_3_1_1 ^ nextParity_cols_3_1_2 ^ nextParity_cols_3_1_3
     ^ nextParity_cols_3_1_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_39 = nextParity_cols_4_1_0 ^ nextParity_cols_4_1_1 ^ nextParity_cols_4_1_2 ^ nextParity_cols_4_1_3
     ^ nextParity_cols_4_1_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_1 = {_nextParity_T_39,_nextParity_T_35,_nextParity_T_31,_nextParity_T_27,_nextParity_T_23}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_9 = {parity_1[3:0],parity_1[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_12 = {parity[0],parity[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_13 = _thetaXor_T_9 ^ _thetaXor_T_12; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_1 = _thetaXor_T_13[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_1 = _thetaXor_T_13[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_1 = _thetaXor_T_13[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_1 = _thetaXor_T_13[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_1 = _thetaXor_T_13[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_738 = {nextParity_cols_0_1_4,nextParity_cols_0_1_3,nextParity_cols_0_1_2,nextParity_cols_0_1_1,
    nextParity_cols_0_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_740 = thetaXor_0_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_741 = _T_738 ^ _T_740; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_747 = {nextParity_cols_1_1_4,nextParity_cols_1_1_3,nextParity_cols_1_1_2,nextParity_cols_1_1_1,
    nextParity_cols_1_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_749 = thetaXor_1_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_750 = _T_747 ^ _T_749; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_756 = {nextParity_cols_2_1_4,nextParity_cols_2_1_3,nextParity_cols_2_1_2,nextParity_cols_2_1_1,
    nextParity_cols_2_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_758 = thetaXor_2_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_759 = _T_756 ^ _T_758; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_765 = {nextParity_cols_3_1_4,nextParity_cols_3_1_3,nextParity_cols_3_1_2,nextParity_cols_3_1_1,
    nextParity_cols_3_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_767 = thetaXor_3_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_768 = _T_765 ^ _T_767; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_774 = {nextParity_cols_4_1_4,nextParity_cols_4_1_3,nextParity_cols_4_1_2,nextParity_cols_4_1_1,
    nextParity_cols_4_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_776 = thetaXor_4_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_777 = _T_774 ^ _T_776; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_43 = nextParity_cols_0_2_0 ^ nextParity_cols_0_2_1 ^ nextParity_cols_0_2_2 ^ nextParity_cols_0_2_3
     ^ nextParity_cols_0_2_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_47 = nextParity_cols_1_2_0 ^ nextParity_cols_1_2_1 ^ nextParity_cols_1_2_2 ^ nextParity_cols_1_2_3
     ^ nextParity_cols_1_2_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_51 = nextParity_cols_2_2_0 ^ nextParity_cols_2_2_1 ^ nextParity_cols_2_2_2 ^ nextParity_cols_2_2_3
     ^ nextParity_cols_2_2_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_55 = nextParity_cols_3_2_0 ^ nextParity_cols_3_2_1 ^ nextParity_cols_3_2_2 ^ nextParity_cols_3_2_3
     ^ nextParity_cols_3_2_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_59 = nextParity_cols_4_2_0 ^ nextParity_cols_4_2_1 ^ nextParity_cols_4_2_2 ^ nextParity_cols_4_2_3
     ^ nextParity_cols_4_2_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_2 = {_nextParity_T_59,_nextParity_T_55,_nextParity_T_51,_nextParity_T_47,_nextParity_T_43}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_16 = {parity_2[3:0],parity_2[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_19 = {parity_1[0],parity_1[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_20 = _thetaXor_T_16 ^ _thetaXor_T_19; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_2 = _thetaXor_T_20[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_2 = _thetaXor_T_20[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_2 = _thetaXor_T_20[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_2 = _thetaXor_T_20[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_2 = _thetaXor_T_20[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_783 = {nextParity_cols_0_2_4,nextParity_cols_0_2_3,nextParity_cols_0_2_2,nextParity_cols_0_2_1,
    nextParity_cols_0_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_785 = thetaXor_0_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_786 = _T_783 ^ _T_785; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_792 = {nextParity_cols_1_2_4,nextParity_cols_1_2_3,nextParity_cols_1_2_2,nextParity_cols_1_2_1,
    nextParity_cols_1_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_794 = thetaXor_1_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_795 = _T_792 ^ _T_794; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_801 = {nextParity_cols_2_2_4,nextParity_cols_2_2_3,nextParity_cols_2_2_2,nextParity_cols_2_2_1,
    nextParity_cols_2_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_803 = thetaXor_2_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_804 = _T_801 ^ _T_803; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_810 = {nextParity_cols_3_2_4,nextParity_cols_3_2_3,nextParity_cols_3_2_2,nextParity_cols_3_2_1,
    nextParity_cols_3_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_812 = thetaXor_3_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_813 = _T_810 ^ _T_812; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_819 = {nextParity_cols_4_2_4,nextParity_cols_4_2_3,nextParity_cols_4_2_2,nextParity_cols_4_2_1,
    nextParity_cols_4_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_821 = thetaXor_4_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_822 = _T_819 ^ _T_821; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_63 = nextParity_cols_0_3_0 ^ nextParity_cols_0_3_1 ^ nextParity_cols_0_3_2 ^ nextParity_cols_0_3_3
     ^ nextParity_cols_0_3_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_67 = nextParity_cols_1_3_0 ^ nextParity_cols_1_3_1 ^ nextParity_cols_1_3_2 ^ nextParity_cols_1_3_3
     ^ nextParity_cols_1_3_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_71 = nextParity_cols_2_3_0 ^ nextParity_cols_2_3_1 ^ nextParity_cols_2_3_2 ^ nextParity_cols_2_3_3
     ^ nextParity_cols_2_3_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_75 = nextParity_cols_3_3_0 ^ nextParity_cols_3_3_1 ^ nextParity_cols_3_3_2 ^ nextParity_cols_3_3_3
     ^ nextParity_cols_3_3_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_79 = nextParity_cols_4_3_0 ^ nextParity_cols_4_3_1 ^ nextParity_cols_4_3_2 ^ nextParity_cols_4_3_3
     ^ nextParity_cols_4_3_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_3 = {_nextParity_T_79,_nextParity_T_75,_nextParity_T_71,_nextParity_T_67,_nextParity_T_63}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_23 = {parity_3[3:0],parity_3[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_26 = {parity_2[0],parity_2[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_27 = _thetaXor_T_23 ^ _thetaXor_T_26; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_3 = _thetaXor_T_27[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_3 = _thetaXor_T_27[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_3 = _thetaXor_T_27[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_3 = _thetaXor_T_27[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_3 = _thetaXor_T_27[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_828 = {nextParity_cols_0_3_4,nextParity_cols_0_3_3,nextParity_cols_0_3_2,nextParity_cols_0_3_1,
    nextParity_cols_0_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_830 = thetaXor_0_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_831 = _T_828 ^ _T_830; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_837 = {nextParity_cols_1_3_4,nextParity_cols_1_3_3,nextParity_cols_1_3_2,nextParity_cols_1_3_1,
    nextParity_cols_1_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_839 = thetaXor_1_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_840 = _T_837 ^ _T_839; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_846 = {nextParity_cols_2_3_4,nextParity_cols_2_3_3,nextParity_cols_2_3_2,nextParity_cols_2_3_1,
    nextParity_cols_2_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_848 = thetaXor_2_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_849 = _T_846 ^ _T_848; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_855 = {nextParity_cols_3_3_4,nextParity_cols_3_3_3,nextParity_cols_3_3_2,nextParity_cols_3_3_1,
    nextParity_cols_3_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_857 = thetaXor_3_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_858 = _T_855 ^ _T_857; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_864 = {nextParity_cols_4_3_4,nextParity_cols_4_3_3,nextParity_cols_4_3_2,nextParity_cols_4_3_1,
    nextParity_cols_4_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_866 = thetaXor_4_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_867 = _T_864 ^ _T_866; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_83 = nextParity_cols_0_4_0 ^ nextParity_cols_0_4_1 ^ nextParity_cols_0_4_2 ^ nextParity_cols_0_4_3
     ^ nextParity_cols_0_4_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_87 = nextParity_cols_1_4_0 ^ nextParity_cols_1_4_1 ^ nextParity_cols_1_4_2 ^ nextParity_cols_1_4_3
     ^ nextParity_cols_1_4_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_91 = nextParity_cols_2_4_0 ^ nextParity_cols_2_4_1 ^ nextParity_cols_2_4_2 ^ nextParity_cols_2_4_3
     ^ nextParity_cols_2_4_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_95 = nextParity_cols_3_4_0 ^ nextParity_cols_3_4_1 ^ nextParity_cols_3_4_2 ^ nextParity_cols_3_4_3
     ^ nextParity_cols_3_4_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_99 = nextParity_cols_4_4_0 ^ nextParity_cols_4_4_1 ^ nextParity_cols_4_4_2 ^ nextParity_cols_4_4_3
     ^ nextParity_cols_4_4_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_4 = {_nextParity_T_99,_nextParity_T_95,_nextParity_T_91,_nextParity_T_87,_nextParity_T_83}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_30 = {parity_4[3:0],parity_4[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_33 = {parity_3[0],parity_3[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_34 = _thetaXor_T_30 ^ _thetaXor_T_33; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_4 = _thetaXor_T_34[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_4 = _thetaXor_T_34[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_4 = _thetaXor_T_34[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_4 = _thetaXor_T_34[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_4 = _thetaXor_T_34[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_873 = {nextParity_cols_0_4_4,nextParity_cols_0_4_3,nextParity_cols_0_4_2,nextParity_cols_0_4_1,
    nextParity_cols_0_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_875 = thetaXor_0_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_876 = _T_873 ^ _T_875; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_882 = {nextParity_cols_1_4_4,nextParity_cols_1_4_3,nextParity_cols_1_4_2,nextParity_cols_1_4_1,
    nextParity_cols_1_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_884 = thetaXor_1_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_885 = _T_882 ^ _T_884; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_891 = {nextParity_cols_2_4_4,nextParity_cols_2_4_3,nextParity_cols_2_4_2,nextParity_cols_2_4_1,
    nextParity_cols_2_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_893 = thetaXor_2_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_894 = _T_891 ^ _T_893; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_900 = {nextParity_cols_3_4_4,nextParity_cols_3_4_3,nextParity_cols_3_4_2,nextParity_cols_3_4_1,
    nextParity_cols_3_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_902 = thetaXor_3_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_903 = _T_900 ^ _T_902; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_909 = {nextParity_cols_4_4_4,nextParity_cols_4_4_3,nextParity_cols_4_4_2,nextParity_cols_4_4_1,
    nextParity_cols_4_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_911 = thetaXor_4_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_912 = _T_909 ^ _T_911; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_103 = nextParity_cols_0_5_0 ^ nextParity_cols_0_5_1 ^ nextParity_cols_0_5_2 ^
    nextParity_cols_0_5_3 ^ nextParity_cols_0_5_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_107 = nextParity_cols_1_5_0 ^ nextParity_cols_1_5_1 ^ nextParity_cols_1_5_2 ^
    nextParity_cols_1_5_3 ^ nextParity_cols_1_5_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_111 = nextParity_cols_2_5_0 ^ nextParity_cols_2_5_1 ^ nextParity_cols_2_5_2 ^
    nextParity_cols_2_5_3 ^ nextParity_cols_2_5_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_115 = nextParity_cols_3_5_0 ^ nextParity_cols_3_5_1 ^ nextParity_cols_3_5_2 ^
    nextParity_cols_3_5_3 ^ nextParity_cols_3_5_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_119 = nextParity_cols_4_5_0 ^ nextParity_cols_4_5_1 ^ nextParity_cols_4_5_2 ^
    nextParity_cols_4_5_3 ^ nextParity_cols_4_5_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_5 = {_nextParity_T_119,_nextParity_T_115,_nextParity_T_111,_nextParity_T_107,_nextParity_T_103}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_37 = {parity_5[3:0],parity_5[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_40 = {parity_4[0],parity_4[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_41 = _thetaXor_T_37 ^ _thetaXor_T_40; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_5 = _thetaXor_T_41[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_5 = _thetaXor_T_41[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_5 = _thetaXor_T_41[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_5 = _thetaXor_T_41[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_5 = _thetaXor_T_41[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_918 = {nextParity_cols_0_5_4,nextParity_cols_0_5_3,nextParity_cols_0_5_2,nextParity_cols_0_5_1,
    nextParity_cols_0_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_920 = thetaXor_0_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_921 = _T_918 ^ _T_920; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_927 = {nextParity_cols_1_5_4,nextParity_cols_1_5_3,nextParity_cols_1_5_2,nextParity_cols_1_5_1,
    nextParity_cols_1_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_929 = thetaXor_1_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_930 = _T_927 ^ _T_929; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_936 = {nextParity_cols_2_5_4,nextParity_cols_2_5_3,nextParity_cols_2_5_2,nextParity_cols_2_5_1,
    nextParity_cols_2_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_938 = thetaXor_2_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_939 = _T_936 ^ _T_938; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_945 = {nextParity_cols_3_5_4,nextParity_cols_3_5_3,nextParity_cols_3_5_2,nextParity_cols_3_5_1,
    nextParity_cols_3_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_947 = thetaXor_3_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_948 = _T_945 ^ _T_947; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_954 = {nextParity_cols_4_5_4,nextParity_cols_4_5_3,nextParity_cols_4_5_2,nextParity_cols_4_5_1,
    nextParity_cols_4_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_956 = thetaXor_4_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_957 = _T_954 ^ _T_956; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_123 = nextParity_cols_0_6_0 ^ nextParity_cols_0_6_1 ^ nextParity_cols_0_6_2 ^
    nextParity_cols_0_6_3 ^ nextParity_cols_0_6_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_127 = nextParity_cols_1_6_0 ^ nextParity_cols_1_6_1 ^ nextParity_cols_1_6_2 ^
    nextParity_cols_1_6_3 ^ nextParity_cols_1_6_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_131 = nextParity_cols_2_6_0 ^ nextParity_cols_2_6_1 ^ nextParity_cols_2_6_2 ^
    nextParity_cols_2_6_3 ^ nextParity_cols_2_6_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_135 = nextParity_cols_3_6_0 ^ nextParity_cols_3_6_1 ^ nextParity_cols_3_6_2 ^
    nextParity_cols_3_6_3 ^ nextParity_cols_3_6_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_139 = nextParity_cols_4_6_0 ^ nextParity_cols_4_6_1 ^ nextParity_cols_4_6_2 ^
    nextParity_cols_4_6_3 ^ nextParity_cols_4_6_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_6 = {_nextParity_T_139,_nextParity_T_135,_nextParity_T_131,_nextParity_T_127,_nextParity_T_123}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_44 = {parity_6[3:0],parity_6[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_47 = {parity_5[0],parity_5[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_48 = _thetaXor_T_44 ^ _thetaXor_T_47; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_6 = _thetaXor_T_48[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_6 = _thetaXor_T_48[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_6 = _thetaXor_T_48[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_6 = _thetaXor_T_48[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_6 = _thetaXor_T_48[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_963 = {nextParity_cols_0_6_4,nextParity_cols_0_6_3,nextParity_cols_0_6_2,nextParity_cols_0_6_1,
    nextParity_cols_0_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_965 = thetaXor_0_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_966 = _T_963 ^ _T_965; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_972 = {nextParity_cols_1_6_4,nextParity_cols_1_6_3,nextParity_cols_1_6_2,nextParity_cols_1_6_1,
    nextParity_cols_1_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_974 = thetaXor_1_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_975 = _T_972 ^ _T_974; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_981 = {nextParity_cols_2_6_4,nextParity_cols_2_6_3,nextParity_cols_2_6_2,nextParity_cols_2_6_1,
    nextParity_cols_2_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_983 = thetaXor_2_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_984 = _T_981 ^ _T_983; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_990 = {nextParity_cols_3_6_4,nextParity_cols_3_6_3,nextParity_cols_3_6_2,nextParity_cols_3_6_1,
    nextParity_cols_3_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_992 = thetaXor_3_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_993 = _T_990 ^ _T_992; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_999 = {nextParity_cols_4_6_4,nextParity_cols_4_6_3,nextParity_cols_4_6_2,nextParity_cols_4_6_1,
    nextParity_cols_4_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1001 = thetaXor_4_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1002 = _T_999 ^ _T_1001; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_143 = nextParity_cols_0_7_0 ^ nextParity_cols_0_7_1 ^ nextParity_cols_0_7_2 ^
    nextParity_cols_0_7_3 ^ nextParity_cols_0_7_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_147 = nextParity_cols_1_7_0 ^ nextParity_cols_1_7_1 ^ nextParity_cols_1_7_2 ^
    nextParity_cols_1_7_3 ^ nextParity_cols_1_7_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_151 = nextParity_cols_2_7_0 ^ nextParity_cols_2_7_1 ^ nextParity_cols_2_7_2 ^
    nextParity_cols_2_7_3 ^ nextParity_cols_2_7_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_155 = nextParity_cols_3_7_0 ^ nextParity_cols_3_7_1 ^ nextParity_cols_3_7_2 ^
    nextParity_cols_3_7_3 ^ nextParity_cols_3_7_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_159 = nextParity_cols_4_7_0 ^ nextParity_cols_4_7_1 ^ nextParity_cols_4_7_2 ^
    nextParity_cols_4_7_3 ^ nextParity_cols_4_7_4; // @[KeccakCore.scala 306:57]
  wire [4:0] lastParity = {_nextParity_T_159,_nextParity_T_155,_nextParity_T_151,_nextParity_T_147,_nextParity_T_143}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_51 = {lastParity[3:0],lastParity[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_54 = {parity_6[0],parity_6[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_55 = _thetaXor_T_51 ^ _thetaXor_T_54; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_7 = _thetaXor_T_55[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_7 = _thetaXor_T_55[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_7 = _thetaXor_T_55[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_7 = _thetaXor_T_55[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_7 = _thetaXor_T_55[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_1008 = {nextParity_cols_0_7_4,nextParity_cols_0_7_3,nextParity_cols_0_7_2,nextParity_cols_0_7_1,
    nextParity_cols_0_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1010 = thetaXor_0_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1011 = _T_1008 ^ _T_1010; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1017 = {nextParity_cols_1_7_4,nextParity_cols_1_7_3,nextParity_cols_1_7_2,nextParity_cols_1_7_1,
    nextParity_cols_1_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1019 = thetaXor_1_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1020 = _T_1017 ^ _T_1019; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1026 = {nextParity_cols_2_7_4,nextParity_cols_2_7_3,nextParity_cols_2_7_2,nextParity_cols_2_7_1,
    nextParity_cols_2_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1028 = thetaXor_2_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1029 = _T_1026 ^ _T_1028; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1035 = {nextParity_cols_3_7_4,nextParity_cols_3_7_3,nextParity_cols_3_7_2,nextParity_cols_3_7_1,
    nextParity_cols_3_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1037 = thetaXor_3_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1038 = _T_1035 ^ _T_1037; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1044 = {nextParity_cols_4_7_4,nextParity_cols_4_7_3,nextParity_cols_4_7_2,nextParity_cols_4_7_1,
    nextParity_cols_4_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1046 = thetaXor_4_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1047 = _T_1044 ^ _T_1046; // @[KeccakCore.scala 311:45]
  wire  _GEN_221 = _T_472 | _T_475; // @[Conditional.scala 39:67 KeccakCore.scala 202:24]
  wire  _GEN_264 = _T_463 ? 1'h0 : _GEN_221; // @[Conditional.scala 39:67]
  wire  updatePrevParity = _T_460 ? 1'h0 : _GEN_264; // @[Conditional.scala 40:58]
  wire  _T_1053_0 = isLastRound ? nextParity_cols_0__0 : _T_696[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_1 = isLastRound ? nextParity_cols_1__0 : _T_705[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_2 = isLastRound ? nextParity_cols_2__0 : _T_714[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_3 = isLastRound ? nextParity_cols_3__0 : _T_723[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_4 = isLastRound ? nextParity_cols_4__0 : _T_732[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_5 = isLastRound ? nextParity_cols_0__1 : _T_696[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_6 = isLastRound ? nextParity_cols_1__1 : _T_705[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_7 = isLastRound ? nextParity_cols_2__1 : _T_714[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_8 = isLastRound ? nextParity_cols_3__1 : _T_723[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_9 = isLastRound ? nextParity_cols_4__1 : _T_732[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_10 = isLastRound ? nextParity_cols_0__2 : _T_696[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_11 = isLastRound ? nextParity_cols_1__2 : _T_705[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_12 = isLastRound ? nextParity_cols_2__2 : _T_714[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_13 = isLastRound ? nextParity_cols_3__2 : _T_723[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_14 = isLastRound ? nextParity_cols_4__2 : _T_732[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_15 = isLastRound ? nextParity_cols_0__3 : _T_696[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_16 = isLastRound ? nextParity_cols_1__3 : _T_705[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_17 = isLastRound ? nextParity_cols_2__3 : _T_714[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_18 = isLastRound ? nextParity_cols_3__3 : _T_723[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_19 = isLastRound ? nextParity_cols_4__3 : _T_732[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_20 = isLastRound ? nextParity_cols_0__4 : _T_696[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_21 = isLastRound ? nextParity_cols_1__4 : _T_705[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_22 = isLastRound ? nextParity_cols_2__4 : _T_714[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_23 = isLastRound ? nextParity_cols_3__4 : _T_723[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1053_24 = isLastRound ? nextParity_cols_4__4 : _T_732[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_0 = isLastRound ? nextParity_cols_0_1_0 : _T_741[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_1 = isLastRound ? nextParity_cols_1_1_0 : _T_750[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_2 = isLastRound ? nextParity_cols_2_1_0 : _T_759[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_3 = isLastRound ? nextParity_cols_3_1_0 : _T_768[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_4 = isLastRound ? nextParity_cols_4_1_0 : _T_777[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_5 = isLastRound ? nextParity_cols_0_1_1 : _T_741[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_6 = isLastRound ? nextParity_cols_1_1_1 : _T_750[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_7 = isLastRound ? nextParity_cols_2_1_1 : _T_759[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_8 = isLastRound ? nextParity_cols_3_1_1 : _T_768[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_9 = isLastRound ? nextParity_cols_4_1_1 : _T_777[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_10 = isLastRound ? nextParity_cols_0_1_2 : _T_741[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_11 = isLastRound ? nextParity_cols_1_1_2 : _T_750[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_12 = isLastRound ? nextParity_cols_2_1_2 : _T_759[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_13 = isLastRound ? nextParity_cols_3_1_2 : _T_768[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_14 = isLastRound ? nextParity_cols_4_1_2 : _T_777[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_15 = isLastRound ? nextParity_cols_0_1_3 : _T_741[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_16 = isLastRound ? nextParity_cols_1_1_3 : _T_750[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_17 = isLastRound ? nextParity_cols_2_1_3 : _T_759[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_18 = isLastRound ? nextParity_cols_3_1_3 : _T_768[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_19 = isLastRound ? nextParity_cols_4_1_3 : _T_777[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_20 = isLastRound ? nextParity_cols_0_1_4 : _T_741[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_21 = isLastRound ? nextParity_cols_1_1_4 : _T_750[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_22 = isLastRound ? nextParity_cols_2_1_4 : _T_759[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_23 = isLastRound ? nextParity_cols_3_1_4 : _T_768[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1054_24 = isLastRound ? nextParity_cols_4_1_4 : _T_777[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_0 = isLastRound ? nextParity_cols_0_2_0 : _T_786[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_1 = isLastRound ? nextParity_cols_1_2_0 : _T_795[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_2 = isLastRound ? nextParity_cols_2_2_0 : _T_804[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_3 = isLastRound ? nextParity_cols_3_2_0 : _T_813[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_4 = isLastRound ? nextParity_cols_4_2_0 : _T_822[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_5 = isLastRound ? nextParity_cols_0_2_1 : _T_786[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_6 = isLastRound ? nextParity_cols_1_2_1 : _T_795[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_7 = isLastRound ? nextParity_cols_2_2_1 : _T_804[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_8 = isLastRound ? nextParity_cols_3_2_1 : _T_813[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_9 = isLastRound ? nextParity_cols_4_2_1 : _T_822[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_10 = isLastRound ? nextParity_cols_0_2_2 : _T_786[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_11 = isLastRound ? nextParity_cols_1_2_2 : _T_795[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_12 = isLastRound ? nextParity_cols_2_2_2 : _T_804[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_13 = isLastRound ? nextParity_cols_3_2_2 : _T_813[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_14 = isLastRound ? nextParity_cols_4_2_2 : _T_822[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_15 = isLastRound ? nextParity_cols_0_2_3 : _T_786[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_16 = isLastRound ? nextParity_cols_1_2_3 : _T_795[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_17 = isLastRound ? nextParity_cols_2_2_3 : _T_804[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_18 = isLastRound ? nextParity_cols_3_2_3 : _T_813[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_19 = isLastRound ? nextParity_cols_4_2_3 : _T_822[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_20 = isLastRound ? nextParity_cols_0_2_4 : _T_786[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_21 = isLastRound ? nextParity_cols_1_2_4 : _T_795[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_22 = isLastRound ? nextParity_cols_2_2_4 : _T_804[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_23 = isLastRound ? nextParity_cols_3_2_4 : _T_813[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1055_24 = isLastRound ? nextParity_cols_4_2_4 : _T_822[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_0 = isLastRound ? nextParity_cols_0_3_0 : _T_831[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_1 = isLastRound ? nextParity_cols_1_3_0 : _T_840[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_2 = isLastRound ? nextParity_cols_2_3_0 : _T_849[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_3 = isLastRound ? nextParity_cols_3_3_0 : _T_858[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_4 = isLastRound ? nextParity_cols_4_3_0 : _T_867[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_5 = isLastRound ? nextParity_cols_0_3_1 : _T_831[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_6 = isLastRound ? nextParity_cols_1_3_1 : _T_840[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_7 = isLastRound ? nextParity_cols_2_3_1 : _T_849[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_8 = isLastRound ? nextParity_cols_3_3_1 : _T_858[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_9 = isLastRound ? nextParity_cols_4_3_1 : _T_867[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_10 = isLastRound ? nextParity_cols_0_3_2 : _T_831[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_11 = isLastRound ? nextParity_cols_1_3_2 : _T_840[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_12 = isLastRound ? nextParity_cols_2_3_2 : _T_849[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_13 = isLastRound ? nextParity_cols_3_3_2 : _T_858[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_14 = isLastRound ? nextParity_cols_4_3_2 : _T_867[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_15 = isLastRound ? nextParity_cols_0_3_3 : _T_831[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_16 = isLastRound ? nextParity_cols_1_3_3 : _T_840[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_17 = isLastRound ? nextParity_cols_2_3_3 : _T_849[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_18 = isLastRound ? nextParity_cols_3_3_3 : _T_858[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_19 = isLastRound ? nextParity_cols_4_3_3 : _T_867[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_20 = isLastRound ? nextParity_cols_0_3_4 : _T_831[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_21 = isLastRound ? nextParity_cols_1_3_4 : _T_840[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_22 = isLastRound ? nextParity_cols_2_3_4 : _T_849[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_23 = isLastRound ? nextParity_cols_3_3_4 : _T_858[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1056_24 = isLastRound ? nextParity_cols_4_3_4 : _T_867[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_0 = isLastRound ? nextParity_cols_0_4_0 : _T_876[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_1 = isLastRound ? nextParity_cols_1_4_0 : _T_885[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_2 = isLastRound ? nextParity_cols_2_4_0 : _T_894[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_3 = isLastRound ? nextParity_cols_3_4_0 : _T_903[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_4 = isLastRound ? nextParity_cols_4_4_0 : _T_912[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_5 = isLastRound ? nextParity_cols_0_4_1 : _T_876[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_6 = isLastRound ? nextParity_cols_1_4_1 : _T_885[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_7 = isLastRound ? nextParity_cols_2_4_1 : _T_894[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_8 = isLastRound ? nextParity_cols_3_4_1 : _T_903[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_9 = isLastRound ? nextParity_cols_4_4_1 : _T_912[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_10 = isLastRound ? nextParity_cols_0_4_2 : _T_876[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_11 = isLastRound ? nextParity_cols_1_4_2 : _T_885[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_12 = isLastRound ? nextParity_cols_2_4_2 : _T_894[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_13 = isLastRound ? nextParity_cols_3_4_2 : _T_903[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_14 = isLastRound ? nextParity_cols_4_4_2 : _T_912[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_15 = isLastRound ? nextParity_cols_0_4_3 : _T_876[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_16 = isLastRound ? nextParity_cols_1_4_3 : _T_885[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_17 = isLastRound ? nextParity_cols_2_4_3 : _T_894[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_18 = isLastRound ? nextParity_cols_3_4_3 : _T_903[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_19 = isLastRound ? nextParity_cols_4_4_3 : _T_912[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_20 = isLastRound ? nextParity_cols_0_4_4 : _T_876[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_21 = isLastRound ? nextParity_cols_1_4_4 : _T_885[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_22 = isLastRound ? nextParity_cols_2_4_4 : _T_894[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_23 = isLastRound ? nextParity_cols_3_4_4 : _T_903[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1057_24 = isLastRound ? nextParity_cols_4_4_4 : _T_912[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_0 = isLastRound ? nextParity_cols_0_5_0 : _T_921[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_1 = isLastRound ? nextParity_cols_1_5_0 : _T_930[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_2 = isLastRound ? nextParity_cols_2_5_0 : _T_939[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_3 = isLastRound ? nextParity_cols_3_5_0 : _T_948[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_4 = isLastRound ? nextParity_cols_4_5_0 : _T_957[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_5 = isLastRound ? nextParity_cols_0_5_1 : _T_921[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_6 = isLastRound ? nextParity_cols_1_5_1 : _T_930[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_7 = isLastRound ? nextParity_cols_2_5_1 : _T_939[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_8 = isLastRound ? nextParity_cols_3_5_1 : _T_948[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_9 = isLastRound ? nextParity_cols_4_5_1 : _T_957[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_10 = isLastRound ? nextParity_cols_0_5_2 : _T_921[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_11 = isLastRound ? nextParity_cols_1_5_2 : _T_930[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_12 = isLastRound ? nextParity_cols_2_5_2 : _T_939[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_13 = isLastRound ? nextParity_cols_3_5_2 : _T_948[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_14 = isLastRound ? nextParity_cols_4_5_2 : _T_957[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_15 = isLastRound ? nextParity_cols_0_5_3 : _T_921[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_16 = isLastRound ? nextParity_cols_1_5_3 : _T_930[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_17 = isLastRound ? nextParity_cols_2_5_3 : _T_939[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_18 = isLastRound ? nextParity_cols_3_5_3 : _T_948[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_19 = isLastRound ? nextParity_cols_4_5_3 : _T_957[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_20 = isLastRound ? nextParity_cols_0_5_4 : _T_921[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_21 = isLastRound ? nextParity_cols_1_5_4 : _T_930[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_22 = isLastRound ? nextParity_cols_2_5_4 : _T_939[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_23 = isLastRound ? nextParity_cols_3_5_4 : _T_948[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1058_24 = isLastRound ? nextParity_cols_4_5_4 : _T_957[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_0 = isLastRound ? nextParity_cols_0_6_0 : _T_966[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_1 = isLastRound ? nextParity_cols_1_6_0 : _T_975[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_2 = isLastRound ? nextParity_cols_2_6_0 : _T_984[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_3 = isLastRound ? nextParity_cols_3_6_0 : _T_993[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_4 = isLastRound ? nextParity_cols_4_6_0 : _T_1002[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_5 = isLastRound ? nextParity_cols_0_6_1 : _T_966[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_6 = isLastRound ? nextParity_cols_1_6_1 : _T_975[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_7 = isLastRound ? nextParity_cols_2_6_1 : _T_984[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_8 = isLastRound ? nextParity_cols_3_6_1 : _T_993[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_9 = isLastRound ? nextParity_cols_4_6_1 : _T_1002[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_10 = isLastRound ? nextParity_cols_0_6_2 : _T_966[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_11 = isLastRound ? nextParity_cols_1_6_2 : _T_975[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_12 = isLastRound ? nextParity_cols_2_6_2 : _T_984[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_13 = isLastRound ? nextParity_cols_3_6_2 : _T_993[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_14 = isLastRound ? nextParity_cols_4_6_2 : _T_1002[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_15 = isLastRound ? nextParity_cols_0_6_3 : _T_966[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_16 = isLastRound ? nextParity_cols_1_6_3 : _T_975[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_17 = isLastRound ? nextParity_cols_2_6_3 : _T_984[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_18 = isLastRound ? nextParity_cols_3_6_3 : _T_993[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_19 = isLastRound ? nextParity_cols_4_6_3 : _T_1002[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_20 = isLastRound ? nextParity_cols_0_6_4 : _T_966[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_21 = isLastRound ? nextParity_cols_1_6_4 : _T_975[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_22 = isLastRound ? nextParity_cols_2_6_4 : _T_984[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_23 = isLastRound ? nextParity_cols_3_6_4 : _T_993[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1059_24 = isLastRound ? nextParity_cols_4_6_4 : _T_1002[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_0 = isLastRound ? nextParity_cols_0_7_0 : _T_1011[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_1 = isLastRound ? nextParity_cols_1_7_0 : _T_1020[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_2 = isLastRound ? nextParity_cols_2_7_0 : _T_1029[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_3 = isLastRound ? nextParity_cols_3_7_0 : _T_1038[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_4 = isLastRound ? nextParity_cols_4_7_0 : _T_1047[0]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_5 = isLastRound ? nextParity_cols_0_7_1 : _T_1011[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_6 = isLastRound ? nextParity_cols_1_7_1 : _T_1020[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_7 = isLastRound ? nextParity_cols_2_7_1 : _T_1029[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_8 = isLastRound ? nextParity_cols_3_7_1 : _T_1038[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_9 = isLastRound ? nextParity_cols_4_7_1 : _T_1047[1]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_10 = isLastRound ? nextParity_cols_0_7_2 : _T_1011[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_11 = isLastRound ? nextParity_cols_1_7_2 : _T_1020[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_12 = isLastRound ? nextParity_cols_2_7_2 : _T_1029[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_13 = isLastRound ? nextParity_cols_3_7_2 : _T_1038[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_14 = isLastRound ? nextParity_cols_4_7_2 : _T_1047[2]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_15 = isLastRound ? nextParity_cols_0_7_3 : _T_1011[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_16 = isLastRound ? nextParity_cols_1_7_3 : _T_1020[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_17 = isLastRound ? nextParity_cols_2_7_3 : _T_1029[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_18 = isLastRound ? nextParity_cols_3_7_3 : _T_1038[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_19 = isLastRound ? nextParity_cols_4_7_3 : _T_1047[3]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_20 = isLastRound ? nextParity_cols_0_7_4 : _T_1011[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_21 = isLastRound ? nextParity_cols_1_7_4 : _T_1020[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_22 = isLastRound ? nextParity_cols_2_7_4 : _T_1029[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_23 = isLastRound ? nextParity_cols_3_7_4 : _T_1038[4]; // @[KeccakCore.scala 447:31]
  wire  _T_1060_24 = isLastRound ? nextParity_cols_4_7_4 : _T_1047[4]; // @[KeccakCore.scala 447:31]
  wire [63:0] _keccakStateRegShares_0_0_T_2 = {_T_1060_0,_T_1059_0,_T_1058_0,_T_1057_0,_T_1056_0,_T_1055_0,_T_1054_0,
    _T_1053_0,keccakStateRegShares_0_0[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_1_T_2 = {_T_1060_1,_T_1059_1,_T_1058_1,_T_1057_1,_T_1056_1,_T_1055_1,_T_1054_1,
    _T_1053_1,keccakStateRegShares_0_1[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_2_T_2 = {_T_1060_2,_T_1059_2,_T_1058_2,_T_1057_2,_T_1056_2,_T_1055_2,_T_1054_2,
    _T_1053_2,keccakStateRegShares_0_2[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_3_T_2 = {_T_1060_3,_T_1059_3,_T_1058_3,_T_1057_3,_T_1056_3,_T_1055_3,_T_1054_3,
    _T_1053_3,keccakStateRegShares_0_3[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_4_T_2 = {_T_1060_4,_T_1059_4,_T_1058_4,_T_1057_4,_T_1056_4,_T_1055_4,_T_1054_4,
    _T_1053_4,keccakStateRegShares_0_4[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_5_T_2 = {_T_1060_5,_T_1059_5,_T_1058_5,_T_1057_5,_T_1056_5,_T_1055_5,_T_1054_5,
    _T_1053_5,keccakStateRegShares_0_5[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_6_T_2 = {_T_1060_6,_T_1059_6,_T_1058_6,_T_1057_6,_T_1056_6,_T_1055_6,_T_1054_6,
    _T_1053_6,keccakStateRegShares_0_6[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_7_T_2 = {_T_1060_7,_T_1059_7,_T_1058_7,_T_1057_7,_T_1056_7,_T_1055_7,_T_1054_7,
    _T_1053_7,keccakStateRegShares_0_7[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_8_T_2 = {_T_1060_8,_T_1059_8,_T_1058_8,_T_1057_8,_T_1056_8,_T_1055_8,_T_1054_8,
    _T_1053_8,keccakStateRegShares_0_8[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_9_T_2 = {_T_1060_9,_T_1059_9,_T_1058_9,_T_1057_9,_T_1056_9,_T_1055_9,_T_1054_9,
    _T_1053_9,keccakStateRegShares_0_9[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_10_T_2 = {_T_1060_10,_T_1059_10,_T_1058_10,_T_1057_10,_T_1056_10,_T_1055_10,
    _T_1054_10,_T_1053_10,keccakStateRegShares_0_10[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_11_T_2 = {_T_1060_11,_T_1059_11,_T_1058_11,_T_1057_11,_T_1056_11,_T_1055_11,
    _T_1054_11,_T_1053_11,keccakStateRegShares_0_11[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_12_T_2 = {_T_1060_12,_T_1059_12,_T_1058_12,_T_1057_12,_T_1056_12,_T_1055_12,
    _T_1054_12,_T_1053_12,keccakStateRegShares_0_12[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_13_T_2 = {_T_1060_13,_T_1059_13,_T_1058_13,_T_1057_13,_T_1056_13,_T_1055_13,
    _T_1054_13,_T_1053_13,keccakStateRegShares_0_13[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_14_T_2 = {_T_1060_14,_T_1059_14,_T_1058_14,_T_1057_14,_T_1056_14,_T_1055_14,
    _T_1054_14,_T_1053_14,keccakStateRegShares_0_14[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_15_T_2 = {_T_1060_15,_T_1059_15,_T_1058_15,_T_1057_15,_T_1056_15,_T_1055_15,
    _T_1054_15,_T_1053_15,keccakStateRegShares_0_15[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_16_T_2 = {_T_1060_16,_T_1059_16,_T_1058_16,_T_1057_16,_T_1056_16,_T_1055_16,
    _T_1054_16,_T_1053_16,keccakStateRegShares_0_16[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_17_T_2 = {_T_1060_17,_T_1059_17,_T_1058_17,_T_1057_17,_T_1056_17,_T_1055_17,
    _T_1054_17,_T_1053_17,keccakStateRegShares_0_17[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_18_T_2 = {_T_1060_18,_T_1059_18,_T_1058_18,_T_1057_18,_T_1056_18,_T_1055_18,
    _T_1054_18,_T_1053_18,keccakStateRegShares_0_18[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_19_T_2 = {_T_1060_19,_T_1059_19,_T_1058_19,_T_1057_19,_T_1056_19,_T_1055_19,
    _T_1054_19,_T_1053_19,keccakStateRegShares_0_19[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_20_T_2 = {_T_1060_20,_T_1059_20,_T_1058_20,_T_1057_20,_T_1056_20,_T_1055_20,
    _T_1054_20,_T_1053_20,keccakStateRegShares_0_20[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_21_T_2 = {_T_1060_21,_T_1059_21,_T_1058_21,_T_1057_21,_T_1056_21,_T_1055_21,
    _T_1054_21,_T_1053_21,keccakStateRegShares_0_21[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_22_T_2 = {_T_1060_22,_T_1059_22,_T_1058_22,_T_1057_22,_T_1056_22,_T_1055_22,
    _T_1054_22,_T_1053_22,keccakStateRegShares_0_22[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_23_T_2 = {_T_1060_23,_T_1059_23,_T_1058_23,_T_1057_23,_T_1056_23,_T_1055_23,
    _T_1054_23,_T_1053_23,keccakStateRegShares_0_23[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_24_T_7 = {_T_1060_24,_T_1059_24,_T_1058_24,_T_1057_24,_T_1056_24,_T_1055_24,
    _T_1054_24,_T_1053_24,keccakStateRegShares_0_24[63:8]}; // @[KeccakCore.scala 214:63]
  wire  lastSliceProc = shiftCtr == 5'h7; // @[KeccakCore.scala 218:36]
  wire  firstRoundThetaFinished = zerothRound & lastSliceProc; // @[KeccakCore.scala 219:49]
  wire [2:0] _GEN_128 = io_ctrl_absorb ? 3'h1 : 3'h6; // @[KeccakCore.scala 227:32 KeccakCore.scala 228:19 KeccakCore.scala 230:19]
  wire [4:0] _GEN_129 = isLastRound ? 5'h0 : roundCtr; // @[KeccakCore.scala 224:27 KeccakCore.scala 225:20 KeccakCore.scala 102:27]
  wire [4:0] _GEN_130 = isLastRound ? 5'h0 : shiftCtr; // @[KeccakCore.scala 224:27 KeccakCore.scala 226:20 KeccakCore.scala 103:27]
  wire [2:0] _GEN_131 = isLastRound ? _GEN_128 : 3'h5; // @[KeccakCore.scala 224:27 KeccakCore.scala 222:15]
  wire  _GEN_132 = lastSliceProc | lastSliceProcFlag; // @[KeccakCore.scala 234:29 KeccakCore.scala 235:29 KeccakCore.scala 168:36]
  wire [2:0] _GEN_133 = firstRoundThetaFinished | lastSliceProcFlag ? _GEN_131 : state; // @[KeccakCore.scala 221:58 KeccakCore.scala 101:34]
  wire [4:0] _GEN_134 = firstRoundThetaFinished | lastSliceProcFlag ? _GEN_129 : roundCtr; // @[KeccakCore.scala 221:58 KeccakCore.scala 102:27]
  wire [4:0] _GEN_135 = firstRoundThetaFinished | lastSliceProcFlag ? _GEN_130 : _shiftCtr_T_1; // @[KeccakCore.scala 221:58 KeccakCore.scala 237:18]
  wire  _GEN_136 = firstRoundThetaFinished | lastSliceProcFlag ? lastSliceProcFlag : _GEN_132; // @[KeccakCore.scala 221:58 KeccakCore.scala 168:36]
  wire [63:0] _T_1067 = {keccakStateRegShares_0_1[62:0],keccakStateRegShares_0_1[63]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1070 = {keccakStateRegShares_0_2[1:0],keccakStateRegShares_0_2[63:2]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1073 = {keccakStateRegShares_0_3[35:0],keccakStateRegShares_0_3[63:36]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1076 = {keccakStateRegShares_0_4[36:0],keccakStateRegShares_0_4[63:37]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1079 = {keccakStateRegShares_0_5[27:0],keccakStateRegShares_0_5[63:28]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1082 = {keccakStateRegShares_0_6[19:0],keccakStateRegShares_0_6[63:20]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1085 = {keccakStateRegShares_0_7[57:0],keccakStateRegShares_0_7[63:58]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1088 = {keccakStateRegShares_0_8[8:0],keccakStateRegShares_0_8[63:9]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1091 = {keccakStateRegShares_0_9[43:0],keccakStateRegShares_0_9[63:44]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1094 = {keccakStateRegShares_0_10[60:0],keccakStateRegShares_0_10[63:61]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1097 = {keccakStateRegShares_0_11[53:0],keccakStateRegShares_0_11[63:54]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1100 = {keccakStateRegShares_0_12[20:0],keccakStateRegShares_0_12[63:21]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1103 = {keccakStateRegShares_0_13[38:0],keccakStateRegShares_0_13[63:39]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1106 = {keccakStateRegShares_0_14[24:0],keccakStateRegShares_0_14[63:25]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1109 = {keccakStateRegShares_0_15[22:0],keccakStateRegShares_0_15[63:23]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1112 = {keccakStateRegShares_0_16[18:0],keccakStateRegShares_0_16[63:19]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1115 = {keccakStateRegShares_0_17[48:0],keccakStateRegShares_0_17[63:49]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1118 = {keccakStateRegShares_0_18[42:0],keccakStateRegShares_0_18[63:43]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1121 = {keccakStateRegShares_0_19[55:0],keccakStateRegShares_0_19[63:56]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1124 = {keccakStateRegShares_0_20[45:0],keccakStateRegShares_0_20[63:46]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1127 = {keccakStateRegShares_0_21[61:0],keccakStateRegShares_0_21[63:62]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1130 = {keccakStateRegShares_0_22[2:0],keccakStateRegShares_0_22[63:3]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1133 = {keccakStateRegShares_0_23[7:0],keccakStateRegShares_0_23[63:8]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_1136 = {keccakStateRegShares_0_24[49:0],keccakStateRegShares_0_24[63:50]}; // @[KeccakCore.scala 479:62]
  wire [4:0] _roundCtr_T_1 = roundCtr + 5'h1; // @[KeccakCore.scala 242:28]
  wire  _GEN_137 = lastRateLine ? 1'h0 : isRateLineFlag; // @[KeccakCore.scala 252:28 KeccakCore.scala 253:26 KeccakCore.scala 105:33]
  wire [4:0] _GEN_138 = lastLaneRotate ? 5'h0 : _shiftCtr_T_1; // @[KeccakCore.scala 257:30 KeccakCore.scala 258:20 KeccakCore.scala 256:18]
  wire [2:0] _GEN_139 = lastLaneRotate ? 3'h7 : state; // @[KeccakCore.scala 257:30 KeccakCore.scala 259:17 KeccakCore.scala 101:34]
  wire  _GEN_140 = ~io_dout_valid | io_dout_ready ? _GEN_137 : isRateLineFlag; // @[KeccakCore.scala 251:45 KeccakCore.scala 105:33]
  wire [4:0] _GEN_142 = ~io_dout_valid | io_dout_ready ? _GEN_138 : shiftCtr; // @[KeccakCore.scala 251:45 KeccakCore.scala 103:27]
  wire [2:0] _GEN_143 = ~io_dout_valid | io_dout_ready ? _GEN_139 : state; // @[KeccakCore.scala 251:45 KeccakCore.scala 101:34]
  wire  _T_1144 = 3'h7 == state; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_144 = io_ctrl_squeeze ? 2'h3 : 2'h0; // @[KeccakCore.scala 266:29 KeccakCore.scala 267:15 KeccakCore.scala 269:15]
  wire  _GEN_146 = _T_1144 | isRateLineFlag; // @[Conditional.scala 39:67 KeccakCore.scala 265:22 KeccakCore.scala 105:33]
  wire [2:0] _GEN_147 = _T_1144 ? {{1'd0}, _GEN_144} : state; // @[Conditional.scala 39:67 KeccakCore.scala 101:34]
  wire  _GEN_148 = _T_1139 & (isRateLineFlag & io_ctrl_squeeze); // @[Conditional.scala 39:67 KeccakCore.scala 249:21 KeccakCore.scala 73:17]
  wire  _GEN_149 = _T_1139 ? _GEN_140 : _GEN_146; // @[Conditional.scala 39:67]
  wire [4:0] _GEN_151 = _T_1139 ? _GEN_142 : shiftCtr; // @[Conditional.scala 39:67 KeccakCore.scala 103:27]
  wire [2:0] _GEN_152 = _T_1139 ? _GEN_143 : _GEN_147; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_154 = _T_1064 ? keccakStateRegShares_0_0 : _GEN_0; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_155 = _T_1064 ? _T_1067 : _GEN_1; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_156 = _T_1064 ? _T_1070 : _GEN_2; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_157 = _T_1064 ? _T_1073 : _GEN_3; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_158 = _T_1064 ? _T_1076 : _GEN_4; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_159 = _T_1064 ? _T_1079 : _GEN_5; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_160 = _T_1064 ? _T_1082 : _GEN_6; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_161 = _T_1064 ? _T_1085 : _GEN_7; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_162 = _T_1064 ? _T_1088 : _GEN_8; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_163 = _T_1064 ? _T_1091 : _GEN_9; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_164 = _T_1064 ? _T_1094 : _GEN_10; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_165 = _T_1064 ? _T_1097 : _GEN_11; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_166 = _T_1064 ? _T_1100 : _GEN_12; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_167 = _T_1064 ? _T_1103 : _GEN_13; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_168 = _T_1064 ? _T_1106 : _GEN_14; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_169 = _T_1064 ? _T_1109 : _GEN_15; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_170 = _T_1064 ? _T_1112 : _GEN_16; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_171 = _T_1064 ? _T_1115 : _GEN_17; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_172 = _T_1064 ? _T_1118 : _GEN_18; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_173 = _T_1064 ? _T_1121 : _GEN_19; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_174 = _T_1064 ? _T_1124 : _GEN_20; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_175 = _T_1064 ? _T_1127 : _GEN_21; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_176 = _T_1064 ? _T_1130 : _GEN_22; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_177 = _T_1064 ? _T_1133 : _GEN_23; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_178 = _T_1064 ? _T_1136 : _GEN_24; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [4:0] _GEN_179 = _T_1064 ? _roundCtr_T_1 : roundCtr; // @[Conditional.scala 39:67 KeccakCore.scala 242:16 KeccakCore.scala 102:27]
  wire [2:0] _GEN_180 = _T_1064 ? 3'h3 : _GEN_152; // @[Conditional.scala 39:67 KeccakCore.scala 246:13]
  wire  _GEN_181 = _T_1064 ? 1'h0 : _GEN_148; // @[Conditional.scala 39:67 KeccakCore.scala 73:17]
  wire  _GEN_182 = _T_1064 ? isRateLineFlag : _GEN_149; // @[Conditional.scala 39:67 KeccakCore.scala 105:33]
  wire [4:0] _GEN_184 = _T_1064 ? shiftCtr : _GEN_151; // @[Conditional.scala 39:67 KeccakCore.scala 103:27]
  wire [2:0] _GEN_212 = _T_475 ? _GEN_133 : _GEN_180; // @[Conditional.scala 39:67]
  wire  _GEN_216 = _T_475 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67 KeccakCore.scala 73:17]
  wire  _GEN_217 = _T_475 ? isRateLineFlag : _GEN_182; // @[Conditional.scala 39:67 KeccakCore.scala 105:33]
  wire  _GEN_222 = _T_472 ? 1'h0 : absorbInitFlag; // @[Conditional.scala 39:67 KeccakCore.scala 203:22 KeccakCore.scala 106:33]
  wire  _GEN_252 = _T_472 ? 1'h0 : _GEN_216; // @[Conditional.scala 39:67 KeccakCore.scala 73:17]
  wire  _GEN_253 = _T_472 ? isRateLineFlag : _GEN_217; // @[Conditional.scala 39:67 KeccakCore.scala 105:33]
  wire  _GEN_256 = _T_463 ? _GEN_35 : _GEN_253; // @[Conditional.scala 39:67]
  wire  _GEN_257 = _T_463 & (isRateLineFlag & _gateBitMask_T_1); // @[Conditional.scala 39:67 KeccakCore.scala 185:20 KeccakCore.scala 74:16]
  wire  _GEN_265 = _T_463 ? absorbInitFlag : _GEN_222; // @[Conditional.scala 39:67 KeccakCore.scala 106:33]
  wire  _GEN_292 = _T_463 ? 1'h0 : _GEN_252; // @[Conditional.scala 39:67 KeccakCore.scala 73:17]
  assign io_din_ready = _T_460 ? 1'h0 : _GEN_257; // @[Conditional.scala 40:58 KeccakCore.scala 74:16]
  assign io_dout_valid = _T_460 ? 1'h0 : _GEN_292; // @[Conditional.scala 40:58 KeccakCore.scala 73:17]
  assign io_dout_bits_0 = keccakStateRegShares_0_0; // @[KeccakCore.scala 79:71]
  always @(posedge clock) begin
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_0 <= _GEN_0;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_0 <= _GEN_0;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_0 <= _GEN_0;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_0 <= _keccakStateRegShares_0_0_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_0 <= _GEN_154;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_1 <= _GEN_1;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_1 <= _GEN_1;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_1 <= _GEN_1;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_1 <= _keccakStateRegShares_0_1_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_1 <= _GEN_155;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_2 <= _GEN_2;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_2 <= _GEN_2;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_2 <= _GEN_2;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_2 <= _keccakStateRegShares_0_2_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_2 <= _GEN_156;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_3 <= _GEN_3;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_3 <= _GEN_3;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_3 <= _GEN_3;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_3 <= _keccakStateRegShares_0_3_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_3 <= _GEN_157;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_4 <= _GEN_4;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_4 <= _GEN_4;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_4 <= _GEN_4;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_4 <= _keccakStateRegShares_0_4_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_4 <= _GEN_158;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_5 <= _GEN_5;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_5 <= _GEN_5;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_5 <= _GEN_5;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_5 <= _keccakStateRegShares_0_5_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_5 <= _GEN_159;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_6 <= _GEN_6;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_6 <= _GEN_6;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_6 <= _GEN_6;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_6 <= _keccakStateRegShares_0_6_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_6 <= _GEN_160;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_7 <= _GEN_7;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_7 <= _GEN_7;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_7 <= _GEN_7;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_7 <= _keccakStateRegShares_0_7_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_7 <= _GEN_161;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_8 <= _GEN_8;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_8 <= _GEN_8;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_8 <= _GEN_8;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_8 <= _keccakStateRegShares_0_8_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_8 <= _GEN_162;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_9 <= _GEN_9;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_9 <= _GEN_9;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_9 <= _GEN_9;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_9 <= _keccakStateRegShares_0_9_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_9 <= _GEN_163;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_10 <= _GEN_10;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_10 <= _GEN_10;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_10 <= _GEN_10;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_10 <= _keccakStateRegShares_0_10_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_10 <= _GEN_164;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_11 <= _GEN_11;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_11 <= _GEN_11;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_11 <= _GEN_11;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_11 <= _keccakStateRegShares_0_11_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_11 <= _GEN_165;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_12 <= _GEN_12;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_12 <= _GEN_12;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_12 <= _GEN_12;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_12 <= _keccakStateRegShares_0_12_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_12 <= _GEN_166;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_13 <= _GEN_13;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_13 <= _GEN_13;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_13 <= _GEN_13;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_13 <= _keccakStateRegShares_0_13_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_13 <= _GEN_167;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_14 <= _GEN_14;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_14 <= _GEN_14;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_14 <= _GEN_14;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_14 <= _keccakStateRegShares_0_14_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_14 <= _GEN_168;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_15 <= _GEN_15;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_15 <= _GEN_15;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_15 <= _GEN_15;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_15 <= _keccakStateRegShares_0_15_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_15 <= _GEN_169;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_16 <= _GEN_16;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_16 <= _GEN_16;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_16 <= _GEN_16;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_16 <= _keccakStateRegShares_0_16_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_16 <= _GEN_170;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_17 <= _GEN_17;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_17 <= _GEN_17;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_17 <= _GEN_17;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_17 <= _keccakStateRegShares_0_17_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_17 <= _GEN_171;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_18 <= _GEN_18;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_18 <= _GEN_18;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_18 <= _GEN_18;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_18 <= _keccakStateRegShares_0_18_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_18 <= _GEN_172;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_19 <= _GEN_19;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_19 <= _GEN_19;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_19 <= _GEN_19;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_19 <= _keccakStateRegShares_0_19_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_19 <= _GEN_173;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_20 <= _GEN_20;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_20 <= _GEN_20;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_20 <= _GEN_20;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_20 <= _keccakStateRegShares_0_20_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_20 <= _GEN_174;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_21 <= _GEN_21;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_21 <= _GEN_21;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_21 <= _GEN_21;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_21 <= _keccakStateRegShares_0_21_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_21 <= _GEN_175;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_22 <= _GEN_22;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_22 <= _GEN_22;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_22 <= _GEN_22;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_22 <= _keccakStateRegShares_0_22_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_22 <= _GEN_176;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_23 <= _GEN_23;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_23 <= _GEN_23;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_23 <= _GEN_23;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_23 <= _keccakStateRegShares_0_23_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_23 <= _GEN_177;
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_24 <= _GEN_24;
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_24 <= _GEN_24;
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_24 <= _GEN_24;
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_24 <= _keccakStateRegShares_0_24_T_7; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_24 <= _GEN_178;
    end
    if (reset) begin // @[KeccakCore.scala 101:34]
      state <= 3'h0; // @[KeccakCore.scala 101:34]
    end else if (_T_460) begin // @[Conditional.scala 40:58]
      if (io_ctrl_absorb) begin // @[KeccakCore.scala 176:28]
        state <= 3'h1; // @[KeccakCore.scala 177:15]
      end
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      if (~io_din_ready | io_din_valid) begin // @[KeccakCore.scala 189:43]
        state <= _GEN_31;
      end
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      state <= 3'h4; // @[KeccakCore.scala 206:13]
    end else begin
      state <= _GEN_212;
    end
    if (!(_T_460)) begin // @[Conditional.scala 40:58]
      if (_T_463) begin // @[Conditional.scala 39:67]
        if (~io_din_ready | io_din_valid) begin // @[KeccakCore.scala 189:43]
          if (lastLaneRotate) begin // @[KeccakCore.scala 192:30]
            roundCtr <= 5'h0; // @[KeccakCore.scala 193:20]
          end
        end
      end else if (!(_T_472)) begin // @[Conditional.scala 39:67]
        if (_T_475) begin // @[Conditional.scala 39:67]
          roundCtr <= _GEN_134;
        end else begin
          roundCtr <= _GEN_179;
        end
      end
    end
    if (_T_460) begin // @[Conditional.scala 40:58]
      shiftCtr <= 5'h0; // @[KeccakCore.scala 172:16]
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      if (~io_din_ready | io_din_valid) begin // @[KeccakCore.scala 189:43]
        shiftCtr <= _shiftCtr_T_1; // @[KeccakCore.scala 191:18]
      end
    end else if (_T_472) begin // @[Conditional.scala 39:67]
      shiftCtr <= 5'h0; // @[KeccakCore.scala 204:16]
    end else if (_T_475) begin // @[Conditional.scala 39:67]
      shiftCtr <= _GEN_135;
    end else begin
      shiftCtr <= _GEN_184;
    end
    isRateLineFlag <= _T_460 | _GEN_256; // @[Conditional.scala 40:58 KeccakCore.scala 173:22]
    absorbInitFlag <= _T_460 | _GEN_265; // @[Conditional.scala 40:58 KeccakCore.scala 174:22]
    if (_T_460) begin // @[Conditional.scala 40:58]
      absorbFinalizeFlag <= 1'h0; // @[KeccakCore.scala 175:26]
    end else if (_T_463) begin // @[Conditional.scala 39:67]
      if (~io_din_ready | io_din_valid) begin // @[KeccakCore.scala 189:43]
        if (lastLaneRotate) begin // @[KeccakCore.scala 192:30]
          absorbFinalizeFlag <= 1'h0; // @[KeccakCore.scala 195:30]
        end else begin
          absorbFinalizeFlag <= _GEN_27;
        end
      end else begin
        absorbFinalizeFlag <= _GEN_27;
      end
    end
    if (!(_T_460)) begin // @[Conditional.scala 40:58]
      if (!(_T_463)) begin // @[Conditional.scala 39:67]
        if (_T_472) begin // @[Conditional.scala 39:67]
          lastSliceProcFlag <= 1'h0; // @[KeccakCore.scala 205:25]
        end else if (_T_475) begin // @[Conditional.scala 39:67]
          lastSliceProcFlag <= _GEN_136;
        end
      end
    end
    reg_ <= xCols__0 ^ _t_T_1; // @[KeccakCore.scala 361:21]
    reg_1 <= xCols__1 ^ _t_T_3; // @[KeccakCore.scala 361:21]
    reg_2 <= xCols__2 ^ _t_T_5; // @[KeccakCore.scala 361:21]
    reg_3 <= xCols__3 ^ _t_T_7; // @[KeccakCore.scala 361:21]
    reg_4 <= xCols__4 ^ _t_T_9; // @[KeccakCore.scala 361:21]
    reg_5 <= xCols_1_0 ^ _t_T_11; // @[KeccakCore.scala 361:21]
    reg_6 <= xCols_1_1 ^ _t_T_13; // @[KeccakCore.scala 361:21]
    reg_7 <= xCols_1_2 ^ _t_T_15; // @[KeccakCore.scala 361:21]
    reg_8 <= xCols_1_3 ^ _t_T_17; // @[KeccakCore.scala 361:21]
    reg_9 <= xCols_1_4 ^ _t_T_19; // @[KeccakCore.scala 361:21]
    reg_10 <= xCols_2_0 ^ _t_T_21; // @[KeccakCore.scala 361:21]
    reg_11 <= xCols_2_1 ^ _t_T_23; // @[KeccakCore.scala 361:21]
    reg_12 <= xCols_2_2 ^ _t_T_25; // @[KeccakCore.scala 361:21]
    reg_13 <= xCols_2_3 ^ _t_T_27; // @[KeccakCore.scala 361:21]
    reg_14 <= xCols_2_4 ^ _t_T_29; // @[KeccakCore.scala 361:21]
    reg_15 <= xCols_3_0 ^ _t_T_31; // @[KeccakCore.scala 361:21]
    reg_16 <= xCols_3_1 ^ _t_T_33; // @[KeccakCore.scala 361:21]
    reg_17 <= xCols_3_2 ^ _t_T_35; // @[KeccakCore.scala 361:21]
    reg_18 <= xCols_3_3 ^ _t_T_37; // @[KeccakCore.scala 361:21]
    reg_19 <= xCols_3_4 ^ _t_T_39; // @[KeccakCore.scala 361:21]
    reg_20 <= xCols_4_0 ^ _t_T_41; // @[KeccakCore.scala 361:21]
    reg_21 <= xCols_4_1 ^ _t_T_43; // @[KeccakCore.scala 361:21]
    reg_22 <= xCols_4_2 ^ _t_T_45; // @[KeccakCore.scala 361:21]
    reg_23 <= xCols_4_3 ^ _t_T_47; // @[KeccakCore.scala 361:21]
    reg_24 <= xCols_4_4 ^ _t_T_49; // @[KeccakCore.scala 361:21]
    reg_25 <= xCols_5_0 ^ _t_T_51; // @[KeccakCore.scala 361:21]
    reg_26 <= xCols_5_1 ^ _t_T_53; // @[KeccakCore.scala 361:21]
    reg_27 <= xCols_5_2 ^ _t_T_55; // @[KeccakCore.scala 361:21]
    reg_28 <= xCols_5_3 ^ _t_T_57; // @[KeccakCore.scala 361:21]
    reg_29 <= xCols_5_4 ^ _t_T_59; // @[KeccakCore.scala 361:21]
    reg_30 <= xCols_6_0 ^ _t_T_61; // @[KeccakCore.scala 361:21]
    reg_31 <= xCols_6_1 ^ _t_T_63; // @[KeccakCore.scala 361:21]
    reg_32 <= xCols_6_2 ^ _t_T_65; // @[KeccakCore.scala 361:21]
    reg_33 <= xCols_6_3 ^ _t_T_67; // @[KeccakCore.scala 361:21]
    reg_34 <= xCols_6_4 ^ _t_T_69; // @[KeccakCore.scala 361:21]
    reg_35 <= xCols_7_0 ^ _t_T_71; // @[KeccakCore.scala 361:21]
    reg_36 <= xCols_7_1 ^ _t_T_73; // @[KeccakCore.scala 361:21]
    reg_37 <= xCols_7_2 ^ _t_T_75; // @[KeccakCore.scala 361:21]
    reg_38 <= xCols_7_3 ^ _t_T_77; // @[KeccakCore.scala 361:21]
    reg_39 <= xCols_7_4 ^ _t_T_79; // @[KeccakCore.scala 361:21]
    if (updatePrevParity) begin // @[KeccakCore.scala 146:30]
      prevSliceParity <= lastParity; // @[KeccakCore.scala 147:25]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  keccakStateRegShares_0_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  keccakStateRegShares_0_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  keccakStateRegShares_0_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  keccakStateRegShares_0_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  keccakStateRegShares_0_4 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  keccakStateRegShares_0_5 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  keccakStateRegShares_0_6 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  keccakStateRegShares_0_7 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  keccakStateRegShares_0_8 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  keccakStateRegShares_0_9 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  keccakStateRegShares_0_10 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  keccakStateRegShares_0_11 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  keccakStateRegShares_0_12 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  keccakStateRegShares_0_13 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  keccakStateRegShares_0_14 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  keccakStateRegShares_0_15 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  keccakStateRegShares_0_16 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  keccakStateRegShares_0_17 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  keccakStateRegShares_0_18 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  keccakStateRegShares_0_19 = _RAND_19[63:0];
  _RAND_20 = {2{`RANDOM}};
  keccakStateRegShares_0_20 = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  keccakStateRegShares_0_21 = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  keccakStateRegShares_0_22 = _RAND_22[63:0];
  _RAND_23 = {2{`RANDOM}};
  keccakStateRegShares_0_23 = _RAND_23[63:0];
  _RAND_24 = {2{`RANDOM}};
  keccakStateRegShares_0_24 = _RAND_24[63:0];
  _RAND_25 = {1{`RANDOM}};
  state = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  roundCtr = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  shiftCtr = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  isRateLineFlag = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  absorbInitFlag = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  absorbFinalizeFlag = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  lastSliceProcFlag = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  reg_ = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  reg_1 = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  reg_2 = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  reg_3 = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  reg_4 = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  reg_5 = _RAND_37[4:0];
  _RAND_38 = {1{`RANDOM}};
  reg_6 = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  reg_7 = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  reg_8 = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  reg_9 = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  reg_10 = _RAND_42[4:0];
  _RAND_43 = {1{`RANDOM}};
  reg_11 = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  reg_12 = _RAND_44[4:0];
  _RAND_45 = {1{`RANDOM}};
  reg_13 = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  reg_14 = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  reg_15 = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  reg_16 = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  reg_17 = _RAND_49[4:0];
  _RAND_50 = {1{`RANDOM}};
  reg_18 = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  reg_19 = _RAND_51[4:0];
  _RAND_52 = {1{`RANDOM}};
  reg_20 = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  reg_21 = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  reg_22 = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  reg_23 = _RAND_55[4:0];
  _RAND_56 = {1{`RANDOM}};
  reg_24 = _RAND_56[4:0];
  _RAND_57 = {1{`RANDOM}};
  reg_25 = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  reg_26 = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  reg_27 = _RAND_59[4:0];
  _RAND_60 = {1{`RANDOM}};
  reg_28 = _RAND_60[4:0];
  _RAND_61 = {1{`RANDOM}};
  reg_29 = _RAND_61[4:0];
  _RAND_62 = {1{`RANDOM}};
  reg_30 = _RAND_62[4:0];
  _RAND_63 = {1{`RANDOM}};
  reg_31 = _RAND_63[4:0];
  _RAND_64 = {1{`RANDOM}};
  reg_32 = _RAND_64[4:0];
  _RAND_65 = {1{`RANDOM}};
  reg_33 = _RAND_65[4:0];
  _RAND_66 = {1{`RANDOM}};
  reg_34 = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  reg_35 = _RAND_67[4:0];
  _RAND_68 = {1{`RANDOM}};
  reg_36 = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  reg_37 = _RAND_69[4:0];
  _RAND_70 = {1{`RANDOM}};
  reg_38 = _RAND_70[4:0];
  _RAND_71 = {1{`RANDOM}};
  reg_39 = _RAND_71[4:0];
  _RAND_72 = {1{`RANDOM}};
  prevSliceParity = _RAND_72[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Sha3Core(
  input         clock,
  input         reset,
  output        io_din_ready,
  input         io_din_valid,
  input  [63:0] io_din_bits_data_0,
  input         io_din_bits_tlast,
  output        io_cmd_ready,
  input         io_cmd_valid,
  input  [1:0]  io_cmd_bits_mode,
  input  [11:0] io_cmd_bits_numSqueezeWords,
  input         io_dout_ready,
  output        io_dout_valid,
  output [63:0] io_dout_bits_0,
  output        io_dout_tlast,
  output [11:0] io_dout_index
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  keccakCore_clock; // @[Sha3Core.scala 44:26]
  wire  keccakCore_reset; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_din_ready; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_din_valid; // @[Sha3Core.scala 44:26]
  wire [63:0] keccakCore_io_din_bits_0; // @[Sha3Core.scala 44:26]
  wire [4:0] keccakCore_io_ctrl_rateLanesMinusOne; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_ctrl_absorb; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_ctrl_absorbFin; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_ctrl_squeeze; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_dout_ready; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_dout_valid; // @[Sha3Core.scala 44:26]
  wire [63:0] keccakCore_io_dout_bits_0; // @[Sha3Core.scala 44:26]
  reg [1:0] command_mode; // @[Sha3Core.scala 46:20]
  reg [11:0] command_numSqueezeWords; // @[Sha3Core.scala 46:20]
  reg [1:0] state; // @[Sha3Core.scala 52:22]
  reg [11:0] squeezeCtr; // @[Sha3Core.scala 54:23]
  wire [11:0] squeezeCtrNext = squeezeCtr + 12'h1; // @[Sha3Core.scala 56:35]
  wire  lastSqueeze = squeezeCtrNext == command_numSqueezeWords; // @[Sha3Core.scala 57:36]
  wire [4:0] _keccakCore_io_ctrl_rateLanesMinusOne_rateLanesMinusOne_T_4 = 2'h1 == command_mode ? 5'h8 : 5'h10; // @[Mux.scala 80:57]
  wire [2:0] lastValidBytes = io_din_bits_data_0[58:56]; // @[Sha3Core.scala 85:45]
  wire  delim_isXOF = command_mode == 2'h2 | command_mode == 2'h3; // @[Sha3Mode.scala 23:40]
  wire [4:0] delim = delim_isXOF ? 5'h1f : 5'h6; // @[Sha3Mode.scala 21:31]
  wire [7:0] _padByte_T = {{3'd0}, delim}; // @[Sha3Core.scala 62:28]
  wire [5:0] _padByte_T_1 = {lastValidBytes,3'h0}; // @[Sha3Core.scala 62:51]
  wire [70:0] _GEN_23 = {{63'd0}, _padByte_T}; // @[Sha3Core.scala 62:32]
  wire [70:0] padByte = _GEN_23 << _padByte_T_1; // @[Sha3Core.scala 62:32]
  wire [63:0] _mask_T_1 = 3'h1 == lastValidBytes ? 64'hff : 64'hffffffffffffffff; // @[Mux.scala 80:57]
  wire [63:0] _mask_T_3 = 3'h2 == lastValidBytes ? 64'hffff : _mask_T_1; // @[Mux.scala 80:57]
  wire [63:0] _mask_T_5 = 3'h3 == lastValidBytes ? 64'hffffff : _mask_T_3; // @[Mux.scala 80:57]
  wire [63:0] _mask_T_7 = 3'h4 == lastValidBytes ? 64'hffffffff : _mask_T_5; // @[Mux.scala 80:57]
  wire [63:0] _mask_T_9 = 3'h5 == lastValidBytes ? 64'hffffffffff : _mask_T_7; // @[Mux.scala 80:57]
  wire [63:0] _mask_T_11 = 3'h6 == lastValidBytes ? 64'hffffffffffff : _mask_T_9; // @[Mux.scala 80:57]
  wire [63:0] mask = 3'h7 == lastValidBytes ? 64'hffffffffffffff : _mask_T_11; // @[Mux.scala 80:57]
  wire [63:0] _T = mask & io_din_bits_data_0; // @[Sha3Core.scala 71:50]
  wire [70:0] _GEN_24 = {{7'd0}, _T}; // @[Sha3Core.scala 71:42]
  wire [70:0] _T_1 = padByte | _GEN_24; // @[Sha3Core.scala 71:42]
  wire [70:0] _T_2 = io_din_bits_tlast ? _T_1 : {{7'd0}, io_din_bits_data_0}; // @[Sha3Core.scala 71:14]
  wire  _T_5 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  isXOF = io_cmd_bits_mode == 2'h2 | io_cmd_bits_mode == 2'h3; // @[Sha3Mode.scala 23:40]
  wire [3:0] command_numSqueezeWords_hashOutWords = io_cmd_bits_mode == 2'h1 ? 4'h8 : 4'h4; // @[Sha3Mode.scala 24:32]
  wire  _T_9 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_10 = io_din_ready & io_din_valid; // @[Decoupled.scala 40:37]
  wire  _T_14 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_15 = io_dout_ready & io_dout_valid; // @[Decoupled.scala 40:37]
  wire [1:0] _GEN_6 = lastSqueeze ? 2'h0 : state; // @[Sha3Core.scala 123:27 Sha3Core.scala 124:17 Sha3Core.scala 52:22]
  wire [1:0] _GEN_8 = _T_15 ? _GEN_6 : state; // @[Sha3Core.scala 121:28 Sha3Core.scala 52:22]
  wire  _GEN_14 = _T_9 ? 1'h0 : _T_14; // @[Conditional.scala 39:67 Sha3Core.scala 78:30]
  KeccakCore keccakCore ( // @[Sha3Core.scala 44:26]
    .clock(keccakCore_clock),
    .reset(keccakCore_reset),
    .io_din_ready(keccakCore_io_din_ready),
    .io_din_valid(keccakCore_io_din_valid),
    .io_din_bits_0(keccakCore_io_din_bits_0),
    .io_ctrl_rateLanesMinusOne(keccakCore_io_ctrl_rateLanesMinusOne),
    .io_ctrl_absorb(keccakCore_io_ctrl_absorb),
    .io_ctrl_absorbFin(keccakCore_io_ctrl_absorbFin),
    .io_ctrl_squeeze(keccakCore_io_ctrl_squeeze),
    .io_dout_ready(keccakCore_io_dout_ready),
    .io_dout_valid(keccakCore_io_dout_valid),
    .io_dout_bits_0(keccakCore_io_dout_bits_0)
  );
  assign io_din_ready = keccakCore_io_din_ready; // @[Sha3Core.scala 90:16]
  assign io_cmd_ready = 2'h0 == state; // @[Conditional.scala 37:30]
  assign io_dout_valid = keccakCore_io_dout_valid; // @[Sha3Core.scala 92:17]
  assign io_dout_bits_0 = keccakCore_io_dout_bits_0; // @[Sha3Core.scala 93:16]
  assign io_dout_tlast = squeezeCtrNext == command_numSqueezeWords; // @[Sha3Core.scala 57:36]
  assign io_dout_index = squeezeCtr; // @[Sha3Core.scala 91:17]
  assign keccakCore_clock = clock;
  assign keccakCore_reset = reset;
  assign keccakCore_io_din_valid = io_din_valid; // @[Sha3Core.scala 89:27]
  assign keccakCore_io_din_bits_0 = _T_2[63:0]; // @[Sha3Core.scala 86:26]
  assign keccakCore_io_ctrl_rateLanesMinusOne = 2'h2 == command_mode ? 5'h14 :
    _keccakCore_io_ctrl_rateLanesMinusOne_rateLanesMinusOne_T_4; // @[Mux.scala 80:57]
  assign keccakCore_io_ctrl_absorb = _T_5 ? 1'h0 : _T_9; // @[Conditional.scala 40:58 Sha3Core.scala 79:29]
  assign keccakCore_io_ctrl_absorbFin = io_din_bits_tlast; // @[Sha3Core.scala 80:32]
  assign keccakCore_io_ctrl_squeeze = _T_5 ? 1'h0 : _GEN_14; // @[Conditional.scala 40:58 Sha3Core.scala 78:30]
  assign keccakCore_io_dout_ready = io_dout_ready; // @[Sha3Core.scala 95:28]
  always @(posedge clock) begin
    if (_T_5) begin // @[Conditional.scala 40:58]
      if (io_cmd_valid) begin // @[Sha3Core.scala 103:26]
        command_mode <= io_cmd_bits_mode; // @[Sha3Core.scala 104:17]
      end
    end
    if (_T_5) begin // @[Conditional.scala 40:58]
      if (io_cmd_valid) begin // @[Sha3Core.scala 103:26]
        if (~isXOF) begin // @[Sha3Core.scala 105:39]
          command_numSqueezeWords <= {{8'd0}, command_numSqueezeWords_hashOutWords}; // @[Sha3Core.scala 106:35]
        end else begin
          command_numSqueezeWords <= io_cmd_bits_numSqueezeWords; // @[Sha3Core.scala 104:17]
        end
      end
    end
    if (reset) begin // @[Sha3Core.scala 52:22]
      state <= 2'h0; // @[Sha3Core.scala 52:22]
    end else if (_T_5) begin // @[Conditional.scala 40:58]
      if (io_cmd_valid) begin // @[Sha3Core.scala 103:26]
        state <= 2'h1; // @[Sha3Core.scala 109:15]
      end
    end else if (_T_9) begin // @[Conditional.scala 39:67]
      if (_T_10 & io_din_bits_tlast) begin // @[Sha3Core.scala 115:48]
        state <= 2'h2; // @[Sha3Core.scala 116:15]
      end
    end else if (_T_14) begin // @[Conditional.scala 39:67]
      state <= _GEN_8;
    end
    if (_T_5) begin // @[Conditional.scala 40:58]
      if (io_cmd_valid) begin // @[Sha3Core.scala 103:26]
        squeezeCtr <= 12'h0; // @[Sha3Core.scala 108:20]
      end
    end else if (!(_T_9)) begin // @[Conditional.scala 39:67]
      if (_T_14) begin // @[Conditional.scala 39:67]
        if (_T_15) begin // @[Sha3Core.scala 121:28]
          squeezeCtr <= squeezeCtrNext; // @[Sha3Core.scala 122:20]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  command_mode = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  command_numSqueezeWords = _RAND_1[11:0];
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  squeezeCtr = _RAND_3[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
