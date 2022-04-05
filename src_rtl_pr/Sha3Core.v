module KeccakCore(
  input         clock,
  input         reset,
  output        io_din_ready,
  input         io_din_valid,
  input  [63:0] io_din_bits_0,
  input  [63:0] io_din_bits_1,
  input  [4:0]  io_ctrl_rateLanesMinusOne,
  input         io_ctrl_absorb,
  input         io_ctrl_absorbFin,
  input         io_ctrl_squeeze,
  input         io_dout_ready,
  output        io_dout_valid,
  output [63:0] io_dout_bits_0,
  output [63:0] io_dout_bits_1
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
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
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
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
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
  reg [63:0] keccakStateRegShares_1_0; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_1; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_2; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_3; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_4; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_5; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_6; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_7; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_8; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_9; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_10; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_11; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_12; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_13; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_14; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_15; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_16; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_17; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_18; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_19; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_20; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_21; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_22; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_23; // @[KeccakCore.scala 77:49]
  reg [63:0] keccakStateRegShares_1_24; // @[KeccakCore.scala 77:49]
  reg [2:0] state; // @[KeccakCore.scala 101:34]
  wire  _T_918 = 3'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_921 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_930 = 3'h3 == state; // @[Conditional.scala 37:30]
  wire  _GEN_364 = _T_921 ? 1'h0 : _T_930; // @[Conditional.scala 39:67]
  wire  selectLastSlice = _T_918 ? 1'h0 : _GEN_364; // @[Conditional.scala 40:58]
  wire  xColsShares_uiCols_cols_0__0 = selectLastSlice ? keccakStateRegShares_0_0[56] : keccakStateRegShares_0_0[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0__2 = selectLastSlice ? keccakStateRegShares_0_1[56] : keccakStateRegShares_0_1[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0__4 = selectLastSlice ? keccakStateRegShares_0_2[56] : keccakStateRegShares_0_2[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0__1 = selectLastSlice ? keccakStateRegShares_0_3[56] : keccakStateRegShares_0_3[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0__3 = selectLastSlice ? keccakStateRegShares_0_4[56] : keccakStateRegShares_0_4[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1__3 = selectLastSlice ? keccakStateRegShares_0_5[56] : keccakStateRegShares_0_5[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1__0 = selectLastSlice ? keccakStateRegShares_0_6[56] : keccakStateRegShares_0_6[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1__2 = selectLastSlice ? keccakStateRegShares_0_7[56] : keccakStateRegShares_0_7[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1__4 = selectLastSlice ? keccakStateRegShares_0_8[56] : keccakStateRegShares_0_8[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1__1 = selectLastSlice ? keccakStateRegShares_0_9[56] : keccakStateRegShares_0_9[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2__1 = selectLastSlice ? keccakStateRegShares_0_10[56] : keccakStateRegShares_0_10[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2__3 = selectLastSlice ? keccakStateRegShares_0_11[56] : keccakStateRegShares_0_11[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2__0 = selectLastSlice ? keccakStateRegShares_0_12[56] : keccakStateRegShares_0_12[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2__2 = selectLastSlice ? keccakStateRegShares_0_13[56] : keccakStateRegShares_0_13[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2__4 = selectLastSlice ? keccakStateRegShares_0_14[56] : keccakStateRegShares_0_14[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3__4 = selectLastSlice ? keccakStateRegShares_0_15[56] : keccakStateRegShares_0_15[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3__1 = selectLastSlice ? keccakStateRegShares_0_16[56] : keccakStateRegShares_0_16[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3__3 = selectLastSlice ? keccakStateRegShares_0_17[56] : keccakStateRegShares_0_17[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3__0 = selectLastSlice ? keccakStateRegShares_0_18[56] : keccakStateRegShares_0_18[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3__2 = selectLastSlice ? keccakStateRegShares_0_19[56] : keccakStateRegShares_0_19[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4__2 = selectLastSlice ? keccakStateRegShares_0_20[56] : keccakStateRegShares_0_20[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4__4 = selectLastSlice ? keccakStateRegShares_0_21[56] : keccakStateRegShares_0_21[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4__1 = selectLastSlice ? keccakStateRegShares_0_22[56] : keccakStateRegShares_0_22[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4__3 = selectLastSlice ? keccakStateRegShares_0_23[56] : keccakStateRegShares_0_23[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4__0 = selectLastSlice ? keccakStateRegShares_0_24[56] : keccakStateRegShares_0_24[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_2_0 = selectLastSlice ? keccakStateRegShares_0_0[57] : keccakStateRegShares_0_0[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_2_2 = selectLastSlice ? keccakStateRegShares_0_1[57] : keccakStateRegShares_0_1[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_2_4 = selectLastSlice ? keccakStateRegShares_0_2[57] : keccakStateRegShares_0_2[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_2_1 = selectLastSlice ? keccakStateRegShares_0_3[57] : keccakStateRegShares_0_3[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_2_3 = selectLastSlice ? keccakStateRegShares_0_4[57] : keccakStateRegShares_0_4[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_2_3 = selectLastSlice ? keccakStateRegShares_0_5[57] : keccakStateRegShares_0_5[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_2_0 = selectLastSlice ? keccakStateRegShares_0_6[57] : keccakStateRegShares_0_6[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_2_2 = selectLastSlice ? keccakStateRegShares_0_7[57] : keccakStateRegShares_0_7[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_2_4 = selectLastSlice ? keccakStateRegShares_0_8[57] : keccakStateRegShares_0_8[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_2_1 = selectLastSlice ? keccakStateRegShares_0_9[57] : keccakStateRegShares_0_9[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_2_1 = selectLastSlice ? keccakStateRegShares_0_10[57] : keccakStateRegShares_0_10[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_2_3 = selectLastSlice ? keccakStateRegShares_0_11[57] : keccakStateRegShares_0_11[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_2_0 = selectLastSlice ? keccakStateRegShares_0_12[57] : keccakStateRegShares_0_12[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_2_2 = selectLastSlice ? keccakStateRegShares_0_13[57] : keccakStateRegShares_0_13[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_2_4 = selectLastSlice ? keccakStateRegShares_0_14[57] : keccakStateRegShares_0_14[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_2_4 = selectLastSlice ? keccakStateRegShares_0_15[57] : keccakStateRegShares_0_15[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_2_1 = selectLastSlice ? keccakStateRegShares_0_16[57] : keccakStateRegShares_0_16[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_2_3 = selectLastSlice ? keccakStateRegShares_0_17[57] : keccakStateRegShares_0_17[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_2_0 = selectLastSlice ? keccakStateRegShares_0_18[57] : keccakStateRegShares_0_18[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_2_2 = selectLastSlice ? keccakStateRegShares_0_19[57] : keccakStateRegShares_0_19[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_2_2 = selectLastSlice ? keccakStateRegShares_0_20[57] : keccakStateRegShares_0_20[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_2_4 = selectLastSlice ? keccakStateRegShares_0_21[57] : keccakStateRegShares_0_21[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_2_1 = selectLastSlice ? keccakStateRegShares_0_22[57] : keccakStateRegShares_0_22[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_2_3 = selectLastSlice ? keccakStateRegShares_0_23[57] : keccakStateRegShares_0_23[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_2_0 = selectLastSlice ? keccakStateRegShares_0_24[57] : keccakStateRegShares_0_24[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_4_0 = selectLastSlice ? keccakStateRegShares_0_0[58] : keccakStateRegShares_0_0[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_4_2 = selectLastSlice ? keccakStateRegShares_0_1[58] : keccakStateRegShares_0_1[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_4_4 = selectLastSlice ? keccakStateRegShares_0_2[58] : keccakStateRegShares_0_2[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_4_1 = selectLastSlice ? keccakStateRegShares_0_3[58] : keccakStateRegShares_0_3[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_4_3 = selectLastSlice ? keccakStateRegShares_0_4[58] : keccakStateRegShares_0_4[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_4_3 = selectLastSlice ? keccakStateRegShares_0_5[58] : keccakStateRegShares_0_5[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_4_0 = selectLastSlice ? keccakStateRegShares_0_6[58] : keccakStateRegShares_0_6[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_4_2 = selectLastSlice ? keccakStateRegShares_0_7[58] : keccakStateRegShares_0_7[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_4_4 = selectLastSlice ? keccakStateRegShares_0_8[58] : keccakStateRegShares_0_8[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_4_1 = selectLastSlice ? keccakStateRegShares_0_9[58] : keccakStateRegShares_0_9[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_4_1 = selectLastSlice ? keccakStateRegShares_0_10[58] : keccakStateRegShares_0_10[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_4_3 = selectLastSlice ? keccakStateRegShares_0_11[58] : keccakStateRegShares_0_11[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_4_0 = selectLastSlice ? keccakStateRegShares_0_12[58] : keccakStateRegShares_0_12[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_4_2 = selectLastSlice ? keccakStateRegShares_0_13[58] : keccakStateRegShares_0_13[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_4_4 = selectLastSlice ? keccakStateRegShares_0_14[58] : keccakStateRegShares_0_14[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_4_4 = selectLastSlice ? keccakStateRegShares_0_15[58] : keccakStateRegShares_0_15[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_4_1 = selectLastSlice ? keccakStateRegShares_0_16[58] : keccakStateRegShares_0_16[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_4_3 = selectLastSlice ? keccakStateRegShares_0_17[58] : keccakStateRegShares_0_17[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_4_0 = selectLastSlice ? keccakStateRegShares_0_18[58] : keccakStateRegShares_0_18[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_4_2 = selectLastSlice ? keccakStateRegShares_0_19[58] : keccakStateRegShares_0_19[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_4_2 = selectLastSlice ? keccakStateRegShares_0_20[58] : keccakStateRegShares_0_20[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_4_4 = selectLastSlice ? keccakStateRegShares_0_21[58] : keccakStateRegShares_0_21[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_4_1 = selectLastSlice ? keccakStateRegShares_0_22[58] : keccakStateRegShares_0_22[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_4_3 = selectLastSlice ? keccakStateRegShares_0_23[58] : keccakStateRegShares_0_23[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_4_0 = selectLastSlice ? keccakStateRegShares_0_24[58] : keccakStateRegShares_0_24[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_6_0 = selectLastSlice ? keccakStateRegShares_0_0[59] : keccakStateRegShares_0_0[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_6_2 = selectLastSlice ? keccakStateRegShares_0_1[59] : keccakStateRegShares_0_1[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_6_4 = selectLastSlice ? keccakStateRegShares_0_2[59] : keccakStateRegShares_0_2[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_6_1 = selectLastSlice ? keccakStateRegShares_0_3[59] : keccakStateRegShares_0_3[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_6_3 = selectLastSlice ? keccakStateRegShares_0_4[59] : keccakStateRegShares_0_4[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_6_3 = selectLastSlice ? keccakStateRegShares_0_5[59] : keccakStateRegShares_0_5[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_6_0 = selectLastSlice ? keccakStateRegShares_0_6[59] : keccakStateRegShares_0_6[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_6_2 = selectLastSlice ? keccakStateRegShares_0_7[59] : keccakStateRegShares_0_7[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_6_4 = selectLastSlice ? keccakStateRegShares_0_8[59] : keccakStateRegShares_0_8[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_6_1 = selectLastSlice ? keccakStateRegShares_0_9[59] : keccakStateRegShares_0_9[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_6_1 = selectLastSlice ? keccakStateRegShares_0_10[59] : keccakStateRegShares_0_10[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_6_3 = selectLastSlice ? keccakStateRegShares_0_11[59] : keccakStateRegShares_0_11[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_6_0 = selectLastSlice ? keccakStateRegShares_0_12[59] : keccakStateRegShares_0_12[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_6_2 = selectLastSlice ? keccakStateRegShares_0_13[59] : keccakStateRegShares_0_13[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_6_4 = selectLastSlice ? keccakStateRegShares_0_14[59] : keccakStateRegShares_0_14[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_6_4 = selectLastSlice ? keccakStateRegShares_0_15[59] : keccakStateRegShares_0_15[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_6_1 = selectLastSlice ? keccakStateRegShares_0_16[59] : keccakStateRegShares_0_16[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_6_3 = selectLastSlice ? keccakStateRegShares_0_17[59] : keccakStateRegShares_0_17[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_6_0 = selectLastSlice ? keccakStateRegShares_0_18[59] : keccakStateRegShares_0_18[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_6_2 = selectLastSlice ? keccakStateRegShares_0_19[59] : keccakStateRegShares_0_19[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_6_2 = selectLastSlice ? keccakStateRegShares_0_20[59] : keccakStateRegShares_0_20[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_6_4 = selectLastSlice ? keccakStateRegShares_0_21[59] : keccakStateRegShares_0_21[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_6_1 = selectLastSlice ? keccakStateRegShares_0_22[59] : keccakStateRegShares_0_22[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_6_3 = selectLastSlice ? keccakStateRegShares_0_23[59] : keccakStateRegShares_0_23[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_6_0 = selectLastSlice ? keccakStateRegShares_0_24[59] : keccakStateRegShares_0_24[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_8_0 = selectLastSlice ? keccakStateRegShares_0_0[60] : keccakStateRegShares_0_0[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_8_2 = selectLastSlice ? keccakStateRegShares_0_1[60] : keccakStateRegShares_0_1[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_8_4 = selectLastSlice ? keccakStateRegShares_0_2[60] : keccakStateRegShares_0_2[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_8_1 = selectLastSlice ? keccakStateRegShares_0_3[60] : keccakStateRegShares_0_3[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_8_3 = selectLastSlice ? keccakStateRegShares_0_4[60] : keccakStateRegShares_0_4[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_8_3 = selectLastSlice ? keccakStateRegShares_0_5[60] : keccakStateRegShares_0_5[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_8_0 = selectLastSlice ? keccakStateRegShares_0_6[60] : keccakStateRegShares_0_6[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_8_2 = selectLastSlice ? keccakStateRegShares_0_7[60] : keccakStateRegShares_0_7[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_8_4 = selectLastSlice ? keccakStateRegShares_0_8[60] : keccakStateRegShares_0_8[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_8_1 = selectLastSlice ? keccakStateRegShares_0_9[60] : keccakStateRegShares_0_9[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_8_1 = selectLastSlice ? keccakStateRegShares_0_10[60] : keccakStateRegShares_0_10[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_8_3 = selectLastSlice ? keccakStateRegShares_0_11[60] : keccakStateRegShares_0_11[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_8_0 = selectLastSlice ? keccakStateRegShares_0_12[60] : keccakStateRegShares_0_12[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_8_2 = selectLastSlice ? keccakStateRegShares_0_13[60] : keccakStateRegShares_0_13[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_8_4 = selectLastSlice ? keccakStateRegShares_0_14[60] : keccakStateRegShares_0_14[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_8_4 = selectLastSlice ? keccakStateRegShares_0_15[60] : keccakStateRegShares_0_15[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_8_1 = selectLastSlice ? keccakStateRegShares_0_16[60] : keccakStateRegShares_0_16[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_8_3 = selectLastSlice ? keccakStateRegShares_0_17[60] : keccakStateRegShares_0_17[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_8_0 = selectLastSlice ? keccakStateRegShares_0_18[60] : keccakStateRegShares_0_18[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_8_2 = selectLastSlice ? keccakStateRegShares_0_19[60] : keccakStateRegShares_0_19[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_8_2 = selectLastSlice ? keccakStateRegShares_0_20[60] : keccakStateRegShares_0_20[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_8_4 = selectLastSlice ? keccakStateRegShares_0_21[60] : keccakStateRegShares_0_21[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_8_1 = selectLastSlice ? keccakStateRegShares_0_22[60] : keccakStateRegShares_0_22[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_8_3 = selectLastSlice ? keccakStateRegShares_0_23[60] : keccakStateRegShares_0_23[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_8_0 = selectLastSlice ? keccakStateRegShares_0_24[60] : keccakStateRegShares_0_24[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_10_0 = selectLastSlice ? keccakStateRegShares_0_0[61] : keccakStateRegShares_0_0[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_10_2 = selectLastSlice ? keccakStateRegShares_0_1[61] : keccakStateRegShares_0_1[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_10_4 = selectLastSlice ? keccakStateRegShares_0_2[61] : keccakStateRegShares_0_2[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_10_1 = selectLastSlice ? keccakStateRegShares_0_3[61] : keccakStateRegShares_0_3[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_10_3 = selectLastSlice ? keccakStateRegShares_0_4[61] : keccakStateRegShares_0_4[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_10_3 = selectLastSlice ? keccakStateRegShares_0_5[61] : keccakStateRegShares_0_5[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_10_0 = selectLastSlice ? keccakStateRegShares_0_6[61] : keccakStateRegShares_0_6[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_10_2 = selectLastSlice ? keccakStateRegShares_0_7[61] : keccakStateRegShares_0_7[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_10_4 = selectLastSlice ? keccakStateRegShares_0_8[61] : keccakStateRegShares_0_8[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_10_1 = selectLastSlice ? keccakStateRegShares_0_9[61] : keccakStateRegShares_0_9[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_10_1 = selectLastSlice ? keccakStateRegShares_0_10[61] : keccakStateRegShares_0_10[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_10_3 = selectLastSlice ? keccakStateRegShares_0_11[61] : keccakStateRegShares_0_11[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_10_0 = selectLastSlice ? keccakStateRegShares_0_12[61] : keccakStateRegShares_0_12[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_10_2 = selectLastSlice ? keccakStateRegShares_0_13[61] : keccakStateRegShares_0_13[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_10_4 = selectLastSlice ? keccakStateRegShares_0_14[61] : keccakStateRegShares_0_14[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_10_4 = selectLastSlice ? keccakStateRegShares_0_15[61] : keccakStateRegShares_0_15[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_10_1 = selectLastSlice ? keccakStateRegShares_0_16[61] : keccakStateRegShares_0_16[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_10_3 = selectLastSlice ? keccakStateRegShares_0_17[61] : keccakStateRegShares_0_17[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_10_0 = selectLastSlice ? keccakStateRegShares_0_18[61] : keccakStateRegShares_0_18[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_10_2 = selectLastSlice ? keccakStateRegShares_0_19[61] : keccakStateRegShares_0_19[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_10_2 = selectLastSlice ? keccakStateRegShares_0_20[61] : keccakStateRegShares_0_20[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_10_4 = selectLastSlice ? keccakStateRegShares_0_21[61] : keccakStateRegShares_0_21[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_10_1 = selectLastSlice ? keccakStateRegShares_0_22[61] : keccakStateRegShares_0_22[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_10_3 = selectLastSlice ? keccakStateRegShares_0_23[61] : keccakStateRegShares_0_23[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_10_0 = selectLastSlice ? keccakStateRegShares_0_24[61] : keccakStateRegShares_0_24[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_12_0 = selectLastSlice ? keccakStateRegShares_0_0[62] : keccakStateRegShares_0_0[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_12_2 = selectLastSlice ? keccakStateRegShares_0_1[62] : keccakStateRegShares_0_1[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_12_4 = selectLastSlice ? keccakStateRegShares_0_2[62] : keccakStateRegShares_0_2[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_12_1 = selectLastSlice ? keccakStateRegShares_0_3[62] : keccakStateRegShares_0_3[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_12_3 = selectLastSlice ? keccakStateRegShares_0_4[62] : keccakStateRegShares_0_4[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_12_3 = selectLastSlice ? keccakStateRegShares_0_5[62] : keccakStateRegShares_0_5[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_12_0 = selectLastSlice ? keccakStateRegShares_0_6[62] : keccakStateRegShares_0_6[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_12_2 = selectLastSlice ? keccakStateRegShares_0_7[62] : keccakStateRegShares_0_7[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_12_4 = selectLastSlice ? keccakStateRegShares_0_8[62] : keccakStateRegShares_0_8[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_12_1 = selectLastSlice ? keccakStateRegShares_0_9[62] : keccakStateRegShares_0_9[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_12_1 = selectLastSlice ? keccakStateRegShares_0_10[62] : keccakStateRegShares_0_10[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_12_3 = selectLastSlice ? keccakStateRegShares_0_11[62] : keccakStateRegShares_0_11[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_12_0 = selectLastSlice ? keccakStateRegShares_0_12[62] : keccakStateRegShares_0_12[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_12_2 = selectLastSlice ? keccakStateRegShares_0_13[62] : keccakStateRegShares_0_13[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_12_4 = selectLastSlice ? keccakStateRegShares_0_14[62] : keccakStateRegShares_0_14[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_12_4 = selectLastSlice ? keccakStateRegShares_0_15[62] : keccakStateRegShares_0_15[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_12_1 = selectLastSlice ? keccakStateRegShares_0_16[62] : keccakStateRegShares_0_16[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_12_3 = selectLastSlice ? keccakStateRegShares_0_17[62] : keccakStateRegShares_0_17[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_12_0 = selectLastSlice ? keccakStateRegShares_0_18[62] : keccakStateRegShares_0_18[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_12_2 = selectLastSlice ? keccakStateRegShares_0_19[62] : keccakStateRegShares_0_19[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_12_2 = selectLastSlice ? keccakStateRegShares_0_20[62] : keccakStateRegShares_0_20[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_12_4 = selectLastSlice ? keccakStateRegShares_0_21[62] : keccakStateRegShares_0_21[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_12_1 = selectLastSlice ? keccakStateRegShares_0_22[62] : keccakStateRegShares_0_22[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_12_3 = selectLastSlice ? keccakStateRegShares_0_23[62] : keccakStateRegShares_0_23[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_12_0 = selectLastSlice ? keccakStateRegShares_0_24[62] : keccakStateRegShares_0_24[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_14_0 = selectLastSlice ? keccakStateRegShares_0_0[63] : keccakStateRegShares_0_0[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_14_2 = selectLastSlice ? keccakStateRegShares_0_1[63] : keccakStateRegShares_0_1[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_14_4 = selectLastSlice ? keccakStateRegShares_0_2[63] : keccakStateRegShares_0_2[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_14_1 = selectLastSlice ? keccakStateRegShares_0_3[63] : keccakStateRegShares_0_3[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_14_3 = selectLastSlice ? keccakStateRegShares_0_4[63] : keccakStateRegShares_0_4[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_14_3 = selectLastSlice ? keccakStateRegShares_0_5[63] : keccakStateRegShares_0_5[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_14_0 = selectLastSlice ? keccakStateRegShares_0_6[63] : keccakStateRegShares_0_6[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_14_2 = selectLastSlice ? keccakStateRegShares_0_7[63] : keccakStateRegShares_0_7[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_14_4 = selectLastSlice ? keccakStateRegShares_0_8[63] : keccakStateRegShares_0_8[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_14_1 = selectLastSlice ? keccakStateRegShares_0_9[63] : keccakStateRegShares_0_9[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_14_1 = selectLastSlice ? keccakStateRegShares_0_10[63] : keccakStateRegShares_0_10[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_14_3 = selectLastSlice ? keccakStateRegShares_0_11[63] : keccakStateRegShares_0_11[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_14_0 = selectLastSlice ? keccakStateRegShares_0_12[63] : keccakStateRegShares_0_12[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_14_2 = selectLastSlice ? keccakStateRegShares_0_13[63] : keccakStateRegShares_0_13[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_14_4 = selectLastSlice ? keccakStateRegShares_0_14[63] : keccakStateRegShares_0_14[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_14_4 = selectLastSlice ? keccakStateRegShares_0_15[63] : keccakStateRegShares_0_15[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_14_1 = selectLastSlice ? keccakStateRegShares_0_16[63] : keccakStateRegShares_0_16[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_14_3 = selectLastSlice ? keccakStateRegShares_0_17[63] : keccakStateRegShares_0_17[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_14_0 = selectLastSlice ? keccakStateRegShares_0_18[63] : keccakStateRegShares_0_18[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_14_2 = selectLastSlice ? keccakStateRegShares_0_19[63] : keccakStateRegShares_0_19[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_14_2 = selectLastSlice ? keccakStateRegShares_0_20[63] : keccakStateRegShares_0_20[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_14_4 = selectLastSlice ? keccakStateRegShares_0_21[63] : keccakStateRegShares_0_21[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_14_1 = selectLastSlice ? keccakStateRegShares_0_22[63] : keccakStateRegShares_0_22[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_14_3 = selectLastSlice ? keccakStateRegShares_0_23[63] : keccakStateRegShares_0_23[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_14_0 = selectLastSlice ? keccakStateRegShares_0_24[63] : keccakStateRegShares_0_24[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_1_0 = selectLastSlice ? keccakStateRegShares_1_0[56] : keccakStateRegShares_1_0[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_1_2 = selectLastSlice ? keccakStateRegShares_1_1[56] : keccakStateRegShares_1_1[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_1_4 = selectLastSlice ? keccakStateRegShares_1_2[56] : keccakStateRegShares_1_2[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_1_1 = selectLastSlice ? keccakStateRegShares_1_3[56] : keccakStateRegShares_1_3[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_1_3 = selectLastSlice ? keccakStateRegShares_1_4[56] : keccakStateRegShares_1_4[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_1_3 = selectLastSlice ? keccakStateRegShares_1_5[56] : keccakStateRegShares_1_5[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_1_0 = selectLastSlice ? keccakStateRegShares_1_6[56] : keccakStateRegShares_1_6[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_1_2 = selectLastSlice ? keccakStateRegShares_1_7[56] : keccakStateRegShares_1_7[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_1_4 = selectLastSlice ? keccakStateRegShares_1_8[56] : keccakStateRegShares_1_8[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_1_1 = selectLastSlice ? keccakStateRegShares_1_9[56] : keccakStateRegShares_1_9[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_1_1 = selectLastSlice ? keccakStateRegShares_1_10[56] : keccakStateRegShares_1_10[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_1_3 = selectLastSlice ? keccakStateRegShares_1_11[56] : keccakStateRegShares_1_11[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_1_0 = selectLastSlice ? keccakStateRegShares_1_12[56] : keccakStateRegShares_1_12[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_1_2 = selectLastSlice ? keccakStateRegShares_1_13[56] : keccakStateRegShares_1_13[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_1_4 = selectLastSlice ? keccakStateRegShares_1_14[56] : keccakStateRegShares_1_14[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_1_4 = selectLastSlice ? keccakStateRegShares_1_15[56] : keccakStateRegShares_1_15[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_1_1 = selectLastSlice ? keccakStateRegShares_1_16[56] : keccakStateRegShares_1_16[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_1_3 = selectLastSlice ? keccakStateRegShares_1_17[56] : keccakStateRegShares_1_17[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_1_0 = selectLastSlice ? keccakStateRegShares_1_18[56] : keccakStateRegShares_1_18[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_1_2 = selectLastSlice ? keccakStateRegShares_1_19[56] : keccakStateRegShares_1_19[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_1_2 = selectLastSlice ? keccakStateRegShares_1_20[56] : keccakStateRegShares_1_20[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_1_4 = selectLastSlice ? keccakStateRegShares_1_21[56] : keccakStateRegShares_1_21[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_1_1 = selectLastSlice ? keccakStateRegShares_1_22[56] : keccakStateRegShares_1_22[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_1_3 = selectLastSlice ? keccakStateRegShares_1_23[56] : keccakStateRegShares_1_23[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_1_0 = selectLastSlice ? keccakStateRegShares_1_24[56] : keccakStateRegShares_1_24[0]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_3_0 = selectLastSlice ? keccakStateRegShares_1_0[57] : keccakStateRegShares_1_0[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_3_2 = selectLastSlice ? keccakStateRegShares_1_1[57] : keccakStateRegShares_1_1[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_3_4 = selectLastSlice ? keccakStateRegShares_1_2[57] : keccakStateRegShares_1_2[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_3_1 = selectLastSlice ? keccakStateRegShares_1_3[57] : keccakStateRegShares_1_3[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_3_3 = selectLastSlice ? keccakStateRegShares_1_4[57] : keccakStateRegShares_1_4[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_3_3 = selectLastSlice ? keccakStateRegShares_1_5[57] : keccakStateRegShares_1_5[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_3_0 = selectLastSlice ? keccakStateRegShares_1_6[57] : keccakStateRegShares_1_6[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_3_2 = selectLastSlice ? keccakStateRegShares_1_7[57] : keccakStateRegShares_1_7[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_3_4 = selectLastSlice ? keccakStateRegShares_1_8[57] : keccakStateRegShares_1_8[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_3_1 = selectLastSlice ? keccakStateRegShares_1_9[57] : keccakStateRegShares_1_9[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_3_1 = selectLastSlice ? keccakStateRegShares_1_10[57] : keccakStateRegShares_1_10[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_3_3 = selectLastSlice ? keccakStateRegShares_1_11[57] : keccakStateRegShares_1_11[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_3_0 = selectLastSlice ? keccakStateRegShares_1_12[57] : keccakStateRegShares_1_12[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_3_2 = selectLastSlice ? keccakStateRegShares_1_13[57] : keccakStateRegShares_1_13[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_3_4 = selectLastSlice ? keccakStateRegShares_1_14[57] : keccakStateRegShares_1_14[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_3_4 = selectLastSlice ? keccakStateRegShares_1_15[57] : keccakStateRegShares_1_15[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_3_1 = selectLastSlice ? keccakStateRegShares_1_16[57] : keccakStateRegShares_1_16[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_3_3 = selectLastSlice ? keccakStateRegShares_1_17[57] : keccakStateRegShares_1_17[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_3_0 = selectLastSlice ? keccakStateRegShares_1_18[57] : keccakStateRegShares_1_18[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_3_2 = selectLastSlice ? keccakStateRegShares_1_19[57] : keccakStateRegShares_1_19[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_3_2 = selectLastSlice ? keccakStateRegShares_1_20[57] : keccakStateRegShares_1_20[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_3_4 = selectLastSlice ? keccakStateRegShares_1_21[57] : keccakStateRegShares_1_21[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_3_1 = selectLastSlice ? keccakStateRegShares_1_22[57] : keccakStateRegShares_1_22[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_3_3 = selectLastSlice ? keccakStateRegShares_1_23[57] : keccakStateRegShares_1_23[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_3_0 = selectLastSlice ? keccakStateRegShares_1_24[57] : keccakStateRegShares_1_24[1]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_5_0 = selectLastSlice ? keccakStateRegShares_1_0[58] : keccakStateRegShares_1_0[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_5_2 = selectLastSlice ? keccakStateRegShares_1_1[58] : keccakStateRegShares_1_1[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_5_4 = selectLastSlice ? keccakStateRegShares_1_2[58] : keccakStateRegShares_1_2[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_5_1 = selectLastSlice ? keccakStateRegShares_1_3[58] : keccakStateRegShares_1_3[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_5_3 = selectLastSlice ? keccakStateRegShares_1_4[58] : keccakStateRegShares_1_4[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_5_3 = selectLastSlice ? keccakStateRegShares_1_5[58] : keccakStateRegShares_1_5[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_5_0 = selectLastSlice ? keccakStateRegShares_1_6[58] : keccakStateRegShares_1_6[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_5_2 = selectLastSlice ? keccakStateRegShares_1_7[58] : keccakStateRegShares_1_7[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_5_4 = selectLastSlice ? keccakStateRegShares_1_8[58] : keccakStateRegShares_1_8[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_5_1 = selectLastSlice ? keccakStateRegShares_1_9[58] : keccakStateRegShares_1_9[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_5_1 = selectLastSlice ? keccakStateRegShares_1_10[58] : keccakStateRegShares_1_10[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_5_3 = selectLastSlice ? keccakStateRegShares_1_11[58] : keccakStateRegShares_1_11[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_5_0 = selectLastSlice ? keccakStateRegShares_1_12[58] : keccakStateRegShares_1_12[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_5_2 = selectLastSlice ? keccakStateRegShares_1_13[58] : keccakStateRegShares_1_13[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_5_4 = selectLastSlice ? keccakStateRegShares_1_14[58] : keccakStateRegShares_1_14[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_5_4 = selectLastSlice ? keccakStateRegShares_1_15[58] : keccakStateRegShares_1_15[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_5_1 = selectLastSlice ? keccakStateRegShares_1_16[58] : keccakStateRegShares_1_16[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_5_3 = selectLastSlice ? keccakStateRegShares_1_17[58] : keccakStateRegShares_1_17[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_5_0 = selectLastSlice ? keccakStateRegShares_1_18[58] : keccakStateRegShares_1_18[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_5_2 = selectLastSlice ? keccakStateRegShares_1_19[58] : keccakStateRegShares_1_19[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_5_2 = selectLastSlice ? keccakStateRegShares_1_20[58] : keccakStateRegShares_1_20[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_5_4 = selectLastSlice ? keccakStateRegShares_1_21[58] : keccakStateRegShares_1_21[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_5_1 = selectLastSlice ? keccakStateRegShares_1_22[58] : keccakStateRegShares_1_22[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_5_3 = selectLastSlice ? keccakStateRegShares_1_23[58] : keccakStateRegShares_1_23[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_5_0 = selectLastSlice ? keccakStateRegShares_1_24[58] : keccakStateRegShares_1_24[2]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_7_0 = selectLastSlice ? keccakStateRegShares_1_0[59] : keccakStateRegShares_1_0[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_7_2 = selectLastSlice ? keccakStateRegShares_1_1[59] : keccakStateRegShares_1_1[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_7_4 = selectLastSlice ? keccakStateRegShares_1_2[59] : keccakStateRegShares_1_2[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_7_1 = selectLastSlice ? keccakStateRegShares_1_3[59] : keccakStateRegShares_1_3[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_7_3 = selectLastSlice ? keccakStateRegShares_1_4[59] : keccakStateRegShares_1_4[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_7_3 = selectLastSlice ? keccakStateRegShares_1_5[59] : keccakStateRegShares_1_5[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_7_0 = selectLastSlice ? keccakStateRegShares_1_6[59] : keccakStateRegShares_1_6[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_7_2 = selectLastSlice ? keccakStateRegShares_1_7[59] : keccakStateRegShares_1_7[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_7_4 = selectLastSlice ? keccakStateRegShares_1_8[59] : keccakStateRegShares_1_8[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_7_1 = selectLastSlice ? keccakStateRegShares_1_9[59] : keccakStateRegShares_1_9[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_7_1 = selectLastSlice ? keccakStateRegShares_1_10[59] : keccakStateRegShares_1_10[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_7_3 = selectLastSlice ? keccakStateRegShares_1_11[59] : keccakStateRegShares_1_11[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_7_0 = selectLastSlice ? keccakStateRegShares_1_12[59] : keccakStateRegShares_1_12[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_7_2 = selectLastSlice ? keccakStateRegShares_1_13[59] : keccakStateRegShares_1_13[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_7_4 = selectLastSlice ? keccakStateRegShares_1_14[59] : keccakStateRegShares_1_14[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_7_4 = selectLastSlice ? keccakStateRegShares_1_15[59] : keccakStateRegShares_1_15[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_7_1 = selectLastSlice ? keccakStateRegShares_1_16[59] : keccakStateRegShares_1_16[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_7_3 = selectLastSlice ? keccakStateRegShares_1_17[59] : keccakStateRegShares_1_17[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_7_0 = selectLastSlice ? keccakStateRegShares_1_18[59] : keccakStateRegShares_1_18[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_7_2 = selectLastSlice ? keccakStateRegShares_1_19[59] : keccakStateRegShares_1_19[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_7_2 = selectLastSlice ? keccakStateRegShares_1_20[59] : keccakStateRegShares_1_20[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_7_4 = selectLastSlice ? keccakStateRegShares_1_21[59] : keccakStateRegShares_1_21[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_7_1 = selectLastSlice ? keccakStateRegShares_1_22[59] : keccakStateRegShares_1_22[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_7_3 = selectLastSlice ? keccakStateRegShares_1_23[59] : keccakStateRegShares_1_23[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_7_0 = selectLastSlice ? keccakStateRegShares_1_24[59] : keccakStateRegShares_1_24[3]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_9_0 = selectLastSlice ? keccakStateRegShares_1_0[60] : keccakStateRegShares_1_0[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_9_2 = selectLastSlice ? keccakStateRegShares_1_1[60] : keccakStateRegShares_1_1[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_9_4 = selectLastSlice ? keccakStateRegShares_1_2[60] : keccakStateRegShares_1_2[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_9_1 = selectLastSlice ? keccakStateRegShares_1_3[60] : keccakStateRegShares_1_3[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_9_3 = selectLastSlice ? keccakStateRegShares_1_4[60] : keccakStateRegShares_1_4[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_9_3 = selectLastSlice ? keccakStateRegShares_1_5[60] : keccakStateRegShares_1_5[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_9_0 = selectLastSlice ? keccakStateRegShares_1_6[60] : keccakStateRegShares_1_6[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_9_2 = selectLastSlice ? keccakStateRegShares_1_7[60] : keccakStateRegShares_1_7[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_9_4 = selectLastSlice ? keccakStateRegShares_1_8[60] : keccakStateRegShares_1_8[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_9_1 = selectLastSlice ? keccakStateRegShares_1_9[60] : keccakStateRegShares_1_9[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_9_1 = selectLastSlice ? keccakStateRegShares_1_10[60] : keccakStateRegShares_1_10[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_9_3 = selectLastSlice ? keccakStateRegShares_1_11[60] : keccakStateRegShares_1_11[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_9_0 = selectLastSlice ? keccakStateRegShares_1_12[60] : keccakStateRegShares_1_12[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_9_2 = selectLastSlice ? keccakStateRegShares_1_13[60] : keccakStateRegShares_1_13[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_9_4 = selectLastSlice ? keccakStateRegShares_1_14[60] : keccakStateRegShares_1_14[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_9_4 = selectLastSlice ? keccakStateRegShares_1_15[60] : keccakStateRegShares_1_15[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_9_1 = selectLastSlice ? keccakStateRegShares_1_16[60] : keccakStateRegShares_1_16[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_9_3 = selectLastSlice ? keccakStateRegShares_1_17[60] : keccakStateRegShares_1_17[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_9_0 = selectLastSlice ? keccakStateRegShares_1_18[60] : keccakStateRegShares_1_18[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_9_2 = selectLastSlice ? keccakStateRegShares_1_19[60] : keccakStateRegShares_1_19[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_9_2 = selectLastSlice ? keccakStateRegShares_1_20[60] : keccakStateRegShares_1_20[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_9_4 = selectLastSlice ? keccakStateRegShares_1_21[60] : keccakStateRegShares_1_21[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_9_1 = selectLastSlice ? keccakStateRegShares_1_22[60] : keccakStateRegShares_1_22[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_9_3 = selectLastSlice ? keccakStateRegShares_1_23[60] : keccakStateRegShares_1_23[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_9_0 = selectLastSlice ? keccakStateRegShares_1_24[60] : keccakStateRegShares_1_24[4]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_11_0 = selectLastSlice ? keccakStateRegShares_1_0[61] : keccakStateRegShares_1_0[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_11_2 = selectLastSlice ? keccakStateRegShares_1_1[61] : keccakStateRegShares_1_1[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_11_4 = selectLastSlice ? keccakStateRegShares_1_2[61] : keccakStateRegShares_1_2[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_11_1 = selectLastSlice ? keccakStateRegShares_1_3[61] : keccakStateRegShares_1_3[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_11_3 = selectLastSlice ? keccakStateRegShares_1_4[61] : keccakStateRegShares_1_4[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_11_3 = selectLastSlice ? keccakStateRegShares_1_5[61] : keccakStateRegShares_1_5[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_11_0 = selectLastSlice ? keccakStateRegShares_1_6[61] : keccakStateRegShares_1_6[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_11_2 = selectLastSlice ? keccakStateRegShares_1_7[61] : keccakStateRegShares_1_7[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_11_4 = selectLastSlice ? keccakStateRegShares_1_8[61] : keccakStateRegShares_1_8[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_11_1 = selectLastSlice ? keccakStateRegShares_1_9[61] : keccakStateRegShares_1_9[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_11_1 = selectLastSlice ? keccakStateRegShares_1_10[61] : keccakStateRegShares_1_10[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_11_3 = selectLastSlice ? keccakStateRegShares_1_11[61] : keccakStateRegShares_1_11[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_11_0 = selectLastSlice ? keccakStateRegShares_1_12[61] : keccakStateRegShares_1_12[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_11_2 = selectLastSlice ? keccakStateRegShares_1_13[61] : keccakStateRegShares_1_13[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_11_4 = selectLastSlice ? keccakStateRegShares_1_14[61] : keccakStateRegShares_1_14[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_11_4 = selectLastSlice ? keccakStateRegShares_1_15[61] : keccakStateRegShares_1_15[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_11_1 = selectLastSlice ? keccakStateRegShares_1_16[61] : keccakStateRegShares_1_16[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_11_3 = selectLastSlice ? keccakStateRegShares_1_17[61] : keccakStateRegShares_1_17[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_11_0 = selectLastSlice ? keccakStateRegShares_1_18[61] : keccakStateRegShares_1_18[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_11_2 = selectLastSlice ? keccakStateRegShares_1_19[61] : keccakStateRegShares_1_19[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_11_2 = selectLastSlice ? keccakStateRegShares_1_20[61] : keccakStateRegShares_1_20[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_11_4 = selectLastSlice ? keccakStateRegShares_1_21[61] : keccakStateRegShares_1_21[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_11_1 = selectLastSlice ? keccakStateRegShares_1_22[61] : keccakStateRegShares_1_22[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_11_3 = selectLastSlice ? keccakStateRegShares_1_23[61] : keccakStateRegShares_1_23[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_11_0 = selectLastSlice ? keccakStateRegShares_1_24[61] : keccakStateRegShares_1_24[5]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_13_0 = selectLastSlice ? keccakStateRegShares_1_0[62] : keccakStateRegShares_1_0[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_13_2 = selectLastSlice ? keccakStateRegShares_1_1[62] : keccakStateRegShares_1_1[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_13_4 = selectLastSlice ? keccakStateRegShares_1_2[62] : keccakStateRegShares_1_2[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_13_1 = selectLastSlice ? keccakStateRegShares_1_3[62] : keccakStateRegShares_1_3[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_13_3 = selectLastSlice ? keccakStateRegShares_1_4[62] : keccakStateRegShares_1_4[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_13_3 = selectLastSlice ? keccakStateRegShares_1_5[62] : keccakStateRegShares_1_5[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_13_0 = selectLastSlice ? keccakStateRegShares_1_6[62] : keccakStateRegShares_1_6[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_13_2 = selectLastSlice ? keccakStateRegShares_1_7[62] : keccakStateRegShares_1_7[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_13_4 = selectLastSlice ? keccakStateRegShares_1_8[62] : keccakStateRegShares_1_8[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_13_1 = selectLastSlice ? keccakStateRegShares_1_9[62] : keccakStateRegShares_1_9[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_13_1 = selectLastSlice ? keccakStateRegShares_1_10[62] : keccakStateRegShares_1_10[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_13_3 = selectLastSlice ? keccakStateRegShares_1_11[62] : keccakStateRegShares_1_11[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_13_0 = selectLastSlice ? keccakStateRegShares_1_12[62] : keccakStateRegShares_1_12[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_13_2 = selectLastSlice ? keccakStateRegShares_1_13[62] : keccakStateRegShares_1_13[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_13_4 = selectLastSlice ? keccakStateRegShares_1_14[62] : keccakStateRegShares_1_14[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_13_4 = selectLastSlice ? keccakStateRegShares_1_15[62] : keccakStateRegShares_1_15[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_13_1 = selectLastSlice ? keccakStateRegShares_1_16[62] : keccakStateRegShares_1_16[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_13_3 = selectLastSlice ? keccakStateRegShares_1_17[62] : keccakStateRegShares_1_17[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_13_0 = selectLastSlice ? keccakStateRegShares_1_18[62] : keccakStateRegShares_1_18[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_13_2 = selectLastSlice ? keccakStateRegShares_1_19[62] : keccakStateRegShares_1_19[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_13_2 = selectLastSlice ? keccakStateRegShares_1_20[62] : keccakStateRegShares_1_20[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_13_4 = selectLastSlice ? keccakStateRegShares_1_21[62] : keccakStateRegShares_1_21[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_13_1 = selectLastSlice ? keccakStateRegShares_1_22[62] : keccakStateRegShares_1_22[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_13_3 = selectLastSlice ? keccakStateRegShares_1_23[62] : keccakStateRegShares_1_23[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_13_0 = selectLastSlice ? keccakStateRegShares_1_24[62] : keccakStateRegShares_1_24[6]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_15_0 = selectLastSlice ? keccakStateRegShares_1_0[63] : keccakStateRegShares_1_0[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_15_2 = selectLastSlice ? keccakStateRegShares_1_1[63] : keccakStateRegShares_1_1[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_15_4 = selectLastSlice ? keccakStateRegShares_1_2[63] : keccakStateRegShares_1_2[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_15_1 = selectLastSlice ? keccakStateRegShares_1_3[63] : keccakStateRegShares_1_3[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_0_15_3 = selectLastSlice ? keccakStateRegShares_1_4[63] : keccakStateRegShares_1_4[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_15_3 = selectLastSlice ? keccakStateRegShares_1_5[63] : keccakStateRegShares_1_5[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_15_0 = selectLastSlice ? keccakStateRegShares_1_6[63] : keccakStateRegShares_1_6[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_15_2 = selectLastSlice ? keccakStateRegShares_1_7[63] : keccakStateRegShares_1_7[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_15_4 = selectLastSlice ? keccakStateRegShares_1_8[63] : keccakStateRegShares_1_8[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_1_15_1 = selectLastSlice ? keccakStateRegShares_1_9[63] : keccakStateRegShares_1_9[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_15_1 = selectLastSlice ? keccakStateRegShares_1_10[63] : keccakStateRegShares_1_10[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_15_3 = selectLastSlice ? keccakStateRegShares_1_11[63] : keccakStateRegShares_1_11[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_15_0 = selectLastSlice ? keccakStateRegShares_1_12[63] : keccakStateRegShares_1_12[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_15_2 = selectLastSlice ? keccakStateRegShares_1_13[63] : keccakStateRegShares_1_13[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_2_15_4 = selectLastSlice ? keccakStateRegShares_1_14[63] : keccakStateRegShares_1_14[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_15_4 = selectLastSlice ? keccakStateRegShares_1_15[63] : keccakStateRegShares_1_15[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_15_1 = selectLastSlice ? keccakStateRegShares_1_16[63] : keccakStateRegShares_1_16[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_15_3 = selectLastSlice ? keccakStateRegShares_1_17[63] : keccakStateRegShares_1_17[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_15_0 = selectLastSlice ? keccakStateRegShares_1_18[63] : keccakStateRegShares_1_18[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_3_15_2 = selectLastSlice ? keccakStateRegShares_1_19[63] : keccakStateRegShares_1_19[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_15_2 = selectLastSlice ? keccakStateRegShares_1_20[63] : keccakStateRegShares_1_20[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_15_4 = selectLastSlice ? keccakStateRegShares_1_21[63] : keccakStateRegShares_1_21[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_15_1 = selectLastSlice ? keccakStateRegShares_1_22[63] : keccakStateRegShares_1_22[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_15_3 = selectLastSlice ? keccakStateRegShares_1_23[63] : keccakStateRegShares_1_23[7]; // @[KeccakCore.scala 447:31]
  wire  xColsShares_uiCols_cols_4_15_0 = selectLastSlice ? keccakStateRegShares_1_24[63] : keccakStateRegShares_1_24[7]; // @[KeccakCore.scala 447:31]
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
  wire [63:0] gatedIn_1 = gateBitMask & io_din_bits_1; // @[KeccakCore.scala 120:33]
  wire [63:0] _keccakStateRegShares_1_24_T_3 = keccakStateRegShares_1_0 & _keccakStateRegShares_0_24_T_2; // @[KeccakCore.scala 126:59]
  wire [63:0] _keccakStateRegShares_1_24_T_4 = _keccakStateRegShares_1_24_T_3 ^ gatedIn_1; // @[KeccakCore.scala 126:96]
  wire  _T_927 = ~io_din_ready | io_din_valid; // @[KeccakCore.scala 189:26]
  wire  _T_933 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire  _T_2178 = 3'h5 == state; // @[Conditional.scala 37:30]
  wire  _T_2325 = 3'h6 == state; // @[Conditional.scala 37:30]
  wire  _T_2327 = ~io_dout_valid | io_dout_ready; // @[KeccakCore.scala 251:27]
  wire  _GEN_234 = _T_2178 ? 1'h0 : _T_2325 & _T_2327; // @[Conditional.scala 39:67]
  wire  _GEN_294 = _T_933 ? 1'h0 : _GEN_234; // @[Conditional.scala 39:67]
  wire  _GEN_355 = _T_930 ? 1'h0 : _GEN_294; // @[Conditional.scala 39:67]
  wire  _GEN_360 = _T_921 ? _T_927 : _GEN_355; // @[Conditional.scala 39:67]
  wire  laneRotate = _T_918 ? 1'h0 : _GEN_360; // @[Conditional.scala 40:58]
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
  wire [63:0] _GEN_25 = laneRotate ? keccakStateRegShares_1_1 : keccakStateRegShares_1_0; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_26 = laneRotate ? keccakStateRegShares_1_2 : keccakStateRegShares_1_1; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_27 = laneRotate ? keccakStateRegShares_1_3 : keccakStateRegShares_1_2; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_28 = laneRotate ? keccakStateRegShares_1_4 : keccakStateRegShares_1_3; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_29 = laneRotate ? keccakStateRegShares_1_5 : keccakStateRegShares_1_4; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_30 = laneRotate ? keccakStateRegShares_1_6 : keccakStateRegShares_1_5; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_31 = laneRotate ? keccakStateRegShares_1_7 : keccakStateRegShares_1_6; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_32 = laneRotate ? keccakStateRegShares_1_8 : keccakStateRegShares_1_7; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_33 = laneRotate ? keccakStateRegShares_1_9 : keccakStateRegShares_1_8; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_34 = laneRotate ? keccakStateRegShares_1_10 : keccakStateRegShares_1_9; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_35 = laneRotate ? keccakStateRegShares_1_11 : keccakStateRegShares_1_10; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_36 = laneRotate ? keccakStateRegShares_1_12 : keccakStateRegShares_1_11; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_37 = laneRotate ? keccakStateRegShares_1_13 : keccakStateRegShares_1_12; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_38 = laneRotate ? keccakStateRegShares_1_14 : keccakStateRegShares_1_13; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_39 = laneRotate ? keccakStateRegShares_1_15 : keccakStateRegShares_1_14; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_40 = laneRotate ? keccakStateRegShares_1_16 : keccakStateRegShares_1_15; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_41 = laneRotate ? keccakStateRegShares_1_17 : keccakStateRegShares_1_16; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_42 = laneRotate ? keccakStateRegShares_1_18 : keccakStateRegShares_1_17; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_43 = laneRotate ? keccakStateRegShares_1_19 : keccakStateRegShares_1_18; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_44 = laneRotate ? keccakStateRegShares_1_20 : keccakStateRegShares_1_19; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_45 = laneRotate ? keccakStateRegShares_1_21 : keccakStateRegShares_1_20; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_46 = laneRotate ? keccakStateRegShares_1_22 : keccakStateRegShares_1_21; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_47 = laneRotate ? keccakStateRegShares_1_23 : keccakStateRegShares_1_22; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_48 = laneRotate ? keccakStateRegShares_1_24 : keccakStateRegShares_1_23; // @[KeccakCore.scala 114:20 KeccakCore.scala 117:27 KeccakCore.scala 77:49]
  wire [63:0] _GEN_49 = laneRotate ? _keccakStateRegShares_1_24_T_4 : keccakStateRegShares_1_24; // @[KeccakCore.scala 114:20 KeccakCore.scala 126:37 KeccakCore.scala 77:49]
  wire  isLastRound = roundCtr == 5'h18; // @[KeccakCore.scala 130:36]
  wire  zerothRound = roundCtr == 5'h0; // @[KeccakCore.scala 131:36]
  reg  lastSliceProcFlag; // @[KeccakCore.scala 168:36]
  wire  _T_922 = io_din_ready & io_din_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_51 = _T_922 & lastRateLine ? 1'h0 : isRateLineFlag; // @[KeccakCore.scala 181:43 KeccakCore.scala 182:24 KeccakCore.scala 105:33]
  wire  _GEN_52 = _T_922 & io_ctrl_absorbFin | absorbFinalizeFlag; // @[KeccakCore.scala 186:48 KeccakCore.scala 187:28 KeccakCore.scala 107:37]
  wire [4:0] _shiftCtr_T_1 = shiftCtr + 5'h1; // @[KeccakCore.scala 191:30]
  wire  _GEN_54 = lastLaneRotate | _GEN_51; // @[KeccakCore.scala 192:30 KeccakCore.scala 194:26]
  wire [2:0] _GEN_56 = lastLaneRotate ? 3'h3 : state; // @[KeccakCore.scala 192:30 KeccakCore.scala 196:17 KeccakCore.scala 101:34]
  wire  _GEN_60 = ~io_din_ready | io_din_valid ? _GEN_54 : _GEN_51; // @[KeccakCore.scala 189:43]
  wire [4:0] xColsShares_0__0 = {xColsShares_uiCols_cols_0__4,xColsShares_uiCols_cols_0__3,xColsShares_uiCols_cols_0__2,
    xColsShares_uiCols_cols_0__1,xColsShares_uiCols_cols_0__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0__1 = {xColsShares_uiCols_cols_1__4,xColsShares_uiCols_cols_1__3,xColsShares_uiCols_cols_1__2,
    xColsShares_uiCols_cols_1__1,xColsShares_uiCols_cols_1__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0__2 = {xColsShares_uiCols_cols_2__4,xColsShares_uiCols_cols_2__3,xColsShares_uiCols_cols_2__2,
    xColsShares_uiCols_cols_2__1,xColsShares_uiCols_cols_2__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0__3 = {xColsShares_uiCols_cols_3__4,xColsShares_uiCols_cols_3__3,xColsShares_uiCols_cols_3__2,
    xColsShares_uiCols_cols_3__1,xColsShares_uiCols_cols_3__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0__4 = {xColsShares_uiCols_cols_4__4,xColsShares_uiCols_cols_4__3,xColsShares_uiCols_cols_4__2,
    xColsShares_uiCols_cols_4__1,xColsShares_uiCols_cols_4__0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1__0 = {xColsShares_uiCols_cols_0_1_4,xColsShares_uiCols_cols_0_1_3,
    xColsShares_uiCols_cols_0_1_2,xColsShares_uiCols_cols_0_1_1,xColsShares_uiCols_cols_0_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1__1 = {xColsShares_uiCols_cols_1_1_4,xColsShares_uiCols_cols_1_1_3,
    xColsShares_uiCols_cols_1_1_2,xColsShares_uiCols_cols_1_1_1,xColsShares_uiCols_cols_1_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1__2 = {xColsShares_uiCols_cols_2_1_4,xColsShares_uiCols_cols_2_1_3,
    xColsShares_uiCols_cols_2_1_2,xColsShares_uiCols_cols_2_1_1,xColsShares_uiCols_cols_2_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1__3 = {xColsShares_uiCols_cols_3_1_4,xColsShares_uiCols_cols_3_1_3,
    xColsShares_uiCols_cols_3_1_2,xColsShares_uiCols_cols_3_1_1,xColsShares_uiCols_cols_3_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1__4 = {xColsShares_uiCols_cols_4_1_4,xColsShares_uiCols_cols_4_1_3,
    xColsShares_uiCols_cols_4_1_2,xColsShares_uiCols_cols_4_1_1,xColsShares_uiCols_cols_4_1_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _regs_T = ~xColsShares_0__1; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_1 = _regs_T & xColsShares_0__2; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_3 = _regs_T & xColsShares_1__2; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_4 = _regs_T_3 ^ xColsShares_0__0; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_5 = xColsShares_0__2 & xColsShares_1__1; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_6 = _regs_T_5 ^ xColsShares_1__0; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_7 = xColsShares_1__2 & xColsShares_1__1; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_934 = regs_0 ^ regs_1; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_8 = ~xColsShares_0__2; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_9 = _regs_T_8 & xColsShares_0__3; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_11 = _regs_T_8 & xColsShares_1__3; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_12 = _regs_T_11 ^ xColsShares_0__1; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_13 = xColsShares_0__3 & xColsShares_1__2; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_14 = _regs_T_13 ^ xColsShares_1__1; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_15 = xColsShares_1__3 & xColsShares_1__2; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_1; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_1; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_1; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_1; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_935 = regs_0_1 ^ regs_1_1; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_16 = ~xColsShares_0__3; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_17 = _regs_T_16 & xColsShares_0__4; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_19 = _regs_T_16 & xColsShares_1__4; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_20 = _regs_T_19 ^ xColsShares_0__2; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_21 = xColsShares_0__4 & xColsShares_1__3; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_22 = _regs_T_21 ^ xColsShares_1__2; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_23 = xColsShares_1__4 & xColsShares_1__3; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_2; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_2; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_2; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_2; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_936 = regs_0_2 ^ regs_1_2; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_24 = ~xColsShares_0__4; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_25 = _regs_T_24 & xColsShares_0__0; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_27 = _regs_T_24 & xColsShares_1__0; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_28 = _regs_T_27 ^ xColsShares_0__3; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_29 = xColsShares_0__0 & xColsShares_1__4; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_30 = _regs_T_29 ^ xColsShares_1__3; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_31 = xColsShares_1__0 & xColsShares_1__4; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_3; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_3; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_3; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_3; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_937 = regs_0_3 ^ regs_1_3; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_32 = ~xColsShares_0__0; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_33 = _regs_T_32 & xColsShares_0__1; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_35 = _regs_T_32 & xColsShares_1__1; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_36 = _regs_T_35 ^ xColsShares_0__4; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_37 = xColsShares_0__1 & xColsShares_1__0; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_38 = _regs_T_37 ^ xColsShares_1__4; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_39 = xColsShares_1__1 & xColsShares_1__0; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_4; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_4; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_4; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_4; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_938 = regs_0_4 ^ regs_1_4; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_939 = regs_2 ^ regs_3; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_940 = regs_2_1 ^ regs_3_1; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_941 = regs_2_2 ^ regs_3_2; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_942 = regs_2_3 ^ regs_3_3; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_943 = regs_2_4 ^ regs_3_4; // @[KeccakCore.scala 392:48]
  wire [4:0] xColsShares_0_1_0 = {xColsShares_uiCols_cols_0_2_4,xColsShares_uiCols_cols_0_2_3,
    xColsShares_uiCols_cols_0_2_2,xColsShares_uiCols_cols_0_2_1,xColsShares_uiCols_cols_0_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_1_1 = {xColsShares_uiCols_cols_1_2_4,xColsShares_uiCols_cols_1_2_3,
    xColsShares_uiCols_cols_1_2_2,xColsShares_uiCols_cols_1_2_1,xColsShares_uiCols_cols_1_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_1_2 = {xColsShares_uiCols_cols_2_2_4,xColsShares_uiCols_cols_2_2_3,
    xColsShares_uiCols_cols_2_2_2,xColsShares_uiCols_cols_2_2_1,xColsShares_uiCols_cols_2_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_1_3 = {xColsShares_uiCols_cols_3_2_4,xColsShares_uiCols_cols_3_2_3,
    xColsShares_uiCols_cols_3_2_2,xColsShares_uiCols_cols_3_2_1,xColsShares_uiCols_cols_3_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_1_4 = {xColsShares_uiCols_cols_4_2_4,xColsShares_uiCols_cols_4_2_3,
    xColsShares_uiCols_cols_4_2_2,xColsShares_uiCols_cols_4_2_1,xColsShares_uiCols_cols_4_2_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_1_0 = {xColsShares_uiCols_cols_0_3_4,xColsShares_uiCols_cols_0_3_3,
    xColsShares_uiCols_cols_0_3_2,xColsShares_uiCols_cols_0_3_1,xColsShares_uiCols_cols_0_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_1_1 = {xColsShares_uiCols_cols_1_3_4,xColsShares_uiCols_cols_1_3_3,
    xColsShares_uiCols_cols_1_3_2,xColsShares_uiCols_cols_1_3_1,xColsShares_uiCols_cols_1_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_1_2 = {xColsShares_uiCols_cols_2_3_4,xColsShares_uiCols_cols_2_3_3,
    xColsShares_uiCols_cols_2_3_2,xColsShares_uiCols_cols_2_3_1,xColsShares_uiCols_cols_2_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_1_3 = {xColsShares_uiCols_cols_3_3_4,xColsShares_uiCols_cols_3_3_3,
    xColsShares_uiCols_cols_3_3_2,xColsShares_uiCols_cols_3_3_1,xColsShares_uiCols_cols_3_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_1_4 = {xColsShares_uiCols_cols_4_3_4,xColsShares_uiCols_cols_4_3_3,
    xColsShares_uiCols_cols_4_3_2,xColsShares_uiCols_cols_4_3_1,xColsShares_uiCols_cols_4_3_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _regs_T_40 = ~xColsShares_0_1_1; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_41 = _regs_T_40 & xColsShares_0_1_2; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_43 = _regs_T_40 & xColsShares_1_1_2; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_44 = _regs_T_43 ^ xColsShares_0_1_0; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_45 = xColsShares_0_1_2 & xColsShares_1_1_1; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_46 = _regs_T_45 ^ xColsShares_1_1_0; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_47 = xColsShares_1_1_2 & xColsShares_1_1_1; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_5; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_5; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_5; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_5; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_994 = regs_0_5 ^ regs_1_5; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_48 = ~xColsShares_0_1_2; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_49 = _regs_T_48 & xColsShares_0_1_3; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_51 = _regs_T_48 & xColsShares_1_1_3; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_52 = _regs_T_51 ^ xColsShares_0_1_1; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_53 = xColsShares_0_1_3 & xColsShares_1_1_2; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_54 = _regs_T_53 ^ xColsShares_1_1_1; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_55 = xColsShares_1_1_3 & xColsShares_1_1_2; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_6; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_6; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_6; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_6; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_995 = regs_0_6 ^ regs_1_6; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_56 = ~xColsShares_0_1_3; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_57 = _regs_T_56 & xColsShares_0_1_4; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_59 = _regs_T_56 & xColsShares_1_1_4; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_60 = _regs_T_59 ^ xColsShares_0_1_2; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_61 = xColsShares_0_1_4 & xColsShares_1_1_3; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_62 = _regs_T_61 ^ xColsShares_1_1_2; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_63 = xColsShares_1_1_4 & xColsShares_1_1_3; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_7; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_7; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_7; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_7; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_996 = regs_0_7 ^ regs_1_7; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_64 = ~xColsShares_0_1_4; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_65 = _regs_T_64 & xColsShares_0_1_0; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_67 = _regs_T_64 & xColsShares_1_1_0; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_68 = _regs_T_67 ^ xColsShares_0_1_3; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_69 = xColsShares_0_1_0 & xColsShares_1_1_4; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_70 = _regs_T_69 ^ xColsShares_1_1_3; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_71 = xColsShares_1_1_0 & xColsShares_1_1_4; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_8; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_8; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_8; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_8; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_997 = regs_0_8 ^ regs_1_8; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_72 = ~xColsShares_0_1_0; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_73 = _regs_T_72 & xColsShares_0_1_1; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_75 = _regs_T_72 & xColsShares_1_1_1; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_76 = _regs_T_75 ^ xColsShares_0_1_4; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_77 = xColsShares_0_1_1 & xColsShares_1_1_0; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_78 = _regs_T_77 ^ xColsShares_1_1_4; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_79 = xColsShares_1_1_1 & xColsShares_1_1_0; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_9; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_9; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_9; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_9; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_998 = regs_0_9 ^ regs_1_9; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_999 = regs_2_5 ^ regs_3_5; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1000 = regs_2_6 ^ regs_3_6; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1001 = regs_2_7 ^ regs_3_7; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1002 = regs_2_8 ^ regs_3_8; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1003 = regs_2_9 ^ regs_3_9; // @[KeccakCore.scala 392:48]
  wire [4:0] xColsShares_0_2_0 = {xColsShares_uiCols_cols_0_4_4,xColsShares_uiCols_cols_0_4_3,
    xColsShares_uiCols_cols_0_4_2,xColsShares_uiCols_cols_0_4_1,xColsShares_uiCols_cols_0_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_2_1 = {xColsShares_uiCols_cols_1_4_4,xColsShares_uiCols_cols_1_4_3,
    xColsShares_uiCols_cols_1_4_2,xColsShares_uiCols_cols_1_4_1,xColsShares_uiCols_cols_1_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_2_2 = {xColsShares_uiCols_cols_2_4_4,xColsShares_uiCols_cols_2_4_3,
    xColsShares_uiCols_cols_2_4_2,xColsShares_uiCols_cols_2_4_1,xColsShares_uiCols_cols_2_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_2_3 = {xColsShares_uiCols_cols_3_4_4,xColsShares_uiCols_cols_3_4_3,
    xColsShares_uiCols_cols_3_4_2,xColsShares_uiCols_cols_3_4_1,xColsShares_uiCols_cols_3_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_2_4 = {xColsShares_uiCols_cols_4_4_4,xColsShares_uiCols_cols_4_4_3,
    xColsShares_uiCols_cols_4_4_2,xColsShares_uiCols_cols_4_4_1,xColsShares_uiCols_cols_4_4_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_2_0 = {xColsShares_uiCols_cols_0_5_4,xColsShares_uiCols_cols_0_5_3,
    xColsShares_uiCols_cols_0_5_2,xColsShares_uiCols_cols_0_5_1,xColsShares_uiCols_cols_0_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_2_1 = {xColsShares_uiCols_cols_1_5_4,xColsShares_uiCols_cols_1_5_3,
    xColsShares_uiCols_cols_1_5_2,xColsShares_uiCols_cols_1_5_1,xColsShares_uiCols_cols_1_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_2_2 = {xColsShares_uiCols_cols_2_5_4,xColsShares_uiCols_cols_2_5_3,
    xColsShares_uiCols_cols_2_5_2,xColsShares_uiCols_cols_2_5_1,xColsShares_uiCols_cols_2_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_2_3 = {xColsShares_uiCols_cols_3_5_4,xColsShares_uiCols_cols_3_5_3,
    xColsShares_uiCols_cols_3_5_2,xColsShares_uiCols_cols_3_5_1,xColsShares_uiCols_cols_3_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_2_4 = {xColsShares_uiCols_cols_4_5_4,xColsShares_uiCols_cols_4_5_3,
    xColsShares_uiCols_cols_4_5_2,xColsShares_uiCols_cols_4_5_1,xColsShares_uiCols_cols_4_5_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _regs_T_80 = ~xColsShares_0_2_1; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_81 = _regs_T_80 & xColsShares_0_2_2; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_83 = _regs_T_80 & xColsShares_1_2_2; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_84 = _regs_T_83 ^ xColsShares_0_2_0; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_85 = xColsShares_0_2_2 & xColsShares_1_2_1; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_86 = _regs_T_85 ^ xColsShares_1_2_0; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_87 = xColsShares_1_2_2 & xColsShares_1_2_1; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_10; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_10; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_10; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_10; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1054 = regs_0_10 ^ regs_1_10; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_88 = ~xColsShares_0_2_2; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_89 = _regs_T_88 & xColsShares_0_2_3; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_91 = _regs_T_88 & xColsShares_1_2_3; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_92 = _regs_T_91 ^ xColsShares_0_2_1; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_93 = xColsShares_0_2_3 & xColsShares_1_2_2; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_94 = _regs_T_93 ^ xColsShares_1_2_1; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_95 = xColsShares_1_2_3 & xColsShares_1_2_2; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_11; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_11; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_11; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_11; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1055 = regs_0_11 ^ regs_1_11; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_96 = ~xColsShares_0_2_3; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_97 = _regs_T_96 & xColsShares_0_2_4; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_99 = _regs_T_96 & xColsShares_1_2_4; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_100 = _regs_T_99 ^ xColsShares_0_2_2; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_101 = xColsShares_0_2_4 & xColsShares_1_2_3; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_102 = _regs_T_101 ^ xColsShares_1_2_2; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_103 = xColsShares_1_2_4 & xColsShares_1_2_3; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_12; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_12; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_12; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_12; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1056 = regs_0_12 ^ regs_1_12; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_104 = ~xColsShares_0_2_4; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_105 = _regs_T_104 & xColsShares_0_2_0; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_107 = _regs_T_104 & xColsShares_1_2_0; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_108 = _regs_T_107 ^ xColsShares_0_2_3; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_109 = xColsShares_0_2_0 & xColsShares_1_2_4; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_110 = _regs_T_109 ^ xColsShares_1_2_3; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_111 = xColsShares_1_2_0 & xColsShares_1_2_4; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_13; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_13; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_13; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_13; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1057 = regs_0_13 ^ regs_1_13; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_112 = ~xColsShares_0_2_0; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_113 = _regs_T_112 & xColsShares_0_2_1; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_115 = _regs_T_112 & xColsShares_1_2_1; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_116 = _regs_T_115 ^ xColsShares_0_2_4; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_117 = xColsShares_0_2_1 & xColsShares_1_2_0; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_118 = _regs_T_117 ^ xColsShares_1_2_4; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_119 = xColsShares_1_2_1 & xColsShares_1_2_0; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_14; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_14; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_14; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_14; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1058 = regs_0_14 ^ regs_1_14; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1059 = regs_2_10 ^ regs_3_10; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1060 = regs_2_11 ^ regs_3_11; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1061 = regs_2_12 ^ regs_3_12; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1062 = regs_2_13 ^ regs_3_13; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1063 = regs_2_14 ^ regs_3_14; // @[KeccakCore.scala 392:48]
  wire [4:0] xColsShares_0_3_0 = {xColsShares_uiCols_cols_0_6_4,xColsShares_uiCols_cols_0_6_3,
    xColsShares_uiCols_cols_0_6_2,xColsShares_uiCols_cols_0_6_1,xColsShares_uiCols_cols_0_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_3_1 = {xColsShares_uiCols_cols_1_6_4,xColsShares_uiCols_cols_1_6_3,
    xColsShares_uiCols_cols_1_6_2,xColsShares_uiCols_cols_1_6_1,xColsShares_uiCols_cols_1_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_3_2 = {xColsShares_uiCols_cols_2_6_4,xColsShares_uiCols_cols_2_6_3,
    xColsShares_uiCols_cols_2_6_2,xColsShares_uiCols_cols_2_6_1,xColsShares_uiCols_cols_2_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_3_3 = {xColsShares_uiCols_cols_3_6_4,xColsShares_uiCols_cols_3_6_3,
    xColsShares_uiCols_cols_3_6_2,xColsShares_uiCols_cols_3_6_1,xColsShares_uiCols_cols_3_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_3_4 = {xColsShares_uiCols_cols_4_6_4,xColsShares_uiCols_cols_4_6_3,
    xColsShares_uiCols_cols_4_6_2,xColsShares_uiCols_cols_4_6_1,xColsShares_uiCols_cols_4_6_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_3_0 = {xColsShares_uiCols_cols_0_7_4,xColsShares_uiCols_cols_0_7_3,
    xColsShares_uiCols_cols_0_7_2,xColsShares_uiCols_cols_0_7_1,xColsShares_uiCols_cols_0_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_3_1 = {xColsShares_uiCols_cols_1_7_4,xColsShares_uiCols_cols_1_7_3,
    xColsShares_uiCols_cols_1_7_2,xColsShares_uiCols_cols_1_7_1,xColsShares_uiCols_cols_1_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_3_2 = {xColsShares_uiCols_cols_2_7_4,xColsShares_uiCols_cols_2_7_3,
    xColsShares_uiCols_cols_2_7_2,xColsShares_uiCols_cols_2_7_1,xColsShares_uiCols_cols_2_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_3_3 = {xColsShares_uiCols_cols_3_7_4,xColsShares_uiCols_cols_3_7_3,
    xColsShares_uiCols_cols_3_7_2,xColsShares_uiCols_cols_3_7_1,xColsShares_uiCols_cols_3_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_3_4 = {xColsShares_uiCols_cols_4_7_4,xColsShares_uiCols_cols_4_7_3,
    xColsShares_uiCols_cols_4_7_2,xColsShares_uiCols_cols_4_7_1,xColsShares_uiCols_cols_4_7_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _regs_T_120 = ~xColsShares_0_3_1; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_121 = _regs_T_120 & xColsShares_0_3_2; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_123 = _regs_T_120 & xColsShares_1_3_2; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_124 = _regs_T_123 ^ xColsShares_0_3_0; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_125 = xColsShares_0_3_2 & xColsShares_1_3_1; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_126 = _regs_T_125 ^ xColsShares_1_3_0; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_127 = xColsShares_1_3_2 & xColsShares_1_3_1; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_15; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_15; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_15; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_15; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1114 = regs_0_15 ^ regs_1_15; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_128 = ~xColsShares_0_3_2; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_129 = _regs_T_128 & xColsShares_0_3_3; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_131 = _regs_T_128 & xColsShares_1_3_3; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_132 = _regs_T_131 ^ xColsShares_0_3_1; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_133 = xColsShares_0_3_3 & xColsShares_1_3_2; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_134 = _regs_T_133 ^ xColsShares_1_3_1; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_135 = xColsShares_1_3_3 & xColsShares_1_3_2; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_16; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_16; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_16; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_16; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1115 = regs_0_16 ^ regs_1_16; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_136 = ~xColsShares_0_3_3; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_137 = _regs_T_136 & xColsShares_0_3_4; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_139 = _regs_T_136 & xColsShares_1_3_4; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_140 = _regs_T_139 ^ xColsShares_0_3_2; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_141 = xColsShares_0_3_4 & xColsShares_1_3_3; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_142 = _regs_T_141 ^ xColsShares_1_3_2; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_143 = xColsShares_1_3_4 & xColsShares_1_3_3; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_17; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_17; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_17; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_17; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1116 = regs_0_17 ^ regs_1_17; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_144 = ~xColsShares_0_3_4; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_145 = _regs_T_144 & xColsShares_0_3_0; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_147 = _regs_T_144 & xColsShares_1_3_0; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_148 = _regs_T_147 ^ xColsShares_0_3_3; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_149 = xColsShares_0_3_0 & xColsShares_1_3_4; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_150 = _regs_T_149 ^ xColsShares_1_3_3; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_151 = xColsShares_1_3_0 & xColsShares_1_3_4; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_18; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_18; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_18; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_18; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1117 = regs_0_18 ^ regs_1_18; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_152 = ~xColsShares_0_3_0; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_153 = _regs_T_152 & xColsShares_0_3_1; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_155 = _regs_T_152 & xColsShares_1_3_1; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_156 = _regs_T_155 ^ xColsShares_0_3_4; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_157 = xColsShares_0_3_1 & xColsShares_1_3_0; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_158 = _regs_T_157 ^ xColsShares_1_3_4; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_159 = xColsShares_1_3_1 & xColsShares_1_3_0; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_19; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_19; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_19; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_19; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1118 = regs_0_19 ^ regs_1_19; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1119 = regs_2_15 ^ regs_3_15; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1120 = regs_2_16 ^ regs_3_16; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1121 = regs_2_17 ^ regs_3_17; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1122 = regs_2_18 ^ regs_3_18; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1123 = regs_2_19 ^ regs_3_19; // @[KeccakCore.scala 392:48]
  wire [4:0] xColsShares_0_4_0 = {xColsShares_uiCols_cols_0_8_4,xColsShares_uiCols_cols_0_8_3,
    xColsShares_uiCols_cols_0_8_2,xColsShares_uiCols_cols_0_8_1,xColsShares_uiCols_cols_0_8_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_4_1 = {xColsShares_uiCols_cols_1_8_4,xColsShares_uiCols_cols_1_8_3,
    xColsShares_uiCols_cols_1_8_2,xColsShares_uiCols_cols_1_8_1,xColsShares_uiCols_cols_1_8_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_4_2 = {xColsShares_uiCols_cols_2_8_4,xColsShares_uiCols_cols_2_8_3,
    xColsShares_uiCols_cols_2_8_2,xColsShares_uiCols_cols_2_8_1,xColsShares_uiCols_cols_2_8_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_4_3 = {xColsShares_uiCols_cols_3_8_4,xColsShares_uiCols_cols_3_8_3,
    xColsShares_uiCols_cols_3_8_2,xColsShares_uiCols_cols_3_8_1,xColsShares_uiCols_cols_3_8_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_4_4 = {xColsShares_uiCols_cols_4_8_4,xColsShares_uiCols_cols_4_8_3,
    xColsShares_uiCols_cols_4_8_2,xColsShares_uiCols_cols_4_8_1,xColsShares_uiCols_cols_4_8_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_4_0 = {xColsShares_uiCols_cols_0_9_4,xColsShares_uiCols_cols_0_9_3,
    xColsShares_uiCols_cols_0_9_2,xColsShares_uiCols_cols_0_9_1,xColsShares_uiCols_cols_0_9_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_4_1 = {xColsShares_uiCols_cols_1_9_4,xColsShares_uiCols_cols_1_9_3,
    xColsShares_uiCols_cols_1_9_2,xColsShares_uiCols_cols_1_9_1,xColsShares_uiCols_cols_1_9_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_4_2 = {xColsShares_uiCols_cols_2_9_4,xColsShares_uiCols_cols_2_9_3,
    xColsShares_uiCols_cols_2_9_2,xColsShares_uiCols_cols_2_9_1,xColsShares_uiCols_cols_2_9_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_4_3 = {xColsShares_uiCols_cols_3_9_4,xColsShares_uiCols_cols_3_9_3,
    xColsShares_uiCols_cols_3_9_2,xColsShares_uiCols_cols_3_9_1,xColsShares_uiCols_cols_3_9_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_4_4 = {xColsShares_uiCols_cols_4_9_4,xColsShares_uiCols_cols_4_9_3,
    xColsShares_uiCols_cols_4_9_2,xColsShares_uiCols_cols_4_9_1,xColsShares_uiCols_cols_4_9_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _regs_T_160 = ~xColsShares_0_4_1; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_161 = _regs_T_160 & xColsShares_0_4_2; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_163 = _regs_T_160 & xColsShares_1_4_2; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_164 = _regs_T_163 ^ xColsShares_0_4_0; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_165 = xColsShares_0_4_2 & xColsShares_1_4_1; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_166 = _regs_T_165 ^ xColsShares_1_4_0; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_167 = xColsShares_1_4_2 & xColsShares_1_4_1; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_20; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_20; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_20; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_20; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1174 = regs_0_20 ^ regs_1_20; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_168 = ~xColsShares_0_4_2; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_169 = _regs_T_168 & xColsShares_0_4_3; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_171 = _regs_T_168 & xColsShares_1_4_3; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_172 = _regs_T_171 ^ xColsShares_0_4_1; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_173 = xColsShares_0_4_3 & xColsShares_1_4_2; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_174 = _regs_T_173 ^ xColsShares_1_4_1; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_175 = xColsShares_1_4_3 & xColsShares_1_4_2; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_21; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_21; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_21; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_21; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1175 = regs_0_21 ^ regs_1_21; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_176 = ~xColsShares_0_4_3; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_177 = _regs_T_176 & xColsShares_0_4_4; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_179 = _regs_T_176 & xColsShares_1_4_4; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_180 = _regs_T_179 ^ xColsShares_0_4_2; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_181 = xColsShares_0_4_4 & xColsShares_1_4_3; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_182 = _regs_T_181 ^ xColsShares_1_4_2; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_183 = xColsShares_1_4_4 & xColsShares_1_4_3; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_22; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_22; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_22; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_22; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1176 = regs_0_22 ^ regs_1_22; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_184 = ~xColsShares_0_4_4; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_185 = _regs_T_184 & xColsShares_0_4_0; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_187 = _regs_T_184 & xColsShares_1_4_0; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_188 = _regs_T_187 ^ xColsShares_0_4_3; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_189 = xColsShares_0_4_0 & xColsShares_1_4_4; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_190 = _regs_T_189 ^ xColsShares_1_4_3; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_191 = xColsShares_1_4_0 & xColsShares_1_4_4; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_23; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_23; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_23; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_23; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1177 = regs_0_23 ^ regs_1_23; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_192 = ~xColsShares_0_4_0; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_193 = _regs_T_192 & xColsShares_0_4_1; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_195 = _regs_T_192 & xColsShares_1_4_1; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_196 = _regs_T_195 ^ xColsShares_0_4_4; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_197 = xColsShares_0_4_1 & xColsShares_1_4_0; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_198 = _regs_T_197 ^ xColsShares_1_4_4; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_199 = xColsShares_1_4_1 & xColsShares_1_4_0; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_24; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_24; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_24; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_24; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1178 = regs_0_24 ^ regs_1_24; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1179 = regs_2_20 ^ regs_3_20; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1180 = regs_2_21 ^ regs_3_21; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1181 = regs_2_22 ^ regs_3_22; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1182 = regs_2_23 ^ regs_3_23; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1183 = regs_2_24 ^ regs_3_24; // @[KeccakCore.scala 392:48]
  wire [4:0] xColsShares_0_5_0 = {xColsShares_uiCols_cols_0_10_4,xColsShares_uiCols_cols_0_10_3,
    xColsShares_uiCols_cols_0_10_2,xColsShares_uiCols_cols_0_10_1,xColsShares_uiCols_cols_0_10_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_5_1 = {xColsShares_uiCols_cols_1_10_4,xColsShares_uiCols_cols_1_10_3,
    xColsShares_uiCols_cols_1_10_2,xColsShares_uiCols_cols_1_10_1,xColsShares_uiCols_cols_1_10_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_5_2 = {xColsShares_uiCols_cols_2_10_4,xColsShares_uiCols_cols_2_10_3,
    xColsShares_uiCols_cols_2_10_2,xColsShares_uiCols_cols_2_10_1,xColsShares_uiCols_cols_2_10_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_5_3 = {xColsShares_uiCols_cols_3_10_4,xColsShares_uiCols_cols_3_10_3,
    xColsShares_uiCols_cols_3_10_2,xColsShares_uiCols_cols_3_10_1,xColsShares_uiCols_cols_3_10_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_5_4 = {xColsShares_uiCols_cols_4_10_4,xColsShares_uiCols_cols_4_10_3,
    xColsShares_uiCols_cols_4_10_2,xColsShares_uiCols_cols_4_10_1,xColsShares_uiCols_cols_4_10_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_5_0 = {xColsShares_uiCols_cols_0_11_4,xColsShares_uiCols_cols_0_11_3,
    xColsShares_uiCols_cols_0_11_2,xColsShares_uiCols_cols_0_11_1,xColsShares_uiCols_cols_0_11_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_5_1 = {xColsShares_uiCols_cols_1_11_4,xColsShares_uiCols_cols_1_11_3,
    xColsShares_uiCols_cols_1_11_2,xColsShares_uiCols_cols_1_11_1,xColsShares_uiCols_cols_1_11_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_5_2 = {xColsShares_uiCols_cols_2_11_4,xColsShares_uiCols_cols_2_11_3,
    xColsShares_uiCols_cols_2_11_2,xColsShares_uiCols_cols_2_11_1,xColsShares_uiCols_cols_2_11_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_5_3 = {xColsShares_uiCols_cols_3_11_4,xColsShares_uiCols_cols_3_11_3,
    xColsShares_uiCols_cols_3_11_2,xColsShares_uiCols_cols_3_11_1,xColsShares_uiCols_cols_3_11_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_5_4 = {xColsShares_uiCols_cols_4_11_4,xColsShares_uiCols_cols_4_11_3,
    xColsShares_uiCols_cols_4_11_2,xColsShares_uiCols_cols_4_11_1,xColsShares_uiCols_cols_4_11_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _regs_T_200 = ~xColsShares_0_5_1; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_201 = _regs_T_200 & xColsShares_0_5_2; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_203 = _regs_T_200 & xColsShares_1_5_2; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_204 = _regs_T_203 ^ xColsShares_0_5_0; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_205 = xColsShares_0_5_2 & xColsShares_1_5_1; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_206 = _regs_T_205 ^ xColsShares_1_5_0; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_207 = xColsShares_1_5_2 & xColsShares_1_5_1; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_25; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_25; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_25; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_25; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1234 = regs_0_25 ^ regs_1_25; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_208 = ~xColsShares_0_5_2; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_209 = _regs_T_208 & xColsShares_0_5_3; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_211 = _regs_T_208 & xColsShares_1_5_3; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_212 = _regs_T_211 ^ xColsShares_0_5_1; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_213 = xColsShares_0_5_3 & xColsShares_1_5_2; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_214 = _regs_T_213 ^ xColsShares_1_5_1; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_215 = xColsShares_1_5_3 & xColsShares_1_5_2; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_26; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_26; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_26; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_26; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1235 = regs_0_26 ^ regs_1_26; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_216 = ~xColsShares_0_5_3; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_217 = _regs_T_216 & xColsShares_0_5_4; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_219 = _regs_T_216 & xColsShares_1_5_4; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_220 = _regs_T_219 ^ xColsShares_0_5_2; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_221 = xColsShares_0_5_4 & xColsShares_1_5_3; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_222 = _regs_T_221 ^ xColsShares_1_5_2; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_223 = xColsShares_1_5_4 & xColsShares_1_5_3; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_27; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_27; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_27; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_27; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1236 = regs_0_27 ^ regs_1_27; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_224 = ~xColsShares_0_5_4; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_225 = _regs_T_224 & xColsShares_0_5_0; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_227 = _regs_T_224 & xColsShares_1_5_0; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_228 = _regs_T_227 ^ xColsShares_0_5_3; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_229 = xColsShares_0_5_0 & xColsShares_1_5_4; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_230 = _regs_T_229 ^ xColsShares_1_5_3; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_231 = xColsShares_1_5_0 & xColsShares_1_5_4; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_28; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_28; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_28; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_28; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1237 = regs_0_28 ^ regs_1_28; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_232 = ~xColsShares_0_5_0; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_233 = _regs_T_232 & xColsShares_0_5_1; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_235 = _regs_T_232 & xColsShares_1_5_1; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_236 = _regs_T_235 ^ xColsShares_0_5_4; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_237 = xColsShares_0_5_1 & xColsShares_1_5_0; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_238 = _regs_T_237 ^ xColsShares_1_5_4; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_239 = xColsShares_1_5_1 & xColsShares_1_5_0; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_29; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_29; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_29; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_29; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1238 = regs_0_29 ^ regs_1_29; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1239 = regs_2_25 ^ regs_3_25; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1240 = regs_2_26 ^ regs_3_26; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1241 = regs_2_27 ^ regs_3_27; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1242 = regs_2_28 ^ regs_3_28; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1243 = regs_2_29 ^ regs_3_29; // @[KeccakCore.scala 392:48]
  wire [4:0] xColsShares_0_6_0 = {xColsShares_uiCols_cols_0_12_4,xColsShares_uiCols_cols_0_12_3,
    xColsShares_uiCols_cols_0_12_2,xColsShares_uiCols_cols_0_12_1,xColsShares_uiCols_cols_0_12_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_6_1 = {xColsShares_uiCols_cols_1_12_4,xColsShares_uiCols_cols_1_12_3,
    xColsShares_uiCols_cols_1_12_2,xColsShares_uiCols_cols_1_12_1,xColsShares_uiCols_cols_1_12_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_6_2 = {xColsShares_uiCols_cols_2_12_4,xColsShares_uiCols_cols_2_12_3,
    xColsShares_uiCols_cols_2_12_2,xColsShares_uiCols_cols_2_12_1,xColsShares_uiCols_cols_2_12_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_6_3 = {xColsShares_uiCols_cols_3_12_4,xColsShares_uiCols_cols_3_12_3,
    xColsShares_uiCols_cols_3_12_2,xColsShares_uiCols_cols_3_12_1,xColsShares_uiCols_cols_3_12_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_6_4 = {xColsShares_uiCols_cols_4_12_4,xColsShares_uiCols_cols_4_12_3,
    xColsShares_uiCols_cols_4_12_2,xColsShares_uiCols_cols_4_12_1,xColsShares_uiCols_cols_4_12_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_6_0 = {xColsShares_uiCols_cols_0_13_4,xColsShares_uiCols_cols_0_13_3,
    xColsShares_uiCols_cols_0_13_2,xColsShares_uiCols_cols_0_13_1,xColsShares_uiCols_cols_0_13_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_6_1 = {xColsShares_uiCols_cols_1_13_4,xColsShares_uiCols_cols_1_13_3,
    xColsShares_uiCols_cols_1_13_2,xColsShares_uiCols_cols_1_13_1,xColsShares_uiCols_cols_1_13_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_6_2 = {xColsShares_uiCols_cols_2_13_4,xColsShares_uiCols_cols_2_13_3,
    xColsShares_uiCols_cols_2_13_2,xColsShares_uiCols_cols_2_13_1,xColsShares_uiCols_cols_2_13_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_6_3 = {xColsShares_uiCols_cols_3_13_4,xColsShares_uiCols_cols_3_13_3,
    xColsShares_uiCols_cols_3_13_2,xColsShares_uiCols_cols_3_13_1,xColsShares_uiCols_cols_3_13_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_6_4 = {xColsShares_uiCols_cols_4_13_4,xColsShares_uiCols_cols_4_13_3,
    xColsShares_uiCols_cols_4_13_2,xColsShares_uiCols_cols_4_13_1,xColsShares_uiCols_cols_4_13_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _regs_T_240 = ~xColsShares_0_6_1; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_241 = _regs_T_240 & xColsShares_0_6_2; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_243 = _regs_T_240 & xColsShares_1_6_2; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_244 = _regs_T_243 ^ xColsShares_0_6_0; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_245 = xColsShares_0_6_2 & xColsShares_1_6_1; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_246 = _regs_T_245 ^ xColsShares_1_6_0; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_247 = xColsShares_1_6_2 & xColsShares_1_6_1; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_30; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_30; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_30; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_30; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1294 = regs_0_30 ^ regs_1_30; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_248 = ~xColsShares_0_6_2; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_249 = _regs_T_248 & xColsShares_0_6_3; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_251 = _regs_T_248 & xColsShares_1_6_3; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_252 = _regs_T_251 ^ xColsShares_0_6_1; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_253 = xColsShares_0_6_3 & xColsShares_1_6_2; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_254 = _regs_T_253 ^ xColsShares_1_6_1; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_255 = xColsShares_1_6_3 & xColsShares_1_6_2; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_31; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_31; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_31; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_31; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1295 = regs_0_31 ^ regs_1_31; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_256 = ~xColsShares_0_6_3; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_257 = _regs_T_256 & xColsShares_0_6_4; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_259 = _regs_T_256 & xColsShares_1_6_4; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_260 = _regs_T_259 ^ xColsShares_0_6_2; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_261 = xColsShares_0_6_4 & xColsShares_1_6_3; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_262 = _regs_T_261 ^ xColsShares_1_6_2; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_263 = xColsShares_1_6_4 & xColsShares_1_6_3; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_32; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_32; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_32; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_32; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1296 = regs_0_32 ^ regs_1_32; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_264 = ~xColsShares_0_6_4; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_265 = _regs_T_264 & xColsShares_0_6_0; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_267 = _regs_T_264 & xColsShares_1_6_0; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_268 = _regs_T_267 ^ xColsShares_0_6_3; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_269 = xColsShares_0_6_0 & xColsShares_1_6_4; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_270 = _regs_T_269 ^ xColsShares_1_6_3; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_271 = xColsShares_1_6_0 & xColsShares_1_6_4; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_33; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_33; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_33; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_33; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1297 = regs_0_33 ^ regs_1_33; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_272 = ~xColsShares_0_6_0; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_273 = _regs_T_272 & xColsShares_0_6_1; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_275 = _regs_T_272 & xColsShares_1_6_1; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_276 = _regs_T_275 ^ xColsShares_0_6_4; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_277 = xColsShares_0_6_1 & xColsShares_1_6_0; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_278 = _regs_T_277 ^ xColsShares_1_6_4; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_279 = xColsShares_1_6_1 & xColsShares_1_6_0; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_34; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_34; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_34; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_34; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1298 = regs_0_34 ^ regs_1_34; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1299 = regs_2_30 ^ regs_3_30; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1300 = regs_2_31 ^ regs_3_31; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1301 = regs_2_32 ^ regs_3_32; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1302 = regs_2_33 ^ regs_3_33; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1303 = regs_2_34 ^ regs_3_34; // @[KeccakCore.scala 392:48]
  wire [4:0] xColsShares_0_7_0 = {xColsShares_uiCols_cols_0_14_4,xColsShares_uiCols_cols_0_14_3,
    xColsShares_uiCols_cols_0_14_2,xColsShares_uiCols_cols_0_14_1,xColsShares_uiCols_cols_0_14_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_7_1 = {xColsShares_uiCols_cols_1_14_4,xColsShares_uiCols_cols_1_14_3,
    xColsShares_uiCols_cols_1_14_2,xColsShares_uiCols_cols_1_14_1,xColsShares_uiCols_cols_1_14_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_7_2 = {xColsShares_uiCols_cols_2_14_4,xColsShares_uiCols_cols_2_14_3,
    xColsShares_uiCols_cols_2_14_2,xColsShares_uiCols_cols_2_14_1,xColsShares_uiCols_cols_2_14_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_7_3 = {xColsShares_uiCols_cols_3_14_4,xColsShares_uiCols_cols_3_14_3,
    xColsShares_uiCols_cols_3_14_2,xColsShares_uiCols_cols_3_14_1,xColsShares_uiCols_cols_3_14_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_0_7_4 = {xColsShares_uiCols_cols_4_14_4,xColsShares_uiCols_cols_4_14_3,
    xColsShares_uiCols_cols_4_14_2,xColsShares_uiCols_cols_4_14_1,xColsShares_uiCols_cols_4_14_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_7_0 = {xColsShares_uiCols_cols_0_15_4,xColsShares_uiCols_cols_0_15_3,
    xColsShares_uiCols_cols_0_15_2,xColsShares_uiCols_cols_0_15_1,xColsShares_uiCols_cols_0_15_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_7_1 = {xColsShares_uiCols_cols_1_15_4,xColsShares_uiCols_cols_1_15_3,
    xColsShares_uiCols_cols_1_15_2,xColsShares_uiCols_cols_1_15_1,xColsShares_uiCols_cols_1_15_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_7_2 = {xColsShares_uiCols_cols_2_15_4,xColsShares_uiCols_cols_2_15_3,
    xColsShares_uiCols_cols_2_15_2,xColsShares_uiCols_cols_2_15_1,xColsShares_uiCols_cols_2_15_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_7_3 = {xColsShares_uiCols_cols_3_15_4,xColsShares_uiCols_cols_3_15_3,
    xColsShares_uiCols_cols_3_15_2,xColsShares_uiCols_cols_3_15_1,xColsShares_uiCols_cols_3_15_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] xColsShares_1_7_4 = {xColsShares_uiCols_cols_4_15_4,xColsShares_uiCols_cols_4_15_3,
    xColsShares_uiCols_cols_4_15_2,xColsShares_uiCols_cols_4_15_1,xColsShares_uiCols_cols_4_15_0}; // @[KeccakCore.scala 283:59]
  wire [4:0] _regs_T_280 = ~xColsShares_0_7_1; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_281 = _regs_T_280 & xColsShares_0_7_2; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_283 = _regs_T_280 & xColsShares_1_7_2; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_284 = _regs_T_283 ^ xColsShares_0_7_0; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_285 = xColsShares_0_7_2 & xColsShares_1_7_1; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_286 = _regs_T_285 ^ xColsShares_1_7_0; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_287 = xColsShares_1_7_2 & xColsShares_1_7_1; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_35; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_35; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_35; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_35; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1354 = regs_0_35 ^ regs_1_35; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_288 = ~xColsShares_0_7_2; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_289 = _regs_T_288 & xColsShares_0_7_3; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_291 = _regs_T_288 & xColsShares_1_7_3; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_292 = _regs_T_291 ^ xColsShares_0_7_1; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_293 = xColsShares_0_7_3 & xColsShares_1_7_2; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_294 = _regs_T_293 ^ xColsShares_1_7_1; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_295 = xColsShares_1_7_3 & xColsShares_1_7_2; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_36; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_36; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_36; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_36; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1355 = regs_0_36 ^ regs_1_36; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_296 = ~xColsShares_0_7_3; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_297 = _regs_T_296 & xColsShares_0_7_4; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_299 = _regs_T_296 & xColsShares_1_7_4; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_300 = _regs_T_299 ^ xColsShares_0_7_2; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_301 = xColsShares_0_7_4 & xColsShares_1_7_3; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_302 = _regs_T_301 ^ xColsShares_1_7_2; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_303 = xColsShares_1_7_4 & xColsShares_1_7_3; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_37; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_37; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_37; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_37; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1356 = regs_0_37 ^ regs_1_37; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_304 = ~xColsShares_0_7_4; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_305 = _regs_T_304 & xColsShares_0_7_0; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_307 = _regs_T_304 & xColsShares_1_7_0; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_308 = _regs_T_307 ^ xColsShares_0_7_3; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_309 = xColsShares_0_7_0 & xColsShares_1_7_4; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_310 = _regs_T_309 ^ xColsShares_1_7_3; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_311 = xColsShares_1_7_0 & xColsShares_1_7_4; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_38; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_38; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_38; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_38; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1357 = regs_0_38 ^ regs_1_38; // @[KeccakCore.scala 392:48]
  wire [4:0] _regs_T_312 = ~xColsShares_0_7_0; // @[KeccakCore.scala 386:13]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_313 = _regs_T_312 & xColsShares_0_7_1; // @[KeccakCore.scala 386:17]
  wire [4:0] _regs_T_315 = _regs_T_312 & xColsShares_1_7_1; // @[KeccakCore.scala 387:18]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_316 = _regs_T_315 ^ xColsShares_0_7_4; // @[KeccakCore.scala 387:24]
  wire [4:0] _regs_T_317 = xColsShares_0_7_1 & xColsShares_1_7_0; // @[KeccakCore.scala 388:17]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_318 = _regs_T_317 ^ xColsShares_1_7_4; // @[KeccakCore.scala 388:23]
  (* DONT_TOUCH = "yes" *)
  wire [4:0] _regs_T_319 = xColsShares_1_7_1 & xColsShares_1_7_0; // @[KeccakCore.scala 389:16]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_0_39; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_1_39; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_2_39; // @[KeccakCore.scala 390:48]
  (* DONT_TOUCH = "yes" *)
  reg [4:0] regs_3_39; // @[KeccakCore.scala 390:48]
  wire [4:0] _T_1358 = regs_0_39 ^ regs_1_39; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1359 = regs_2_35 ^ regs_3_35; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1360 = regs_2_36 ^ regs_3_36; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1361 = regs_2_37 ^ regs_3_37; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1362 = regs_2_38 ^ regs_3_38; // @[KeccakCore.scala 392:48]
  wire [4:0] _T_1363 = regs_2_39 ^ regs_3_39; // @[KeccakCore.scala 392:48]
  wire [63:0] _GEN_64 = 5'h1 == roundCtr ? 64'h1 : 64'h0; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_65 = 5'h2 == roundCtr ? 64'h8082 : _GEN_64; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_66 = 5'h3 == roundCtr ? 64'h800000000000808a : _GEN_65; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_67 = 5'h4 == roundCtr ? 64'h8000000080008000 : _GEN_66; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_68 = 5'h5 == roundCtr ? 64'h808b : _GEN_67; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_69 = 5'h6 == roundCtr ? 64'h80000001 : _GEN_68; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_70 = 5'h7 == roundCtr ? 64'h8000000080008081 : _GEN_69; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_71 = 5'h8 == roundCtr ? 64'h8000000000008009 : _GEN_70; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_72 = 5'h9 == roundCtr ? 64'h8a : _GEN_71; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_73 = 5'ha == roundCtr ? 64'h88 : _GEN_72; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_74 = 5'hb == roundCtr ? 64'h80008009 : _GEN_73; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_75 = 5'hc == roundCtr ? 64'h8000000a : _GEN_74; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_76 = 5'hd == roundCtr ? 64'h8000808b : _GEN_75; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_77 = 5'he == roundCtr ? 64'h800000000000008b : _GEN_76; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_78 = 5'hf == roundCtr ? 64'h8000000000008089 : _GEN_77; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_79 = 5'h10 == roundCtr ? 64'h8000000000008003 : _GEN_78; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_80 = 5'h11 == roundCtr ? 64'h8000000000008002 : _GEN_79; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_81 = 5'h12 == roundCtr ? 64'h8000000000000080 : _GEN_80; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_82 = 5'h13 == roundCtr ? 64'h800a : _GEN_81; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_83 = 5'h14 == roundCtr ? 64'h800000008000000a : _GEN_82; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_84 = 5'h15 == roundCtr ? 64'h8000000080008081 : _GEN_83; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_85 = 5'h16 == roundCtr ? 64'h8000000000008080 : _GEN_84; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_86 = 5'h17 == roundCtr ? 64'h80000001 : _GEN_85; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _GEN_87 = 5'h18 == roundCtr ? 64'h8000000080008008 : _GEN_86; // @[KeccakCore.scala 417:43 KeccakCore.scala 417:43]
  wire [63:0] _rcBits_T_2 = {_GEN_87[55:0],_GEN_87[63:56]}; // @[KeccakCore.scala 417:43]
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
  wire  _GEN_96 = 3'h1 == shiftCtr[2:0] ? rcBits_1_0 : rcBits_0_0; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_97 = 3'h1 == shiftCtr[2:0] ? rcBits_1_1 : rcBits_0_1; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_98 = 3'h1 == shiftCtr[2:0] ? rcBits_1_2 : rcBits_0_2; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_99 = 3'h1 == shiftCtr[2:0] ? rcBits_1_3 : rcBits_0_3; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_100 = 3'h1 == shiftCtr[2:0] ? rcBits_1_4 : rcBits_0_4; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_101 = 3'h1 == shiftCtr[2:0] ? rcBits_1_5 : rcBits_0_5; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_102 = 3'h1 == shiftCtr[2:0] ? rcBits_1_6 : rcBits_0_6; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_103 = 3'h1 == shiftCtr[2:0] ? rcBits_1_7 : rcBits_0_7; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_104 = 3'h2 == shiftCtr[2:0] ? rcBits_2_0 : _GEN_96; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_105 = 3'h2 == shiftCtr[2:0] ? rcBits_2_1 : _GEN_97; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_106 = 3'h2 == shiftCtr[2:0] ? rcBits_2_2 : _GEN_98; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_107 = 3'h2 == shiftCtr[2:0] ? rcBits_2_3 : _GEN_99; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_108 = 3'h2 == shiftCtr[2:0] ? rcBits_2_4 : _GEN_100; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_109 = 3'h2 == shiftCtr[2:0] ? rcBits_2_5 : _GEN_101; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_110 = 3'h2 == shiftCtr[2:0] ? rcBits_2_6 : _GEN_102; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_111 = 3'h2 == shiftCtr[2:0] ? rcBits_2_7 : _GEN_103; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_112 = 3'h3 == shiftCtr[2:0] ? rcBits_3_0 : _GEN_104; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_113 = 3'h3 == shiftCtr[2:0] ? rcBits_3_1 : _GEN_105; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_114 = 3'h3 == shiftCtr[2:0] ? rcBits_3_2 : _GEN_106; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_115 = 3'h3 == shiftCtr[2:0] ? rcBits_3_3 : _GEN_107; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_116 = 3'h3 == shiftCtr[2:0] ? rcBits_3_4 : _GEN_108; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_117 = 3'h3 == shiftCtr[2:0] ? rcBits_3_5 : _GEN_109; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_118 = 3'h3 == shiftCtr[2:0] ? rcBits_3_6 : _GEN_110; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_119 = 3'h3 == shiftCtr[2:0] ? rcBits_3_7 : _GEN_111; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_120 = 3'h4 == shiftCtr[2:0] ? rcBits_4_0 : _GEN_112; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_121 = 3'h4 == shiftCtr[2:0] ? rcBits_4_1 : _GEN_113; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_122 = 3'h4 == shiftCtr[2:0] ? rcBits_4_2 : _GEN_114; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_123 = 3'h4 == shiftCtr[2:0] ? rcBits_4_3 : _GEN_115; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_124 = 3'h4 == shiftCtr[2:0] ? rcBits_4_4 : _GEN_116; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_125 = 3'h4 == shiftCtr[2:0] ? rcBits_4_5 : _GEN_117; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_126 = 3'h4 == shiftCtr[2:0] ? rcBits_4_6 : _GEN_118; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_127 = 3'h4 == shiftCtr[2:0] ? rcBits_4_7 : _GEN_119; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_128 = 3'h5 == shiftCtr[2:0] ? rcBits_5_0 : _GEN_120; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_129 = 3'h5 == shiftCtr[2:0] ? rcBits_5_1 : _GEN_121; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_130 = 3'h5 == shiftCtr[2:0] ? rcBits_5_2 : _GEN_122; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_131 = 3'h5 == shiftCtr[2:0] ? rcBits_5_3 : _GEN_123; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_132 = 3'h5 == shiftCtr[2:0] ? rcBits_5_4 : _GEN_124; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_133 = 3'h5 == shiftCtr[2:0] ? rcBits_5_5 : _GEN_125; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_134 = 3'h5 == shiftCtr[2:0] ? rcBits_5_6 : _GEN_126; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_135 = 3'h5 == shiftCtr[2:0] ? rcBits_5_7 : _GEN_127; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_136 = 3'h6 == shiftCtr[2:0] ? rcBits_6_0 : _GEN_128; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_137 = 3'h6 == shiftCtr[2:0] ? rcBits_6_1 : _GEN_129; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_138 = 3'h6 == shiftCtr[2:0] ? rcBits_6_2 : _GEN_130; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_139 = 3'h6 == shiftCtr[2:0] ? rcBits_6_3 : _GEN_131; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_140 = 3'h6 == shiftCtr[2:0] ? rcBits_6_4 : _GEN_132; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_141 = 3'h6 == shiftCtr[2:0] ? rcBits_6_5 : _GEN_133; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_142 = 3'h6 == shiftCtr[2:0] ? rcBits_6_6 : _GEN_134; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_143 = 3'h6 == shiftCtr[2:0] ? rcBits_6_7 : _GEN_135; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_144 = 3'h7 == shiftCtr[2:0] ? rcBits_7_0 : _GEN_136; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_145 = 3'h7 == shiftCtr[2:0] ? rcBits_7_1 : _GEN_137; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_146 = 3'h7 == shiftCtr[2:0] ? rcBits_7_2 : _GEN_138; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_147 = 3'h7 == shiftCtr[2:0] ? rcBits_7_3 : _GEN_139; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_148 = 3'h7 == shiftCtr[2:0] ? rcBits_7_4 : _GEN_140; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_149 = 3'h7 == shiftCtr[2:0] ? rcBits_7_5 : _GEN_141; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_150 = 3'h7 == shiftCtr[2:0] ? rcBits_7_6 : _GEN_142; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _GEN_151 = 3'h7 == shiftCtr[2:0] ? rcBits_7_7 : _GEN_143; // @[KeccakCore.scala 423:58 KeccakCore.scala 423:58]
  wire  _T_1415 = _T_934[0] ^ _GEN_144; // @[KeccakCore.scala 423:58]
  wire  _T_1416 = _T_994[0] ^ _GEN_145; // @[KeccakCore.scala 423:58]
  wire  _T_1417 = _T_1054[0] ^ _GEN_146; // @[KeccakCore.scala 423:58]
  wire  _T_1418 = _T_1114[0] ^ _GEN_147; // @[KeccakCore.scala 423:58]
  wire  _T_1419 = _T_1174[0] ^ _GEN_148; // @[KeccakCore.scala 423:58]
  wire  _T_1420 = _T_1234[0] ^ _GEN_149; // @[KeccakCore.scala 423:58]
  wire  _T_1421 = _T_1294[0] ^ _GEN_150; // @[KeccakCore.scala 423:58]
  wire  _T_1422 = _T_1354[0] ^ _GEN_151; // @[KeccakCore.scala 423:58]
  wire  nextParity_cols_0__0 = zerothRound ? xColsShares_uiCols_cols_0__0 : _T_1415; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__0 = zerothRound ? xColsShares_uiCols_cols_0__2 : _T_935[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__0 = zerothRound ? xColsShares_uiCols_cols_0__4 : _T_936[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__0 = zerothRound ? xColsShares_uiCols_cols_0__1 : _T_937[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__0 = zerothRound ? xColsShares_uiCols_cols_0__3 : _T_938[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0__1 = zerothRound ? xColsShares_uiCols_cols_1__3 : _T_934[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__1 = zerothRound ? xColsShares_uiCols_cols_1__0 : _T_935[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__1 = zerothRound ? xColsShares_uiCols_cols_1__2 : _T_936[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__1 = zerothRound ? xColsShares_uiCols_cols_1__4 : _T_937[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__1 = zerothRound ? xColsShares_uiCols_cols_1__1 : _T_938[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0__2 = zerothRound ? xColsShares_uiCols_cols_2__1 : _T_934[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__2 = zerothRound ? xColsShares_uiCols_cols_2__3 : _T_935[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__2 = zerothRound ? xColsShares_uiCols_cols_2__0 : _T_936[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__2 = zerothRound ? xColsShares_uiCols_cols_2__2 : _T_937[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__2 = zerothRound ? xColsShares_uiCols_cols_2__4 : _T_938[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0__3 = zerothRound ? xColsShares_uiCols_cols_3__4 : _T_934[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__3 = zerothRound ? xColsShares_uiCols_cols_3__1 : _T_935[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__3 = zerothRound ? xColsShares_uiCols_cols_3__3 : _T_936[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__3 = zerothRound ? xColsShares_uiCols_cols_3__0 : _T_937[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__3 = zerothRound ? xColsShares_uiCols_cols_3__2 : _T_938[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0__4 = zerothRound ? xColsShares_uiCols_cols_4__2 : _T_934[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1__4 = zerothRound ? xColsShares_uiCols_cols_4__4 : _T_935[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2__4 = zerothRound ? xColsShares_uiCols_cols_4__1 : _T_936[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3__4 = zerothRound ? xColsShares_uiCols_cols_4__3 : _T_937[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4__4 = zerothRound ? xColsShares_uiCols_cols_4__0 : _T_938[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_0 = zerothRound ? xColsShares_uiCols_cols_0_2_0 : _T_1416; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_0 = zerothRound ? xColsShares_uiCols_cols_0_2_2 : _T_995[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_0 = zerothRound ? xColsShares_uiCols_cols_0_2_4 : _T_996[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_0 = zerothRound ? xColsShares_uiCols_cols_0_2_1 : _T_997[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_0 = zerothRound ? xColsShares_uiCols_cols_0_2_3 : _T_998[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_1 = zerothRound ? xColsShares_uiCols_cols_1_2_3 : _T_994[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_1 = zerothRound ? xColsShares_uiCols_cols_1_2_0 : _T_995[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_1 = zerothRound ? xColsShares_uiCols_cols_1_2_2 : _T_996[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_1 = zerothRound ? xColsShares_uiCols_cols_1_2_4 : _T_997[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_1 = zerothRound ? xColsShares_uiCols_cols_1_2_1 : _T_998[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_2 = zerothRound ? xColsShares_uiCols_cols_2_2_1 : _T_994[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_2 = zerothRound ? xColsShares_uiCols_cols_2_2_3 : _T_995[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_2 = zerothRound ? xColsShares_uiCols_cols_2_2_0 : _T_996[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_2 = zerothRound ? xColsShares_uiCols_cols_2_2_2 : _T_997[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_2 = zerothRound ? xColsShares_uiCols_cols_2_2_4 : _T_998[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_3 = zerothRound ? xColsShares_uiCols_cols_3_2_4 : _T_994[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_3 = zerothRound ? xColsShares_uiCols_cols_3_2_1 : _T_995[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_3 = zerothRound ? xColsShares_uiCols_cols_3_2_3 : _T_996[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_3 = zerothRound ? xColsShares_uiCols_cols_3_2_0 : _T_997[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_3 = zerothRound ? xColsShares_uiCols_cols_3_2_2 : _T_998[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_1_4 = zerothRound ? xColsShares_uiCols_cols_4_2_2 : _T_994[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_1_4 = zerothRound ? xColsShares_uiCols_cols_4_2_4 : _T_995[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_1_4 = zerothRound ? xColsShares_uiCols_cols_4_2_1 : _T_996[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_1_4 = zerothRound ? xColsShares_uiCols_cols_4_2_3 : _T_997[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_1_4 = zerothRound ? xColsShares_uiCols_cols_4_2_0 : _T_998[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_0 = zerothRound ? xColsShares_uiCols_cols_0_4_0 : _T_1417; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_0 = zerothRound ? xColsShares_uiCols_cols_0_4_2 : _T_1055[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_0 = zerothRound ? xColsShares_uiCols_cols_0_4_4 : _T_1056[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_0 = zerothRound ? xColsShares_uiCols_cols_0_4_1 : _T_1057[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_0 = zerothRound ? xColsShares_uiCols_cols_0_4_3 : _T_1058[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_1 = zerothRound ? xColsShares_uiCols_cols_1_4_3 : _T_1054[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_1 = zerothRound ? xColsShares_uiCols_cols_1_4_0 : _T_1055[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_1 = zerothRound ? xColsShares_uiCols_cols_1_4_2 : _T_1056[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_1 = zerothRound ? xColsShares_uiCols_cols_1_4_4 : _T_1057[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_1 = zerothRound ? xColsShares_uiCols_cols_1_4_1 : _T_1058[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_2 = zerothRound ? xColsShares_uiCols_cols_2_4_1 : _T_1054[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_2 = zerothRound ? xColsShares_uiCols_cols_2_4_3 : _T_1055[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_2 = zerothRound ? xColsShares_uiCols_cols_2_4_0 : _T_1056[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_2 = zerothRound ? xColsShares_uiCols_cols_2_4_2 : _T_1057[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_2 = zerothRound ? xColsShares_uiCols_cols_2_4_4 : _T_1058[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_3 = zerothRound ? xColsShares_uiCols_cols_3_4_4 : _T_1054[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_3 = zerothRound ? xColsShares_uiCols_cols_3_4_1 : _T_1055[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_3 = zerothRound ? xColsShares_uiCols_cols_3_4_3 : _T_1056[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_3 = zerothRound ? xColsShares_uiCols_cols_3_4_0 : _T_1057[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_3 = zerothRound ? xColsShares_uiCols_cols_3_4_2 : _T_1058[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_2_4 = zerothRound ? xColsShares_uiCols_cols_4_4_2 : _T_1054[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_2_4 = zerothRound ? xColsShares_uiCols_cols_4_4_4 : _T_1055[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_2_4 = zerothRound ? xColsShares_uiCols_cols_4_4_1 : _T_1056[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_2_4 = zerothRound ? xColsShares_uiCols_cols_4_4_3 : _T_1057[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_2_4 = zerothRound ? xColsShares_uiCols_cols_4_4_0 : _T_1058[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_0 = zerothRound ? xColsShares_uiCols_cols_0_6_0 : _T_1418; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_0 = zerothRound ? xColsShares_uiCols_cols_0_6_2 : _T_1115[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_0 = zerothRound ? xColsShares_uiCols_cols_0_6_4 : _T_1116[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_0 = zerothRound ? xColsShares_uiCols_cols_0_6_1 : _T_1117[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_0 = zerothRound ? xColsShares_uiCols_cols_0_6_3 : _T_1118[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_1 = zerothRound ? xColsShares_uiCols_cols_1_6_3 : _T_1114[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_1 = zerothRound ? xColsShares_uiCols_cols_1_6_0 : _T_1115[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_1 = zerothRound ? xColsShares_uiCols_cols_1_6_2 : _T_1116[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_1 = zerothRound ? xColsShares_uiCols_cols_1_6_4 : _T_1117[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_1 = zerothRound ? xColsShares_uiCols_cols_1_6_1 : _T_1118[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_2 = zerothRound ? xColsShares_uiCols_cols_2_6_1 : _T_1114[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_2 = zerothRound ? xColsShares_uiCols_cols_2_6_3 : _T_1115[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_2 = zerothRound ? xColsShares_uiCols_cols_2_6_0 : _T_1116[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_2 = zerothRound ? xColsShares_uiCols_cols_2_6_2 : _T_1117[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_2 = zerothRound ? xColsShares_uiCols_cols_2_6_4 : _T_1118[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_3 = zerothRound ? xColsShares_uiCols_cols_3_6_4 : _T_1114[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_3 = zerothRound ? xColsShares_uiCols_cols_3_6_1 : _T_1115[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_3 = zerothRound ? xColsShares_uiCols_cols_3_6_3 : _T_1116[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_3 = zerothRound ? xColsShares_uiCols_cols_3_6_0 : _T_1117[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_3 = zerothRound ? xColsShares_uiCols_cols_3_6_2 : _T_1118[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_3_4 = zerothRound ? xColsShares_uiCols_cols_4_6_2 : _T_1114[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_3_4 = zerothRound ? xColsShares_uiCols_cols_4_6_4 : _T_1115[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_3_4 = zerothRound ? xColsShares_uiCols_cols_4_6_1 : _T_1116[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_3_4 = zerothRound ? xColsShares_uiCols_cols_4_6_3 : _T_1117[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_3_4 = zerothRound ? xColsShares_uiCols_cols_4_6_0 : _T_1118[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_0 = zerothRound ? xColsShares_uiCols_cols_0_8_0 : _T_1419; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_0 = zerothRound ? xColsShares_uiCols_cols_0_8_2 : _T_1175[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_0 = zerothRound ? xColsShares_uiCols_cols_0_8_4 : _T_1176[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_0 = zerothRound ? xColsShares_uiCols_cols_0_8_1 : _T_1177[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_0 = zerothRound ? xColsShares_uiCols_cols_0_8_3 : _T_1178[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_1 = zerothRound ? xColsShares_uiCols_cols_1_8_3 : _T_1174[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_1 = zerothRound ? xColsShares_uiCols_cols_1_8_0 : _T_1175[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_1 = zerothRound ? xColsShares_uiCols_cols_1_8_2 : _T_1176[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_1 = zerothRound ? xColsShares_uiCols_cols_1_8_4 : _T_1177[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_1 = zerothRound ? xColsShares_uiCols_cols_1_8_1 : _T_1178[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_2 = zerothRound ? xColsShares_uiCols_cols_2_8_1 : _T_1174[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_2 = zerothRound ? xColsShares_uiCols_cols_2_8_3 : _T_1175[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_2 = zerothRound ? xColsShares_uiCols_cols_2_8_0 : _T_1176[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_2 = zerothRound ? xColsShares_uiCols_cols_2_8_2 : _T_1177[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_2 = zerothRound ? xColsShares_uiCols_cols_2_8_4 : _T_1178[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_3 = zerothRound ? xColsShares_uiCols_cols_3_8_4 : _T_1174[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_3 = zerothRound ? xColsShares_uiCols_cols_3_8_1 : _T_1175[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_3 = zerothRound ? xColsShares_uiCols_cols_3_8_3 : _T_1176[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_3 = zerothRound ? xColsShares_uiCols_cols_3_8_0 : _T_1177[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_3 = zerothRound ? xColsShares_uiCols_cols_3_8_2 : _T_1178[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_4_4 = zerothRound ? xColsShares_uiCols_cols_4_8_2 : _T_1174[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_4_4 = zerothRound ? xColsShares_uiCols_cols_4_8_4 : _T_1175[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_4_4 = zerothRound ? xColsShares_uiCols_cols_4_8_1 : _T_1176[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_4_4 = zerothRound ? xColsShares_uiCols_cols_4_8_3 : _T_1177[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_4_4 = zerothRound ? xColsShares_uiCols_cols_4_8_0 : _T_1178[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_0 = zerothRound ? xColsShares_uiCols_cols_0_10_0 : _T_1420; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_0 = zerothRound ? xColsShares_uiCols_cols_0_10_2 : _T_1235[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_0 = zerothRound ? xColsShares_uiCols_cols_0_10_4 : _T_1236[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_0 = zerothRound ? xColsShares_uiCols_cols_0_10_1 : _T_1237[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_0 = zerothRound ? xColsShares_uiCols_cols_0_10_3 : _T_1238[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_1 = zerothRound ? xColsShares_uiCols_cols_1_10_3 : _T_1234[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_1 = zerothRound ? xColsShares_uiCols_cols_1_10_0 : _T_1235[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_1 = zerothRound ? xColsShares_uiCols_cols_1_10_2 : _T_1236[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_1 = zerothRound ? xColsShares_uiCols_cols_1_10_4 : _T_1237[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_1 = zerothRound ? xColsShares_uiCols_cols_1_10_1 : _T_1238[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_2 = zerothRound ? xColsShares_uiCols_cols_2_10_1 : _T_1234[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_2 = zerothRound ? xColsShares_uiCols_cols_2_10_3 : _T_1235[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_2 = zerothRound ? xColsShares_uiCols_cols_2_10_0 : _T_1236[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_2 = zerothRound ? xColsShares_uiCols_cols_2_10_2 : _T_1237[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_2 = zerothRound ? xColsShares_uiCols_cols_2_10_4 : _T_1238[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_3 = zerothRound ? xColsShares_uiCols_cols_3_10_4 : _T_1234[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_3 = zerothRound ? xColsShares_uiCols_cols_3_10_1 : _T_1235[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_3 = zerothRound ? xColsShares_uiCols_cols_3_10_3 : _T_1236[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_3 = zerothRound ? xColsShares_uiCols_cols_3_10_0 : _T_1237[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_3 = zerothRound ? xColsShares_uiCols_cols_3_10_2 : _T_1238[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_5_4 = zerothRound ? xColsShares_uiCols_cols_4_10_2 : _T_1234[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_5_4 = zerothRound ? xColsShares_uiCols_cols_4_10_4 : _T_1235[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_5_4 = zerothRound ? xColsShares_uiCols_cols_4_10_1 : _T_1236[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_5_4 = zerothRound ? xColsShares_uiCols_cols_4_10_3 : _T_1237[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_5_4 = zerothRound ? xColsShares_uiCols_cols_4_10_0 : _T_1238[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_0 = zerothRound ? xColsShares_uiCols_cols_0_12_0 : _T_1421; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_0 = zerothRound ? xColsShares_uiCols_cols_0_12_2 : _T_1295[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_0 = zerothRound ? xColsShares_uiCols_cols_0_12_4 : _T_1296[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_0 = zerothRound ? xColsShares_uiCols_cols_0_12_1 : _T_1297[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_0 = zerothRound ? xColsShares_uiCols_cols_0_12_3 : _T_1298[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_1 = zerothRound ? xColsShares_uiCols_cols_1_12_3 : _T_1294[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_1 = zerothRound ? xColsShares_uiCols_cols_1_12_0 : _T_1295[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_1 = zerothRound ? xColsShares_uiCols_cols_1_12_2 : _T_1296[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_1 = zerothRound ? xColsShares_uiCols_cols_1_12_4 : _T_1297[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_1 = zerothRound ? xColsShares_uiCols_cols_1_12_1 : _T_1298[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_2 = zerothRound ? xColsShares_uiCols_cols_2_12_1 : _T_1294[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_2 = zerothRound ? xColsShares_uiCols_cols_2_12_3 : _T_1295[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_2 = zerothRound ? xColsShares_uiCols_cols_2_12_0 : _T_1296[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_2 = zerothRound ? xColsShares_uiCols_cols_2_12_2 : _T_1297[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_2 = zerothRound ? xColsShares_uiCols_cols_2_12_4 : _T_1298[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_3 = zerothRound ? xColsShares_uiCols_cols_3_12_4 : _T_1294[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_3 = zerothRound ? xColsShares_uiCols_cols_3_12_1 : _T_1295[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_3 = zerothRound ? xColsShares_uiCols_cols_3_12_3 : _T_1296[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_3 = zerothRound ? xColsShares_uiCols_cols_3_12_0 : _T_1297[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_3 = zerothRound ? xColsShares_uiCols_cols_3_12_2 : _T_1298[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_6_4 = zerothRound ? xColsShares_uiCols_cols_4_12_2 : _T_1294[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_6_4 = zerothRound ? xColsShares_uiCols_cols_4_12_4 : _T_1295[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_6_4 = zerothRound ? xColsShares_uiCols_cols_4_12_1 : _T_1296[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_6_4 = zerothRound ? xColsShares_uiCols_cols_4_12_3 : _T_1297[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_6_4 = zerothRound ? xColsShares_uiCols_cols_4_12_0 : _T_1298[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_0 = zerothRound ? xColsShares_uiCols_cols_0_14_0 : _T_1422; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_0 = zerothRound ? xColsShares_uiCols_cols_0_14_2 : _T_1355[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_0 = zerothRound ? xColsShares_uiCols_cols_0_14_4 : _T_1356[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_0 = zerothRound ? xColsShares_uiCols_cols_0_14_1 : _T_1357[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_0 = zerothRound ? xColsShares_uiCols_cols_0_14_3 : _T_1358[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_1 = zerothRound ? xColsShares_uiCols_cols_1_14_3 : _T_1354[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_1 = zerothRound ? xColsShares_uiCols_cols_1_14_0 : _T_1355[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_1 = zerothRound ? xColsShares_uiCols_cols_1_14_2 : _T_1356[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_1 = zerothRound ? xColsShares_uiCols_cols_1_14_4 : _T_1357[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_1 = zerothRound ? xColsShares_uiCols_cols_1_14_1 : _T_1358[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_2 = zerothRound ? xColsShares_uiCols_cols_2_14_1 : _T_1354[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_2 = zerothRound ? xColsShares_uiCols_cols_2_14_3 : _T_1355[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_2 = zerothRound ? xColsShares_uiCols_cols_2_14_0 : _T_1356[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_2 = zerothRound ? xColsShares_uiCols_cols_2_14_2 : _T_1357[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_2 = zerothRound ? xColsShares_uiCols_cols_2_14_4 : _T_1358[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_3 = zerothRound ? xColsShares_uiCols_cols_3_14_4 : _T_1354[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_3 = zerothRound ? xColsShares_uiCols_cols_3_14_1 : _T_1355[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_3 = zerothRound ? xColsShares_uiCols_cols_3_14_3 : _T_1356[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_3 = zerothRound ? xColsShares_uiCols_cols_3_14_0 : _T_1357[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_3 = zerothRound ? xColsShares_uiCols_cols_3_14_2 : _T_1358[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_7_4 = zerothRound ? xColsShares_uiCols_cols_4_14_2 : _T_1354[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_7_4 = zerothRound ? xColsShares_uiCols_cols_4_14_4 : _T_1355[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_7_4 = zerothRound ? xColsShares_uiCols_cols_4_14_1 : _T_1356[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_7_4 = zerothRound ? xColsShares_uiCols_cols_4_14_3 : _T_1357[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_7_4 = zerothRound ? xColsShares_uiCols_cols_4_14_0 : _T_1358[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_8_0 = zerothRound ? xColsShares_uiCols_cols_0_1_0 : _T_939[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_8_0 = zerothRound ? xColsShares_uiCols_cols_0_1_2 : _T_940[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_8_0 = zerothRound ? xColsShares_uiCols_cols_0_1_4 : _T_941[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_8_0 = zerothRound ? xColsShares_uiCols_cols_0_1_1 : _T_942[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_8_0 = zerothRound ? xColsShares_uiCols_cols_0_1_3 : _T_943[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_8_1 = zerothRound ? xColsShares_uiCols_cols_1_1_3 : _T_939[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_8_1 = zerothRound ? xColsShares_uiCols_cols_1_1_0 : _T_940[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_8_1 = zerothRound ? xColsShares_uiCols_cols_1_1_2 : _T_941[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_8_1 = zerothRound ? xColsShares_uiCols_cols_1_1_4 : _T_942[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_8_1 = zerothRound ? xColsShares_uiCols_cols_1_1_1 : _T_943[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_8_2 = zerothRound ? xColsShares_uiCols_cols_2_1_1 : _T_939[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_8_2 = zerothRound ? xColsShares_uiCols_cols_2_1_3 : _T_940[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_8_2 = zerothRound ? xColsShares_uiCols_cols_2_1_0 : _T_941[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_8_2 = zerothRound ? xColsShares_uiCols_cols_2_1_2 : _T_942[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_8_2 = zerothRound ? xColsShares_uiCols_cols_2_1_4 : _T_943[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_8_3 = zerothRound ? xColsShares_uiCols_cols_3_1_4 : _T_939[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_8_3 = zerothRound ? xColsShares_uiCols_cols_3_1_1 : _T_940[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_8_3 = zerothRound ? xColsShares_uiCols_cols_3_1_3 : _T_941[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_8_3 = zerothRound ? xColsShares_uiCols_cols_3_1_0 : _T_942[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_8_3 = zerothRound ? xColsShares_uiCols_cols_3_1_2 : _T_943[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_8_4 = zerothRound ? xColsShares_uiCols_cols_4_1_2 : _T_939[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_8_4 = zerothRound ? xColsShares_uiCols_cols_4_1_4 : _T_940[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_8_4 = zerothRound ? xColsShares_uiCols_cols_4_1_1 : _T_941[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_8_4 = zerothRound ? xColsShares_uiCols_cols_4_1_3 : _T_942[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_8_4 = zerothRound ? xColsShares_uiCols_cols_4_1_0 : _T_943[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_9_0 = zerothRound ? xColsShares_uiCols_cols_0_3_0 : _T_999[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_9_0 = zerothRound ? xColsShares_uiCols_cols_0_3_2 : _T_1000[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_9_0 = zerothRound ? xColsShares_uiCols_cols_0_3_4 : _T_1001[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_9_0 = zerothRound ? xColsShares_uiCols_cols_0_3_1 : _T_1002[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_9_0 = zerothRound ? xColsShares_uiCols_cols_0_3_3 : _T_1003[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_9_1 = zerothRound ? xColsShares_uiCols_cols_1_3_3 : _T_999[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_9_1 = zerothRound ? xColsShares_uiCols_cols_1_3_0 : _T_1000[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_9_1 = zerothRound ? xColsShares_uiCols_cols_1_3_2 : _T_1001[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_9_1 = zerothRound ? xColsShares_uiCols_cols_1_3_4 : _T_1002[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_9_1 = zerothRound ? xColsShares_uiCols_cols_1_3_1 : _T_1003[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_9_2 = zerothRound ? xColsShares_uiCols_cols_2_3_1 : _T_999[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_9_2 = zerothRound ? xColsShares_uiCols_cols_2_3_3 : _T_1000[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_9_2 = zerothRound ? xColsShares_uiCols_cols_2_3_0 : _T_1001[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_9_2 = zerothRound ? xColsShares_uiCols_cols_2_3_2 : _T_1002[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_9_2 = zerothRound ? xColsShares_uiCols_cols_2_3_4 : _T_1003[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_9_3 = zerothRound ? xColsShares_uiCols_cols_3_3_4 : _T_999[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_9_3 = zerothRound ? xColsShares_uiCols_cols_3_3_1 : _T_1000[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_9_3 = zerothRound ? xColsShares_uiCols_cols_3_3_3 : _T_1001[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_9_3 = zerothRound ? xColsShares_uiCols_cols_3_3_0 : _T_1002[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_9_3 = zerothRound ? xColsShares_uiCols_cols_3_3_2 : _T_1003[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_9_4 = zerothRound ? xColsShares_uiCols_cols_4_3_2 : _T_999[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_9_4 = zerothRound ? xColsShares_uiCols_cols_4_3_4 : _T_1000[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_9_4 = zerothRound ? xColsShares_uiCols_cols_4_3_1 : _T_1001[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_9_4 = zerothRound ? xColsShares_uiCols_cols_4_3_3 : _T_1002[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_9_4 = zerothRound ? xColsShares_uiCols_cols_4_3_0 : _T_1003[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_10_0 = zerothRound ? xColsShares_uiCols_cols_0_5_0 : _T_1059[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_10_0 = zerothRound ? xColsShares_uiCols_cols_0_5_2 : _T_1060[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_10_0 = zerothRound ? xColsShares_uiCols_cols_0_5_4 : _T_1061[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_10_0 = zerothRound ? xColsShares_uiCols_cols_0_5_1 : _T_1062[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_10_0 = zerothRound ? xColsShares_uiCols_cols_0_5_3 : _T_1063[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_10_1 = zerothRound ? xColsShares_uiCols_cols_1_5_3 : _T_1059[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_10_1 = zerothRound ? xColsShares_uiCols_cols_1_5_0 : _T_1060[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_10_1 = zerothRound ? xColsShares_uiCols_cols_1_5_2 : _T_1061[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_10_1 = zerothRound ? xColsShares_uiCols_cols_1_5_4 : _T_1062[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_10_1 = zerothRound ? xColsShares_uiCols_cols_1_5_1 : _T_1063[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_10_2 = zerothRound ? xColsShares_uiCols_cols_2_5_1 : _T_1059[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_10_2 = zerothRound ? xColsShares_uiCols_cols_2_5_3 : _T_1060[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_10_2 = zerothRound ? xColsShares_uiCols_cols_2_5_0 : _T_1061[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_10_2 = zerothRound ? xColsShares_uiCols_cols_2_5_2 : _T_1062[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_10_2 = zerothRound ? xColsShares_uiCols_cols_2_5_4 : _T_1063[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_10_3 = zerothRound ? xColsShares_uiCols_cols_3_5_4 : _T_1059[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_10_3 = zerothRound ? xColsShares_uiCols_cols_3_5_1 : _T_1060[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_10_3 = zerothRound ? xColsShares_uiCols_cols_3_5_3 : _T_1061[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_10_3 = zerothRound ? xColsShares_uiCols_cols_3_5_0 : _T_1062[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_10_3 = zerothRound ? xColsShares_uiCols_cols_3_5_2 : _T_1063[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_10_4 = zerothRound ? xColsShares_uiCols_cols_4_5_2 : _T_1059[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_10_4 = zerothRound ? xColsShares_uiCols_cols_4_5_4 : _T_1060[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_10_4 = zerothRound ? xColsShares_uiCols_cols_4_5_1 : _T_1061[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_10_4 = zerothRound ? xColsShares_uiCols_cols_4_5_3 : _T_1062[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_10_4 = zerothRound ? xColsShares_uiCols_cols_4_5_0 : _T_1063[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_11_0 = zerothRound ? xColsShares_uiCols_cols_0_7_0 : _T_1119[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_11_0 = zerothRound ? xColsShares_uiCols_cols_0_7_2 : _T_1120[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_11_0 = zerothRound ? xColsShares_uiCols_cols_0_7_4 : _T_1121[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_11_0 = zerothRound ? xColsShares_uiCols_cols_0_7_1 : _T_1122[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_11_0 = zerothRound ? xColsShares_uiCols_cols_0_7_3 : _T_1123[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_11_1 = zerothRound ? xColsShares_uiCols_cols_1_7_3 : _T_1119[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_11_1 = zerothRound ? xColsShares_uiCols_cols_1_7_0 : _T_1120[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_11_1 = zerothRound ? xColsShares_uiCols_cols_1_7_2 : _T_1121[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_11_1 = zerothRound ? xColsShares_uiCols_cols_1_7_4 : _T_1122[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_11_1 = zerothRound ? xColsShares_uiCols_cols_1_7_1 : _T_1123[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_11_2 = zerothRound ? xColsShares_uiCols_cols_2_7_1 : _T_1119[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_11_2 = zerothRound ? xColsShares_uiCols_cols_2_7_3 : _T_1120[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_11_2 = zerothRound ? xColsShares_uiCols_cols_2_7_0 : _T_1121[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_11_2 = zerothRound ? xColsShares_uiCols_cols_2_7_2 : _T_1122[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_11_2 = zerothRound ? xColsShares_uiCols_cols_2_7_4 : _T_1123[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_11_3 = zerothRound ? xColsShares_uiCols_cols_3_7_4 : _T_1119[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_11_3 = zerothRound ? xColsShares_uiCols_cols_3_7_1 : _T_1120[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_11_3 = zerothRound ? xColsShares_uiCols_cols_3_7_3 : _T_1121[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_11_3 = zerothRound ? xColsShares_uiCols_cols_3_7_0 : _T_1122[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_11_3 = zerothRound ? xColsShares_uiCols_cols_3_7_2 : _T_1123[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_11_4 = zerothRound ? xColsShares_uiCols_cols_4_7_2 : _T_1119[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_11_4 = zerothRound ? xColsShares_uiCols_cols_4_7_4 : _T_1120[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_11_4 = zerothRound ? xColsShares_uiCols_cols_4_7_1 : _T_1121[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_11_4 = zerothRound ? xColsShares_uiCols_cols_4_7_3 : _T_1122[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_11_4 = zerothRound ? xColsShares_uiCols_cols_4_7_0 : _T_1123[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_12_0 = zerothRound ? xColsShares_uiCols_cols_0_9_0 : _T_1179[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_12_0 = zerothRound ? xColsShares_uiCols_cols_0_9_2 : _T_1180[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_12_0 = zerothRound ? xColsShares_uiCols_cols_0_9_4 : _T_1181[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_12_0 = zerothRound ? xColsShares_uiCols_cols_0_9_1 : _T_1182[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_12_0 = zerothRound ? xColsShares_uiCols_cols_0_9_3 : _T_1183[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_12_1 = zerothRound ? xColsShares_uiCols_cols_1_9_3 : _T_1179[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_12_1 = zerothRound ? xColsShares_uiCols_cols_1_9_0 : _T_1180[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_12_1 = zerothRound ? xColsShares_uiCols_cols_1_9_2 : _T_1181[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_12_1 = zerothRound ? xColsShares_uiCols_cols_1_9_4 : _T_1182[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_12_1 = zerothRound ? xColsShares_uiCols_cols_1_9_1 : _T_1183[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_12_2 = zerothRound ? xColsShares_uiCols_cols_2_9_1 : _T_1179[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_12_2 = zerothRound ? xColsShares_uiCols_cols_2_9_3 : _T_1180[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_12_2 = zerothRound ? xColsShares_uiCols_cols_2_9_0 : _T_1181[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_12_2 = zerothRound ? xColsShares_uiCols_cols_2_9_2 : _T_1182[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_12_2 = zerothRound ? xColsShares_uiCols_cols_2_9_4 : _T_1183[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_12_3 = zerothRound ? xColsShares_uiCols_cols_3_9_4 : _T_1179[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_12_3 = zerothRound ? xColsShares_uiCols_cols_3_9_1 : _T_1180[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_12_3 = zerothRound ? xColsShares_uiCols_cols_3_9_3 : _T_1181[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_12_3 = zerothRound ? xColsShares_uiCols_cols_3_9_0 : _T_1182[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_12_3 = zerothRound ? xColsShares_uiCols_cols_3_9_2 : _T_1183[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_12_4 = zerothRound ? xColsShares_uiCols_cols_4_9_2 : _T_1179[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_12_4 = zerothRound ? xColsShares_uiCols_cols_4_9_4 : _T_1180[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_12_4 = zerothRound ? xColsShares_uiCols_cols_4_9_1 : _T_1181[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_12_4 = zerothRound ? xColsShares_uiCols_cols_4_9_3 : _T_1182[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_12_4 = zerothRound ? xColsShares_uiCols_cols_4_9_0 : _T_1183[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_13_0 = zerothRound ? xColsShares_uiCols_cols_0_11_0 : _T_1239[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_13_0 = zerothRound ? xColsShares_uiCols_cols_0_11_2 : _T_1240[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_13_0 = zerothRound ? xColsShares_uiCols_cols_0_11_4 : _T_1241[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_13_0 = zerothRound ? xColsShares_uiCols_cols_0_11_1 : _T_1242[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_13_0 = zerothRound ? xColsShares_uiCols_cols_0_11_3 : _T_1243[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_13_1 = zerothRound ? xColsShares_uiCols_cols_1_11_3 : _T_1239[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_13_1 = zerothRound ? xColsShares_uiCols_cols_1_11_0 : _T_1240[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_13_1 = zerothRound ? xColsShares_uiCols_cols_1_11_2 : _T_1241[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_13_1 = zerothRound ? xColsShares_uiCols_cols_1_11_4 : _T_1242[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_13_1 = zerothRound ? xColsShares_uiCols_cols_1_11_1 : _T_1243[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_13_2 = zerothRound ? xColsShares_uiCols_cols_2_11_1 : _T_1239[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_13_2 = zerothRound ? xColsShares_uiCols_cols_2_11_3 : _T_1240[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_13_2 = zerothRound ? xColsShares_uiCols_cols_2_11_0 : _T_1241[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_13_2 = zerothRound ? xColsShares_uiCols_cols_2_11_2 : _T_1242[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_13_2 = zerothRound ? xColsShares_uiCols_cols_2_11_4 : _T_1243[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_13_3 = zerothRound ? xColsShares_uiCols_cols_3_11_4 : _T_1239[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_13_3 = zerothRound ? xColsShares_uiCols_cols_3_11_1 : _T_1240[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_13_3 = zerothRound ? xColsShares_uiCols_cols_3_11_3 : _T_1241[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_13_3 = zerothRound ? xColsShares_uiCols_cols_3_11_0 : _T_1242[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_13_3 = zerothRound ? xColsShares_uiCols_cols_3_11_2 : _T_1243[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_13_4 = zerothRound ? xColsShares_uiCols_cols_4_11_2 : _T_1239[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_13_4 = zerothRound ? xColsShares_uiCols_cols_4_11_4 : _T_1240[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_13_4 = zerothRound ? xColsShares_uiCols_cols_4_11_1 : _T_1241[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_13_4 = zerothRound ? xColsShares_uiCols_cols_4_11_3 : _T_1242[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_13_4 = zerothRound ? xColsShares_uiCols_cols_4_11_0 : _T_1243[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_14_0 = zerothRound ? xColsShares_uiCols_cols_0_13_0 : _T_1299[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_14_0 = zerothRound ? xColsShares_uiCols_cols_0_13_2 : _T_1300[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_14_0 = zerothRound ? xColsShares_uiCols_cols_0_13_4 : _T_1301[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_14_0 = zerothRound ? xColsShares_uiCols_cols_0_13_1 : _T_1302[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_14_0 = zerothRound ? xColsShares_uiCols_cols_0_13_3 : _T_1303[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_14_1 = zerothRound ? xColsShares_uiCols_cols_1_13_3 : _T_1299[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_14_1 = zerothRound ? xColsShares_uiCols_cols_1_13_0 : _T_1300[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_14_1 = zerothRound ? xColsShares_uiCols_cols_1_13_2 : _T_1301[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_14_1 = zerothRound ? xColsShares_uiCols_cols_1_13_4 : _T_1302[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_14_1 = zerothRound ? xColsShares_uiCols_cols_1_13_1 : _T_1303[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_14_2 = zerothRound ? xColsShares_uiCols_cols_2_13_1 : _T_1299[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_14_2 = zerothRound ? xColsShares_uiCols_cols_2_13_3 : _T_1300[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_14_2 = zerothRound ? xColsShares_uiCols_cols_2_13_0 : _T_1301[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_14_2 = zerothRound ? xColsShares_uiCols_cols_2_13_2 : _T_1302[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_14_2 = zerothRound ? xColsShares_uiCols_cols_2_13_4 : _T_1303[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_14_3 = zerothRound ? xColsShares_uiCols_cols_3_13_4 : _T_1299[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_14_3 = zerothRound ? xColsShares_uiCols_cols_3_13_1 : _T_1300[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_14_3 = zerothRound ? xColsShares_uiCols_cols_3_13_3 : _T_1301[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_14_3 = zerothRound ? xColsShares_uiCols_cols_3_13_0 : _T_1302[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_14_3 = zerothRound ? xColsShares_uiCols_cols_3_13_2 : _T_1303[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_14_4 = zerothRound ? xColsShares_uiCols_cols_4_13_2 : _T_1299[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_14_4 = zerothRound ? xColsShares_uiCols_cols_4_13_4 : _T_1300[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_14_4 = zerothRound ? xColsShares_uiCols_cols_4_13_1 : _T_1301[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_14_4 = zerothRound ? xColsShares_uiCols_cols_4_13_3 : _T_1302[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_14_4 = zerothRound ? xColsShares_uiCols_cols_4_13_0 : _T_1303[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_15_0 = zerothRound ? xColsShares_uiCols_cols_0_15_0 : _T_1359[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_15_0 = zerothRound ? xColsShares_uiCols_cols_0_15_2 : _T_1360[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_15_0 = zerothRound ? xColsShares_uiCols_cols_0_15_4 : _T_1361[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_15_0 = zerothRound ? xColsShares_uiCols_cols_0_15_1 : _T_1362[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_15_0 = zerothRound ? xColsShares_uiCols_cols_0_15_3 : _T_1363[0]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_15_1 = zerothRound ? xColsShares_uiCols_cols_1_15_3 : _T_1359[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_15_1 = zerothRound ? xColsShares_uiCols_cols_1_15_0 : _T_1360[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_15_1 = zerothRound ? xColsShares_uiCols_cols_1_15_2 : _T_1361[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_15_1 = zerothRound ? xColsShares_uiCols_cols_1_15_4 : _T_1362[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_15_1 = zerothRound ? xColsShares_uiCols_cols_1_15_1 : _T_1363[1]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_15_2 = zerothRound ? xColsShares_uiCols_cols_2_15_1 : _T_1359[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_15_2 = zerothRound ? xColsShares_uiCols_cols_2_15_3 : _T_1360[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_15_2 = zerothRound ? xColsShares_uiCols_cols_2_15_0 : _T_1361[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_15_2 = zerothRound ? xColsShares_uiCols_cols_2_15_2 : _T_1362[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_15_2 = zerothRound ? xColsShares_uiCols_cols_2_15_4 : _T_1363[2]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_15_3 = zerothRound ? xColsShares_uiCols_cols_3_15_4 : _T_1359[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_15_3 = zerothRound ? xColsShares_uiCols_cols_3_15_1 : _T_1360[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_15_3 = zerothRound ? xColsShares_uiCols_cols_3_15_3 : _T_1361[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_15_3 = zerothRound ? xColsShares_uiCols_cols_3_15_0 : _T_1362[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_15_3 = zerothRound ? xColsShares_uiCols_cols_3_15_2 : _T_1363[3]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_0_15_4 = zerothRound ? xColsShares_uiCols_cols_4_15_2 : _T_1359[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_1_15_4 = zerothRound ? xColsShares_uiCols_cols_4_15_4 : _T_1360[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_2_15_4 = zerothRound ? xColsShares_uiCols_cols_4_15_1 : _T_1361[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_3_15_4 = zerothRound ? xColsShares_uiCols_cols_4_15_3 : _T_1362[4]; // @[KeccakCore.scala 447:31]
  wire  nextParity_cols_4_15_4 = zerothRound ? xColsShares_uiCols_cols_4_15_0 : _T_1363[4]; // @[KeccakCore.scala 447:31]
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
  wire [4:0] _T_1439 = {nextParity_cols_0__4,nextParity_cols_0__3,nextParity_cols_0__2,nextParity_cols_0__1,
    nextParity_cols_0__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1441 = thetaXor_0 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1442 = _T_1439 ^ _T_1441; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1448 = {nextParity_cols_1__4,nextParity_cols_1__3,nextParity_cols_1__2,nextParity_cols_1__1,
    nextParity_cols_1__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1450 = thetaXor_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1451 = _T_1448 ^ _T_1450; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1457 = {nextParity_cols_2__4,nextParity_cols_2__3,nextParity_cols_2__2,nextParity_cols_2__1,
    nextParity_cols_2__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1459 = thetaXor_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1460 = _T_1457 ^ _T_1459; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1466 = {nextParity_cols_3__4,nextParity_cols_3__3,nextParity_cols_3__2,nextParity_cols_3__1,
    nextParity_cols_3__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1468 = thetaXor_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1469 = _T_1466 ^ _T_1468; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1475 = {nextParity_cols_4__4,nextParity_cols_4__3,nextParity_cols_4__2,nextParity_cols_4__1,
    nextParity_cols_4__0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1477 = thetaXor_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1478 = _T_1475 ^ _T_1477; // @[KeccakCore.scala 311:45]
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
  wire [4:0] _T_1484 = {nextParity_cols_0_1_4,nextParity_cols_0_1_3,nextParity_cols_0_1_2,nextParity_cols_0_1_1,
    nextParity_cols_0_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1486 = thetaXor_0_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1487 = _T_1484 ^ _T_1486; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1493 = {nextParity_cols_1_1_4,nextParity_cols_1_1_3,nextParity_cols_1_1_2,nextParity_cols_1_1_1,
    nextParity_cols_1_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1495 = thetaXor_1_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1496 = _T_1493 ^ _T_1495; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1502 = {nextParity_cols_2_1_4,nextParity_cols_2_1_3,nextParity_cols_2_1_2,nextParity_cols_2_1_1,
    nextParity_cols_2_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1504 = thetaXor_2_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1505 = _T_1502 ^ _T_1504; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1511 = {nextParity_cols_3_1_4,nextParity_cols_3_1_3,nextParity_cols_3_1_2,nextParity_cols_3_1_1,
    nextParity_cols_3_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1513 = thetaXor_3_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1514 = _T_1511 ^ _T_1513; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1520 = {nextParity_cols_4_1_4,nextParity_cols_4_1_3,nextParity_cols_4_1_2,nextParity_cols_4_1_1,
    nextParity_cols_4_1_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1522 = thetaXor_4_1 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1523 = _T_1520 ^ _T_1522; // @[KeccakCore.scala 311:45]
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
  wire [4:0] _T_1529 = {nextParity_cols_0_2_4,nextParity_cols_0_2_3,nextParity_cols_0_2_2,nextParity_cols_0_2_1,
    nextParity_cols_0_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1531 = thetaXor_0_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1532 = _T_1529 ^ _T_1531; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1538 = {nextParity_cols_1_2_4,nextParity_cols_1_2_3,nextParity_cols_1_2_2,nextParity_cols_1_2_1,
    nextParity_cols_1_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1540 = thetaXor_1_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1541 = _T_1538 ^ _T_1540; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1547 = {nextParity_cols_2_2_4,nextParity_cols_2_2_3,nextParity_cols_2_2_2,nextParity_cols_2_2_1,
    nextParity_cols_2_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1549 = thetaXor_2_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1550 = _T_1547 ^ _T_1549; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1556 = {nextParity_cols_3_2_4,nextParity_cols_3_2_3,nextParity_cols_3_2_2,nextParity_cols_3_2_1,
    nextParity_cols_3_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1558 = thetaXor_3_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1559 = _T_1556 ^ _T_1558; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1565 = {nextParity_cols_4_2_4,nextParity_cols_4_2_3,nextParity_cols_4_2_2,nextParity_cols_4_2_1,
    nextParity_cols_4_2_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1567 = thetaXor_4_2 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1568 = _T_1565 ^ _T_1567; // @[KeccakCore.scala 311:45]
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
  wire [4:0] _T_1574 = {nextParity_cols_0_3_4,nextParity_cols_0_3_3,nextParity_cols_0_3_2,nextParity_cols_0_3_1,
    nextParity_cols_0_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1576 = thetaXor_0_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1577 = _T_1574 ^ _T_1576; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1583 = {nextParity_cols_1_3_4,nextParity_cols_1_3_3,nextParity_cols_1_3_2,nextParity_cols_1_3_1,
    nextParity_cols_1_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1585 = thetaXor_1_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1586 = _T_1583 ^ _T_1585; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1592 = {nextParity_cols_2_3_4,nextParity_cols_2_3_3,nextParity_cols_2_3_2,nextParity_cols_2_3_1,
    nextParity_cols_2_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1594 = thetaXor_2_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1595 = _T_1592 ^ _T_1594; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1601 = {nextParity_cols_3_3_4,nextParity_cols_3_3_3,nextParity_cols_3_3_2,nextParity_cols_3_3_1,
    nextParity_cols_3_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1603 = thetaXor_3_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1604 = _T_1601 ^ _T_1603; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1610 = {nextParity_cols_4_3_4,nextParity_cols_4_3_3,nextParity_cols_4_3_2,nextParity_cols_4_3_1,
    nextParity_cols_4_3_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1612 = thetaXor_4_3 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1613 = _T_1610 ^ _T_1612; // @[KeccakCore.scala 311:45]
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
  wire [4:0] _T_1619 = {nextParity_cols_0_4_4,nextParity_cols_0_4_3,nextParity_cols_0_4_2,nextParity_cols_0_4_1,
    nextParity_cols_0_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1621 = thetaXor_0_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1622 = _T_1619 ^ _T_1621; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1628 = {nextParity_cols_1_4_4,nextParity_cols_1_4_3,nextParity_cols_1_4_2,nextParity_cols_1_4_1,
    nextParity_cols_1_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1630 = thetaXor_1_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1631 = _T_1628 ^ _T_1630; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1637 = {nextParity_cols_2_4_4,nextParity_cols_2_4_3,nextParity_cols_2_4_2,nextParity_cols_2_4_1,
    nextParity_cols_2_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1639 = thetaXor_2_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1640 = _T_1637 ^ _T_1639; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1646 = {nextParity_cols_3_4_4,nextParity_cols_3_4_3,nextParity_cols_3_4_2,nextParity_cols_3_4_1,
    nextParity_cols_3_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1648 = thetaXor_3_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1649 = _T_1646 ^ _T_1648; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1655 = {nextParity_cols_4_4_4,nextParity_cols_4_4_3,nextParity_cols_4_4_2,nextParity_cols_4_4_1,
    nextParity_cols_4_4_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1657 = thetaXor_4_4 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1658 = _T_1655 ^ _T_1657; // @[KeccakCore.scala 311:45]
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
  wire [4:0] _T_1664 = {nextParity_cols_0_5_4,nextParity_cols_0_5_3,nextParity_cols_0_5_2,nextParity_cols_0_5_1,
    nextParity_cols_0_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1666 = thetaXor_0_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1667 = _T_1664 ^ _T_1666; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1673 = {nextParity_cols_1_5_4,nextParity_cols_1_5_3,nextParity_cols_1_5_2,nextParity_cols_1_5_1,
    nextParity_cols_1_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1675 = thetaXor_1_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1676 = _T_1673 ^ _T_1675; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1682 = {nextParity_cols_2_5_4,nextParity_cols_2_5_3,nextParity_cols_2_5_2,nextParity_cols_2_5_1,
    nextParity_cols_2_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1684 = thetaXor_2_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1685 = _T_1682 ^ _T_1684; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1691 = {nextParity_cols_3_5_4,nextParity_cols_3_5_3,nextParity_cols_3_5_2,nextParity_cols_3_5_1,
    nextParity_cols_3_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1693 = thetaXor_3_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1694 = _T_1691 ^ _T_1693; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1700 = {nextParity_cols_4_5_4,nextParity_cols_4_5_3,nextParity_cols_4_5_2,nextParity_cols_4_5_1,
    nextParity_cols_4_5_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1702 = thetaXor_4_5 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1703 = _T_1700 ^ _T_1702; // @[KeccakCore.scala 311:45]
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
  wire [4:0] _T_1709 = {nextParity_cols_0_6_4,nextParity_cols_0_6_3,nextParity_cols_0_6_2,nextParity_cols_0_6_1,
    nextParity_cols_0_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1711 = thetaXor_0_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1712 = _T_1709 ^ _T_1711; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1718 = {nextParity_cols_1_6_4,nextParity_cols_1_6_3,nextParity_cols_1_6_2,nextParity_cols_1_6_1,
    nextParity_cols_1_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1720 = thetaXor_1_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1721 = _T_1718 ^ _T_1720; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1727 = {nextParity_cols_2_6_4,nextParity_cols_2_6_3,nextParity_cols_2_6_2,nextParity_cols_2_6_1,
    nextParity_cols_2_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1729 = thetaXor_2_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1730 = _T_1727 ^ _T_1729; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1736 = {nextParity_cols_3_6_4,nextParity_cols_3_6_3,nextParity_cols_3_6_2,nextParity_cols_3_6_1,
    nextParity_cols_3_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1738 = thetaXor_3_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1739 = _T_1736 ^ _T_1738; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1745 = {nextParity_cols_4_6_4,nextParity_cols_4_6_3,nextParity_cols_4_6_2,nextParity_cols_4_6_1,
    nextParity_cols_4_6_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1747 = thetaXor_4_6 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1748 = _T_1745 ^ _T_1747; // @[KeccakCore.scala 311:45]
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
  wire [4:0] _T_1754 = {nextParity_cols_0_7_4,nextParity_cols_0_7_3,nextParity_cols_0_7_2,nextParity_cols_0_7_1,
    nextParity_cols_0_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1756 = thetaXor_0_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1757 = _T_1754 ^ _T_1756; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1763 = {nextParity_cols_1_7_4,nextParity_cols_1_7_3,nextParity_cols_1_7_2,nextParity_cols_1_7_1,
    nextParity_cols_1_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1765 = thetaXor_1_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1766 = _T_1763 ^ _T_1765; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1772 = {nextParity_cols_2_7_4,nextParity_cols_2_7_3,nextParity_cols_2_7_2,nextParity_cols_2_7_1,
    nextParity_cols_2_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1774 = thetaXor_2_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1775 = _T_1772 ^ _T_1774; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1781 = {nextParity_cols_3_7_4,nextParity_cols_3_7_3,nextParity_cols_3_7_2,nextParity_cols_3_7_1,
    nextParity_cols_3_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1783 = thetaXor_3_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1784 = _T_1781 ^ _T_1783; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1790 = {nextParity_cols_4_7_4,nextParity_cols_4_7_3,nextParity_cols_4_7_2,nextParity_cols_4_7_1,
    nextParity_cols_4_7_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1792 = thetaXor_4_7 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1793 = _T_1790 ^ _T_1792; // @[KeccakCore.scala 311:45]
  wire  _GEN_297 = _T_930 | _T_933; // @[Conditional.scala 39:67 KeccakCore.scala 202:24]
  wire  _GEN_365 = _T_921 ? 1'h0 : _GEN_297; // @[Conditional.scala 39:67]
  wire  updatePrevParity = _T_918 ? 1'h0 : _GEN_365; // @[Conditional.scala 40:58]
  reg [4:0] prevSliceParity_1; // @[KeccakCore.scala 144:32]
  wire  _nextParity_T_163 = nextParity_cols_0_8_0 ^ nextParity_cols_0_8_1 ^ nextParity_cols_0_8_2 ^
    nextParity_cols_0_8_3 ^ nextParity_cols_0_8_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_167 = nextParity_cols_1_8_0 ^ nextParity_cols_1_8_1 ^ nextParity_cols_1_8_2 ^
    nextParity_cols_1_8_3 ^ nextParity_cols_1_8_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_171 = nextParity_cols_2_8_0 ^ nextParity_cols_2_8_1 ^ nextParity_cols_2_8_2 ^
    nextParity_cols_2_8_3 ^ nextParity_cols_2_8_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_175 = nextParity_cols_3_8_0 ^ nextParity_cols_3_8_1 ^ nextParity_cols_3_8_2 ^
    nextParity_cols_3_8_3 ^ nextParity_cols_3_8_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_179 = nextParity_cols_4_8_0 ^ nextParity_cols_4_8_1 ^ nextParity_cols_4_8_2 ^
    nextParity_cols_4_8_3 ^ nextParity_cols_4_8_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_7 = {_nextParity_T_179,_nextParity_T_175,_nextParity_T_171,_nextParity_T_167,_nextParity_T_163}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_58 = {parity_7[3:0],parity_7[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_61 = {prevSliceParity_1[0],prevSliceParity_1[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_62 = _thetaXor_T_58 ^ _thetaXor_T_61; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_8 = _thetaXor_T_62[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_8 = _thetaXor_T_62[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_8 = _thetaXor_T_62[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_8 = _thetaXor_T_62[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_8 = _thetaXor_T_62[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_1799 = {nextParity_cols_0_8_4,nextParity_cols_0_8_3,nextParity_cols_0_8_2,nextParity_cols_0_8_1,
    nextParity_cols_0_8_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1801 = thetaXor_0_8 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1802 = _T_1799 ^ _T_1801; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1808 = {nextParity_cols_1_8_4,nextParity_cols_1_8_3,nextParity_cols_1_8_2,nextParity_cols_1_8_1,
    nextParity_cols_1_8_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1810 = thetaXor_1_8 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1811 = _T_1808 ^ _T_1810; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1817 = {nextParity_cols_2_8_4,nextParity_cols_2_8_3,nextParity_cols_2_8_2,nextParity_cols_2_8_1,
    nextParity_cols_2_8_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1819 = thetaXor_2_8 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1820 = _T_1817 ^ _T_1819; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1826 = {nextParity_cols_3_8_4,nextParity_cols_3_8_3,nextParity_cols_3_8_2,nextParity_cols_3_8_1,
    nextParity_cols_3_8_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1828 = thetaXor_3_8 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1829 = _T_1826 ^ _T_1828; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1835 = {nextParity_cols_4_8_4,nextParity_cols_4_8_3,nextParity_cols_4_8_2,nextParity_cols_4_8_1,
    nextParity_cols_4_8_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1837 = thetaXor_4_8 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1838 = _T_1835 ^ _T_1837; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_183 = nextParity_cols_0_9_0 ^ nextParity_cols_0_9_1 ^ nextParity_cols_0_9_2 ^
    nextParity_cols_0_9_3 ^ nextParity_cols_0_9_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_187 = nextParity_cols_1_9_0 ^ nextParity_cols_1_9_1 ^ nextParity_cols_1_9_2 ^
    nextParity_cols_1_9_3 ^ nextParity_cols_1_9_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_191 = nextParity_cols_2_9_0 ^ nextParity_cols_2_9_1 ^ nextParity_cols_2_9_2 ^
    nextParity_cols_2_9_3 ^ nextParity_cols_2_9_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_195 = nextParity_cols_3_9_0 ^ nextParity_cols_3_9_1 ^ nextParity_cols_3_9_2 ^
    nextParity_cols_3_9_3 ^ nextParity_cols_3_9_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_199 = nextParity_cols_4_9_0 ^ nextParity_cols_4_9_1 ^ nextParity_cols_4_9_2 ^
    nextParity_cols_4_9_3 ^ nextParity_cols_4_9_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_8 = {_nextParity_T_199,_nextParity_T_195,_nextParity_T_191,_nextParity_T_187,_nextParity_T_183}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_65 = {parity_8[3:0],parity_8[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_68 = {parity_7[0],parity_7[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_69 = _thetaXor_T_65 ^ _thetaXor_T_68; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_9 = _thetaXor_T_69[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_9 = _thetaXor_T_69[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_9 = _thetaXor_T_69[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_9 = _thetaXor_T_69[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_9 = _thetaXor_T_69[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_1844 = {nextParity_cols_0_9_4,nextParity_cols_0_9_3,nextParity_cols_0_9_2,nextParity_cols_0_9_1,
    nextParity_cols_0_9_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1846 = thetaXor_0_9 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1847 = _T_1844 ^ _T_1846; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1853 = {nextParity_cols_1_9_4,nextParity_cols_1_9_3,nextParity_cols_1_9_2,nextParity_cols_1_9_1,
    nextParity_cols_1_9_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1855 = thetaXor_1_9 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1856 = _T_1853 ^ _T_1855; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1862 = {nextParity_cols_2_9_4,nextParity_cols_2_9_3,nextParity_cols_2_9_2,nextParity_cols_2_9_1,
    nextParity_cols_2_9_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1864 = thetaXor_2_9 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1865 = _T_1862 ^ _T_1864; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1871 = {nextParity_cols_3_9_4,nextParity_cols_3_9_3,nextParity_cols_3_9_2,nextParity_cols_3_9_1,
    nextParity_cols_3_9_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1873 = thetaXor_3_9 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1874 = _T_1871 ^ _T_1873; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1880 = {nextParity_cols_4_9_4,nextParity_cols_4_9_3,nextParity_cols_4_9_2,nextParity_cols_4_9_1,
    nextParity_cols_4_9_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1882 = thetaXor_4_9 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1883 = _T_1880 ^ _T_1882; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_203 = nextParity_cols_0_10_0 ^ nextParity_cols_0_10_1 ^ nextParity_cols_0_10_2 ^
    nextParity_cols_0_10_3 ^ nextParity_cols_0_10_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_207 = nextParity_cols_1_10_0 ^ nextParity_cols_1_10_1 ^ nextParity_cols_1_10_2 ^
    nextParity_cols_1_10_3 ^ nextParity_cols_1_10_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_211 = nextParity_cols_2_10_0 ^ nextParity_cols_2_10_1 ^ nextParity_cols_2_10_2 ^
    nextParity_cols_2_10_3 ^ nextParity_cols_2_10_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_215 = nextParity_cols_3_10_0 ^ nextParity_cols_3_10_1 ^ nextParity_cols_3_10_2 ^
    nextParity_cols_3_10_3 ^ nextParity_cols_3_10_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_219 = nextParity_cols_4_10_0 ^ nextParity_cols_4_10_1 ^ nextParity_cols_4_10_2 ^
    nextParity_cols_4_10_3 ^ nextParity_cols_4_10_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_9 = {_nextParity_T_219,_nextParity_T_215,_nextParity_T_211,_nextParity_T_207,_nextParity_T_203}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_72 = {parity_9[3:0],parity_9[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_75 = {parity_8[0],parity_8[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_76 = _thetaXor_T_72 ^ _thetaXor_T_75; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_10 = _thetaXor_T_76[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_10 = _thetaXor_T_76[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_10 = _thetaXor_T_76[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_10 = _thetaXor_T_76[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_10 = _thetaXor_T_76[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_1889 = {nextParity_cols_0_10_4,nextParity_cols_0_10_3,nextParity_cols_0_10_2,nextParity_cols_0_10_1,
    nextParity_cols_0_10_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1891 = thetaXor_0_10 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1892 = _T_1889 ^ _T_1891; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1898 = {nextParity_cols_1_10_4,nextParity_cols_1_10_3,nextParity_cols_1_10_2,nextParity_cols_1_10_1,
    nextParity_cols_1_10_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1900 = thetaXor_1_10 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1901 = _T_1898 ^ _T_1900; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1907 = {nextParity_cols_2_10_4,nextParity_cols_2_10_3,nextParity_cols_2_10_2,nextParity_cols_2_10_1,
    nextParity_cols_2_10_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1909 = thetaXor_2_10 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1910 = _T_1907 ^ _T_1909; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1916 = {nextParity_cols_3_10_4,nextParity_cols_3_10_3,nextParity_cols_3_10_2,nextParity_cols_3_10_1,
    nextParity_cols_3_10_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1918 = thetaXor_3_10 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1919 = _T_1916 ^ _T_1918; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1925 = {nextParity_cols_4_10_4,nextParity_cols_4_10_3,nextParity_cols_4_10_2,nextParity_cols_4_10_1,
    nextParity_cols_4_10_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1927 = thetaXor_4_10 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1928 = _T_1925 ^ _T_1927; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_223 = nextParity_cols_0_11_0 ^ nextParity_cols_0_11_1 ^ nextParity_cols_0_11_2 ^
    nextParity_cols_0_11_3 ^ nextParity_cols_0_11_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_227 = nextParity_cols_1_11_0 ^ nextParity_cols_1_11_1 ^ nextParity_cols_1_11_2 ^
    nextParity_cols_1_11_3 ^ nextParity_cols_1_11_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_231 = nextParity_cols_2_11_0 ^ nextParity_cols_2_11_1 ^ nextParity_cols_2_11_2 ^
    nextParity_cols_2_11_3 ^ nextParity_cols_2_11_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_235 = nextParity_cols_3_11_0 ^ nextParity_cols_3_11_1 ^ nextParity_cols_3_11_2 ^
    nextParity_cols_3_11_3 ^ nextParity_cols_3_11_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_239 = nextParity_cols_4_11_0 ^ nextParity_cols_4_11_1 ^ nextParity_cols_4_11_2 ^
    nextParity_cols_4_11_3 ^ nextParity_cols_4_11_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_10 = {_nextParity_T_239,_nextParity_T_235,_nextParity_T_231,_nextParity_T_227,_nextParity_T_223}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_79 = {parity_10[3:0],parity_10[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_82 = {parity_9[0],parity_9[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_83 = _thetaXor_T_79 ^ _thetaXor_T_82; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_11 = _thetaXor_T_83[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_11 = _thetaXor_T_83[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_11 = _thetaXor_T_83[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_11 = _thetaXor_T_83[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_11 = _thetaXor_T_83[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_1934 = {nextParity_cols_0_11_4,nextParity_cols_0_11_3,nextParity_cols_0_11_2,nextParity_cols_0_11_1,
    nextParity_cols_0_11_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1936 = thetaXor_0_11 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1937 = _T_1934 ^ _T_1936; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1943 = {nextParity_cols_1_11_4,nextParity_cols_1_11_3,nextParity_cols_1_11_2,nextParity_cols_1_11_1,
    nextParity_cols_1_11_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1945 = thetaXor_1_11 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1946 = _T_1943 ^ _T_1945; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1952 = {nextParity_cols_2_11_4,nextParity_cols_2_11_3,nextParity_cols_2_11_2,nextParity_cols_2_11_1,
    nextParity_cols_2_11_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1954 = thetaXor_2_11 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1955 = _T_1952 ^ _T_1954; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1961 = {nextParity_cols_3_11_4,nextParity_cols_3_11_3,nextParity_cols_3_11_2,nextParity_cols_3_11_1,
    nextParity_cols_3_11_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1963 = thetaXor_3_11 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1964 = _T_1961 ^ _T_1963; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1970 = {nextParity_cols_4_11_4,nextParity_cols_4_11_3,nextParity_cols_4_11_2,nextParity_cols_4_11_1,
    nextParity_cols_4_11_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1972 = thetaXor_4_11 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1973 = _T_1970 ^ _T_1972; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_243 = nextParity_cols_0_12_0 ^ nextParity_cols_0_12_1 ^ nextParity_cols_0_12_2 ^
    nextParity_cols_0_12_3 ^ nextParity_cols_0_12_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_247 = nextParity_cols_1_12_0 ^ nextParity_cols_1_12_1 ^ nextParity_cols_1_12_2 ^
    nextParity_cols_1_12_3 ^ nextParity_cols_1_12_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_251 = nextParity_cols_2_12_0 ^ nextParity_cols_2_12_1 ^ nextParity_cols_2_12_2 ^
    nextParity_cols_2_12_3 ^ nextParity_cols_2_12_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_255 = nextParity_cols_3_12_0 ^ nextParity_cols_3_12_1 ^ nextParity_cols_3_12_2 ^
    nextParity_cols_3_12_3 ^ nextParity_cols_3_12_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_259 = nextParity_cols_4_12_0 ^ nextParity_cols_4_12_1 ^ nextParity_cols_4_12_2 ^
    nextParity_cols_4_12_3 ^ nextParity_cols_4_12_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_11 = {_nextParity_T_259,_nextParity_T_255,_nextParity_T_251,_nextParity_T_247,_nextParity_T_243}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_86 = {parity_11[3:0],parity_11[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_89 = {parity_10[0],parity_10[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_90 = _thetaXor_T_86 ^ _thetaXor_T_89; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_12 = _thetaXor_T_90[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_12 = _thetaXor_T_90[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_12 = _thetaXor_T_90[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_12 = _thetaXor_T_90[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_12 = _thetaXor_T_90[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_1979 = {nextParity_cols_0_12_4,nextParity_cols_0_12_3,nextParity_cols_0_12_2,nextParity_cols_0_12_1,
    nextParity_cols_0_12_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1981 = thetaXor_0_12 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1982 = _T_1979 ^ _T_1981; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1988 = {nextParity_cols_1_12_4,nextParity_cols_1_12_3,nextParity_cols_1_12_2,nextParity_cols_1_12_1,
    nextParity_cols_1_12_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1990 = thetaXor_1_12 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_1991 = _T_1988 ^ _T_1990; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_1997 = {nextParity_cols_2_12_4,nextParity_cols_2_12_3,nextParity_cols_2_12_2,nextParity_cols_2_12_1,
    nextParity_cols_2_12_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_1999 = thetaXor_2_12 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2000 = _T_1997 ^ _T_1999; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2006 = {nextParity_cols_3_12_4,nextParity_cols_3_12_3,nextParity_cols_3_12_2,nextParity_cols_3_12_1,
    nextParity_cols_3_12_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2008 = thetaXor_3_12 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2009 = _T_2006 ^ _T_2008; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2015 = {nextParity_cols_4_12_4,nextParity_cols_4_12_3,nextParity_cols_4_12_2,nextParity_cols_4_12_1,
    nextParity_cols_4_12_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2017 = thetaXor_4_12 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2018 = _T_2015 ^ _T_2017; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_263 = nextParity_cols_0_13_0 ^ nextParity_cols_0_13_1 ^ nextParity_cols_0_13_2 ^
    nextParity_cols_0_13_3 ^ nextParity_cols_0_13_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_267 = nextParity_cols_1_13_0 ^ nextParity_cols_1_13_1 ^ nextParity_cols_1_13_2 ^
    nextParity_cols_1_13_3 ^ nextParity_cols_1_13_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_271 = nextParity_cols_2_13_0 ^ nextParity_cols_2_13_1 ^ nextParity_cols_2_13_2 ^
    nextParity_cols_2_13_3 ^ nextParity_cols_2_13_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_275 = nextParity_cols_3_13_0 ^ nextParity_cols_3_13_1 ^ nextParity_cols_3_13_2 ^
    nextParity_cols_3_13_3 ^ nextParity_cols_3_13_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_279 = nextParity_cols_4_13_0 ^ nextParity_cols_4_13_1 ^ nextParity_cols_4_13_2 ^
    nextParity_cols_4_13_3 ^ nextParity_cols_4_13_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_12 = {_nextParity_T_279,_nextParity_T_275,_nextParity_T_271,_nextParity_T_267,_nextParity_T_263}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_93 = {parity_12[3:0],parity_12[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_96 = {parity_11[0],parity_11[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_97 = _thetaXor_T_93 ^ _thetaXor_T_96; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_13 = _thetaXor_T_97[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_13 = _thetaXor_T_97[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_13 = _thetaXor_T_97[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_13 = _thetaXor_T_97[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_13 = _thetaXor_T_97[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_2024 = {nextParity_cols_0_13_4,nextParity_cols_0_13_3,nextParity_cols_0_13_2,nextParity_cols_0_13_1,
    nextParity_cols_0_13_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2026 = thetaXor_0_13 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2027 = _T_2024 ^ _T_2026; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2033 = {nextParity_cols_1_13_4,nextParity_cols_1_13_3,nextParity_cols_1_13_2,nextParity_cols_1_13_1,
    nextParity_cols_1_13_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2035 = thetaXor_1_13 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2036 = _T_2033 ^ _T_2035; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2042 = {nextParity_cols_2_13_4,nextParity_cols_2_13_3,nextParity_cols_2_13_2,nextParity_cols_2_13_1,
    nextParity_cols_2_13_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2044 = thetaXor_2_13 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2045 = _T_2042 ^ _T_2044; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2051 = {nextParity_cols_3_13_4,nextParity_cols_3_13_3,nextParity_cols_3_13_2,nextParity_cols_3_13_1,
    nextParity_cols_3_13_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2053 = thetaXor_3_13 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2054 = _T_2051 ^ _T_2053; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2060 = {nextParity_cols_4_13_4,nextParity_cols_4_13_3,nextParity_cols_4_13_2,nextParity_cols_4_13_1,
    nextParity_cols_4_13_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2062 = thetaXor_4_13 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2063 = _T_2060 ^ _T_2062; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_283 = nextParity_cols_0_14_0 ^ nextParity_cols_0_14_1 ^ nextParity_cols_0_14_2 ^
    nextParity_cols_0_14_3 ^ nextParity_cols_0_14_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_287 = nextParity_cols_1_14_0 ^ nextParity_cols_1_14_1 ^ nextParity_cols_1_14_2 ^
    nextParity_cols_1_14_3 ^ nextParity_cols_1_14_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_291 = nextParity_cols_2_14_0 ^ nextParity_cols_2_14_1 ^ nextParity_cols_2_14_2 ^
    nextParity_cols_2_14_3 ^ nextParity_cols_2_14_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_295 = nextParity_cols_3_14_0 ^ nextParity_cols_3_14_1 ^ nextParity_cols_3_14_2 ^
    nextParity_cols_3_14_3 ^ nextParity_cols_3_14_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_299 = nextParity_cols_4_14_0 ^ nextParity_cols_4_14_1 ^ nextParity_cols_4_14_2 ^
    nextParity_cols_4_14_3 ^ nextParity_cols_4_14_4; // @[KeccakCore.scala 306:57]
  wire [4:0] parity_13 = {_nextParity_T_299,_nextParity_T_295,_nextParity_T_291,_nextParity_T_287,_nextParity_T_283}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_100 = {parity_13[3:0],parity_13[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_103 = {parity_12[0],parity_12[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_104 = _thetaXor_T_100 ^ _thetaXor_T_103; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_14 = _thetaXor_T_104[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_14 = _thetaXor_T_104[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_14 = _thetaXor_T_104[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_14 = _thetaXor_T_104[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_14 = _thetaXor_T_104[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_2069 = {nextParity_cols_0_14_4,nextParity_cols_0_14_3,nextParity_cols_0_14_2,nextParity_cols_0_14_1,
    nextParity_cols_0_14_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2071 = thetaXor_0_14 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2072 = _T_2069 ^ _T_2071; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2078 = {nextParity_cols_1_14_4,nextParity_cols_1_14_3,nextParity_cols_1_14_2,nextParity_cols_1_14_1,
    nextParity_cols_1_14_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2080 = thetaXor_1_14 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2081 = _T_2078 ^ _T_2080; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2087 = {nextParity_cols_2_14_4,nextParity_cols_2_14_3,nextParity_cols_2_14_2,nextParity_cols_2_14_1,
    nextParity_cols_2_14_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2089 = thetaXor_2_14 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2090 = _T_2087 ^ _T_2089; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2096 = {nextParity_cols_3_14_4,nextParity_cols_3_14_3,nextParity_cols_3_14_2,nextParity_cols_3_14_1,
    nextParity_cols_3_14_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2098 = thetaXor_3_14 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2099 = _T_2096 ^ _T_2098; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2105 = {nextParity_cols_4_14_4,nextParity_cols_4_14_3,nextParity_cols_4_14_2,nextParity_cols_4_14_1,
    nextParity_cols_4_14_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2107 = thetaXor_4_14 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2108 = _T_2105 ^ _T_2107; // @[KeccakCore.scala 311:45]
  wire  _nextParity_T_303 = nextParity_cols_0_15_0 ^ nextParity_cols_0_15_1 ^ nextParity_cols_0_15_2 ^
    nextParity_cols_0_15_3 ^ nextParity_cols_0_15_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_307 = nextParity_cols_1_15_0 ^ nextParity_cols_1_15_1 ^ nextParity_cols_1_15_2 ^
    nextParity_cols_1_15_3 ^ nextParity_cols_1_15_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_311 = nextParity_cols_2_15_0 ^ nextParity_cols_2_15_1 ^ nextParity_cols_2_15_2 ^
    nextParity_cols_2_15_3 ^ nextParity_cols_2_15_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_315 = nextParity_cols_3_15_0 ^ nextParity_cols_3_15_1 ^ nextParity_cols_3_15_2 ^
    nextParity_cols_3_15_3 ^ nextParity_cols_3_15_4; // @[KeccakCore.scala 306:57]
  wire  _nextParity_T_319 = nextParity_cols_4_15_0 ^ nextParity_cols_4_15_1 ^ nextParity_cols_4_15_2 ^
    nextParity_cols_4_15_3 ^ nextParity_cols_4_15_4; // @[KeccakCore.scala 306:57]
  wire [4:0] lastParity_1 = {_nextParity_T_319,_nextParity_T_315,_nextParity_T_311,_nextParity_T_307,_nextParity_T_303}; // @[KeccakCore.scala 306:70]
  wire [4:0] _thetaXor_T_107 = {lastParity_1[3:0],lastParity_1[4]}; // @[KeccakCore.scala 307:44]
  wire [4:0] _thetaXor_T_110 = {parity_13[0],parity_13[4:1]}; // @[KeccakCore.scala 307:77]
  wire [4:0] _thetaXor_T_111 = _thetaXor_T_107 ^ _thetaXor_T_110; // @[KeccakCore.scala 307:48]
  wire  thetaXor_0_15 = _thetaXor_T_111[0]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_1_15 = _thetaXor_T_111[1]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_2_15 = _thetaXor_T_111[2]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_3_15 = _thetaXor_T_111[3]; // @[KeccakCore.scala 307:89]
  wire  thetaXor_4_15 = _thetaXor_T_111[4]; // @[KeccakCore.scala 307:89]
  wire [4:0] _T_2114 = {nextParity_cols_0_15_4,nextParity_cols_0_15_3,nextParity_cols_0_15_2,nextParity_cols_0_15_1,
    nextParity_cols_0_15_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2116 = thetaXor_0_15 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2117 = _T_2114 ^ _T_2116; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2123 = {nextParity_cols_1_15_4,nextParity_cols_1_15_3,nextParity_cols_1_15_2,nextParity_cols_1_15_1,
    nextParity_cols_1_15_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2125 = thetaXor_1_15 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2126 = _T_2123 ^ _T_2125; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2132 = {nextParity_cols_2_15_4,nextParity_cols_2_15_3,nextParity_cols_2_15_2,nextParity_cols_2_15_1,
    nextParity_cols_2_15_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2134 = thetaXor_2_15 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2135 = _T_2132 ^ _T_2134; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2141 = {nextParity_cols_3_15_4,nextParity_cols_3_15_3,nextParity_cols_3_15_2,nextParity_cols_3_15_1,
    nextParity_cols_3_15_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2143 = thetaXor_3_15 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2144 = _T_2141 ^ _T_2143; // @[KeccakCore.scala 311:45]
  wire [4:0] _T_2150 = {nextParity_cols_4_15_4,nextParity_cols_4_15_3,nextParity_cols_4_15_2,nextParity_cols_4_15_1,
    nextParity_cols_4_15_0}; // @[KeccakCore.scala 311:38]
  wire [4:0] _T_2152 = thetaXor_4_15 ? 5'h1f : 5'h0; // @[Bitwise.scala 72:12]
  wire [4:0] _T_2153 = _T_2150 ^ _T_2152; // @[KeccakCore.scala 311:45]
  wire  _T_2159_0 = isLastRound ? nextParity_cols_0__0 : _T_1442[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_1 = isLastRound ? nextParity_cols_1__0 : _T_1451[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_2 = isLastRound ? nextParity_cols_2__0 : _T_1460[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_3 = isLastRound ? nextParity_cols_3__0 : _T_1469[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_4 = isLastRound ? nextParity_cols_4__0 : _T_1478[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_5 = isLastRound ? nextParity_cols_0__1 : _T_1442[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_6 = isLastRound ? nextParity_cols_1__1 : _T_1451[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_7 = isLastRound ? nextParity_cols_2__1 : _T_1460[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_8 = isLastRound ? nextParity_cols_3__1 : _T_1469[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_9 = isLastRound ? nextParity_cols_4__1 : _T_1478[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_10 = isLastRound ? nextParity_cols_0__2 : _T_1442[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_11 = isLastRound ? nextParity_cols_1__2 : _T_1451[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_12 = isLastRound ? nextParity_cols_2__2 : _T_1460[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_13 = isLastRound ? nextParity_cols_3__2 : _T_1469[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_14 = isLastRound ? nextParity_cols_4__2 : _T_1478[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_15 = isLastRound ? nextParity_cols_0__3 : _T_1442[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_16 = isLastRound ? nextParity_cols_1__3 : _T_1451[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_17 = isLastRound ? nextParity_cols_2__3 : _T_1460[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_18 = isLastRound ? nextParity_cols_3__3 : _T_1469[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_19 = isLastRound ? nextParity_cols_4__3 : _T_1478[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_20 = isLastRound ? nextParity_cols_0__4 : _T_1442[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_21 = isLastRound ? nextParity_cols_1__4 : _T_1451[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_22 = isLastRound ? nextParity_cols_2__4 : _T_1460[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_23 = isLastRound ? nextParity_cols_3__4 : _T_1469[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2159_24 = isLastRound ? nextParity_cols_4__4 : _T_1478[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_0 = isLastRound ? nextParity_cols_0_1_0 : _T_1487[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_1 = isLastRound ? nextParity_cols_1_1_0 : _T_1496[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_2 = isLastRound ? nextParity_cols_2_1_0 : _T_1505[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_3 = isLastRound ? nextParity_cols_3_1_0 : _T_1514[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_4 = isLastRound ? nextParity_cols_4_1_0 : _T_1523[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_5 = isLastRound ? nextParity_cols_0_1_1 : _T_1487[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_6 = isLastRound ? nextParity_cols_1_1_1 : _T_1496[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_7 = isLastRound ? nextParity_cols_2_1_1 : _T_1505[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_8 = isLastRound ? nextParity_cols_3_1_1 : _T_1514[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_9 = isLastRound ? nextParity_cols_4_1_1 : _T_1523[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_10 = isLastRound ? nextParity_cols_0_1_2 : _T_1487[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_11 = isLastRound ? nextParity_cols_1_1_2 : _T_1496[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_12 = isLastRound ? nextParity_cols_2_1_2 : _T_1505[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_13 = isLastRound ? nextParity_cols_3_1_2 : _T_1514[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_14 = isLastRound ? nextParity_cols_4_1_2 : _T_1523[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_15 = isLastRound ? nextParity_cols_0_1_3 : _T_1487[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_16 = isLastRound ? nextParity_cols_1_1_3 : _T_1496[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_17 = isLastRound ? nextParity_cols_2_1_3 : _T_1505[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_18 = isLastRound ? nextParity_cols_3_1_3 : _T_1514[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_19 = isLastRound ? nextParity_cols_4_1_3 : _T_1523[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_20 = isLastRound ? nextParity_cols_0_1_4 : _T_1487[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_21 = isLastRound ? nextParity_cols_1_1_4 : _T_1496[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_22 = isLastRound ? nextParity_cols_2_1_4 : _T_1505[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_23 = isLastRound ? nextParity_cols_3_1_4 : _T_1514[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2160_24 = isLastRound ? nextParity_cols_4_1_4 : _T_1523[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_0 = isLastRound ? nextParity_cols_0_2_0 : _T_1532[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_1 = isLastRound ? nextParity_cols_1_2_0 : _T_1541[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_2 = isLastRound ? nextParity_cols_2_2_0 : _T_1550[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_3 = isLastRound ? nextParity_cols_3_2_0 : _T_1559[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_4 = isLastRound ? nextParity_cols_4_2_0 : _T_1568[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_5 = isLastRound ? nextParity_cols_0_2_1 : _T_1532[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_6 = isLastRound ? nextParity_cols_1_2_1 : _T_1541[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_7 = isLastRound ? nextParity_cols_2_2_1 : _T_1550[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_8 = isLastRound ? nextParity_cols_3_2_1 : _T_1559[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_9 = isLastRound ? nextParity_cols_4_2_1 : _T_1568[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_10 = isLastRound ? nextParity_cols_0_2_2 : _T_1532[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_11 = isLastRound ? nextParity_cols_1_2_2 : _T_1541[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_12 = isLastRound ? nextParity_cols_2_2_2 : _T_1550[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_13 = isLastRound ? nextParity_cols_3_2_2 : _T_1559[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_14 = isLastRound ? nextParity_cols_4_2_2 : _T_1568[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_15 = isLastRound ? nextParity_cols_0_2_3 : _T_1532[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_16 = isLastRound ? nextParity_cols_1_2_3 : _T_1541[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_17 = isLastRound ? nextParity_cols_2_2_3 : _T_1550[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_18 = isLastRound ? nextParity_cols_3_2_3 : _T_1559[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_19 = isLastRound ? nextParity_cols_4_2_3 : _T_1568[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_20 = isLastRound ? nextParity_cols_0_2_4 : _T_1532[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_21 = isLastRound ? nextParity_cols_1_2_4 : _T_1541[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_22 = isLastRound ? nextParity_cols_2_2_4 : _T_1550[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_23 = isLastRound ? nextParity_cols_3_2_4 : _T_1559[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2161_24 = isLastRound ? nextParity_cols_4_2_4 : _T_1568[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_0 = isLastRound ? nextParity_cols_0_3_0 : _T_1577[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_1 = isLastRound ? nextParity_cols_1_3_0 : _T_1586[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_2 = isLastRound ? nextParity_cols_2_3_0 : _T_1595[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_3 = isLastRound ? nextParity_cols_3_3_0 : _T_1604[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_4 = isLastRound ? nextParity_cols_4_3_0 : _T_1613[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_5 = isLastRound ? nextParity_cols_0_3_1 : _T_1577[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_6 = isLastRound ? nextParity_cols_1_3_1 : _T_1586[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_7 = isLastRound ? nextParity_cols_2_3_1 : _T_1595[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_8 = isLastRound ? nextParity_cols_3_3_1 : _T_1604[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_9 = isLastRound ? nextParity_cols_4_3_1 : _T_1613[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_10 = isLastRound ? nextParity_cols_0_3_2 : _T_1577[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_11 = isLastRound ? nextParity_cols_1_3_2 : _T_1586[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_12 = isLastRound ? nextParity_cols_2_3_2 : _T_1595[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_13 = isLastRound ? nextParity_cols_3_3_2 : _T_1604[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_14 = isLastRound ? nextParity_cols_4_3_2 : _T_1613[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_15 = isLastRound ? nextParity_cols_0_3_3 : _T_1577[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_16 = isLastRound ? nextParity_cols_1_3_3 : _T_1586[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_17 = isLastRound ? nextParity_cols_2_3_3 : _T_1595[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_18 = isLastRound ? nextParity_cols_3_3_3 : _T_1604[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_19 = isLastRound ? nextParity_cols_4_3_3 : _T_1613[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_20 = isLastRound ? nextParity_cols_0_3_4 : _T_1577[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_21 = isLastRound ? nextParity_cols_1_3_4 : _T_1586[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_22 = isLastRound ? nextParity_cols_2_3_4 : _T_1595[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_23 = isLastRound ? nextParity_cols_3_3_4 : _T_1604[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2162_24 = isLastRound ? nextParity_cols_4_3_4 : _T_1613[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_0 = isLastRound ? nextParity_cols_0_4_0 : _T_1622[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_1 = isLastRound ? nextParity_cols_1_4_0 : _T_1631[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_2 = isLastRound ? nextParity_cols_2_4_0 : _T_1640[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_3 = isLastRound ? nextParity_cols_3_4_0 : _T_1649[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_4 = isLastRound ? nextParity_cols_4_4_0 : _T_1658[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_5 = isLastRound ? nextParity_cols_0_4_1 : _T_1622[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_6 = isLastRound ? nextParity_cols_1_4_1 : _T_1631[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_7 = isLastRound ? nextParity_cols_2_4_1 : _T_1640[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_8 = isLastRound ? nextParity_cols_3_4_1 : _T_1649[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_9 = isLastRound ? nextParity_cols_4_4_1 : _T_1658[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_10 = isLastRound ? nextParity_cols_0_4_2 : _T_1622[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_11 = isLastRound ? nextParity_cols_1_4_2 : _T_1631[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_12 = isLastRound ? nextParity_cols_2_4_2 : _T_1640[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_13 = isLastRound ? nextParity_cols_3_4_2 : _T_1649[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_14 = isLastRound ? nextParity_cols_4_4_2 : _T_1658[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_15 = isLastRound ? nextParity_cols_0_4_3 : _T_1622[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_16 = isLastRound ? nextParity_cols_1_4_3 : _T_1631[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_17 = isLastRound ? nextParity_cols_2_4_3 : _T_1640[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_18 = isLastRound ? nextParity_cols_3_4_3 : _T_1649[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_19 = isLastRound ? nextParity_cols_4_4_3 : _T_1658[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_20 = isLastRound ? nextParity_cols_0_4_4 : _T_1622[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_21 = isLastRound ? nextParity_cols_1_4_4 : _T_1631[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_22 = isLastRound ? nextParity_cols_2_4_4 : _T_1640[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_23 = isLastRound ? nextParity_cols_3_4_4 : _T_1649[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2163_24 = isLastRound ? nextParity_cols_4_4_4 : _T_1658[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_0 = isLastRound ? nextParity_cols_0_5_0 : _T_1667[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_1 = isLastRound ? nextParity_cols_1_5_0 : _T_1676[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_2 = isLastRound ? nextParity_cols_2_5_0 : _T_1685[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_3 = isLastRound ? nextParity_cols_3_5_0 : _T_1694[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_4 = isLastRound ? nextParity_cols_4_5_0 : _T_1703[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_5 = isLastRound ? nextParity_cols_0_5_1 : _T_1667[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_6 = isLastRound ? nextParity_cols_1_5_1 : _T_1676[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_7 = isLastRound ? nextParity_cols_2_5_1 : _T_1685[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_8 = isLastRound ? nextParity_cols_3_5_1 : _T_1694[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_9 = isLastRound ? nextParity_cols_4_5_1 : _T_1703[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_10 = isLastRound ? nextParity_cols_0_5_2 : _T_1667[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_11 = isLastRound ? nextParity_cols_1_5_2 : _T_1676[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_12 = isLastRound ? nextParity_cols_2_5_2 : _T_1685[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_13 = isLastRound ? nextParity_cols_3_5_2 : _T_1694[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_14 = isLastRound ? nextParity_cols_4_5_2 : _T_1703[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_15 = isLastRound ? nextParity_cols_0_5_3 : _T_1667[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_16 = isLastRound ? nextParity_cols_1_5_3 : _T_1676[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_17 = isLastRound ? nextParity_cols_2_5_3 : _T_1685[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_18 = isLastRound ? nextParity_cols_3_5_3 : _T_1694[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_19 = isLastRound ? nextParity_cols_4_5_3 : _T_1703[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_20 = isLastRound ? nextParity_cols_0_5_4 : _T_1667[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_21 = isLastRound ? nextParity_cols_1_5_4 : _T_1676[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_22 = isLastRound ? nextParity_cols_2_5_4 : _T_1685[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_23 = isLastRound ? nextParity_cols_3_5_4 : _T_1694[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2164_24 = isLastRound ? nextParity_cols_4_5_4 : _T_1703[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_0 = isLastRound ? nextParity_cols_0_6_0 : _T_1712[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_1 = isLastRound ? nextParity_cols_1_6_0 : _T_1721[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_2 = isLastRound ? nextParity_cols_2_6_0 : _T_1730[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_3 = isLastRound ? nextParity_cols_3_6_0 : _T_1739[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_4 = isLastRound ? nextParity_cols_4_6_0 : _T_1748[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_5 = isLastRound ? nextParity_cols_0_6_1 : _T_1712[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_6 = isLastRound ? nextParity_cols_1_6_1 : _T_1721[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_7 = isLastRound ? nextParity_cols_2_6_1 : _T_1730[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_8 = isLastRound ? nextParity_cols_3_6_1 : _T_1739[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_9 = isLastRound ? nextParity_cols_4_6_1 : _T_1748[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_10 = isLastRound ? nextParity_cols_0_6_2 : _T_1712[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_11 = isLastRound ? nextParity_cols_1_6_2 : _T_1721[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_12 = isLastRound ? nextParity_cols_2_6_2 : _T_1730[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_13 = isLastRound ? nextParity_cols_3_6_2 : _T_1739[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_14 = isLastRound ? nextParity_cols_4_6_2 : _T_1748[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_15 = isLastRound ? nextParity_cols_0_6_3 : _T_1712[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_16 = isLastRound ? nextParity_cols_1_6_3 : _T_1721[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_17 = isLastRound ? nextParity_cols_2_6_3 : _T_1730[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_18 = isLastRound ? nextParity_cols_3_6_3 : _T_1739[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_19 = isLastRound ? nextParity_cols_4_6_3 : _T_1748[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_20 = isLastRound ? nextParity_cols_0_6_4 : _T_1712[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_21 = isLastRound ? nextParity_cols_1_6_4 : _T_1721[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_22 = isLastRound ? nextParity_cols_2_6_4 : _T_1730[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_23 = isLastRound ? nextParity_cols_3_6_4 : _T_1739[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2165_24 = isLastRound ? nextParity_cols_4_6_4 : _T_1748[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_0 = isLastRound ? nextParity_cols_0_7_0 : _T_1757[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_1 = isLastRound ? nextParity_cols_1_7_0 : _T_1766[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_2 = isLastRound ? nextParity_cols_2_7_0 : _T_1775[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_3 = isLastRound ? nextParity_cols_3_7_0 : _T_1784[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_4 = isLastRound ? nextParity_cols_4_7_0 : _T_1793[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_5 = isLastRound ? nextParity_cols_0_7_1 : _T_1757[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_6 = isLastRound ? nextParity_cols_1_7_1 : _T_1766[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_7 = isLastRound ? nextParity_cols_2_7_1 : _T_1775[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_8 = isLastRound ? nextParity_cols_3_7_1 : _T_1784[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_9 = isLastRound ? nextParity_cols_4_7_1 : _T_1793[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_10 = isLastRound ? nextParity_cols_0_7_2 : _T_1757[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_11 = isLastRound ? nextParity_cols_1_7_2 : _T_1766[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_12 = isLastRound ? nextParity_cols_2_7_2 : _T_1775[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_13 = isLastRound ? nextParity_cols_3_7_2 : _T_1784[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_14 = isLastRound ? nextParity_cols_4_7_2 : _T_1793[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_15 = isLastRound ? nextParity_cols_0_7_3 : _T_1757[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_16 = isLastRound ? nextParity_cols_1_7_3 : _T_1766[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_17 = isLastRound ? nextParity_cols_2_7_3 : _T_1775[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_18 = isLastRound ? nextParity_cols_3_7_3 : _T_1784[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_19 = isLastRound ? nextParity_cols_4_7_3 : _T_1793[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_20 = isLastRound ? nextParity_cols_0_7_4 : _T_1757[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_21 = isLastRound ? nextParity_cols_1_7_4 : _T_1766[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_22 = isLastRound ? nextParity_cols_2_7_4 : _T_1775[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_23 = isLastRound ? nextParity_cols_3_7_4 : _T_1784[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2166_24 = isLastRound ? nextParity_cols_4_7_4 : _T_1793[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_0 = isLastRound ? nextParity_cols_0_8_0 : _T_1802[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_1 = isLastRound ? nextParity_cols_1_8_0 : _T_1811[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_2 = isLastRound ? nextParity_cols_2_8_0 : _T_1820[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_3 = isLastRound ? nextParity_cols_3_8_0 : _T_1829[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_4 = isLastRound ? nextParity_cols_4_8_0 : _T_1838[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_5 = isLastRound ? nextParity_cols_0_8_1 : _T_1802[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_6 = isLastRound ? nextParity_cols_1_8_1 : _T_1811[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_7 = isLastRound ? nextParity_cols_2_8_1 : _T_1820[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_8 = isLastRound ? nextParity_cols_3_8_1 : _T_1829[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_9 = isLastRound ? nextParity_cols_4_8_1 : _T_1838[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_10 = isLastRound ? nextParity_cols_0_8_2 : _T_1802[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_11 = isLastRound ? nextParity_cols_1_8_2 : _T_1811[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_12 = isLastRound ? nextParity_cols_2_8_2 : _T_1820[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_13 = isLastRound ? nextParity_cols_3_8_2 : _T_1829[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_14 = isLastRound ? nextParity_cols_4_8_2 : _T_1838[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_15 = isLastRound ? nextParity_cols_0_8_3 : _T_1802[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_16 = isLastRound ? nextParity_cols_1_8_3 : _T_1811[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_17 = isLastRound ? nextParity_cols_2_8_3 : _T_1820[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_18 = isLastRound ? nextParity_cols_3_8_3 : _T_1829[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_19 = isLastRound ? nextParity_cols_4_8_3 : _T_1838[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_20 = isLastRound ? nextParity_cols_0_8_4 : _T_1802[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_21 = isLastRound ? nextParity_cols_1_8_4 : _T_1811[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_22 = isLastRound ? nextParity_cols_2_8_4 : _T_1820[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_23 = isLastRound ? nextParity_cols_3_8_4 : _T_1829[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2167_24 = isLastRound ? nextParity_cols_4_8_4 : _T_1838[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_0 = isLastRound ? nextParity_cols_0_9_0 : _T_1847[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_1 = isLastRound ? nextParity_cols_1_9_0 : _T_1856[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_2 = isLastRound ? nextParity_cols_2_9_0 : _T_1865[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_3 = isLastRound ? nextParity_cols_3_9_0 : _T_1874[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_4 = isLastRound ? nextParity_cols_4_9_0 : _T_1883[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_5 = isLastRound ? nextParity_cols_0_9_1 : _T_1847[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_6 = isLastRound ? nextParity_cols_1_9_1 : _T_1856[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_7 = isLastRound ? nextParity_cols_2_9_1 : _T_1865[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_8 = isLastRound ? nextParity_cols_3_9_1 : _T_1874[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_9 = isLastRound ? nextParity_cols_4_9_1 : _T_1883[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_10 = isLastRound ? nextParity_cols_0_9_2 : _T_1847[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_11 = isLastRound ? nextParity_cols_1_9_2 : _T_1856[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_12 = isLastRound ? nextParity_cols_2_9_2 : _T_1865[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_13 = isLastRound ? nextParity_cols_3_9_2 : _T_1874[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_14 = isLastRound ? nextParity_cols_4_9_2 : _T_1883[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_15 = isLastRound ? nextParity_cols_0_9_3 : _T_1847[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_16 = isLastRound ? nextParity_cols_1_9_3 : _T_1856[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_17 = isLastRound ? nextParity_cols_2_9_3 : _T_1865[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_18 = isLastRound ? nextParity_cols_3_9_3 : _T_1874[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_19 = isLastRound ? nextParity_cols_4_9_3 : _T_1883[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_20 = isLastRound ? nextParity_cols_0_9_4 : _T_1847[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_21 = isLastRound ? nextParity_cols_1_9_4 : _T_1856[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_22 = isLastRound ? nextParity_cols_2_9_4 : _T_1865[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_23 = isLastRound ? nextParity_cols_3_9_4 : _T_1874[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2168_24 = isLastRound ? nextParity_cols_4_9_4 : _T_1883[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_0 = isLastRound ? nextParity_cols_0_10_0 : _T_1892[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_1 = isLastRound ? nextParity_cols_1_10_0 : _T_1901[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_2 = isLastRound ? nextParity_cols_2_10_0 : _T_1910[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_3 = isLastRound ? nextParity_cols_3_10_0 : _T_1919[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_4 = isLastRound ? nextParity_cols_4_10_0 : _T_1928[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_5 = isLastRound ? nextParity_cols_0_10_1 : _T_1892[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_6 = isLastRound ? nextParity_cols_1_10_1 : _T_1901[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_7 = isLastRound ? nextParity_cols_2_10_1 : _T_1910[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_8 = isLastRound ? nextParity_cols_3_10_1 : _T_1919[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_9 = isLastRound ? nextParity_cols_4_10_1 : _T_1928[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_10 = isLastRound ? nextParity_cols_0_10_2 : _T_1892[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_11 = isLastRound ? nextParity_cols_1_10_2 : _T_1901[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_12 = isLastRound ? nextParity_cols_2_10_2 : _T_1910[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_13 = isLastRound ? nextParity_cols_3_10_2 : _T_1919[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_14 = isLastRound ? nextParity_cols_4_10_2 : _T_1928[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_15 = isLastRound ? nextParity_cols_0_10_3 : _T_1892[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_16 = isLastRound ? nextParity_cols_1_10_3 : _T_1901[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_17 = isLastRound ? nextParity_cols_2_10_3 : _T_1910[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_18 = isLastRound ? nextParity_cols_3_10_3 : _T_1919[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_19 = isLastRound ? nextParity_cols_4_10_3 : _T_1928[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_20 = isLastRound ? nextParity_cols_0_10_4 : _T_1892[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_21 = isLastRound ? nextParity_cols_1_10_4 : _T_1901[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_22 = isLastRound ? nextParity_cols_2_10_4 : _T_1910[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_23 = isLastRound ? nextParity_cols_3_10_4 : _T_1919[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2169_24 = isLastRound ? nextParity_cols_4_10_4 : _T_1928[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_0 = isLastRound ? nextParity_cols_0_11_0 : _T_1937[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_1 = isLastRound ? nextParity_cols_1_11_0 : _T_1946[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_2 = isLastRound ? nextParity_cols_2_11_0 : _T_1955[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_3 = isLastRound ? nextParity_cols_3_11_0 : _T_1964[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_4 = isLastRound ? nextParity_cols_4_11_0 : _T_1973[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_5 = isLastRound ? nextParity_cols_0_11_1 : _T_1937[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_6 = isLastRound ? nextParity_cols_1_11_1 : _T_1946[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_7 = isLastRound ? nextParity_cols_2_11_1 : _T_1955[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_8 = isLastRound ? nextParity_cols_3_11_1 : _T_1964[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_9 = isLastRound ? nextParity_cols_4_11_1 : _T_1973[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_10 = isLastRound ? nextParity_cols_0_11_2 : _T_1937[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_11 = isLastRound ? nextParity_cols_1_11_2 : _T_1946[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_12 = isLastRound ? nextParity_cols_2_11_2 : _T_1955[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_13 = isLastRound ? nextParity_cols_3_11_2 : _T_1964[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_14 = isLastRound ? nextParity_cols_4_11_2 : _T_1973[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_15 = isLastRound ? nextParity_cols_0_11_3 : _T_1937[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_16 = isLastRound ? nextParity_cols_1_11_3 : _T_1946[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_17 = isLastRound ? nextParity_cols_2_11_3 : _T_1955[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_18 = isLastRound ? nextParity_cols_3_11_3 : _T_1964[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_19 = isLastRound ? nextParity_cols_4_11_3 : _T_1973[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_20 = isLastRound ? nextParity_cols_0_11_4 : _T_1937[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_21 = isLastRound ? nextParity_cols_1_11_4 : _T_1946[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_22 = isLastRound ? nextParity_cols_2_11_4 : _T_1955[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_23 = isLastRound ? nextParity_cols_3_11_4 : _T_1964[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2170_24 = isLastRound ? nextParity_cols_4_11_4 : _T_1973[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_0 = isLastRound ? nextParity_cols_0_12_0 : _T_1982[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_1 = isLastRound ? nextParity_cols_1_12_0 : _T_1991[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_2 = isLastRound ? nextParity_cols_2_12_0 : _T_2000[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_3 = isLastRound ? nextParity_cols_3_12_0 : _T_2009[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_4 = isLastRound ? nextParity_cols_4_12_0 : _T_2018[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_5 = isLastRound ? nextParity_cols_0_12_1 : _T_1982[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_6 = isLastRound ? nextParity_cols_1_12_1 : _T_1991[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_7 = isLastRound ? nextParity_cols_2_12_1 : _T_2000[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_8 = isLastRound ? nextParity_cols_3_12_1 : _T_2009[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_9 = isLastRound ? nextParity_cols_4_12_1 : _T_2018[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_10 = isLastRound ? nextParity_cols_0_12_2 : _T_1982[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_11 = isLastRound ? nextParity_cols_1_12_2 : _T_1991[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_12 = isLastRound ? nextParity_cols_2_12_2 : _T_2000[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_13 = isLastRound ? nextParity_cols_3_12_2 : _T_2009[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_14 = isLastRound ? nextParity_cols_4_12_2 : _T_2018[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_15 = isLastRound ? nextParity_cols_0_12_3 : _T_1982[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_16 = isLastRound ? nextParity_cols_1_12_3 : _T_1991[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_17 = isLastRound ? nextParity_cols_2_12_3 : _T_2000[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_18 = isLastRound ? nextParity_cols_3_12_3 : _T_2009[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_19 = isLastRound ? nextParity_cols_4_12_3 : _T_2018[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_20 = isLastRound ? nextParity_cols_0_12_4 : _T_1982[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_21 = isLastRound ? nextParity_cols_1_12_4 : _T_1991[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_22 = isLastRound ? nextParity_cols_2_12_4 : _T_2000[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_23 = isLastRound ? nextParity_cols_3_12_4 : _T_2009[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2171_24 = isLastRound ? nextParity_cols_4_12_4 : _T_2018[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_0 = isLastRound ? nextParity_cols_0_13_0 : _T_2027[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_1 = isLastRound ? nextParity_cols_1_13_0 : _T_2036[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_2 = isLastRound ? nextParity_cols_2_13_0 : _T_2045[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_3 = isLastRound ? nextParity_cols_3_13_0 : _T_2054[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_4 = isLastRound ? nextParity_cols_4_13_0 : _T_2063[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_5 = isLastRound ? nextParity_cols_0_13_1 : _T_2027[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_6 = isLastRound ? nextParity_cols_1_13_1 : _T_2036[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_7 = isLastRound ? nextParity_cols_2_13_1 : _T_2045[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_8 = isLastRound ? nextParity_cols_3_13_1 : _T_2054[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_9 = isLastRound ? nextParity_cols_4_13_1 : _T_2063[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_10 = isLastRound ? nextParity_cols_0_13_2 : _T_2027[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_11 = isLastRound ? nextParity_cols_1_13_2 : _T_2036[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_12 = isLastRound ? nextParity_cols_2_13_2 : _T_2045[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_13 = isLastRound ? nextParity_cols_3_13_2 : _T_2054[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_14 = isLastRound ? nextParity_cols_4_13_2 : _T_2063[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_15 = isLastRound ? nextParity_cols_0_13_3 : _T_2027[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_16 = isLastRound ? nextParity_cols_1_13_3 : _T_2036[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_17 = isLastRound ? nextParity_cols_2_13_3 : _T_2045[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_18 = isLastRound ? nextParity_cols_3_13_3 : _T_2054[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_19 = isLastRound ? nextParity_cols_4_13_3 : _T_2063[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_20 = isLastRound ? nextParity_cols_0_13_4 : _T_2027[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_21 = isLastRound ? nextParity_cols_1_13_4 : _T_2036[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_22 = isLastRound ? nextParity_cols_2_13_4 : _T_2045[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_23 = isLastRound ? nextParity_cols_3_13_4 : _T_2054[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2172_24 = isLastRound ? nextParity_cols_4_13_4 : _T_2063[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_0 = isLastRound ? nextParity_cols_0_14_0 : _T_2072[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_1 = isLastRound ? nextParity_cols_1_14_0 : _T_2081[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_2 = isLastRound ? nextParity_cols_2_14_0 : _T_2090[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_3 = isLastRound ? nextParity_cols_3_14_0 : _T_2099[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_4 = isLastRound ? nextParity_cols_4_14_0 : _T_2108[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_5 = isLastRound ? nextParity_cols_0_14_1 : _T_2072[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_6 = isLastRound ? nextParity_cols_1_14_1 : _T_2081[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_7 = isLastRound ? nextParity_cols_2_14_1 : _T_2090[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_8 = isLastRound ? nextParity_cols_3_14_1 : _T_2099[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_9 = isLastRound ? nextParity_cols_4_14_1 : _T_2108[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_10 = isLastRound ? nextParity_cols_0_14_2 : _T_2072[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_11 = isLastRound ? nextParity_cols_1_14_2 : _T_2081[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_12 = isLastRound ? nextParity_cols_2_14_2 : _T_2090[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_13 = isLastRound ? nextParity_cols_3_14_2 : _T_2099[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_14 = isLastRound ? nextParity_cols_4_14_2 : _T_2108[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_15 = isLastRound ? nextParity_cols_0_14_3 : _T_2072[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_16 = isLastRound ? nextParity_cols_1_14_3 : _T_2081[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_17 = isLastRound ? nextParity_cols_2_14_3 : _T_2090[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_18 = isLastRound ? nextParity_cols_3_14_3 : _T_2099[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_19 = isLastRound ? nextParity_cols_4_14_3 : _T_2108[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_20 = isLastRound ? nextParity_cols_0_14_4 : _T_2072[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_21 = isLastRound ? nextParity_cols_1_14_4 : _T_2081[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_22 = isLastRound ? nextParity_cols_2_14_4 : _T_2090[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_23 = isLastRound ? nextParity_cols_3_14_4 : _T_2099[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2173_24 = isLastRound ? nextParity_cols_4_14_4 : _T_2108[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_0 = isLastRound ? nextParity_cols_0_15_0 : _T_2117[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_1 = isLastRound ? nextParity_cols_1_15_0 : _T_2126[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_2 = isLastRound ? nextParity_cols_2_15_0 : _T_2135[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_3 = isLastRound ? nextParity_cols_3_15_0 : _T_2144[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_4 = isLastRound ? nextParity_cols_4_15_0 : _T_2153[0]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_5 = isLastRound ? nextParity_cols_0_15_1 : _T_2117[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_6 = isLastRound ? nextParity_cols_1_15_1 : _T_2126[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_7 = isLastRound ? nextParity_cols_2_15_1 : _T_2135[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_8 = isLastRound ? nextParity_cols_3_15_1 : _T_2144[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_9 = isLastRound ? nextParity_cols_4_15_1 : _T_2153[1]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_10 = isLastRound ? nextParity_cols_0_15_2 : _T_2117[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_11 = isLastRound ? nextParity_cols_1_15_2 : _T_2126[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_12 = isLastRound ? nextParity_cols_2_15_2 : _T_2135[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_13 = isLastRound ? nextParity_cols_3_15_2 : _T_2144[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_14 = isLastRound ? nextParity_cols_4_15_2 : _T_2153[2]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_15 = isLastRound ? nextParity_cols_0_15_3 : _T_2117[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_16 = isLastRound ? nextParity_cols_1_15_3 : _T_2126[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_17 = isLastRound ? nextParity_cols_2_15_3 : _T_2135[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_18 = isLastRound ? nextParity_cols_3_15_3 : _T_2144[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_19 = isLastRound ? nextParity_cols_4_15_3 : _T_2153[3]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_20 = isLastRound ? nextParity_cols_0_15_4 : _T_2117[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_21 = isLastRound ? nextParity_cols_1_15_4 : _T_2126[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_22 = isLastRound ? nextParity_cols_2_15_4 : _T_2135[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_23 = isLastRound ? nextParity_cols_3_15_4 : _T_2144[4]; // @[KeccakCore.scala 447:31]
  wire  _T_2174_24 = isLastRound ? nextParity_cols_4_15_4 : _T_2153[4]; // @[KeccakCore.scala 447:31]
  wire [63:0] _keccakStateRegShares_0_0_T_2 = {_T_2166_0,_T_2165_0,_T_2164_0,_T_2163_0,_T_2162_0,_T_2161_0,_T_2160_0,
    _T_2159_0,keccakStateRegShares_0_0[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_1_T_2 = {_T_2166_1,_T_2165_1,_T_2164_1,_T_2163_1,_T_2162_1,_T_2161_1,_T_2160_1,
    _T_2159_1,keccakStateRegShares_0_1[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_2_T_2 = {_T_2166_2,_T_2165_2,_T_2164_2,_T_2163_2,_T_2162_2,_T_2161_2,_T_2160_2,
    _T_2159_2,keccakStateRegShares_0_2[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_3_T_2 = {_T_2166_3,_T_2165_3,_T_2164_3,_T_2163_3,_T_2162_3,_T_2161_3,_T_2160_3,
    _T_2159_3,keccakStateRegShares_0_3[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_4_T_2 = {_T_2166_4,_T_2165_4,_T_2164_4,_T_2163_4,_T_2162_4,_T_2161_4,_T_2160_4,
    _T_2159_4,keccakStateRegShares_0_4[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_5_T_2 = {_T_2166_5,_T_2165_5,_T_2164_5,_T_2163_5,_T_2162_5,_T_2161_5,_T_2160_5,
    _T_2159_5,keccakStateRegShares_0_5[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_6_T_2 = {_T_2166_6,_T_2165_6,_T_2164_6,_T_2163_6,_T_2162_6,_T_2161_6,_T_2160_6,
    _T_2159_6,keccakStateRegShares_0_6[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_7_T_2 = {_T_2166_7,_T_2165_7,_T_2164_7,_T_2163_7,_T_2162_7,_T_2161_7,_T_2160_7,
    _T_2159_7,keccakStateRegShares_0_7[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_8_T_2 = {_T_2166_8,_T_2165_8,_T_2164_8,_T_2163_8,_T_2162_8,_T_2161_8,_T_2160_8,
    _T_2159_8,keccakStateRegShares_0_8[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_9_T_2 = {_T_2166_9,_T_2165_9,_T_2164_9,_T_2163_9,_T_2162_9,_T_2161_9,_T_2160_9,
    _T_2159_9,keccakStateRegShares_0_9[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_10_T_2 = {_T_2166_10,_T_2165_10,_T_2164_10,_T_2163_10,_T_2162_10,_T_2161_10,
    _T_2160_10,_T_2159_10,keccakStateRegShares_0_10[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_11_T_2 = {_T_2166_11,_T_2165_11,_T_2164_11,_T_2163_11,_T_2162_11,_T_2161_11,
    _T_2160_11,_T_2159_11,keccakStateRegShares_0_11[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_12_T_2 = {_T_2166_12,_T_2165_12,_T_2164_12,_T_2163_12,_T_2162_12,_T_2161_12,
    _T_2160_12,_T_2159_12,keccakStateRegShares_0_12[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_13_T_2 = {_T_2166_13,_T_2165_13,_T_2164_13,_T_2163_13,_T_2162_13,_T_2161_13,
    _T_2160_13,_T_2159_13,keccakStateRegShares_0_13[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_14_T_2 = {_T_2166_14,_T_2165_14,_T_2164_14,_T_2163_14,_T_2162_14,_T_2161_14,
    _T_2160_14,_T_2159_14,keccakStateRegShares_0_14[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_15_T_2 = {_T_2166_15,_T_2165_15,_T_2164_15,_T_2163_15,_T_2162_15,_T_2161_15,
    _T_2160_15,_T_2159_15,keccakStateRegShares_0_15[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_16_T_2 = {_T_2166_16,_T_2165_16,_T_2164_16,_T_2163_16,_T_2162_16,_T_2161_16,
    _T_2160_16,_T_2159_16,keccakStateRegShares_0_16[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_17_T_2 = {_T_2166_17,_T_2165_17,_T_2164_17,_T_2163_17,_T_2162_17,_T_2161_17,
    _T_2160_17,_T_2159_17,keccakStateRegShares_0_17[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_18_T_2 = {_T_2166_18,_T_2165_18,_T_2164_18,_T_2163_18,_T_2162_18,_T_2161_18,
    _T_2160_18,_T_2159_18,keccakStateRegShares_0_18[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_19_T_2 = {_T_2166_19,_T_2165_19,_T_2164_19,_T_2163_19,_T_2162_19,_T_2161_19,
    _T_2160_19,_T_2159_19,keccakStateRegShares_0_19[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_20_T_2 = {_T_2166_20,_T_2165_20,_T_2164_20,_T_2163_20,_T_2162_20,_T_2161_20,
    _T_2160_20,_T_2159_20,keccakStateRegShares_0_20[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_21_T_2 = {_T_2166_21,_T_2165_21,_T_2164_21,_T_2163_21,_T_2162_21,_T_2161_21,
    _T_2160_21,_T_2159_21,keccakStateRegShares_0_21[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_22_T_2 = {_T_2166_22,_T_2165_22,_T_2164_22,_T_2163_22,_T_2162_22,_T_2161_22,
    _T_2160_22,_T_2159_22,keccakStateRegShares_0_22[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_23_T_2 = {_T_2166_23,_T_2165_23,_T_2164_23,_T_2163_23,_T_2162_23,_T_2161_23,
    _T_2160_23,_T_2159_23,keccakStateRegShares_0_23[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_0_24_T_7 = {_T_2166_24,_T_2165_24,_T_2164_24,_T_2163_24,_T_2162_24,_T_2161_24,
    _T_2160_24,_T_2159_24,keccakStateRegShares_0_24[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_0_T_2 = {_T_2174_0,_T_2173_0,_T_2172_0,_T_2171_0,_T_2170_0,_T_2169_0,_T_2168_0,
    _T_2167_0,keccakStateRegShares_1_0[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_1_T_2 = {_T_2174_1,_T_2173_1,_T_2172_1,_T_2171_1,_T_2170_1,_T_2169_1,_T_2168_1,
    _T_2167_1,keccakStateRegShares_1_1[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_2_T_2 = {_T_2174_2,_T_2173_2,_T_2172_2,_T_2171_2,_T_2170_2,_T_2169_2,_T_2168_2,
    _T_2167_2,keccakStateRegShares_1_2[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_3_T_2 = {_T_2174_3,_T_2173_3,_T_2172_3,_T_2171_3,_T_2170_3,_T_2169_3,_T_2168_3,
    _T_2167_3,keccakStateRegShares_1_3[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_4_T_2 = {_T_2174_4,_T_2173_4,_T_2172_4,_T_2171_4,_T_2170_4,_T_2169_4,_T_2168_4,
    _T_2167_4,keccakStateRegShares_1_4[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_5_T_2 = {_T_2174_5,_T_2173_5,_T_2172_5,_T_2171_5,_T_2170_5,_T_2169_5,_T_2168_5,
    _T_2167_5,keccakStateRegShares_1_5[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_6_T_2 = {_T_2174_6,_T_2173_6,_T_2172_6,_T_2171_6,_T_2170_6,_T_2169_6,_T_2168_6,
    _T_2167_6,keccakStateRegShares_1_6[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_7_T_2 = {_T_2174_7,_T_2173_7,_T_2172_7,_T_2171_7,_T_2170_7,_T_2169_7,_T_2168_7,
    _T_2167_7,keccakStateRegShares_1_7[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_8_T_2 = {_T_2174_8,_T_2173_8,_T_2172_8,_T_2171_8,_T_2170_8,_T_2169_8,_T_2168_8,
    _T_2167_8,keccakStateRegShares_1_8[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_9_T_2 = {_T_2174_9,_T_2173_9,_T_2172_9,_T_2171_9,_T_2170_9,_T_2169_9,_T_2168_9,
    _T_2167_9,keccakStateRegShares_1_9[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_10_T_2 = {_T_2174_10,_T_2173_10,_T_2172_10,_T_2171_10,_T_2170_10,_T_2169_10,
    _T_2168_10,_T_2167_10,keccakStateRegShares_1_10[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_11_T_2 = {_T_2174_11,_T_2173_11,_T_2172_11,_T_2171_11,_T_2170_11,_T_2169_11,
    _T_2168_11,_T_2167_11,keccakStateRegShares_1_11[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_12_T_2 = {_T_2174_12,_T_2173_12,_T_2172_12,_T_2171_12,_T_2170_12,_T_2169_12,
    _T_2168_12,_T_2167_12,keccakStateRegShares_1_12[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_13_T_2 = {_T_2174_13,_T_2173_13,_T_2172_13,_T_2171_13,_T_2170_13,_T_2169_13,
    _T_2168_13,_T_2167_13,keccakStateRegShares_1_13[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_14_T_2 = {_T_2174_14,_T_2173_14,_T_2172_14,_T_2171_14,_T_2170_14,_T_2169_14,
    _T_2168_14,_T_2167_14,keccakStateRegShares_1_14[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_15_T_2 = {_T_2174_15,_T_2173_15,_T_2172_15,_T_2171_15,_T_2170_15,_T_2169_15,
    _T_2168_15,_T_2167_15,keccakStateRegShares_1_15[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_16_T_2 = {_T_2174_16,_T_2173_16,_T_2172_16,_T_2171_16,_T_2170_16,_T_2169_16,
    _T_2168_16,_T_2167_16,keccakStateRegShares_1_16[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_17_T_2 = {_T_2174_17,_T_2173_17,_T_2172_17,_T_2171_17,_T_2170_17,_T_2169_17,
    _T_2168_17,_T_2167_17,keccakStateRegShares_1_17[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_18_T_2 = {_T_2174_18,_T_2173_18,_T_2172_18,_T_2171_18,_T_2170_18,_T_2169_18,
    _T_2168_18,_T_2167_18,keccakStateRegShares_1_18[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_19_T_2 = {_T_2174_19,_T_2173_19,_T_2172_19,_T_2171_19,_T_2170_19,_T_2169_19,
    _T_2168_19,_T_2167_19,keccakStateRegShares_1_19[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_20_T_2 = {_T_2174_20,_T_2173_20,_T_2172_20,_T_2171_20,_T_2170_20,_T_2169_20,
    _T_2168_20,_T_2167_20,keccakStateRegShares_1_20[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_21_T_2 = {_T_2174_21,_T_2173_21,_T_2172_21,_T_2171_21,_T_2170_21,_T_2169_21,
    _T_2168_21,_T_2167_21,keccakStateRegShares_1_21[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_22_T_2 = {_T_2174_22,_T_2173_22,_T_2172_22,_T_2171_22,_T_2170_22,_T_2169_22,
    _T_2168_22,_T_2167_22,keccakStateRegShares_1_22[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_23_T_2 = {_T_2174_23,_T_2173_23,_T_2172_23,_T_2171_23,_T_2170_23,_T_2169_23,
    _T_2168_23,_T_2167_23,keccakStateRegShares_1_23[63:8]}; // @[KeccakCore.scala 214:63]
  wire [63:0] _keccakStateRegShares_1_24_T_7 = {_T_2174_24,_T_2173_24,_T_2172_24,_T_2171_24,_T_2170_24,_T_2169_24,
    _T_2168_24,_T_2167_24,keccakStateRegShares_1_24[63:8]}; // @[KeccakCore.scala 214:63]
  wire  lastSliceProc = shiftCtr == 5'h7; // @[KeccakCore.scala 218:36]
  wire  firstRoundThetaFinished = zerothRound & lastSliceProc; // @[KeccakCore.scala 219:49]
  wire [2:0] _GEN_154 = io_ctrl_absorb ? 3'h1 : 3'h6; // @[KeccakCore.scala 227:32 KeccakCore.scala 228:19 KeccakCore.scala 230:19]
  wire [4:0] _GEN_155 = isLastRound ? 5'h0 : roundCtr; // @[KeccakCore.scala 224:27 KeccakCore.scala 225:20 KeccakCore.scala 102:27]
  wire [4:0] _GEN_156 = isLastRound ? 5'h0 : shiftCtr; // @[KeccakCore.scala 224:27 KeccakCore.scala 226:20 KeccakCore.scala 103:27]
  wire [2:0] _GEN_157 = isLastRound ? _GEN_154 : 3'h5; // @[KeccakCore.scala 224:27 KeccakCore.scala 222:15]
  wire  _GEN_158 = lastSliceProc | lastSliceProcFlag; // @[KeccakCore.scala 234:29 KeccakCore.scala 235:29 KeccakCore.scala 168:36]
  wire [2:0] _GEN_159 = firstRoundThetaFinished | lastSliceProcFlag ? _GEN_157 : state; // @[KeccakCore.scala 221:58 KeccakCore.scala 101:34]
  wire [4:0] _GEN_160 = firstRoundThetaFinished | lastSliceProcFlag ? _GEN_155 : roundCtr; // @[KeccakCore.scala 221:58 KeccakCore.scala 102:27]
  wire [4:0] _GEN_161 = firstRoundThetaFinished | lastSliceProcFlag ? _GEN_156 : _shiftCtr_T_1; // @[KeccakCore.scala 221:58 KeccakCore.scala 237:18]
  wire  _GEN_162 = firstRoundThetaFinished | lastSliceProcFlag ? lastSliceProcFlag : _GEN_158; // @[KeccakCore.scala 221:58 KeccakCore.scala 168:36]
  wire [63:0] _T_2181 = {keccakStateRegShares_0_1[62:0],keccakStateRegShares_0_1[63]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2184 = {keccakStateRegShares_0_2[1:0],keccakStateRegShares_0_2[63:2]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2187 = {keccakStateRegShares_0_3[35:0],keccakStateRegShares_0_3[63:36]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2190 = {keccakStateRegShares_0_4[36:0],keccakStateRegShares_0_4[63:37]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2193 = {keccakStateRegShares_0_5[27:0],keccakStateRegShares_0_5[63:28]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2196 = {keccakStateRegShares_0_6[19:0],keccakStateRegShares_0_6[63:20]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2199 = {keccakStateRegShares_0_7[57:0],keccakStateRegShares_0_7[63:58]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2202 = {keccakStateRegShares_0_8[8:0],keccakStateRegShares_0_8[63:9]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2205 = {keccakStateRegShares_0_9[43:0],keccakStateRegShares_0_9[63:44]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2208 = {keccakStateRegShares_0_10[60:0],keccakStateRegShares_0_10[63:61]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2211 = {keccakStateRegShares_0_11[53:0],keccakStateRegShares_0_11[63:54]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2214 = {keccakStateRegShares_0_12[20:0],keccakStateRegShares_0_12[63:21]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2217 = {keccakStateRegShares_0_13[38:0],keccakStateRegShares_0_13[63:39]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2220 = {keccakStateRegShares_0_14[24:0],keccakStateRegShares_0_14[63:25]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2223 = {keccakStateRegShares_0_15[22:0],keccakStateRegShares_0_15[63:23]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2226 = {keccakStateRegShares_0_16[18:0],keccakStateRegShares_0_16[63:19]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2229 = {keccakStateRegShares_0_17[48:0],keccakStateRegShares_0_17[63:49]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2232 = {keccakStateRegShares_0_18[42:0],keccakStateRegShares_0_18[63:43]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2235 = {keccakStateRegShares_0_19[55:0],keccakStateRegShares_0_19[63:56]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2238 = {keccakStateRegShares_0_20[45:0],keccakStateRegShares_0_20[63:46]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2241 = {keccakStateRegShares_0_21[61:0],keccakStateRegShares_0_21[63:62]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2244 = {keccakStateRegShares_0_22[2:0],keccakStateRegShares_0_22[63:3]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2247 = {keccakStateRegShares_0_23[7:0],keccakStateRegShares_0_23[63:8]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2250 = {keccakStateRegShares_0_24[49:0],keccakStateRegShares_0_24[63:50]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2253 = {keccakStateRegShares_1_1[62:0],keccakStateRegShares_1_1[63]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2256 = {keccakStateRegShares_1_2[1:0],keccakStateRegShares_1_2[63:2]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2259 = {keccakStateRegShares_1_3[35:0],keccakStateRegShares_1_3[63:36]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2262 = {keccakStateRegShares_1_4[36:0],keccakStateRegShares_1_4[63:37]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2265 = {keccakStateRegShares_1_5[27:0],keccakStateRegShares_1_5[63:28]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2268 = {keccakStateRegShares_1_6[19:0],keccakStateRegShares_1_6[63:20]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2271 = {keccakStateRegShares_1_7[57:0],keccakStateRegShares_1_7[63:58]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2274 = {keccakStateRegShares_1_8[8:0],keccakStateRegShares_1_8[63:9]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2277 = {keccakStateRegShares_1_9[43:0],keccakStateRegShares_1_9[63:44]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2280 = {keccakStateRegShares_1_10[60:0],keccakStateRegShares_1_10[63:61]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2283 = {keccakStateRegShares_1_11[53:0],keccakStateRegShares_1_11[63:54]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2286 = {keccakStateRegShares_1_12[20:0],keccakStateRegShares_1_12[63:21]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2289 = {keccakStateRegShares_1_13[38:0],keccakStateRegShares_1_13[63:39]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2292 = {keccakStateRegShares_1_14[24:0],keccakStateRegShares_1_14[63:25]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2295 = {keccakStateRegShares_1_15[22:0],keccakStateRegShares_1_15[63:23]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2298 = {keccakStateRegShares_1_16[18:0],keccakStateRegShares_1_16[63:19]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2301 = {keccakStateRegShares_1_17[48:0],keccakStateRegShares_1_17[63:49]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2304 = {keccakStateRegShares_1_18[42:0],keccakStateRegShares_1_18[63:43]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2307 = {keccakStateRegShares_1_19[55:0],keccakStateRegShares_1_19[63:56]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2310 = {keccakStateRegShares_1_20[45:0],keccakStateRegShares_1_20[63:46]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2313 = {keccakStateRegShares_1_21[61:0],keccakStateRegShares_1_21[63:62]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2316 = {keccakStateRegShares_1_22[2:0],keccakStateRegShares_1_22[63:3]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2319 = {keccakStateRegShares_1_23[7:0],keccakStateRegShares_1_23[63:8]}; // @[KeccakCore.scala 479:62]
  wire [63:0] _T_2322 = {keccakStateRegShares_1_24[49:0],keccakStateRegShares_1_24[63:50]}; // @[KeccakCore.scala 479:62]
  wire [4:0] _roundCtr_T_1 = roundCtr + 5'h1; // @[KeccakCore.scala 242:28]
  wire  _GEN_163 = lastRateLine ? 1'h0 : isRateLineFlag; // @[KeccakCore.scala 252:28 KeccakCore.scala 253:26 KeccakCore.scala 105:33]
  wire [4:0] _GEN_164 = lastLaneRotate ? 5'h0 : _shiftCtr_T_1; // @[KeccakCore.scala 257:30 KeccakCore.scala 258:20 KeccakCore.scala 256:18]
  wire [2:0] _GEN_165 = lastLaneRotate ? 3'h7 : state; // @[KeccakCore.scala 257:30 KeccakCore.scala 259:17 KeccakCore.scala 101:34]
  wire  _GEN_166 = ~io_dout_valid | io_dout_ready ? _GEN_163 : isRateLineFlag; // @[KeccakCore.scala 251:45 KeccakCore.scala 105:33]
  wire [4:0] _GEN_168 = ~io_dout_valid | io_dout_ready ? _GEN_164 : shiftCtr; // @[KeccakCore.scala 251:45 KeccakCore.scala 103:27]
  wire [2:0] _GEN_169 = ~io_dout_valid | io_dout_ready ? _GEN_165 : state; // @[KeccakCore.scala 251:45 KeccakCore.scala 101:34]
  wire  _T_2330 = 3'h7 == state; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_170 = io_ctrl_squeeze ? 2'h3 : 2'h0; // @[KeccakCore.scala 266:29 KeccakCore.scala 267:15 KeccakCore.scala 269:15]
  wire  _GEN_172 = _T_2330 | isRateLineFlag; // @[Conditional.scala 39:67 KeccakCore.scala 265:22 KeccakCore.scala 105:33]
  wire [2:0] _GEN_173 = _T_2330 ? {{1'd0}, _GEN_170} : state; // @[Conditional.scala 39:67 KeccakCore.scala 101:34]
  wire  _GEN_174 = _T_2325 & (isRateLineFlag & io_ctrl_squeeze); // @[Conditional.scala 39:67 KeccakCore.scala 249:21 KeccakCore.scala 73:17]
  wire  _GEN_175 = _T_2325 ? _GEN_166 : _GEN_172; // @[Conditional.scala 39:67]
  wire [4:0] _GEN_177 = _T_2325 ? _GEN_168 : shiftCtr; // @[Conditional.scala 39:67 KeccakCore.scala 103:27]
  wire [2:0] _GEN_178 = _T_2325 ? _GEN_169 : _GEN_173; // @[Conditional.scala 39:67]
  wire [63:0] _GEN_180 = _T_2178 ? keccakStateRegShares_0_0 : _GEN_0; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_181 = _T_2178 ? _T_2181 : _GEN_1; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_182 = _T_2178 ? _T_2184 : _GEN_2; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_183 = _T_2178 ? _T_2187 : _GEN_3; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_184 = _T_2178 ? _T_2190 : _GEN_4; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_185 = _T_2178 ? _T_2193 : _GEN_5; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_186 = _T_2178 ? _T_2196 : _GEN_6; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_187 = _T_2178 ? _T_2199 : _GEN_7; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_188 = _T_2178 ? _T_2202 : _GEN_8; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_189 = _T_2178 ? _T_2205 : _GEN_9; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_190 = _T_2178 ? _T_2208 : _GEN_10; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_191 = _T_2178 ? _T_2211 : _GEN_11; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_192 = _T_2178 ? _T_2214 : _GEN_12; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_193 = _T_2178 ? _T_2217 : _GEN_13; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_194 = _T_2178 ? _T_2220 : _GEN_14; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_195 = _T_2178 ? _T_2223 : _GEN_15; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_196 = _T_2178 ? _T_2226 : _GEN_16; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_197 = _T_2178 ? _T_2229 : _GEN_17; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_198 = _T_2178 ? _T_2232 : _GEN_18; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_199 = _T_2178 ? _T_2235 : _GEN_19; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_200 = _T_2178 ? _T_2238 : _GEN_20; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_201 = _T_2178 ? _T_2241 : _GEN_21; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_202 = _T_2178 ? _T_2244 : _GEN_22; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_203 = _T_2178 ? _T_2247 : _GEN_23; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_204 = _T_2178 ? _T_2250 : _GEN_24; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_205 = _T_2178 ? keccakStateRegShares_1_0 : _GEN_25; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_206 = _T_2178 ? _T_2253 : _GEN_26; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_207 = _T_2178 ? _T_2256 : _GEN_27; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_208 = _T_2178 ? _T_2259 : _GEN_28; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_209 = _T_2178 ? _T_2262 : _GEN_29; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_210 = _T_2178 ? _T_2265 : _GEN_30; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_211 = _T_2178 ? _T_2268 : _GEN_31; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_212 = _T_2178 ? _T_2271 : _GEN_32; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_213 = _T_2178 ? _T_2274 : _GEN_33; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_214 = _T_2178 ? _T_2277 : _GEN_34; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_215 = _T_2178 ? _T_2280 : _GEN_35; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_216 = _T_2178 ? _T_2283 : _GEN_36; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_217 = _T_2178 ? _T_2286 : _GEN_37; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_218 = _T_2178 ? _T_2289 : _GEN_38; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_219 = _T_2178 ? _T_2292 : _GEN_39; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_220 = _T_2178 ? _T_2295 : _GEN_40; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_221 = _T_2178 ? _T_2298 : _GEN_41; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_222 = _T_2178 ? _T_2301 : _GEN_42; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_223 = _T_2178 ? _T_2304 : _GEN_43; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_224 = _T_2178 ? _T_2307 : _GEN_44; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_225 = _T_2178 ? _T_2310 : _GEN_45; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_226 = _T_2178 ? _T_2313 : _GEN_46; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_227 = _T_2178 ? _T_2316 : _GEN_47; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_228 = _T_2178 ? _T_2319 : _GEN_48; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [63:0] _GEN_229 = _T_2178 ? _T_2322 : _GEN_49; // @[Conditional.scala 39:67 KeccakCore.scala 241:45]
  wire [4:0] _GEN_230 = _T_2178 ? _roundCtr_T_1 : roundCtr; // @[Conditional.scala 39:67 KeccakCore.scala 242:16 KeccakCore.scala 102:27]
  wire [2:0] _GEN_231 = _T_2178 ? 3'h3 : _GEN_178; // @[Conditional.scala 39:67 KeccakCore.scala 246:13]
  wire  _GEN_232 = _T_2178 ? 1'h0 : _GEN_174; // @[Conditional.scala 39:67 KeccakCore.scala 73:17]
  wire  _GEN_233 = _T_2178 ? isRateLineFlag : _GEN_175; // @[Conditional.scala 39:67 KeccakCore.scala 105:33]
  wire [4:0] _GEN_235 = _T_2178 ? shiftCtr : _GEN_177; // @[Conditional.scala 39:67 KeccakCore.scala 103:27]
  wire [2:0] _GEN_288 = _T_933 ? _GEN_159 : _GEN_231; // @[Conditional.scala 39:67]
  wire  _GEN_292 = _T_933 ? 1'h0 : _GEN_232; // @[Conditional.scala 39:67 KeccakCore.scala 73:17]
  wire  _GEN_293 = _T_933 ? isRateLineFlag : _GEN_233; // @[Conditional.scala 39:67 KeccakCore.scala 105:33]
  wire  _GEN_298 = _T_930 ? 1'h0 : absorbInitFlag; // @[Conditional.scala 39:67 KeccakCore.scala 203:22 KeccakCore.scala 106:33]
  wire  _GEN_353 = _T_930 ? 1'h0 : _GEN_292; // @[Conditional.scala 39:67 KeccakCore.scala 73:17]
  wire  _GEN_354 = _T_930 ? isRateLineFlag : _GEN_293; // @[Conditional.scala 39:67 KeccakCore.scala 105:33]
  wire  _GEN_357 = _T_921 ? _GEN_60 : _GEN_354; // @[Conditional.scala 39:67]
  wire  _GEN_358 = _T_921 & (isRateLineFlag & _gateBitMask_T_1); // @[Conditional.scala 39:67 KeccakCore.scala 185:20 KeccakCore.scala 74:16]
  wire  _GEN_366 = _T_921 ? absorbInitFlag : _GEN_298; // @[Conditional.scala 39:67 KeccakCore.scala 106:33]
  wire  _GEN_418 = _T_921 ? 1'h0 : _GEN_353; // @[Conditional.scala 39:67 KeccakCore.scala 73:17]
  assign io_din_ready = _T_918 ? 1'h0 : _GEN_358; // @[Conditional.scala 40:58 KeccakCore.scala 74:16]
  assign io_dout_valid = _T_918 ? 1'h0 : _GEN_418; // @[Conditional.scala 40:58 KeccakCore.scala 73:17]
  assign io_dout_bits_0 = keccakStateRegShares_0_0; // @[KeccakCore.scala 79:71]
  assign io_dout_bits_1 = keccakStateRegShares_1_0; // @[KeccakCore.scala 79:71]
  always @(posedge clock) begin
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_0 <= _GEN_0;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_0 <= _GEN_0;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_0 <= _GEN_0;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_0 <= _keccakStateRegShares_0_0_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_0 <= _GEN_180;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_1 <= _GEN_1;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_1 <= _GEN_1;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_1 <= _GEN_1;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_1 <= _keccakStateRegShares_0_1_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_1 <= _GEN_181;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_2 <= _GEN_2;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_2 <= _GEN_2;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_2 <= _GEN_2;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_2 <= _keccakStateRegShares_0_2_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_2 <= _GEN_182;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_3 <= _GEN_3;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_3 <= _GEN_3;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_3 <= _GEN_3;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_3 <= _keccakStateRegShares_0_3_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_3 <= _GEN_183;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_4 <= _GEN_4;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_4 <= _GEN_4;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_4 <= _GEN_4;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_4 <= _keccakStateRegShares_0_4_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_4 <= _GEN_184;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_5 <= _GEN_5;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_5 <= _GEN_5;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_5 <= _GEN_5;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_5 <= _keccakStateRegShares_0_5_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_5 <= _GEN_185;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_6 <= _GEN_6;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_6 <= _GEN_6;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_6 <= _GEN_6;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_6 <= _keccakStateRegShares_0_6_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_6 <= _GEN_186;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_7 <= _GEN_7;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_7 <= _GEN_7;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_7 <= _GEN_7;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_7 <= _keccakStateRegShares_0_7_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_7 <= _GEN_187;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_8 <= _GEN_8;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_8 <= _GEN_8;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_8 <= _GEN_8;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_8 <= _keccakStateRegShares_0_8_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_8 <= _GEN_188;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_9 <= _GEN_9;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_9 <= _GEN_9;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_9 <= _GEN_9;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_9 <= _keccakStateRegShares_0_9_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_9 <= _GEN_189;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_10 <= _GEN_10;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_10 <= _GEN_10;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_10 <= _GEN_10;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_10 <= _keccakStateRegShares_0_10_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_10 <= _GEN_190;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_11 <= _GEN_11;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_11 <= _GEN_11;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_11 <= _GEN_11;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_11 <= _keccakStateRegShares_0_11_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_11 <= _GEN_191;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_12 <= _GEN_12;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_12 <= _GEN_12;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_12 <= _GEN_12;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_12 <= _keccakStateRegShares_0_12_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_12 <= _GEN_192;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_13 <= _GEN_13;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_13 <= _GEN_13;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_13 <= _GEN_13;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_13 <= _keccakStateRegShares_0_13_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_13 <= _GEN_193;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_14 <= _GEN_14;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_14 <= _GEN_14;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_14 <= _GEN_14;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_14 <= _keccakStateRegShares_0_14_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_14 <= _GEN_194;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_15 <= _GEN_15;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_15 <= _GEN_15;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_15 <= _GEN_15;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_15 <= _keccakStateRegShares_0_15_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_15 <= _GEN_195;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_16 <= _GEN_16;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_16 <= _GEN_16;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_16 <= _GEN_16;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_16 <= _keccakStateRegShares_0_16_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_16 <= _GEN_196;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_17 <= _GEN_17;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_17 <= _GEN_17;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_17 <= _GEN_17;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_17 <= _keccakStateRegShares_0_17_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_17 <= _GEN_197;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_18 <= _GEN_18;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_18 <= _GEN_18;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_18 <= _GEN_18;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_18 <= _keccakStateRegShares_0_18_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_18 <= _GEN_198;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_19 <= _GEN_19;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_19 <= _GEN_19;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_19 <= _GEN_19;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_19 <= _keccakStateRegShares_0_19_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_19 <= _GEN_199;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_20 <= _GEN_20;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_20 <= _GEN_20;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_20 <= _GEN_20;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_20 <= _keccakStateRegShares_0_20_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_20 <= _GEN_200;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_21 <= _GEN_21;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_21 <= _GEN_21;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_21 <= _GEN_21;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_21 <= _keccakStateRegShares_0_21_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_21 <= _GEN_201;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_22 <= _GEN_22;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_22 <= _GEN_22;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_22 <= _GEN_22;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_22 <= _keccakStateRegShares_0_22_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_22 <= _GEN_202;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_23 <= _GEN_23;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_23 <= _GEN_23;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_23 <= _GEN_23;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_23 <= _keccakStateRegShares_0_23_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_23 <= _GEN_203;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_0_24 <= _GEN_24;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_24 <= _GEN_24;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_24 <= _GEN_24;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_0_24 <= _keccakStateRegShares_0_24_T_7; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_0_24 <= _GEN_204;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_0 <= _GEN_25;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_0 <= _GEN_25;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_0 <= _GEN_25;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_0 <= _keccakStateRegShares_1_0_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_0 <= _GEN_205;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_1 <= _GEN_26;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_1 <= _GEN_26;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_1 <= _GEN_26;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_1 <= _keccakStateRegShares_1_1_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_1 <= _GEN_206;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_2 <= _GEN_27;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_2 <= _GEN_27;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_2 <= _GEN_27;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_2 <= _keccakStateRegShares_1_2_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_2 <= _GEN_207;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_3 <= _GEN_28;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_3 <= _GEN_28;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_3 <= _GEN_28;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_3 <= _keccakStateRegShares_1_3_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_3 <= _GEN_208;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_4 <= _GEN_29;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_4 <= _GEN_29;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_4 <= _GEN_29;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_4 <= _keccakStateRegShares_1_4_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_4 <= _GEN_209;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_5 <= _GEN_30;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_5 <= _GEN_30;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_5 <= _GEN_30;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_5 <= _keccakStateRegShares_1_5_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_5 <= _GEN_210;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_6 <= _GEN_31;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_6 <= _GEN_31;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_6 <= _GEN_31;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_6 <= _keccakStateRegShares_1_6_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_6 <= _GEN_211;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_7 <= _GEN_32;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_7 <= _GEN_32;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_7 <= _GEN_32;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_7 <= _keccakStateRegShares_1_7_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_7 <= _GEN_212;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_8 <= _GEN_33;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_8 <= _GEN_33;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_8 <= _GEN_33;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_8 <= _keccakStateRegShares_1_8_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_8 <= _GEN_213;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_9 <= _GEN_34;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_9 <= _GEN_34;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_9 <= _GEN_34;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_9 <= _keccakStateRegShares_1_9_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_9 <= _GEN_214;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_10 <= _GEN_35;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_10 <= _GEN_35;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_10 <= _GEN_35;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_10 <= _keccakStateRegShares_1_10_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_10 <= _GEN_215;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_11 <= _GEN_36;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_11 <= _GEN_36;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_11 <= _GEN_36;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_11 <= _keccakStateRegShares_1_11_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_11 <= _GEN_216;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_12 <= _GEN_37;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_12 <= _GEN_37;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_12 <= _GEN_37;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_12 <= _keccakStateRegShares_1_12_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_12 <= _GEN_217;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_13 <= _GEN_38;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_13 <= _GEN_38;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_13 <= _GEN_38;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_13 <= _keccakStateRegShares_1_13_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_13 <= _GEN_218;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_14 <= _GEN_39;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_14 <= _GEN_39;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_14 <= _GEN_39;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_14 <= _keccakStateRegShares_1_14_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_14 <= _GEN_219;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_15 <= _GEN_40;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_15 <= _GEN_40;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_15 <= _GEN_40;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_15 <= _keccakStateRegShares_1_15_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_15 <= _GEN_220;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_16 <= _GEN_41;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_16 <= _GEN_41;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_16 <= _GEN_41;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_16 <= _keccakStateRegShares_1_16_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_16 <= _GEN_221;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_17 <= _GEN_42;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_17 <= _GEN_42;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_17 <= _GEN_42;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_17 <= _keccakStateRegShares_1_17_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_17 <= _GEN_222;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_18 <= _GEN_43;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_18 <= _GEN_43;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_18 <= _GEN_43;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_18 <= _keccakStateRegShares_1_18_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_18 <= _GEN_223;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_19 <= _GEN_44;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_19 <= _GEN_44;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_19 <= _GEN_44;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_19 <= _keccakStateRegShares_1_19_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_19 <= _GEN_224;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_20 <= _GEN_45;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_20 <= _GEN_45;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_20 <= _GEN_45;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_20 <= _keccakStateRegShares_1_20_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_20 <= _GEN_225;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_21 <= _GEN_46;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_21 <= _GEN_46;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_21 <= _GEN_46;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_21 <= _keccakStateRegShares_1_21_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_21 <= _GEN_226;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_22 <= _GEN_47;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_22 <= _GEN_47;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_22 <= _GEN_47;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_22 <= _keccakStateRegShares_1_22_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_22 <= _GEN_227;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_23 <= _GEN_48;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_23 <= _GEN_48;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_23 <= _GEN_48;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_23 <= _keccakStateRegShares_1_23_T_2; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_23 <= _GEN_228;
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      keccakStateRegShares_1_24 <= _GEN_49;
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_24 <= _GEN_49;
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_24 <= _GEN_49;
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      keccakStateRegShares_1_24 <= _keccakStateRegShares_1_24_T_7; // @[KeccakCore.scala 214:16]
    end else begin
      keccakStateRegShares_1_24 <= _GEN_229;
    end
    if (reset) begin // @[KeccakCore.scala 101:34]
      state <= 3'h0; // @[KeccakCore.scala 101:34]
    end else if (_T_918) begin // @[Conditional.scala 40:58]
      if (io_ctrl_absorb) begin // @[KeccakCore.scala 176:28]
        state <= 3'h1; // @[KeccakCore.scala 177:15]
      end
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      if (~io_din_ready | io_din_valid) begin // @[KeccakCore.scala 189:43]
        state <= _GEN_56;
      end
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      state <= 3'h4; // @[KeccakCore.scala 206:13]
    end else begin
      state <= _GEN_288;
    end
    if (!(_T_918)) begin // @[Conditional.scala 40:58]
      if (_T_921) begin // @[Conditional.scala 39:67]
        if (~io_din_ready | io_din_valid) begin // @[KeccakCore.scala 189:43]
          if (lastLaneRotate) begin // @[KeccakCore.scala 192:30]
            roundCtr <= 5'h0; // @[KeccakCore.scala 193:20]
          end
        end
      end else if (!(_T_930)) begin // @[Conditional.scala 39:67]
        if (_T_933) begin // @[Conditional.scala 39:67]
          roundCtr <= _GEN_160;
        end else begin
          roundCtr <= _GEN_230;
        end
      end
    end
    if (_T_918) begin // @[Conditional.scala 40:58]
      shiftCtr <= 5'h0; // @[KeccakCore.scala 172:16]
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      if (~io_din_ready | io_din_valid) begin // @[KeccakCore.scala 189:43]
        shiftCtr <= _shiftCtr_T_1; // @[KeccakCore.scala 191:18]
      end
    end else if (_T_930) begin // @[Conditional.scala 39:67]
      shiftCtr <= 5'h0; // @[KeccakCore.scala 204:16]
    end else if (_T_933) begin // @[Conditional.scala 39:67]
      shiftCtr <= _GEN_161;
    end else begin
      shiftCtr <= _GEN_235;
    end
    isRateLineFlag <= _T_918 | _GEN_357; // @[Conditional.scala 40:58 KeccakCore.scala 173:22]
    absorbInitFlag <= _T_918 | _GEN_366; // @[Conditional.scala 40:58 KeccakCore.scala 174:22]
    if (_T_918) begin // @[Conditional.scala 40:58]
      absorbFinalizeFlag <= 1'h0; // @[KeccakCore.scala 175:26]
    end else if (_T_921) begin // @[Conditional.scala 39:67]
      if (~io_din_ready | io_din_valid) begin // @[KeccakCore.scala 189:43]
        if (lastLaneRotate) begin // @[KeccakCore.scala 192:30]
          absorbFinalizeFlag <= 1'h0; // @[KeccakCore.scala 195:30]
        end else begin
          absorbFinalizeFlag <= _GEN_52;
        end
      end else begin
        absorbFinalizeFlag <= _GEN_52;
      end
    end
    if (!(_T_918)) begin // @[Conditional.scala 40:58]
      if (!(_T_921)) begin // @[Conditional.scala 39:67]
        if (_T_930) begin // @[Conditional.scala 39:67]
          lastSliceProcFlag <= 1'h0; // @[KeccakCore.scala 205:25]
        end else if (_T_933) begin // @[Conditional.scala 39:67]
          lastSliceProcFlag <= _GEN_162;
        end
      end
    end
    regs_0 <= _regs_T_1; // @[KeccakCore.scala 390:48]
    regs_1 <= _regs_T_4; // @[KeccakCore.scala 390:48]
    regs_2 <= _regs_T_6; // @[KeccakCore.scala 390:48]
    regs_3 <= _regs_T_7; // @[KeccakCore.scala 390:48]
    regs_0_1 <= _regs_T_9; // @[KeccakCore.scala 390:48]
    regs_1_1 <= _regs_T_12; // @[KeccakCore.scala 390:48]
    regs_2_1 <= _regs_T_14; // @[KeccakCore.scala 390:48]
    regs_3_1 <= _regs_T_15; // @[KeccakCore.scala 390:48]
    regs_0_2 <= _regs_T_17; // @[KeccakCore.scala 390:48]
    regs_1_2 <= _regs_T_20; // @[KeccakCore.scala 390:48]
    regs_2_2 <= _regs_T_22; // @[KeccakCore.scala 390:48]
    regs_3_2 <= _regs_T_23; // @[KeccakCore.scala 390:48]
    regs_0_3 <= _regs_T_25; // @[KeccakCore.scala 390:48]
    regs_1_3 <= _regs_T_28; // @[KeccakCore.scala 390:48]
    regs_2_3 <= _regs_T_30; // @[KeccakCore.scala 390:48]
    regs_3_3 <= _regs_T_31; // @[KeccakCore.scala 390:48]
    regs_0_4 <= _regs_T_33; // @[KeccakCore.scala 390:48]
    regs_1_4 <= _regs_T_36; // @[KeccakCore.scala 390:48]
    regs_2_4 <= _regs_T_38; // @[KeccakCore.scala 390:48]
    regs_3_4 <= _regs_T_39; // @[KeccakCore.scala 390:48]
    regs_0_5 <= _regs_T_41; // @[KeccakCore.scala 390:48]
    regs_1_5 <= _regs_T_44; // @[KeccakCore.scala 390:48]
    regs_2_5 <= _regs_T_46; // @[KeccakCore.scala 390:48]
    regs_3_5 <= _regs_T_47; // @[KeccakCore.scala 390:48]
    regs_0_6 <= _regs_T_49; // @[KeccakCore.scala 390:48]
    regs_1_6 <= _regs_T_52; // @[KeccakCore.scala 390:48]
    regs_2_6 <= _regs_T_54; // @[KeccakCore.scala 390:48]
    regs_3_6 <= _regs_T_55; // @[KeccakCore.scala 390:48]
    regs_0_7 <= _regs_T_57; // @[KeccakCore.scala 390:48]
    regs_1_7 <= _regs_T_60; // @[KeccakCore.scala 390:48]
    regs_2_7 <= _regs_T_62; // @[KeccakCore.scala 390:48]
    regs_3_7 <= _regs_T_63; // @[KeccakCore.scala 390:48]
    regs_0_8 <= _regs_T_65; // @[KeccakCore.scala 390:48]
    regs_1_8 <= _regs_T_68; // @[KeccakCore.scala 390:48]
    regs_2_8 <= _regs_T_70; // @[KeccakCore.scala 390:48]
    regs_3_8 <= _regs_T_71; // @[KeccakCore.scala 390:48]
    regs_0_9 <= _regs_T_73; // @[KeccakCore.scala 390:48]
    regs_1_9 <= _regs_T_76; // @[KeccakCore.scala 390:48]
    regs_2_9 <= _regs_T_78; // @[KeccakCore.scala 390:48]
    regs_3_9 <= _regs_T_79; // @[KeccakCore.scala 390:48]
    regs_0_10 <= _regs_T_81; // @[KeccakCore.scala 390:48]
    regs_1_10 <= _regs_T_84; // @[KeccakCore.scala 390:48]
    regs_2_10 <= _regs_T_86; // @[KeccakCore.scala 390:48]
    regs_3_10 <= _regs_T_87; // @[KeccakCore.scala 390:48]
    regs_0_11 <= _regs_T_89; // @[KeccakCore.scala 390:48]
    regs_1_11 <= _regs_T_92; // @[KeccakCore.scala 390:48]
    regs_2_11 <= _regs_T_94; // @[KeccakCore.scala 390:48]
    regs_3_11 <= _regs_T_95; // @[KeccakCore.scala 390:48]
    regs_0_12 <= _regs_T_97; // @[KeccakCore.scala 390:48]
    regs_1_12 <= _regs_T_100; // @[KeccakCore.scala 390:48]
    regs_2_12 <= _regs_T_102; // @[KeccakCore.scala 390:48]
    regs_3_12 <= _regs_T_103; // @[KeccakCore.scala 390:48]
    regs_0_13 <= _regs_T_105; // @[KeccakCore.scala 390:48]
    regs_1_13 <= _regs_T_108; // @[KeccakCore.scala 390:48]
    regs_2_13 <= _regs_T_110; // @[KeccakCore.scala 390:48]
    regs_3_13 <= _regs_T_111; // @[KeccakCore.scala 390:48]
    regs_0_14 <= _regs_T_113; // @[KeccakCore.scala 390:48]
    regs_1_14 <= _regs_T_116; // @[KeccakCore.scala 390:48]
    regs_2_14 <= _regs_T_118; // @[KeccakCore.scala 390:48]
    regs_3_14 <= _regs_T_119; // @[KeccakCore.scala 390:48]
    regs_0_15 <= _regs_T_121; // @[KeccakCore.scala 390:48]
    regs_1_15 <= _regs_T_124; // @[KeccakCore.scala 390:48]
    regs_2_15 <= _regs_T_126; // @[KeccakCore.scala 390:48]
    regs_3_15 <= _regs_T_127; // @[KeccakCore.scala 390:48]
    regs_0_16 <= _regs_T_129; // @[KeccakCore.scala 390:48]
    regs_1_16 <= _regs_T_132; // @[KeccakCore.scala 390:48]
    regs_2_16 <= _regs_T_134; // @[KeccakCore.scala 390:48]
    regs_3_16 <= _regs_T_135; // @[KeccakCore.scala 390:48]
    regs_0_17 <= _regs_T_137; // @[KeccakCore.scala 390:48]
    regs_1_17 <= _regs_T_140; // @[KeccakCore.scala 390:48]
    regs_2_17 <= _regs_T_142; // @[KeccakCore.scala 390:48]
    regs_3_17 <= _regs_T_143; // @[KeccakCore.scala 390:48]
    regs_0_18 <= _regs_T_145; // @[KeccakCore.scala 390:48]
    regs_1_18 <= _regs_T_148; // @[KeccakCore.scala 390:48]
    regs_2_18 <= _regs_T_150; // @[KeccakCore.scala 390:48]
    regs_3_18 <= _regs_T_151; // @[KeccakCore.scala 390:48]
    regs_0_19 <= _regs_T_153; // @[KeccakCore.scala 390:48]
    regs_1_19 <= _regs_T_156; // @[KeccakCore.scala 390:48]
    regs_2_19 <= _regs_T_158; // @[KeccakCore.scala 390:48]
    regs_3_19 <= _regs_T_159; // @[KeccakCore.scala 390:48]
    regs_0_20 <= _regs_T_161; // @[KeccakCore.scala 390:48]
    regs_1_20 <= _regs_T_164; // @[KeccakCore.scala 390:48]
    regs_2_20 <= _regs_T_166; // @[KeccakCore.scala 390:48]
    regs_3_20 <= _regs_T_167; // @[KeccakCore.scala 390:48]
    regs_0_21 <= _regs_T_169; // @[KeccakCore.scala 390:48]
    regs_1_21 <= _regs_T_172; // @[KeccakCore.scala 390:48]
    regs_2_21 <= _regs_T_174; // @[KeccakCore.scala 390:48]
    regs_3_21 <= _regs_T_175; // @[KeccakCore.scala 390:48]
    regs_0_22 <= _regs_T_177; // @[KeccakCore.scala 390:48]
    regs_1_22 <= _regs_T_180; // @[KeccakCore.scala 390:48]
    regs_2_22 <= _regs_T_182; // @[KeccakCore.scala 390:48]
    regs_3_22 <= _regs_T_183; // @[KeccakCore.scala 390:48]
    regs_0_23 <= _regs_T_185; // @[KeccakCore.scala 390:48]
    regs_1_23 <= _regs_T_188; // @[KeccakCore.scala 390:48]
    regs_2_23 <= _regs_T_190; // @[KeccakCore.scala 390:48]
    regs_3_23 <= _regs_T_191; // @[KeccakCore.scala 390:48]
    regs_0_24 <= _regs_T_193; // @[KeccakCore.scala 390:48]
    regs_1_24 <= _regs_T_196; // @[KeccakCore.scala 390:48]
    regs_2_24 <= _regs_T_198; // @[KeccakCore.scala 390:48]
    regs_3_24 <= _regs_T_199; // @[KeccakCore.scala 390:48]
    regs_0_25 <= _regs_T_201; // @[KeccakCore.scala 390:48]
    regs_1_25 <= _regs_T_204; // @[KeccakCore.scala 390:48]
    regs_2_25 <= _regs_T_206; // @[KeccakCore.scala 390:48]
    regs_3_25 <= _regs_T_207; // @[KeccakCore.scala 390:48]
    regs_0_26 <= _regs_T_209; // @[KeccakCore.scala 390:48]
    regs_1_26 <= _regs_T_212; // @[KeccakCore.scala 390:48]
    regs_2_26 <= _regs_T_214; // @[KeccakCore.scala 390:48]
    regs_3_26 <= _regs_T_215; // @[KeccakCore.scala 390:48]
    regs_0_27 <= _regs_T_217; // @[KeccakCore.scala 390:48]
    regs_1_27 <= _regs_T_220; // @[KeccakCore.scala 390:48]
    regs_2_27 <= _regs_T_222; // @[KeccakCore.scala 390:48]
    regs_3_27 <= _regs_T_223; // @[KeccakCore.scala 390:48]
    regs_0_28 <= _regs_T_225; // @[KeccakCore.scala 390:48]
    regs_1_28 <= _regs_T_228; // @[KeccakCore.scala 390:48]
    regs_2_28 <= _regs_T_230; // @[KeccakCore.scala 390:48]
    regs_3_28 <= _regs_T_231; // @[KeccakCore.scala 390:48]
    regs_0_29 <= _regs_T_233; // @[KeccakCore.scala 390:48]
    regs_1_29 <= _regs_T_236; // @[KeccakCore.scala 390:48]
    regs_2_29 <= _regs_T_238; // @[KeccakCore.scala 390:48]
    regs_3_29 <= _regs_T_239; // @[KeccakCore.scala 390:48]
    regs_0_30 <= _regs_T_241; // @[KeccakCore.scala 390:48]
    regs_1_30 <= _regs_T_244; // @[KeccakCore.scala 390:48]
    regs_2_30 <= _regs_T_246; // @[KeccakCore.scala 390:48]
    regs_3_30 <= _regs_T_247; // @[KeccakCore.scala 390:48]
    regs_0_31 <= _regs_T_249; // @[KeccakCore.scala 390:48]
    regs_1_31 <= _regs_T_252; // @[KeccakCore.scala 390:48]
    regs_2_31 <= _regs_T_254; // @[KeccakCore.scala 390:48]
    regs_3_31 <= _regs_T_255; // @[KeccakCore.scala 390:48]
    regs_0_32 <= _regs_T_257; // @[KeccakCore.scala 390:48]
    regs_1_32 <= _regs_T_260; // @[KeccakCore.scala 390:48]
    regs_2_32 <= _regs_T_262; // @[KeccakCore.scala 390:48]
    regs_3_32 <= _regs_T_263; // @[KeccakCore.scala 390:48]
    regs_0_33 <= _regs_T_265; // @[KeccakCore.scala 390:48]
    regs_1_33 <= _regs_T_268; // @[KeccakCore.scala 390:48]
    regs_2_33 <= _regs_T_270; // @[KeccakCore.scala 390:48]
    regs_3_33 <= _regs_T_271; // @[KeccakCore.scala 390:48]
    regs_0_34 <= _regs_T_273; // @[KeccakCore.scala 390:48]
    regs_1_34 <= _regs_T_276; // @[KeccakCore.scala 390:48]
    regs_2_34 <= _regs_T_278; // @[KeccakCore.scala 390:48]
    regs_3_34 <= _regs_T_279; // @[KeccakCore.scala 390:48]
    regs_0_35 <= _regs_T_281; // @[KeccakCore.scala 390:48]
    regs_1_35 <= _regs_T_284; // @[KeccakCore.scala 390:48]
    regs_2_35 <= _regs_T_286; // @[KeccakCore.scala 390:48]
    regs_3_35 <= _regs_T_287; // @[KeccakCore.scala 390:48]
    regs_0_36 <= _regs_T_289; // @[KeccakCore.scala 390:48]
    regs_1_36 <= _regs_T_292; // @[KeccakCore.scala 390:48]
    regs_2_36 <= _regs_T_294; // @[KeccakCore.scala 390:48]
    regs_3_36 <= _regs_T_295; // @[KeccakCore.scala 390:48]
    regs_0_37 <= _regs_T_297; // @[KeccakCore.scala 390:48]
    regs_1_37 <= _regs_T_300; // @[KeccakCore.scala 390:48]
    regs_2_37 <= _regs_T_302; // @[KeccakCore.scala 390:48]
    regs_3_37 <= _regs_T_303; // @[KeccakCore.scala 390:48]
    regs_0_38 <= _regs_T_305; // @[KeccakCore.scala 390:48]
    regs_1_38 <= _regs_T_308; // @[KeccakCore.scala 390:48]
    regs_2_38 <= _regs_T_310; // @[KeccakCore.scala 390:48]
    regs_3_38 <= _regs_T_311; // @[KeccakCore.scala 390:48]
    regs_0_39 <= _regs_T_313; // @[KeccakCore.scala 390:48]
    regs_1_39 <= _regs_T_316; // @[KeccakCore.scala 390:48]
    regs_2_39 <= _regs_T_318; // @[KeccakCore.scala 390:48]
    regs_3_39 <= _regs_T_319; // @[KeccakCore.scala 390:48]
    if (updatePrevParity) begin // @[KeccakCore.scala 146:30]
      prevSliceParity <= lastParity; // @[KeccakCore.scala 147:25]
    end
    if (updatePrevParity) begin // @[KeccakCore.scala 146:30]
      prevSliceParity_1 <= lastParity_1; // @[KeccakCore.scala 147:25]
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
  _RAND_25 = {2{`RANDOM}};
  keccakStateRegShares_1_0 = _RAND_25[63:0];
  _RAND_26 = {2{`RANDOM}};
  keccakStateRegShares_1_1 = _RAND_26[63:0];
  _RAND_27 = {2{`RANDOM}};
  keccakStateRegShares_1_2 = _RAND_27[63:0];
  _RAND_28 = {2{`RANDOM}};
  keccakStateRegShares_1_3 = _RAND_28[63:0];
  _RAND_29 = {2{`RANDOM}};
  keccakStateRegShares_1_4 = _RAND_29[63:0];
  _RAND_30 = {2{`RANDOM}};
  keccakStateRegShares_1_5 = _RAND_30[63:0];
  _RAND_31 = {2{`RANDOM}};
  keccakStateRegShares_1_6 = _RAND_31[63:0];
  _RAND_32 = {2{`RANDOM}};
  keccakStateRegShares_1_7 = _RAND_32[63:0];
  _RAND_33 = {2{`RANDOM}};
  keccakStateRegShares_1_8 = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  keccakStateRegShares_1_9 = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  keccakStateRegShares_1_10 = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  keccakStateRegShares_1_11 = _RAND_36[63:0];
  _RAND_37 = {2{`RANDOM}};
  keccakStateRegShares_1_12 = _RAND_37[63:0];
  _RAND_38 = {2{`RANDOM}};
  keccakStateRegShares_1_13 = _RAND_38[63:0];
  _RAND_39 = {2{`RANDOM}};
  keccakStateRegShares_1_14 = _RAND_39[63:0];
  _RAND_40 = {2{`RANDOM}};
  keccakStateRegShares_1_15 = _RAND_40[63:0];
  _RAND_41 = {2{`RANDOM}};
  keccakStateRegShares_1_16 = _RAND_41[63:0];
  _RAND_42 = {2{`RANDOM}};
  keccakStateRegShares_1_17 = _RAND_42[63:0];
  _RAND_43 = {2{`RANDOM}};
  keccakStateRegShares_1_18 = _RAND_43[63:0];
  _RAND_44 = {2{`RANDOM}};
  keccakStateRegShares_1_19 = _RAND_44[63:0];
  _RAND_45 = {2{`RANDOM}};
  keccakStateRegShares_1_20 = _RAND_45[63:0];
  _RAND_46 = {2{`RANDOM}};
  keccakStateRegShares_1_21 = _RAND_46[63:0];
  _RAND_47 = {2{`RANDOM}};
  keccakStateRegShares_1_22 = _RAND_47[63:0];
  _RAND_48 = {2{`RANDOM}};
  keccakStateRegShares_1_23 = _RAND_48[63:0];
  _RAND_49 = {2{`RANDOM}};
  keccakStateRegShares_1_24 = _RAND_49[63:0];
  _RAND_50 = {1{`RANDOM}};
  state = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  roundCtr = _RAND_51[4:0];
  _RAND_52 = {1{`RANDOM}};
  shiftCtr = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  isRateLineFlag = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  absorbInitFlag = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  absorbFinalizeFlag = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  lastSliceProcFlag = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  regs_0 = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  regs_1 = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  regs_2 = _RAND_59[4:0];
  _RAND_60 = {1{`RANDOM}};
  regs_3 = _RAND_60[4:0];
  _RAND_61 = {1{`RANDOM}};
  regs_0_1 = _RAND_61[4:0];
  _RAND_62 = {1{`RANDOM}};
  regs_1_1 = _RAND_62[4:0];
  _RAND_63 = {1{`RANDOM}};
  regs_2_1 = _RAND_63[4:0];
  _RAND_64 = {1{`RANDOM}};
  regs_3_1 = _RAND_64[4:0];
  _RAND_65 = {1{`RANDOM}};
  regs_0_2 = _RAND_65[4:0];
  _RAND_66 = {1{`RANDOM}};
  regs_1_2 = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  regs_2_2 = _RAND_67[4:0];
  _RAND_68 = {1{`RANDOM}};
  regs_3_2 = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  regs_0_3 = _RAND_69[4:0];
  _RAND_70 = {1{`RANDOM}};
  regs_1_3 = _RAND_70[4:0];
  _RAND_71 = {1{`RANDOM}};
  regs_2_3 = _RAND_71[4:0];
  _RAND_72 = {1{`RANDOM}};
  regs_3_3 = _RAND_72[4:0];
  _RAND_73 = {1{`RANDOM}};
  regs_0_4 = _RAND_73[4:0];
  _RAND_74 = {1{`RANDOM}};
  regs_1_4 = _RAND_74[4:0];
  _RAND_75 = {1{`RANDOM}};
  regs_2_4 = _RAND_75[4:0];
  _RAND_76 = {1{`RANDOM}};
  regs_3_4 = _RAND_76[4:0];
  _RAND_77 = {1{`RANDOM}};
  regs_0_5 = _RAND_77[4:0];
  _RAND_78 = {1{`RANDOM}};
  regs_1_5 = _RAND_78[4:0];
  _RAND_79 = {1{`RANDOM}};
  regs_2_5 = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  regs_3_5 = _RAND_80[4:0];
  _RAND_81 = {1{`RANDOM}};
  regs_0_6 = _RAND_81[4:0];
  _RAND_82 = {1{`RANDOM}};
  regs_1_6 = _RAND_82[4:0];
  _RAND_83 = {1{`RANDOM}};
  regs_2_6 = _RAND_83[4:0];
  _RAND_84 = {1{`RANDOM}};
  regs_3_6 = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  regs_0_7 = _RAND_85[4:0];
  _RAND_86 = {1{`RANDOM}};
  regs_1_7 = _RAND_86[4:0];
  _RAND_87 = {1{`RANDOM}};
  regs_2_7 = _RAND_87[4:0];
  _RAND_88 = {1{`RANDOM}};
  regs_3_7 = _RAND_88[4:0];
  _RAND_89 = {1{`RANDOM}};
  regs_0_8 = _RAND_89[4:0];
  _RAND_90 = {1{`RANDOM}};
  regs_1_8 = _RAND_90[4:0];
  _RAND_91 = {1{`RANDOM}};
  regs_2_8 = _RAND_91[4:0];
  _RAND_92 = {1{`RANDOM}};
  regs_3_8 = _RAND_92[4:0];
  _RAND_93 = {1{`RANDOM}};
  regs_0_9 = _RAND_93[4:0];
  _RAND_94 = {1{`RANDOM}};
  regs_1_9 = _RAND_94[4:0];
  _RAND_95 = {1{`RANDOM}};
  regs_2_9 = _RAND_95[4:0];
  _RAND_96 = {1{`RANDOM}};
  regs_3_9 = _RAND_96[4:0];
  _RAND_97 = {1{`RANDOM}};
  regs_0_10 = _RAND_97[4:0];
  _RAND_98 = {1{`RANDOM}};
  regs_1_10 = _RAND_98[4:0];
  _RAND_99 = {1{`RANDOM}};
  regs_2_10 = _RAND_99[4:0];
  _RAND_100 = {1{`RANDOM}};
  regs_3_10 = _RAND_100[4:0];
  _RAND_101 = {1{`RANDOM}};
  regs_0_11 = _RAND_101[4:0];
  _RAND_102 = {1{`RANDOM}};
  regs_1_11 = _RAND_102[4:0];
  _RAND_103 = {1{`RANDOM}};
  regs_2_11 = _RAND_103[4:0];
  _RAND_104 = {1{`RANDOM}};
  regs_3_11 = _RAND_104[4:0];
  _RAND_105 = {1{`RANDOM}};
  regs_0_12 = _RAND_105[4:0];
  _RAND_106 = {1{`RANDOM}};
  regs_1_12 = _RAND_106[4:0];
  _RAND_107 = {1{`RANDOM}};
  regs_2_12 = _RAND_107[4:0];
  _RAND_108 = {1{`RANDOM}};
  regs_3_12 = _RAND_108[4:0];
  _RAND_109 = {1{`RANDOM}};
  regs_0_13 = _RAND_109[4:0];
  _RAND_110 = {1{`RANDOM}};
  regs_1_13 = _RAND_110[4:0];
  _RAND_111 = {1{`RANDOM}};
  regs_2_13 = _RAND_111[4:0];
  _RAND_112 = {1{`RANDOM}};
  regs_3_13 = _RAND_112[4:0];
  _RAND_113 = {1{`RANDOM}};
  regs_0_14 = _RAND_113[4:0];
  _RAND_114 = {1{`RANDOM}};
  regs_1_14 = _RAND_114[4:0];
  _RAND_115 = {1{`RANDOM}};
  regs_2_14 = _RAND_115[4:0];
  _RAND_116 = {1{`RANDOM}};
  regs_3_14 = _RAND_116[4:0];
  _RAND_117 = {1{`RANDOM}};
  regs_0_15 = _RAND_117[4:0];
  _RAND_118 = {1{`RANDOM}};
  regs_1_15 = _RAND_118[4:0];
  _RAND_119 = {1{`RANDOM}};
  regs_2_15 = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  regs_3_15 = _RAND_120[4:0];
  _RAND_121 = {1{`RANDOM}};
  regs_0_16 = _RAND_121[4:0];
  _RAND_122 = {1{`RANDOM}};
  regs_1_16 = _RAND_122[4:0];
  _RAND_123 = {1{`RANDOM}};
  regs_2_16 = _RAND_123[4:0];
  _RAND_124 = {1{`RANDOM}};
  regs_3_16 = _RAND_124[4:0];
  _RAND_125 = {1{`RANDOM}};
  regs_0_17 = _RAND_125[4:0];
  _RAND_126 = {1{`RANDOM}};
  regs_1_17 = _RAND_126[4:0];
  _RAND_127 = {1{`RANDOM}};
  regs_2_17 = _RAND_127[4:0];
  _RAND_128 = {1{`RANDOM}};
  regs_3_17 = _RAND_128[4:0];
  _RAND_129 = {1{`RANDOM}};
  regs_0_18 = _RAND_129[4:0];
  _RAND_130 = {1{`RANDOM}};
  regs_1_18 = _RAND_130[4:0];
  _RAND_131 = {1{`RANDOM}};
  regs_2_18 = _RAND_131[4:0];
  _RAND_132 = {1{`RANDOM}};
  regs_3_18 = _RAND_132[4:0];
  _RAND_133 = {1{`RANDOM}};
  regs_0_19 = _RAND_133[4:0];
  _RAND_134 = {1{`RANDOM}};
  regs_1_19 = _RAND_134[4:0];
  _RAND_135 = {1{`RANDOM}};
  regs_2_19 = _RAND_135[4:0];
  _RAND_136 = {1{`RANDOM}};
  regs_3_19 = _RAND_136[4:0];
  _RAND_137 = {1{`RANDOM}};
  regs_0_20 = _RAND_137[4:0];
  _RAND_138 = {1{`RANDOM}};
  regs_1_20 = _RAND_138[4:0];
  _RAND_139 = {1{`RANDOM}};
  regs_2_20 = _RAND_139[4:0];
  _RAND_140 = {1{`RANDOM}};
  regs_3_20 = _RAND_140[4:0];
  _RAND_141 = {1{`RANDOM}};
  regs_0_21 = _RAND_141[4:0];
  _RAND_142 = {1{`RANDOM}};
  regs_1_21 = _RAND_142[4:0];
  _RAND_143 = {1{`RANDOM}};
  regs_2_21 = _RAND_143[4:0];
  _RAND_144 = {1{`RANDOM}};
  regs_3_21 = _RAND_144[4:0];
  _RAND_145 = {1{`RANDOM}};
  regs_0_22 = _RAND_145[4:0];
  _RAND_146 = {1{`RANDOM}};
  regs_1_22 = _RAND_146[4:0];
  _RAND_147 = {1{`RANDOM}};
  regs_2_22 = _RAND_147[4:0];
  _RAND_148 = {1{`RANDOM}};
  regs_3_22 = _RAND_148[4:0];
  _RAND_149 = {1{`RANDOM}};
  regs_0_23 = _RAND_149[4:0];
  _RAND_150 = {1{`RANDOM}};
  regs_1_23 = _RAND_150[4:0];
  _RAND_151 = {1{`RANDOM}};
  regs_2_23 = _RAND_151[4:0];
  _RAND_152 = {1{`RANDOM}};
  regs_3_23 = _RAND_152[4:0];
  _RAND_153 = {1{`RANDOM}};
  regs_0_24 = _RAND_153[4:0];
  _RAND_154 = {1{`RANDOM}};
  regs_1_24 = _RAND_154[4:0];
  _RAND_155 = {1{`RANDOM}};
  regs_2_24 = _RAND_155[4:0];
  _RAND_156 = {1{`RANDOM}};
  regs_3_24 = _RAND_156[4:0];
  _RAND_157 = {1{`RANDOM}};
  regs_0_25 = _RAND_157[4:0];
  _RAND_158 = {1{`RANDOM}};
  regs_1_25 = _RAND_158[4:0];
  _RAND_159 = {1{`RANDOM}};
  regs_2_25 = _RAND_159[4:0];
  _RAND_160 = {1{`RANDOM}};
  regs_3_25 = _RAND_160[4:0];
  _RAND_161 = {1{`RANDOM}};
  regs_0_26 = _RAND_161[4:0];
  _RAND_162 = {1{`RANDOM}};
  regs_1_26 = _RAND_162[4:0];
  _RAND_163 = {1{`RANDOM}};
  regs_2_26 = _RAND_163[4:0];
  _RAND_164 = {1{`RANDOM}};
  regs_3_26 = _RAND_164[4:0];
  _RAND_165 = {1{`RANDOM}};
  regs_0_27 = _RAND_165[4:0];
  _RAND_166 = {1{`RANDOM}};
  regs_1_27 = _RAND_166[4:0];
  _RAND_167 = {1{`RANDOM}};
  regs_2_27 = _RAND_167[4:0];
  _RAND_168 = {1{`RANDOM}};
  regs_3_27 = _RAND_168[4:0];
  _RAND_169 = {1{`RANDOM}};
  regs_0_28 = _RAND_169[4:0];
  _RAND_170 = {1{`RANDOM}};
  regs_1_28 = _RAND_170[4:0];
  _RAND_171 = {1{`RANDOM}};
  regs_2_28 = _RAND_171[4:0];
  _RAND_172 = {1{`RANDOM}};
  regs_3_28 = _RAND_172[4:0];
  _RAND_173 = {1{`RANDOM}};
  regs_0_29 = _RAND_173[4:0];
  _RAND_174 = {1{`RANDOM}};
  regs_1_29 = _RAND_174[4:0];
  _RAND_175 = {1{`RANDOM}};
  regs_2_29 = _RAND_175[4:0];
  _RAND_176 = {1{`RANDOM}};
  regs_3_29 = _RAND_176[4:0];
  _RAND_177 = {1{`RANDOM}};
  regs_0_30 = _RAND_177[4:0];
  _RAND_178 = {1{`RANDOM}};
  regs_1_30 = _RAND_178[4:0];
  _RAND_179 = {1{`RANDOM}};
  regs_2_30 = _RAND_179[4:0];
  _RAND_180 = {1{`RANDOM}};
  regs_3_30 = _RAND_180[4:0];
  _RAND_181 = {1{`RANDOM}};
  regs_0_31 = _RAND_181[4:0];
  _RAND_182 = {1{`RANDOM}};
  regs_1_31 = _RAND_182[4:0];
  _RAND_183 = {1{`RANDOM}};
  regs_2_31 = _RAND_183[4:0];
  _RAND_184 = {1{`RANDOM}};
  regs_3_31 = _RAND_184[4:0];
  _RAND_185 = {1{`RANDOM}};
  regs_0_32 = _RAND_185[4:0];
  _RAND_186 = {1{`RANDOM}};
  regs_1_32 = _RAND_186[4:0];
  _RAND_187 = {1{`RANDOM}};
  regs_2_32 = _RAND_187[4:0];
  _RAND_188 = {1{`RANDOM}};
  regs_3_32 = _RAND_188[4:0];
  _RAND_189 = {1{`RANDOM}};
  regs_0_33 = _RAND_189[4:0];
  _RAND_190 = {1{`RANDOM}};
  regs_1_33 = _RAND_190[4:0];
  _RAND_191 = {1{`RANDOM}};
  regs_2_33 = _RAND_191[4:0];
  _RAND_192 = {1{`RANDOM}};
  regs_3_33 = _RAND_192[4:0];
  _RAND_193 = {1{`RANDOM}};
  regs_0_34 = _RAND_193[4:0];
  _RAND_194 = {1{`RANDOM}};
  regs_1_34 = _RAND_194[4:0];
  _RAND_195 = {1{`RANDOM}};
  regs_2_34 = _RAND_195[4:0];
  _RAND_196 = {1{`RANDOM}};
  regs_3_34 = _RAND_196[4:0];
  _RAND_197 = {1{`RANDOM}};
  regs_0_35 = _RAND_197[4:0];
  _RAND_198 = {1{`RANDOM}};
  regs_1_35 = _RAND_198[4:0];
  _RAND_199 = {1{`RANDOM}};
  regs_2_35 = _RAND_199[4:0];
  _RAND_200 = {1{`RANDOM}};
  regs_3_35 = _RAND_200[4:0];
  _RAND_201 = {1{`RANDOM}};
  regs_0_36 = _RAND_201[4:0];
  _RAND_202 = {1{`RANDOM}};
  regs_1_36 = _RAND_202[4:0];
  _RAND_203 = {1{`RANDOM}};
  regs_2_36 = _RAND_203[4:0];
  _RAND_204 = {1{`RANDOM}};
  regs_3_36 = _RAND_204[4:0];
  _RAND_205 = {1{`RANDOM}};
  regs_0_37 = _RAND_205[4:0];
  _RAND_206 = {1{`RANDOM}};
  regs_1_37 = _RAND_206[4:0];
  _RAND_207 = {1{`RANDOM}};
  regs_2_37 = _RAND_207[4:0];
  _RAND_208 = {1{`RANDOM}};
  regs_3_37 = _RAND_208[4:0];
  _RAND_209 = {1{`RANDOM}};
  regs_0_38 = _RAND_209[4:0];
  _RAND_210 = {1{`RANDOM}};
  regs_1_38 = _RAND_210[4:0];
  _RAND_211 = {1{`RANDOM}};
  regs_2_38 = _RAND_211[4:0];
  _RAND_212 = {1{`RANDOM}};
  regs_3_38 = _RAND_212[4:0];
  _RAND_213 = {1{`RANDOM}};
  regs_0_39 = _RAND_213[4:0];
  _RAND_214 = {1{`RANDOM}};
  regs_1_39 = _RAND_214[4:0];
  _RAND_215 = {1{`RANDOM}};
  regs_2_39 = _RAND_215[4:0];
  _RAND_216 = {1{`RANDOM}};
  regs_3_39 = _RAND_216[4:0];
  _RAND_217 = {1{`RANDOM}};
  prevSliceParity = _RAND_217[4:0];
  _RAND_218 = {1{`RANDOM}};
  prevSliceParity_1 = _RAND_218[4:0];
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
  input  [63:0] io_din_bits_data_1,
  input         io_din_bits_tlast,
  output        io_cmd_ready,
  input         io_cmd_valid,
  input  [1:0]  io_cmd_bits_mode,
  input  [11:0] io_cmd_bits_numSqueezeWords,
  input         io_dout_ready,
  output        io_dout_valid,
  output [63:0] io_dout_bits_0,
  output [63:0] io_dout_bits_1,
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
  wire [63:0] keccakCore_io_din_bits_1; // @[Sha3Core.scala 44:26]
  wire [4:0] keccakCore_io_ctrl_rateLanesMinusOne; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_ctrl_absorb; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_ctrl_absorbFin; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_ctrl_squeeze; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_dout_ready; // @[Sha3Core.scala 44:26]
  wire  keccakCore_io_dout_valid; // @[Sha3Core.scala 44:26]
  wire [63:0] keccakCore_io_dout_bits_0; // @[Sha3Core.scala 44:26]
  wire [63:0] keccakCore_io_dout_bits_1; // @[Sha3Core.scala 44:26]
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
  wire [63:0] _T_3 = mask & io_din_bits_data_1; // @[Sha3Core.scala 73:39]
  wire [63:0] _T_4 = io_din_bits_tlast ? _T_3 : io_din_bits_data_1; // @[Sha3Core.scala 73:14]
  wire  _T_7 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  isXOF = io_cmd_bits_mode == 2'h2 | io_cmd_bits_mode == 2'h3; // @[Sha3Mode.scala 23:40]
  wire [3:0] command_numSqueezeWords_hashOutWords = io_cmd_bits_mode == 2'h1 ? 4'h8 : 4'h4; // @[Sha3Mode.scala 24:32]
  wire  _T_11 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_12 = io_din_ready & io_din_valid; // @[Decoupled.scala 40:37]
  wire  _T_16 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_17 = io_dout_ready & io_dout_valid; // @[Decoupled.scala 40:37]
  wire [1:0] _GEN_6 = lastSqueeze ? 2'h0 : state; // @[Sha3Core.scala 123:27 Sha3Core.scala 124:17 Sha3Core.scala 52:22]
  wire [1:0] _GEN_8 = _T_17 ? _GEN_6 : state; // @[Sha3Core.scala 121:28 Sha3Core.scala 52:22]
  wire  _GEN_14 = _T_11 ? 1'h0 : _T_16; // @[Conditional.scala 39:67 Sha3Core.scala 78:30]
  wire [70:0] _WIRE_1 = {{7'd0}, _T_4}; // @[Sha3Core.scala 86:36 Sha3Core.scala 86:36]
  KeccakCore keccakCore ( // @[Sha3Core.scala 44:26]
    .clock(keccakCore_clock),
    .reset(keccakCore_reset),
    .io_din_ready(keccakCore_io_din_ready),
    .io_din_valid(keccakCore_io_din_valid),
    .io_din_bits_0(keccakCore_io_din_bits_0),
    .io_din_bits_1(keccakCore_io_din_bits_1),
    .io_ctrl_rateLanesMinusOne(keccakCore_io_ctrl_rateLanesMinusOne),
    .io_ctrl_absorb(keccakCore_io_ctrl_absorb),
    .io_ctrl_absorbFin(keccakCore_io_ctrl_absorbFin),
    .io_ctrl_squeeze(keccakCore_io_ctrl_squeeze),
    .io_dout_ready(keccakCore_io_dout_ready),
    .io_dout_valid(keccakCore_io_dout_valid),
    .io_dout_bits_0(keccakCore_io_dout_bits_0),
    .io_dout_bits_1(keccakCore_io_dout_bits_1)
  );
  assign io_din_ready = keccakCore_io_din_ready; // @[Sha3Core.scala 90:16]
  assign io_cmd_ready = 2'h0 == state; // @[Conditional.scala 37:30]
  assign io_dout_valid = keccakCore_io_dout_valid; // @[Sha3Core.scala 92:17]
  assign io_dout_bits_0 = keccakCore_io_dout_bits_0; // @[Sha3Core.scala 93:16]
  assign io_dout_bits_1 = keccakCore_io_dout_bits_1; // @[Sha3Core.scala 93:16]
  assign io_dout_tlast = squeezeCtrNext == command_numSqueezeWords; // @[Sha3Core.scala 57:36]
  assign io_dout_index = squeezeCtr; // @[Sha3Core.scala 91:17]
  assign keccakCore_clock = clock;
  assign keccakCore_reset = reset;
  assign keccakCore_io_din_valid = io_din_valid; // @[Sha3Core.scala 89:27]
  assign keccakCore_io_din_bits_0 = _T_2[63:0]; // @[Sha3Core.scala 86:26]
  assign keccakCore_io_din_bits_1 = _WIRE_1[63:0]; // @[Sha3Core.scala 86:26]
  assign keccakCore_io_ctrl_rateLanesMinusOne = 2'h2 == command_mode ? 5'h14 :
    _keccakCore_io_ctrl_rateLanesMinusOne_rateLanesMinusOne_T_4; // @[Mux.scala 80:57]
  assign keccakCore_io_ctrl_absorb = _T_7 ? 1'h0 : _T_11; // @[Conditional.scala 40:58 Sha3Core.scala 79:29]
  assign keccakCore_io_ctrl_absorbFin = io_din_bits_tlast; // @[Sha3Core.scala 80:32]
  assign keccakCore_io_ctrl_squeeze = _T_7 ? 1'h0 : _GEN_14; // @[Conditional.scala 40:58 Sha3Core.scala 78:30]
  assign keccakCore_io_dout_ready = io_dout_ready; // @[Sha3Core.scala 95:28]
  always @(posedge clock) begin
    if (_T_7) begin // @[Conditional.scala 40:58]
      if (io_cmd_valid) begin // @[Sha3Core.scala 103:26]
        command_mode <= io_cmd_bits_mode; // @[Sha3Core.scala 104:17]
      end
    end
    if (_T_7) begin // @[Conditional.scala 40:58]
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
    end else if (_T_7) begin // @[Conditional.scala 40:58]
      if (io_cmd_valid) begin // @[Sha3Core.scala 103:26]
        state <= 2'h1; // @[Sha3Core.scala 109:15]
      end
    end else if (_T_11) begin // @[Conditional.scala 39:67]
      if (_T_12 & io_din_bits_tlast) begin // @[Sha3Core.scala 115:48]
        state <= 2'h2; // @[Sha3Core.scala 116:15]
      end
    end else if (_T_16) begin // @[Conditional.scala 39:67]
      state <= _GEN_8;
    end
    if (_T_7) begin // @[Conditional.scala 40:58]
      if (io_cmd_valid) begin // @[Sha3Core.scala 103:26]
        squeezeCtr <= 12'h0; // @[Sha3Core.scala 108:20]
      end
    end else if (!(_T_11)) begin // @[Conditional.scala 39:67]
      if (_T_16) begin // @[Conditional.scala 39:67]
        if (_T_17) begin // @[Sha3Core.scala 121:28]
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
