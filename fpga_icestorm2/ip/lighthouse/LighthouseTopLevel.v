// Generator : SpinalHDL v1.3.7    git head : d74c57c64ecad8fa6207f63c97f3ff1dcde4527a
// Date      : 06/04/2020, 18:32:53
// Component : LighthouseTopLevel


`define UartParityType_defaultEncoding_type [1:0]
`define UartParityType_defaultEncoding_NONE 2'b00
`define UartParityType_defaultEncoding_EVEN 2'b01
`define UartParityType_defaultEncoding_ODD 2'b10

`define UartStopType_defaultEncoding_type [0:0]
`define UartStopType_defaultEncoding_ONE 1'b0
`define UartStopType_defaultEncoding_TWO 1'b1

`define fsm_enumDefinition_defaultEncoding_type [2:0]
`define fsm_enumDefinition_defaultEncoding_boot 3'b000
`define fsm_enumDefinition_defaultEncoding_fsm_idle 3'b001
`define fsm_enumDefinition_defaultEncoding_fsm_testDelta 3'b010
`define fsm_enumDefinition_defaultEncoding_fsm_waitFinder 3'b011
`define fsm_enumDefinition_defaultEncoding_fsm_sendResult 3'b100

`define fsm_enumDefinition_1_defaultEncoding_type [2:0]
`define fsm_enumDefinition_1_defaultEncoding_boot 3'b000
`define fsm_enumDefinition_1_defaultEncoding_fsm_idle 3'b001
`define fsm_enumDefinition_1_defaultEncoding_fsm_testDelta 3'b010
`define fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder 3'b011
`define fsm_enumDefinition_1_defaultEncoding_fsm_sendResult 3'b100

`define StateMachineEnum_defaultEncoding_type [2:0]
`define StateMachineEnum_defaultEncoding_boot 3'b000
`define StateMachineEnum_defaultEncoding_e1 3'b001
`define StateMachineEnum_defaultEncoding_e2 3'b010
`define StateMachineEnum_defaultEncoding_e3 3'b011
`define StateMachineEnum_defaultEncoding_e4 3'b100
`define StateMachineEnum_defaultEncoding_e5 3'b101

`define StateMachineEnum_1_defaultEncoding_type [2:0]
`define StateMachineEnum_1_defaultEncoding_boot 3'b000
`define StateMachineEnum_1_defaultEncoding_e1 3'b001
`define StateMachineEnum_1_defaultEncoding_e2 3'b010
`define StateMachineEnum_1_defaultEncoding_e3 3'b011
`define StateMachineEnum_1_defaultEncoding_e4 3'b100
`define StateMachineEnum_1_defaultEncoding_e5 3'b101

`define StateMachineEnum_2_defaultEncoding_type [2:0]
`define StateMachineEnum_2_defaultEncoding_boot 3'b000
`define StateMachineEnum_2_defaultEncoding_e1 3'b001
`define StateMachineEnum_2_defaultEncoding_e2 3'b010
`define StateMachineEnum_2_defaultEncoding_e3 3'b011
`define StateMachineEnum_2_defaultEncoding_e4 3'b100
`define StateMachineEnum_2_defaultEncoding_e5 3'b101

`define StateMachineEnum_3_defaultEncoding_type [2:0]
`define StateMachineEnum_3_defaultEncoding_boot 3'b000
`define StateMachineEnum_3_defaultEncoding_e1 3'b001
`define StateMachineEnum_3_defaultEncoding_e2 3'b010
`define StateMachineEnum_3_defaultEncoding_e3 3'b011
`define StateMachineEnum_3_defaultEncoding_e4 3'b100
`define StateMachineEnum_3_defaultEncoding_e5 3'b101

`define UartCtrlTxState_defaultEncoding_type [2:0]
`define UartCtrlTxState_defaultEncoding_IDLE 3'b000
`define UartCtrlTxState_defaultEncoding_START 3'b001
`define UartCtrlTxState_defaultEncoding_DATA 3'b010
`define UartCtrlTxState_defaultEncoding_PARITY 3'b011
`define UartCtrlTxState_defaultEncoding_STOP 3'b100

`define UartCtrlRxState_defaultEncoding_type [2:0]
`define UartCtrlRxState_defaultEncoding_IDLE 3'b000
`define UartCtrlRxState_defaultEncoding_START 3'b001
`define UartCtrlRxState_defaultEncoding_DATA 3'b010
`define UartCtrlRxState_defaultEncoding_PARITY 3'b011
`define UartCtrlRxState_defaultEncoding_STOP 3'b100

`define fsm_enumDefinition_2_defaultEncoding_type [1:0]
`define fsm_enumDefinition_2_defaultEncoding_boot 2'b00
`define fsm_enumDefinition_2_defaultEncoding_fsm_idle 2'b01
`define fsm_enumDefinition_2_defaultEncoding_fsm_receiveArg 2'b10

module BufferCC (
      input   io_initial,
      input   io_dataIn,
      output  io_dataOut,
      input   Slow_clk);
  reg  buffers_0 = 1'b0;
  reg  buffers_1 = 1'b0;
  assign io_dataOut = buffers_1;
  always @ (posedge Slow_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule

module BufferCC_1_ (
      input   io_initial,
      input   io_dataIn,
      output  io_dataOut,
      input   Core_clk);
  reg  buffers_0 = 1'b0;
  reg  buffers_1 = 1'b0;
  assign io_dataOut = buffers_1;
  always @ (posedge Core_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule


//BufferCC_2_ remplaced by BufferCC


//BufferCC_3_ remplaced by BufferCC_1_


//BufferCC_4_ remplaced by BufferCC


//BufferCC_5_ remplaced by BufferCC_1_


//BufferCC_6_ remplaced by BufferCC


//BufferCC_7_ remplaced by BufferCC_1_


//BufferCC_8_ remplaced by BufferCC

module PolyFinder (
      input  [16:0] io_startState,
      input  [16:0] io_targetState,
      input  [9:0] io_maxTick,
      input   io_start_valid,
      output  io_start_ready,
      output  io_found,
      output [4:0] io_polyFound,
      output  io_done_valid,
      input   io_done_ready,
      input   Slow_clk);
  wire  _zz_96_;
  wire  _zz_97_;
  wire  _zz_98_;
  wire  _zz_99_;
  wire  _zz_100_;
  wire  _zz_101_;
  wire  _zz_102_;
  wire  _zz_103_;
  wire  _zz_104_;
  wire  _zz_105_;
  wire  _zz_106_;
  wire  _zz_107_;
  wire  _zz_108_;
  wire  _zz_109_;
  wire  _zz_110_;
  wire  _zz_111_;
  wire  _zz_112_;
  wire  _zz_113_;
  wire  _zz_114_;
  wire  _zz_115_;
  wire  _zz_116_;
  wire  _zz_117_;
  wire  _zz_118_;
  wire  _zz_119_;
  wire  _zz_120_;
  wire  _zz_121_;
  wire  _zz_122_;
  wire  _zz_123_;
  wire  _zz_124_;
  wire  _zz_125_;
  wire  _zz_126_;
  wire  _zz_127_;
  wire  _zz_128_;
  wire  _zz_129_;
  wire  _zz_130_;
  wire  _zz_131_;
  wire  _zz_132_;
  wire  _zz_133_;
  wire  _zz_134_;
  wire  _zz_135_;
  wire  _zz_136_;
  wire  _zz_137_;
  wire  _zz_138_;
  wire  _zz_139_;
  wire  _zz_140_;
  wire  _zz_141_;
  wire  _zz_142_;
  wire  _zz_143_;
  wire  _zz_144_;
  wire  _zz_145_;
  wire  _zz_146_;
  wire  _zz_147_;
  wire  _zz_148_;
  wire  _zz_149_;
  wire  _zz_150_;
  wire  _zz_151_;
  wire  _zz_152_;
  wire  _zz_153_;
  wire  _zz_154_;
  wire  _zz_155_;
  wire  _zz_156_;
  wire  _zz_157_;
  wire  _zz_158_;
  wire  _zz_159_;
  reg  searching = 1'b0;
  reg [31:0] found = (32'b00000000000000000000000000000000);
  wire  _zz_1_;
  wire  _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire  _zz_5_;
  wire  _zz_6_;
  wire  _zz_7_;
  wire  _zz_8_;
  wire  _zz_9_;
  wire  _zz_10_;
  wire  _zz_11_;
  wire  _zz_12_;
  wire  _zz_13_;
  wire  _zz_14_;
  wire  _zz_15_;
  wire  _zz_16_;
  wire  _zz_17_;
  wire  _zz_18_;
  wire  _zz_19_;
  wire  _zz_20_;
  wire  _zz_21_;
  wire  _zz_22_;
  wire  _zz_23_;
  wire  _zz_24_;
  wire  _zz_25_;
  wire  _zz_26_;
  wire  _zz_27_;
  wire  _zz_28_;
  wire  _zz_29_;
  wire  _zz_30_;
  wire  _zz_31_;
  reg  searching_regNext;
  reg [9:0] counter = (10'b0000000000);
  wire [16:0] states_0;
  wire [16:0] states_1;
  wire [16:0] states_2;
  wire [16:0] states_3;
  wire [16:0] states_4;
  wire [16:0] states_5;
  wire [16:0] states_6;
  wire [16:0] states_7;
  wire [16:0] states_8;
  wire [16:0] states_9;
  wire [16:0] states_10;
  wire [16:0] states_11;
  wire [16:0] states_12;
  wire [16:0] states_13;
  wire [16:0] states_14;
  wire [16:0] states_15;
  wire [16:0] states_16;
  wire [16:0] states_17;
  wire [16:0] states_18;
  wire [16:0] states_19;
  wire [16:0] states_20;
  wire [16:0] states_21;
  wire [16:0] states_22;
  wire [16:0] states_23;
  wire [16:0] states_24;
  wire [16:0] states_25;
  wire [16:0] states_26;
  wire [16:0] states_27;
  wire [16:0] states_28;
  wire [16:0] states_29;
  wire [16:0] states_30;
  wire [16:0] states_31;
  reg [16:0] _zz_32_ = (17'b00000000000000000);
  wire [16:0] _zz_33_;
  reg [16:0] _zz_34_ = (17'b00000000000000000);
  wire [16:0] _zz_35_;
  reg [16:0] _zz_36_ = (17'b00000000000000000);
  wire [16:0] _zz_37_;
  reg [16:0] _zz_38_ = (17'b00000000000000000);
  wire [16:0] _zz_39_;
  reg [16:0] _zz_40_ = (17'b00000000000000000);
  wire [16:0] _zz_41_;
  reg [16:0] _zz_42_ = (17'b00000000000000000);
  wire [16:0] _zz_43_;
  reg [16:0] _zz_44_ = (17'b00000000000000000);
  wire [16:0] _zz_45_;
  reg [16:0] _zz_46_ = (17'b00000000000000000);
  wire [16:0] _zz_47_;
  reg [16:0] _zz_48_ = (17'b00000000000000000);
  wire [16:0] _zz_49_;
  reg [16:0] _zz_50_ = (17'b00000000000000000);
  wire [16:0] _zz_51_;
  reg [16:0] _zz_52_ = (17'b00000000000000000);
  wire [16:0] _zz_53_;
  reg [16:0] _zz_54_ = (17'b00000000000000000);
  wire [16:0] _zz_55_;
  reg [16:0] _zz_56_ = (17'b00000000000000000);
  wire [16:0] _zz_57_;
  reg [16:0] _zz_58_ = (17'b00000000000000000);
  wire [16:0] _zz_59_;
  reg [16:0] _zz_60_ = (17'b00000000000000000);
  wire [16:0] _zz_61_;
  reg [16:0] _zz_62_ = (17'b00000000000000000);
  wire [16:0] _zz_63_;
  reg [16:0] _zz_64_ = (17'b00000000000000000);
  wire [16:0] _zz_65_;
  reg [16:0] _zz_66_ = (17'b00000000000000000);
  wire [16:0] _zz_67_;
  reg [16:0] _zz_68_ = (17'b00000000000000000);
  wire [16:0] _zz_69_;
  reg [16:0] _zz_70_ = (17'b00000000000000000);
  wire [16:0] _zz_71_;
  reg [16:0] _zz_72_ = (17'b00000000000000000);
  wire [16:0] _zz_73_;
  reg [16:0] _zz_74_ = (17'b00000000000000000);
  wire [16:0] _zz_75_;
  reg [16:0] _zz_76_ = (17'b00000000000000000);
  wire [16:0] _zz_77_;
  reg [16:0] _zz_78_ = (17'b00000000000000000);
  wire [16:0] _zz_79_;
  reg [16:0] _zz_80_ = (17'b00000000000000000);
  wire [16:0] _zz_81_;
  reg [16:0] _zz_82_ = (17'b00000000000000000);
  wire [16:0] _zz_83_;
  reg [16:0] _zz_84_ = (17'b00000000000000000);
  wire [16:0] _zz_85_;
  reg [16:0] _zz_86_ = (17'b00000000000000000);
  wire [16:0] _zz_87_;
  reg [16:0] _zz_88_ = (17'b00000000000000000);
  wire [16:0] _zz_89_;
  reg [16:0] _zz_90_ = (17'b00000000000000000);
  wire [16:0] _zz_91_;
  reg [16:0] _zz_92_ = (17'b00000000000000000);
  wire [16:0] _zz_93_;
  reg [16:0] _zz_94_ = (17'b00000000000000000);
  wire [16:0] _zz_95_;
  assign _zz_96_ = ((_zz_33_[0] ^ _zz_33_[1]) ^ _zz_33_[2]);
  assign _zz_97_ = _zz_33_[3];
  assign _zz_98_ = ((_zz_35_[0] ^ _zz_35_[1]) ^ _zz_35_[2]);
  assign _zz_99_ = _zz_35_[3];
  assign _zz_100_ = ((_zz_37_[0] ^ _zz_37_[1]) ^ _zz_37_[2]);
  assign _zz_101_ = _zz_37_[3];
  assign _zz_102_ = ((_zz_39_[0] ^ _zz_39_[1]) ^ _zz_39_[2]);
  assign _zz_103_ = _zz_39_[3];
  assign _zz_104_ = ((_zz_41_[0] ^ _zz_41_[1]) ^ _zz_41_[2]);
  assign _zz_105_ = _zz_41_[3];
  assign _zz_106_ = ((_zz_43_[0] ^ _zz_43_[1]) ^ _zz_43_[2]);
  assign _zz_107_ = _zz_43_[3];
  assign _zz_108_ = ((_zz_45_[0] ^ _zz_45_[1]) ^ _zz_45_[2]);
  assign _zz_109_ = _zz_45_[3];
  assign _zz_110_ = ((_zz_47_[0] ^ _zz_47_[1]) ^ _zz_47_[2]);
  assign _zz_111_ = _zz_47_[3];
  assign _zz_112_ = ((_zz_49_[0] ^ _zz_49_[1]) ^ _zz_49_[2]);
  assign _zz_113_ = _zz_49_[3];
  assign _zz_114_ = ((_zz_51_[0] ^ _zz_51_[1]) ^ _zz_51_[2]);
  assign _zz_115_ = _zz_51_[3];
  assign _zz_116_ = ((_zz_53_[0] ^ _zz_53_[1]) ^ _zz_53_[2]);
  assign _zz_117_ = _zz_53_[3];
  assign _zz_118_ = ((_zz_55_[0] ^ _zz_55_[1]) ^ _zz_55_[2]);
  assign _zz_119_ = _zz_55_[3];
  assign _zz_120_ = ((_zz_57_[0] ^ _zz_57_[1]) ^ _zz_57_[2]);
  assign _zz_121_ = _zz_57_[3];
  assign _zz_122_ = ((_zz_59_[0] ^ _zz_59_[1]) ^ _zz_59_[2]);
  assign _zz_123_ = _zz_59_[3];
  assign _zz_124_ = ((_zz_61_[0] ^ _zz_61_[1]) ^ _zz_61_[2]);
  assign _zz_125_ = _zz_61_[3];
  assign _zz_126_ = ((_zz_63_[0] ^ _zz_63_[1]) ^ _zz_63_[2]);
  assign _zz_127_ = _zz_63_[3];
  assign _zz_128_ = ((_zz_65_[0] ^ _zz_65_[1]) ^ _zz_65_[2]);
  assign _zz_129_ = _zz_65_[3];
  assign _zz_130_ = ((_zz_67_[0] ^ _zz_67_[1]) ^ _zz_67_[2]);
  assign _zz_131_ = _zz_67_[3];
  assign _zz_132_ = ((_zz_69_[0] ^ _zz_69_[1]) ^ _zz_69_[2]);
  assign _zz_133_ = _zz_69_[3];
  assign _zz_134_ = ((_zz_71_[0] ^ _zz_71_[1]) ^ _zz_71_[2]);
  assign _zz_135_ = _zz_71_[3];
  assign _zz_136_ = ((_zz_73_[0] ^ _zz_73_[1]) ^ _zz_73_[2]);
  assign _zz_137_ = _zz_73_[3];
  assign _zz_138_ = ((_zz_75_[0] ^ _zz_75_[1]) ^ _zz_75_[2]);
  assign _zz_139_ = _zz_75_[3];
  assign _zz_140_ = ((_zz_77_[0] ^ _zz_77_[1]) ^ _zz_77_[2]);
  assign _zz_141_ = _zz_77_[3];
  assign _zz_142_ = ((_zz_79_[0] ^ _zz_79_[1]) ^ _zz_79_[2]);
  assign _zz_143_ = _zz_79_[3];
  assign _zz_144_ = ((_zz_81_[0] ^ _zz_81_[1]) ^ _zz_81_[2]);
  assign _zz_145_ = _zz_81_[3];
  assign _zz_146_ = ((_zz_83_[0] ^ _zz_83_[1]) ^ _zz_83_[2]);
  assign _zz_147_ = _zz_83_[3];
  assign _zz_148_ = ((_zz_85_[0] ^ _zz_85_[1]) ^ _zz_85_[2]);
  assign _zz_149_ = _zz_85_[3];
  assign _zz_150_ = ((_zz_87_[0] ^ _zz_87_[1]) ^ _zz_87_[2]);
  assign _zz_151_ = _zz_87_[3];
  assign _zz_152_ = ((_zz_89_[0] ^ _zz_89_[1]) ^ _zz_89_[2]);
  assign _zz_153_ = _zz_89_[3];
  assign _zz_154_ = ((_zz_91_[0] ^ _zz_91_[1]) ^ _zz_91_[2]);
  assign _zz_155_ = _zz_91_[3];
  assign _zz_156_ = ((_zz_93_[0] ^ _zz_93_[1]) ^ _zz_93_[2]);
  assign _zz_157_ = _zz_93_[3];
  assign _zz_158_ = ((_zz_95_[0] ^ _zz_95_[1]) ^ _zz_95_[2]);
  assign _zz_159_ = _zz_95_[3];
  assign _zz_1_ = found[3];
  assign _zz_2_ = found[5];
  assign _zz_3_ = found[6];
  assign _zz_4_ = found[7];
  assign _zz_5_ = found[9];
  assign _zz_6_ = found[10];
  assign _zz_7_ = found[11];
  assign _zz_8_ = found[12];
  assign _zz_9_ = found[13];
  assign _zz_10_ = found[14];
  assign _zz_11_ = found[15];
  assign _zz_12_ = found[17];
  assign _zz_13_ = found[18];
  assign _zz_14_ = found[19];
  assign _zz_15_ = found[20];
  assign _zz_16_ = found[21];
  assign _zz_17_ = found[22];
  assign _zz_18_ = found[23];
  assign _zz_19_ = found[24];
  assign _zz_20_ = found[25];
  assign _zz_21_ = found[26];
  assign _zz_22_ = found[27];
  assign _zz_23_ = found[28];
  assign _zz_24_ = found[29];
  assign _zz_25_ = found[30];
  assign _zz_26_ = found[31];
  assign _zz_27_ = (((((((((((((((found[1] || _zz_1_) || _zz_2_) || _zz_4_) || _zz_5_) || _zz_7_) || _zz_9_) || _zz_11_) || _zz_12_) || _zz_14_) || _zz_16_) || _zz_18_) || _zz_20_) || _zz_22_) || _zz_24_) || _zz_26_);
  assign _zz_28_ = (((((((((((((((found[2] || _zz_1_) || _zz_3_) || _zz_4_) || _zz_6_) || _zz_7_) || _zz_10_) || _zz_11_) || _zz_13_) || _zz_14_) || _zz_17_) || _zz_18_) || _zz_21_) || _zz_22_) || _zz_25_) || _zz_26_);
  assign _zz_29_ = (((((((((((((((found[4] || _zz_2_) || _zz_3_) || _zz_4_) || _zz_8_) || _zz_9_) || _zz_10_) || _zz_11_) || _zz_15_) || _zz_16_) || _zz_17_) || _zz_18_) || _zz_23_) || _zz_24_) || _zz_25_) || _zz_26_);
  assign _zz_30_ = (((((((((((((((found[8] || _zz_5_) || _zz_6_) || _zz_7_) || _zz_8_) || _zz_9_) || _zz_10_) || _zz_11_) || _zz_19_) || _zz_20_) || _zz_21_) || _zz_22_) || _zz_23_) || _zz_24_) || _zz_25_) || _zz_26_);
  assign _zz_31_ = (((((((((((((((found[16] || _zz_12_) || _zz_13_) || _zz_14_) || _zz_15_) || _zz_16_) || _zz_17_) || _zz_18_) || _zz_19_) || _zz_20_) || _zz_21_) || _zz_22_) || _zz_23_) || _zz_24_) || _zz_25_) || _zz_26_);
  assign io_polyFound = {_zz_31_,{_zz_30_,{_zz_29_,{_zz_28_,_zz_27_}}}};
  assign io_done_valid = ((! searching) && searching_regNext);
  assign io_found = (found != (32'b00000000000000000000000000000000));
  assign io_start_ready = 1'b1;
  assign states_0 = _zz_32_;
  assign _zz_33_ = (_zz_32_ & (17'b11101001001011000));
  assign states_1 = _zz_34_;
  assign _zz_35_ = (_zz_34_ & (17'b10111111000000100));
  assign states_2 = _zz_36_;
  assign _zz_37_ = (_zz_36_ & (17'b11111111101101011));
  assign states_3 = _zz_38_;
  assign _zz_39_ = (_zz_38_ & (17'b10011111101100111));
  assign states_4 = _zz_40_;
  assign _zz_41_ = (_zz_40_ & (17'b11011100111101110));
  assign states_5 = _zz_42_;
  assign _zz_43_ = (_zz_42_ & (17'b11001100011010001));
  assign states_6 = _zz_44_;
  assign _zz_45_ = (_zz_44_ & (17'b10111100011000111));
  assign states_7 = _zz_46_;
  assign _zz_47_ = (_zz_46_ & (17'b11000101001010101));
  assign states_8 = _zz_48_;
  assign _zz_49_ = (_zz_48_ & (17'b10101011101110111));
  assign states_9 = _zz_50_;
  assign _zz_51_ = (_zz_50_ & (17'b11101100100010001));
  assign states_10 = _zz_52_;
  assign _zz_53_ = (_zz_52_ & (17'b10101011101101001));
  assign states_11 = _zz_54_;
  assign _zz_55_ = (_zz_54_ & (17'b11001100100011111));
  assign states_12 = _zz_56_;
  assign _zz_57_ = (_zz_56_ & (17'b10010101111010000));
  assign states_13 = _zz_58_;
  assign _zz_59_ = (_zz_58_ & (17'b11100111101110011));
  assign states_14 = _zz_60_;
  assign _zz_61_ = (_zz_60_ & (17'b10011011001011101));
  assign states_15 = _zz_62_;
  assign _zz_63_ = (_zz_62_ & (17'b11001011111110101));
  assign states_16 = _zz_64_;
  assign _zz_65_ = (_zz_64_ & (17'b11001010010100000));
  assign states_17 = _zz_66_;
  assign _zz_67_ = (_zz_66_ & (17'b11011001001111001));
  assign states_18 = _zz_68_;
  assign _zz_69_ = (_zz_68_ & (17'b10011101000110100));
  assign states_19 = _zz_70_;
  assign _zz_71_ = (_zz_70_ & (17'b11010111001000001));
  assign states_20 = _zz_72_;
  assign _zz_73_ = (_zz_72_ & (17'b11000000011010100));
  assign states_21 = _zz_74_;
  assign _zz_75_ = (_zz_74_ & (17'b10111100010010001));
  assign states_22 = _zz_76_;
  assign _zz_77_ = (_zz_76_ & (17'b10010111001100100));
  assign states_23 = _zz_78_;
  assign _zz_79_ = (_zz_78_ & (17'b10111110001110010));
  assign states_24 = _zz_80_;
  assign _zz_81_ = (_zz_80_ & (17'b11001110001101101));
  assign states_25 = _zz_82_;
  assign _zz_83_ = (_zz_82_ & (17'b10011111100110010));
  assign states_26 = _zz_84_;
  assign _zz_85_ = (_zz_84_ & (17'b11010111000010100));
  assign states_27 = _zz_86_;
  assign _zz_87_ = (_zz_86_ & (17'b10100111001110110));
  assign states_28 = _zz_88_;
  assign _zz_89_ = (_zz_88_ & (17'b10011110010010111));
  assign states_29 = _zz_90_;
  assign _zz_91_ = (_zz_90_ & (17'b10011000011001011));
  assign states_30 = _zz_92_;
  assign _zz_93_ = (_zz_92_ & (17'b10011011101010000));
  assign states_31 = _zz_94_;
  assign _zz_95_ = (_zz_94_ & (17'b11100101110001101));
  always @ (posedge Slow_clk) begin
    if(searching)begin
      counter <= (counter - (10'b0000000001));
      if((counter == (10'b0000000000)))begin
        searching <= 1'b0;
        found <= (32'b00000000000000000000000000000000);
      end
    end else begin
      counter <= io_maxTick;
    end
    if((io_start_valid && io_start_ready))begin
      searching <= 1'b1;
      found <= (32'b00000000000000000000000000000000);
    end
    if((io_start_valid && io_start_ready))begin
      _zz_32_ <= io_startState;
    end
    if(searching)begin
      _zz_32_ <= {_zz_32_[15 : 0],((((((((((((((_zz_96_ ^ _zz_97_) ^ _zz_33_[4]) ^ _zz_33_[5]) ^ _zz_33_[6]) ^ _zz_33_[7]) ^ _zz_33_[8]) ^ _zz_33_[9]) ^ _zz_33_[10]) ^ _zz_33_[11]) ^ _zz_33_[12]) ^ _zz_33_[13]) ^ _zz_33_[14]) ^ _zz_33_[15]) ^ _zz_33_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_32_ == io_targetState)))begin
        found[0] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_34_ <= io_startState;
    end
    if(searching)begin
      _zz_34_ <= {_zz_34_[15 : 0],((((((((((((((_zz_98_ ^ _zz_99_) ^ _zz_35_[4]) ^ _zz_35_[5]) ^ _zz_35_[6]) ^ _zz_35_[7]) ^ _zz_35_[8]) ^ _zz_35_[9]) ^ _zz_35_[10]) ^ _zz_35_[11]) ^ _zz_35_[12]) ^ _zz_35_[13]) ^ _zz_35_[14]) ^ _zz_35_[15]) ^ _zz_35_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_34_ == io_targetState)))begin
        found[1] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_36_ <= io_startState;
    end
    if(searching)begin
      _zz_36_ <= {_zz_36_[15 : 0],((((((((((((((_zz_100_ ^ _zz_101_) ^ _zz_37_[4]) ^ _zz_37_[5]) ^ _zz_37_[6]) ^ _zz_37_[7]) ^ _zz_37_[8]) ^ _zz_37_[9]) ^ _zz_37_[10]) ^ _zz_37_[11]) ^ _zz_37_[12]) ^ _zz_37_[13]) ^ _zz_37_[14]) ^ _zz_37_[15]) ^ _zz_37_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_36_ == io_targetState)))begin
        found[2] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_38_ <= io_startState;
    end
    if(searching)begin
      _zz_38_ <= {_zz_38_[15 : 0],((((((((((((((_zz_102_ ^ _zz_103_) ^ _zz_39_[4]) ^ _zz_39_[5]) ^ _zz_39_[6]) ^ _zz_39_[7]) ^ _zz_39_[8]) ^ _zz_39_[9]) ^ _zz_39_[10]) ^ _zz_39_[11]) ^ _zz_39_[12]) ^ _zz_39_[13]) ^ _zz_39_[14]) ^ _zz_39_[15]) ^ _zz_39_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_38_ == io_targetState)))begin
        found[3] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_40_ <= io_startState;
    end
    if(searching)begin
      _zz_40_ <= {_zz_40_[15 : 0],((((((((((((((_zz_104_ ^ _zz_105_) ^ _zz_41_[4]) ^ _zz_41_[5]) ^ _zz_41_[6]) ^ _zz_41_[7]) ^ _zz_41_[8]) ^ _zz_41_[9]) ^ _zz_41_[10]) ^ _zz_41_[11]) ^ _zz_41_[12]) ^ _zz_41_[13]) ^ _zz_41_[14]) ^ _zz_41_[15]) ^ _zz_41_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_40_ == io_targetState)))begin
        found[4] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_42_ <= io_startState;
    end
    if(searching)begin
      _zz_42_ <= {_zz_42_[15 : 0],((((((((((((((_zz_106_ ^ _zz_107_) ^ _zz_43_[4]) ^ _zz_43_[5]) ^ _zz_43_[6]) ^ _zz_43_[7]) ^ _zz_43_[8]) ^ _zz_43_[9]) ^ _zz_43_[10]) ^ _zz_43_[11]) ^ _zz_43_[12]) ^ _zz_43_[13]) ^ _zz_43_[14]) ^ _zz_43_[15]) ^ _zz_43_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_42_ == io_targetState)))begin
        found[5] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_44_ <= io_startState;
    end
    if(searching)begin
      _zz_44_ <= {_zz_44_[15 : 0],((((((((((((((_zz_108_ ^ _zz_109_) ^ _zz_45_[4]) ^ _zz_45_[5]) ^ _zz_45_[6]) ^ _zz_45_[7]) ^ _zz_45_[8]) ^ _zz_45_[9]) ^ _zz_45_[10]) ^ _zz_45_[11]) ^ _zz_45_[12]) ^ _zz_45_[13]) ^ _zz_45_[14]) ^ _zz_45_[15]) ^ _zz_45_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_44_ == io_targetState)))begin
        found[6] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_46_ <= io_startState;
    end
    if(searching)begin
      _zz_46_ <= {_zz_46_[15 : 0],((((((((((((((_zz_110_ ^ _zz_111_) ^ _zz_47_[4]) ^ _zz_47_[5]) ^ _zz_47_[6]) ^ _zz_47_[7]) ^ _zz_47_[8]) ^ _zz_47_[9]) ^ _zz_47_[10]) ^ _zz_47_[11]) ^ _zz_47_[12]) ^ _zz_47_[13]) ^ _zz_47_[14]) ^ _zz_47_[15]) ^ _zz_47_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_46_ == io_targetState)))begin
        found[7] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_48_ <= io_startState;
    end
    if(searching)begin
      _zz_48_ <= {_zz_48_[15 : 0],((((((((((((((_zz_112_ ^ _zz_113_) ^ _zz_49_[4]) ^ _zz_49_[5]) ^ _zz_49_[6]) ^ _zz_49_[7]) ^ _zz_49_[8]) ^ _zz_49_[9]) ^ _zz_49_[10]) ^ _zz_49_[11]) ^ _zz_49_[12]) ^ _zz_49_[13]) ^ _zz_49_[14]) ^ _zz_49_[15]) ^ _zz_49_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_48_ == io_targetState)))begin
        found[8] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_50_ <= io_startState;
    end
    if(searching)begin
      _zz_50_ <= {_zz_50_[15 : 0],((((((((((((((_zz_114_ ^ _zz_115_) ^ _zz_51_[4]) ^ _zz_51_[5]) ^ _zz_51_[6]) ^ _zz_51_[7]) ^ _zz_51_[8]) ^ _zz_51_[9]) ^ _zz_51_[10]) ^ _zz_51_[11]) ^ _zz_51_[12]) ^ _zz_51_[13]) ^ _zz_51_[14]) ^ _zz_51_[15]) ^ _zz_51_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_50_ == io_targetState)))begin
        found[9] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_52_ <= io_startState;
    end
    if(searching)begin
      _zz_52_ <= {_zz_52_[15 : 0],((((((((((((((_zz_116_ ^ _zz_117_) ^ _zz_53_[4]) ^ _zz_53_[5]) ^ _zz_53_[6]) ^ _zz_53_[7]) ^ _zz_53_[8]) ^ _zz_53_[9]) ^ _zz_53_[10]) ^ _zz_53_[11]) ^ _zz_53_[12]) ^ _zz_53_[13]) ^ _zz_53_[14]) ^ _zz_53_[15]) ^ _zz_53_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_52_ == io_targetState)))begin
        found[10] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_54_ <= io_startState;
    end
    if(searching)begin
      _zz_54_ <= {_zz_54_[15 : 0],((((((((((((((_zz_118_ ^ _zz_119_) ^ _zz_55_[4]) ^ _zz_55_[5]) ^ _zz_55_[6]) ^ _zz_55_[7]) ^ _zz_55_[8]) ^ _zz_55_[9]) ^ _zz_55_[10]) ^ _zz_55_[11]) ^ _zz_55_[12]) ^ _zz_55_[13]) ^ _zz_55_[14]) ^ _zz_55_[15]) ^ _zz_55_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_54_ == io_targetState)))begin
        found[11] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_56_ <= io_startState;
    end
    if(searching)begin
      _zz_56_ <= {_zz_56_[15 : 0],((((((((((((((_zz_120_ ^ _zz_121_) ^ _zz_57_[4]) ^ _zz_57_[5]) ^ _zz_57_[6]) ^ _zz_57_[7]) ^ _zz_57_[8]) ^ _zz_57_[9]) ^ _zz_57_[10]) ^ _zz_57_[11]) ^ _zz_57_[12]) ^ _zz_57_[13]) ^ _zz_57_[14]) ^ _zz_57_[15]) ^ _zz_57_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_56_ == io_targetState)))begin
        found[12] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_58_ <= io_startState;
    end
    if(searching)begin
      _zz_58_ <= {_zz_58_[15 : 0],((((((((((((((_zz_122_ ^ _zz_123_) ^ _zz_59_[4]) ^ _zz_59_[5]) ^ _zz_59_[6]) ^ _zz_59_[7]) ^ _zz_59_[8]) ^ _zz_59_[9]) ^ _zz_59_[10]) ^ _zz_59_[11]) ^ _zz_59_[12]) ^ _zz_59_[13]) ^ _zz_59_[14]) ^ _zz_59_[15]) ^ _zz_59_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_58_ == io_targetState)))begin
        found[13] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_60_ <= io_startState;
    end
    if(searching)begin
      _zz_60_ <= {_zz_60_[15 : 0],((((((((((((((_zz_124_ ^ _zz_125_) ^ _zz_61_[4]) ^ _zz_61_[5]) ^ _zz_61_[6]) ^ _zz_61_[7]) ^ _zz_61_[8]) ^ _zz_61_[9]) ^ _zz_61_[10]) ^ _zz_61_[11]) ^ _zz_61_[12]) ^ _zz_61_[13]) ^ _zz_61_[14]) ^ _zz_61_[15]) ^ _zz_61_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_60_ == io_targetState)))begin
        found[14] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_62_ <= io_startState;
    end
    if(searching)begin
      _zz_62_ <= {_zz_62_[15 : 0],((((((((((((((_zz_126_ ^ _zz_127_) ^ _zz_63_[4]) ^ _zz_63_[5]) ^ _zz_63_[6]) ^ _zz_63_[7]) ^ _zz_63_[8]) ^ _zz_63_[9]) ^ _zz_63_[10]) ^ _zz_63_[11]) ^ _zz_63_[12]) ^ _zz_63_[13]) ^ _zz_63_[14]) ^ _zz_63_[15]) ^ _zz_63_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_62_ == io_targetState)))begin
        found[15] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_64_ <= io_startState;
    end
    if(searching)begin
      _zz_64_ <= {_zz_64_[15 : 0],((((((((((((((_zz_128_ ^ _zz_129_) ^ _zz_65_[4]) ^ _zz_65_[5]) ^ _zz_65_[6]) ^ _zz_65_[7]) ^ _zz_65_[8]) ^ _zz_65_[9]) ^ _zz_65_[10]) ^ _zz_65_[11]) ^ _zz_65_[12]) ^ _zz_65_[13]) ^ _zz_65_[14]) ^ _zz_65_[15]) ^ _zz_65_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_64_ == io_targetState)))begin
        found[16] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_66_ <= io_startState;
    end
    if(searching)begin
      _zz_66_ <= {_zz_66_[15 : 0],((((((((((((((_zz_130_ ^ _zz_131_) ^ _zz_67_[4]) ^ _zz_67_[5]) ^ _zz_67_[6]) ^ _zz_67_[7]) ^ _zz_67_[8]) ^ _zz_67_[9]) ^ _zz_67_[10]) ^ _zz_67_[11]) ^ _zz_67_[12]) ^ _zz_67_[13]) ^ _zz_67_[14]) ^ _zz_67_[15]) ^ _zz_67_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_66_ == io_targetState)))begin
        found[17] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_68_ <= io_startState;
    end
    if(searching)begin
      _zz_68_ <= {_zz_68_[15 : 0],((((((((((((((_zz_132_ ^ _zz_133_) ^ _zz_69_[4]) ^ _zz_69_[5]) ^ _zz_69_[6]) ^ _zz_69_[7]) ^ _zz_69_[8]) ^ _zz_69_[9]) ^ _zz_69_[10]) ^ _zz_69_[11]) ^ _zz_69_[12]) ^ _zz_69_[13]) ^ _zz_69_[14]) ^ _zz_69_[15]) ^ _zz_69_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_68_ == io_targetState)))begin
        found[18] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_70_ <= io_startState;
    end
    if(searching)begin
      _zz_70_ <= {_zz_70_[15 : 0],((((((((((((((_zz_134_ ^ _zz_135_) ^ _zz_71_[4]) ^ _zz_71_[5]) ^ _zz_71_[6]) ^ _zz_71_[7]) ^ _zz_71_[8]) ^ _zz_71_[9]) ^ _zz_71_[10]) ^ _zz_71_[11]) ^ _zz_71_[12]) ^ _zz_71_[13]) ^ _zz_71_[14]) ^ _zz_71_[15]) ^ _zz_71_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_70_ == io_targetState)))begin
        found[19] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_72_ <= io_startState;
    end
    if(searching)begin
      _zz_72_ <= {_zz_72_[15 : 0],((((((((((((((_zz_136_ ^ _zz_137_) ^ _zz_73_[4]) ^ _zz_73_[5]) ^ _zz_73_[6]) ^ _zz_73_[7]) ^ _zz_73_[8]) ^ _zz_73_[9]) ^ _zz_73_[10]) ^ _zz_73_[11]) ^ _zz_73_[12]) ^ _zz_73_[13]) ^ _zz_73_[14]) ^ _zz_73_[15]) ^ _zz_73_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_72_ == io_targetState)))begin
        found[20] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_74_ <= io_startState;
    end
    if(searching)begin
      _zz_74_ <= {_zz_74_[15 : 0],((((((((((((((_zz_138_ ^ _zz_139_) ^ _zz_75_[4]) ^ _zz_75_[5]) ^ _zz_75_[6]) ^ _zz_75_[7]) ^ _zz_75_[8]) ^ _zz_75_[9]) ^ _zz_75_[10]) ^ _zz_75_[11]) ^ _zz_75_[12]) ^ _zz_75_[13]) ^ _zz_75_[14]) ^ _zz_75_[15]) ^ _zz_75_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_74_ == io_targetState)))begin
        found[21] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_76_ <= io_startState;
    end
    if(searching)begin
      _zz_76_ <= {_zz_76_[15 : 0],((((((((((((((_zz_140_ ^ _zz_141_) ^ _zz_77_[4]) ^ _zz_77_[5]) ^ _zz_77_[6]) ^ _zz_77_[7]) ^ _zz_77_[8]) ^ _zz_77_[9]) ^ _zz_77_[10]) ^ _zz_77_[11]) ^ _zz_77_[12]) ^ _zz_77_[13]) ^ _zz_77_[14]) ^ _zz_77_[15]) ^ _zz_77_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_76_ == io_targetState)))begin
        found[22] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_78_ <= io_startState;
    end
    if(searching)begin
      _zz_78_ <= {_zz_78_[15 : 0],((((((((((((((_zz_142_ ^ _zz_143_) ^ _zz_79_[4]) ^ _zz_79_[5]) ^ _zz_79_[6]) ^ _zz_79_[7]) ^ _zz_79_[8]) ^ _zz_79_[9]) ^ _zz_79_[10]) ^ _zz_79_[11]) ^ _zz_79_[12]) ^ _zz_79_[13]) ^ _zz_79_[14]) ^ _zz_79_[15]) ^ _zz_79_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_78_ == io_targetState)))begin
        found[23] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_80_ <= io_startState;
    end
    if(searching)begin
      _zz_80_ <= {_zz_80_[15 : 0],((((((((((((((_zz_144_ ^ _zz_145_) ^ _zz_81_[4]) ^ _zz_81_[5]) ^ _zz_81_[6]) ^ _zz_81_[7]) ^ _zz_81_[8]) ^ _zz_81_[9]) ^ _zz_81_[10]) ^ _zz_81_[11]) ^ _zz_81_[12]) ^ _zz_81_[13]) ^ _zz_81_[14]) ^ _zz_81_[15]) ^ _zz_81_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_80_ == io_targetState)))begin
        found[24] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_82_ <= io_startState;
    end
    if(searching)begin
      _zz_82_ <= {_zz_82_[15 : 0],((((((((((((((_zz_146_ ^ _zz_147_) ^ _zz_83_[4]) ^ _zz_83_[5]) ^ _zz_83_[6]) ^ _zz_83_[7]) ^ _zz_83_[8]) ^ _zz_83_[9]) ^ _zz_83_[10]) ^ _zz_83_[11]) ^ _zz_83_[12]) ^ _zz_83_[13]) ^ _zz_83_[14]) ^ _zz_83_[15]) ^ _zz_83_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_82_ == io_targetState)))begin
        found[25] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_84_ <= io_startState;
    end
    if(searching)begin
      _zz_84_ <= {_zz_84_[15 : 0],((((((((((((((_zz_148_ ^ _zz_149_) ^ _zz_85_[4]) ^ _zz_85_[5]) ^ _zz_85_[6]) ^ _zz_85_[7]) ^ _zz_85_[8]) ^ _zz_85_[9]) ^ _zz_85_[10]) ^ _zz_85_[11]) ^ _zz_85_[12]) ^ _zz_85_[13]) ^ _zz_85_[14]) ^ _zz_85_[15]) ^ _zz_85_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_84_ == io_targetState)))begin
        found[26] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_86_ <= io_startState;
    end
    if(searching)begin
      _zz_86_ <= {_zz_86_[15 : 0],((((((((((((((_zz_150_ ^ _zz_151_) ^ _zz_87_[4]) ^ _zz_87_[5]) ^ _zz_87_[6]) ^ _zz_87_[7]) ^ _zz_87_[8]) ^ _zz_87_[9]) ^ _zz_87_[10]) ^ _zz_87_[11]) ^ _zz_87_[12]) ^ _zz_87_[13]) ^ _zz_87_[14]) ^ _zz_87_[15]) ^ _zz_87_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_86_ == io_targetState)))begin
        found[27] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_88_ <= io_startState;
    end
    if(searching)begin
      _zz_88_ <= {_zz_88_[15 : 0],((((((((((((((_zz_152_ ^ _zz_153_) ^ _zz_89_[4]) ^ _zz_89_[5]) ^ _zz_89_[6]) ^ _zz_89_[7]) ^ _zz_89_[8]) ^ _zz_89_[9]) ^ _zz_89_[10]) ^ _zz_89_[11]) ^ _zz_89_[12]) ^ _zz_89_[13]) ^ _zz_89_[14]) ^ _zz_89_[15]) ^ _zz_89_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_88_ == io_targetState)))begin
        found[28] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_90_ <= io_startState;
    end
    if(searching)begin
      _zz_90_ <= {_zz_90_[15 : 0],((((((((((((((_zz_154_ ^ _zz_155_) ^ _zz_91_[4]) ^ _zz_91_[5]) ^ _zz_91_[6]) ^ _zz_91_[7]) ^ _zz_91_[8]) ^ _zz_91_[9]) ^ _zz_91_[10]) ^ _zz_91_[11]) ^ _zz_91_[12]) ^ _zz_91_[13]) ^ _zz_91_[14]) ^ _zz_91_[15]) ^ _zz_91_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_90_ == io_targetState)))begin
        found[29] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_92_ <= io_startState;
    end
    if(searching)begin
      _zz_92_ <= {_zz_92_[15 : 0],((((((((((((((_zz_156_ ^ _zz_157_) ^ _zz_93_[4]) ^ _zz_93_[5]) ^ _zz_93_[6]) ^ _zz_93_[7]) ^ _zz_93_[8]) ^ _zz_93_[9]) ^ _zz_93_[10]) ^ _zz_93_[11]) ^ _zz_93_[12]) ^ _zz_93_[13]) ^ _zz_93_[14]) ^ _zz_93_[15]) ^ _zz_93_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_92_ == io_targetState)))begin
        found[30] <= 1'b1;
        searching <= 1'b0;
      end
    end
    if((io_start_valid && io_start_ready))begin
      _zz_94_ <= io_startState;
    end
    if(searching)begin
      _zz_94_ <= {_zz_94_[15 : 0],((((((((((((((_zz_158_ ^ _zz_159_) ^ _zz_95_[4]) ^ _zz_95_[5]) ^ _zz_95_[6]) ^ _zz_95_[7]) ^ _zz_95_[8]) ^ _zz_95_[9]) ^ _zz_95_[10]) ^ _zz_95_[11]) ^ _zz_95_[12]) ^ _zz_95_[13]) ^ _zz_95_[14]) ^ _zz_95_[15]) ^ _zz_95_[16])};
      if(((counter[9 : 2] == (8'b00000000)) && (_zz_94_ == io_targetState)))begin
        found[31] <= 1'b1;
        searching <= 1'b0;
      end
    end
  end

  always @ (posedge Slow_clk) begin
    searching_regNext <= searching;
  end

endmodule

module OffsetFinder (
      input   io_start,
      output  io_done,
      input   io_reset,
      input  [4:0] io_nPoly,
      input  [16:0] io_targetState,
      output  io_found,
      output [16:0] io_offset,
      input   Slow_clk);
  reg [16:0] _zz_37_;
  reg [16:0] _zz_38_;
  reg [16:0] _zz_39_;
  reg [16:0] _zz_40_;
  wire  _zz_41_;
  wire  _zz_42_;
  wire  _zz_43_;
  wire  _zz_44_;
  wire  _zz_45_;
  wire  _zz_46_;
  wire  _zz_47_;
  wire  _zz_48_;
  wire [6:0] _zz_49_;
  wire [6:0] _zz_50_;
  wire [6:0] _zz_51_;
  wire  _zz_52_;
  wire  _zz_53_;
  wire  _zz_54_;
  wire  _zz_55_;
  wire  _zz_56_;
  wire  _zz_57_;
  wire  _zz_58_;
  wire  _zz_59_;
  wire  _zz_60_;
  wire  _zz_61_;
  wire  _zz_62_;
  wire  _zz_63_;
  wire [16:0] lfsrLut_0;
  wire [16:0] lfsrLut_1;
  wire [16:0] lfsrLut_2;
  wire [16:0] lfsrLut_3;
  wire [16:0] lfsrLut_4;
  wire [16:0] lfsrLut_5;
  wire [16:0] lfsrLut_6;
  wire [16:0] lfsrLut_7;
  wire [16:0] lfsrLut_8;
  wire [16:0] lfsrLut_9;
  wire [16:0] lfsrLut_10;
  wire [16:0] lfsrLut_11;
  wire [16:0] lfsrLut_12;
  wire [16:0] lfsrLut_13;
  wire [16:0] lfsrLut_14;
  wire [16:0] lfsrLut_15;
  wire [16:0] lfsrLut_16;
  wire [16:0] lfsrLut_17;
  wire [16:0] lfsrLut_18;
  wire [16:0] lfsrLut_19;
  wire [16:0] lfsrLut_20;
  wire [16:0] lfsrLut_21;
  wire [16:0] lfsrLut_22;
  wire [16:0] lfsrLut_23;
  wire [16:0] lfsrLut_24;
  wire [16:0] lfsrLut_25;
  wire [16:0] lfsrLut_26;
  wire [16:0] lfsrLut_27;
  wire [16:0] lfsrLut_28;
  wire [16:0] lfsrLut_29;
  wire [16:0] lfsrLut_30;
  wire [16:0] lfsrLut_31;
  wire [16:0] lfsrLut_32;
  wire [16:0] lfsrLut_33;
  wire [16:0] lfsrLut_34;
  wire [16:0] lfsrLut_35;
  wire [16:0] lfsrLut_36;
  wire [16:0] lfsrLut_37;
  wire [16:0] lfsrLut_38;
  wire [16:0] lfsrLut_39;
  wire [16:0] lfsrLut_40;
  wire [16:0] lfsrLut_41;
  wire [16:0] lfsrLut_42;
  wire [16:0] lfsrLut_43;
  wire [16:0] lfsrLut_44;
  wire [16:0] lfsrLut_45;
  wire [16:0] lfsrLut_46;
  wire [16:0] lfsrLut_47;
  wire [16:0] lfsrLut_48;
  wire [16:0] lfsrLut_49;
  wire [16:0] lfsrLut_50;
  wire [16:0] lfsrLut_51;
  wire [16:0] lfsrLut_52;
  wire [16:0] lfsrLut_53;
  wire [16:0] lfsrLut_54;
  wire [16:0] lfsrLut_55;
  wire [16:0] lfsrLut_56;
  wire [16:0] lfsrLut_57;
  wire [16:0] lfsrLut_58;
  wire [16:0] lfsrLut_59;
  wire [16:0] lfsrLut_60;
  wire [16:0] lfsrLut_61;
  wire [16:0] lfsrLut_62;
  wire [16:0] lfsrLut_63;
  wire [16:0] lfsrLut_64;
  wire [16:0] lfsrLut_65;
  wire [16:0] lfsrLut_66;
  wire [16:0] lfsrLut_67;
  wire [16:0] lfsrLut_68;
  wire [16:0] lfsrLut_69;
  wire [16:0] lfsrLut_70;
  wire [16:0] lfsrLut_71;
  wire [16:0] lfsrLut_72;
  wire [16:0] lfsrLut_73;
  wire [16:0] lfsrLut_74;
  wire [16:0] lfsrLut_75;
  wire [16:0] lfsrLut_76;
  wire [16:0] lfsrLut_77;
  wire [16:0] lfsrLut_78;
  wire [16:0] lfsrLut_79;
  wire [16:0] lfsrLut_80;
  wire [16:0] lfsrLut_81;
  wire [16:0] lfsrLut_82;
  wire [16:0] lfsrLut_83;
  wire [16:0] lfsrLut_84;
  wire [16:0] lfsrLut_85;
  wire [16:0] lfsrLut_86;
  wire [16:0] lfsrLut_87;
  wire [16:0] lfsrLut_88;
  wire [16:0] lfsrLut_89;
  wire [16:0] lfsrLut_90;
  wire [16:0] lfsrLut_91;
  wire [16:0] lfsrLut_92;
  wire [16:0] lfsrLut_93;
  wire [16:0] lfsrLut_94;
  wire [16:0] lfsrLut_95;
  wire [16:0] lfsrLut_96;
  wire [16:0] lfsrLut_97;
  wire [16:0] lfsrLut_98;
  wire [16:0] lfsrLut_99;
  wire [16:0] lfsrLut_100;
  wire [16:0] lfsrLut_101;
  wire [16:0] lfsrLut_102;
  wire [16:0] lfsrLut_103;
  wire [16:0] lfsrLut_104;
  wire [16:0] lfsrLut_105;
  wire [16:0] lfsrLut_106;
  wire [16:0] lfsrLut_107;
  wire [16:0] lfsrLut_108;
  wire [16:0] lfsrLut_109;
  wire [16:0] lfsrLut_110;
  wire [16:0] lfsrLut_111;
  wire [16:0] lfsrLut_112;
  wire [16:0] lfsrLut_113;
  wire [16:0] lfsrLut_114;
  wire [16:0] lfsrLut_115;
  wire [16:0] lfsrLut_116;
  wire [16:0] lfsrLut_117;
  wire [16:0] lfsrLut_118;
  wire [16:0] lfsrLut_119;
  wire [16:0] lfsrLut_120;
  wire [16:0] lfsrLut_121;
  wire [16:0] lfsrLut_122;
  wire [16:0] lfsrLut_123;
  wire [16:0] lfsrLut_124;
  wire [16:0] lfsrLut_125;
  wire [16:0] lfsrLut_126;
  wire [16:0] lfsrLut_127;
  reg [3:0] done;
  reg  found = 1'b0;
  reg [16:0] offset = (17'b00000000000000000);
  reg [6:0] _zz_2_;
  wire [16:0] _zz_3_;
  reg [16:0] _zz_4_;
  reg [16:0] _zz_5_;
  reg [14:0] _zz_6_;
  reg [6:0] _zz_8_;
  wire [16:0] _zz_9_;
  reg [16:0] _zz_10_;
  reg [16:0] _zz_11_;
  reg [14:0] _zz_12_;
  reg [6:0] _zz_14_;
  wire [16:0] _zz_15_;
  reg [16:0] _zz_16_;
  reg [16:0] _zz_17_;
  reg [14:0] _zz_18_;
  reg [6:0] _zz_20_;
  wire [16:0] _zz_21_;
  reg [16:0] _zz_22_;
  reg [16:0] _zz_23_;
  reg [14:0] _zz_24_;
  reg `StateMachineEnum_defaultEncoding_type _zz_25_ = `StateMachineEnum_defaultEncoding_boot;
  reg `StateMachineEnum_defaultEncoding_type _zz_26_;
  wire [16:0] _zz_27_;
  reg `StateMachineEnum_1_defaultEncoding_type _zz_28_ = `StateMachineEnum_1_defaultEncoding_boot;
  reg `StateMachineEnum_1_defaultEncoding_type _zz_29_;
  wire [16:0] _zz_30_;
  reg `StateMachineEnum_2_defaultEncoding_type _zz_31_ = `StateMachineEnum_2_defaultEncoding_boot;
  reg `StateMachineEnum_2_defaultEncoding_type _zz_32_;
  wire [16:0] _zz_33_;
  reg `StateMachineEnum_3_defaultEncoding_type _zz_34_ = `StateMachineEnum_3_defaultEncoding_boot;
  reg `StateMachineEnum_3_defaultEncoding_type _zz_35_;
  wire [16:0] _zz_36_;
  `ifndef SYNTHESIS
  reg [31:0] _zz_25__string;
  reg [31:0] _zz_26__string;
  reg [31:0] _zz_28__string;
  reg [31:0] _zz_29__string;
  reg [31:0] _zz_31__string;
  reg [31:0] _zz_32__string;
  reg [31:0] _zz_34__string;
  reg [31:0] _zz_35__string;
  `endif

  reg [16:0] _zz_1_ [0:127];
  reg [16:0] _zz_7_ [0:127];
  reg [16:0] _zz_13_ [0:127];
  reg [16:0] _zz_19_ [0:127];
  assign _zz_41_ = (_zz_5_ == io_targetState);
  assign _zz_42_ = ((_zz_6_ == (15'b111111111111111)) || found);
  assign _zz_43_ = (_zz_11_ == io_targetState);
  assign _zz_44_ = ((_zz_12_ == (15'b111111111111111)) || found);
  assign _zz_45_ = (_zz_17_ == io_targetState);
  assign _zz_46_ = ((_zz_18_ == (15'b111111111111111)) || found);
  assign _zz_47_ = (_zz_23_ == io_targetState);
  assign _zz_48_ = ((_zz_24_ == (15'b111111111111111)) || found);
  assign _zz_49_ = ({2'd0,io_nPoly} <<< 2);
  assign _zz_50_ = ({2'd0,io_nPoly} <<< 2);
  assign _zz_51_ = ({2'd0,io_nPoly} <<< 2);
  assign _zz_52_ = 1'b1;
  assign _zz_53_ = 1'b1;
  assign _zz_54_ = 1'b1;
  assign _zz_55_ = 1'b1;
  assign _zz_56_ = ((_zz_27_[0] ^ _zz_27_[1]) ^ _zz_27_[2]);
  assign _zz_57_ = _zz_27_[3];
  assign _zz_58_ = ((_zz_30_[0] ^ _zz_30_[1]) ^ _zz_30_[2]);
  assign _zz_59_ = _zz_30_[3];
  assign _zz_60_ = ((_zz_33_[0] ^ _zz_33_[1]) ^ _zz_33_[2]);
  assign _zz_61_ = _zz_33_[3];
  assign _zz_62_ = ((_zz_36_[0] ^ _zz_36_[1]) ^ _zz_36_[2]);
  assign _zz_63_ = _zz_36_[3];
  initial begin
    $readmemb("LighthouseTopLevel.v_toplevel_slowArea_pulseOffsetFinder_offsetFinder_1___zz_1_.bin",_zz_1_);
  end
  always @ (posedge Slow_clk) begin
    if(_zz_52_) begin
      _zz_37_ <= _zz_1_[_zz_2_];
    end
  end

  initial begin
    $readmemb("LighthouseTopLevel.v_toplevel_slowArea_pulseOffsetFinder_offsetFinder_1___zz_7_.bin",_zz_7_);
  end
  always @ (posedge Slow_clk) begin
    if(_zz_53_) begin
      _zz_38_ <= _zz_7_[_zz_8_];
    end
  end

  initial begin
    $readmemb("LighthouseTopLevel.v_toplevel_slowArea_pulseOffsetFinder_offsetFinder_1___zz_13_.bin",_zz_13_);
  end
  always @ (posedge Slow_clk) begin
    if(_zz_54_) begin
      _zz_39_ <= _zz_13_[_zz_14_];
    end
  end

  initial begin
    $readmemb("LighthouseTopLevel.v_toplevel_slowArea_pulseOffsetFinder_offsetFinder_1___zz_19_.bin",_zz_19_);
  end
  always @ (posedge Slow_clk) begin
    if(_zz_55_) begin
      _zz_40_ <= _zz_19_[_zz_20_];
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_25_)
      `StateMachineEnum_defaultEncoding_boot : _zz_25__string = "boot";
      `StateMachineEnum_defaultEncoding_e1 : _zz_25__string = "e1  ";
      `StateMachineEnum_defaultEncoding_e2 : _zz_25__string = "e2  ";
      `StateMachineEnum_defaultEncoding_e3 : _zz_25__string = "e3  ";
      `StateMachineEnum_defaultEncoding_e4 : _zz_25__string = "e4  ";
      `StateMachineEnum_defaultEncoding_e5 : _zz_25__string = "e5  ";
      default : _zz_25__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_26_)
      `StateMachineEnum_defaultEncoding_boot : _zz_26__string = "boot";
      `StateMachineEnum_defaultEncoding_e1 : _zz_26__string = "e1  ";
      `StateMachineEnum_defaultEncoding_e2 : _zz_26__string = "e2  ";
      `StateMachineEnum_defaultEncoding_e3 : _zz_26__string = "e3  ";
      `StateMachineEnum_defaultEncoding_e4 : _zz_26__string = "e4  ";
      `StateMachineEnum_defaultEncoding_e5 : _zz_26__string = "e5  ";
      default : _zz_26__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_28_)
      `StateMachineEnum_1_defaultEncoding_boot : _zz_28__string = "boot";
      `StateMachineEnum_1_defaultEncoding_e1 : _zz_28__string = "e1  ";
      `StateMachineEnum_1_defaultEncoding_e2 : _zz_28__string = "e2  ";
      `StateMachineEnum_1_defaultEncoding_e3 : _zz_28__string = "e3  ";
      `StateMachineEnum_1_defaultEncoding_e4 : _zz_28__string = "e4  ";
      `StateMachineEnum_1_defaultEncoding_e5 : _zz_28__string = "e5  ";
      default : _zz_28__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_29_)
      `StateMachineEnum_1_defaultEncoding_boot : _zz_29__string = "boot";
      `StateMachineEnum_1_defaultEncoding_e1 : _zz_29__string = "e1  ";
      `StateMachineEnum_1_defaultEncoding_e2 : _zz_29__string = "e2  ";
      `StateMachineEnum_1_defaultEncoding_e3 : _zz_29__string = "e3  ";
      `StateMachineEnum_1_defaultEncoding_e4 : _zz_29__string = "e4  ";
      `StateMachineEnum_1_defaultEncoding_e5 : _zz_29__string = "e5  ";
      default : _zz_29__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_31_)
      `StateMachineEnum_2_defaultEncoding_boot : _zz_31__string = "boot";
      `StateMachineEnum_2_defaultEncoding_e1 : _zz_31__string = "e1  ";
      `StateMachineEnum_2_defaultEncoding_e2 : _zz_31__string = "e2  ";
      `StateMachineEnum_2_defaultEncoding_e3 : _zz_31__string = "e3  ";
      `StateMachineEnum_2_defaultEncoding_e4 : _zz_31__string = "e4  ";
      `StateMachineEnum_2_defaultEncoding_e5 : _zz_31__string = "e5  ";
      default : _zz_31__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_32_)
      `StateMachineEnum_2_defaultEncoding_boot : _zz_32__string = "boot";
      `StateMachineEnum_2_defaultEncoding_e1 : _zz_32__string = "e1  ";
      `StateMachineEnum_2_defaultEncoding_e2 : _zz_32__string = "e2  ";
      `StateMachineEnum_2_defaultEncoding_e3 : _zz_32__string = "e3  ";
      `StateMachineEnum_2_defaultEncoding_e4 : _zz_32__string = "e4  ";
      `StateMachineEnum_2_defaultEncoding_e5 : _zz_32__string = "e5  ";
      default : _zz_32__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_34_)
      `StateMachineEnum_3_defaultEncoding_boot : _zz_34__string = "boot";
      `StateMachineEnum_3_defaultEncoding_e1 : _zz_34__string = "e1  ";
      `StateMachineEnum_3_defaultEncoding_e2 : _zz_34__string = "e2  ";
      `StateMachineEnum_3_defaultEncoding_e3 : _zz_34__string = "e3  ";
      `StateMachineEnum_3_defaultEncoding_e4 : _zz_34__string = "e4  ";
      `StateMachineEnum_3_defaultEncoding_e5 : _zz_34__string = "e5  ";
      default : _zz_34__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_35_)
      `StateMachineEnum_3_defaultEncoding_boot : _zz_35__string = "boot";
      `StateMachineEnum_3_defaultEncoding_e1 : _zz_35__string = "e1  ";
      `StateMachineEnum_3_defaultEncoding_e2 : _zz_35__string = "e2  ";
      `StateMachineEnum_3_defaultEncoding_e3 : _zz_35__string = "e3  ";
      `StateMachineEnum_3_defaultEncoding_e4 : _zz_35__string = "e4  ";
      `StateMachineEnum_3_defaultEncoding_e5 : _zz_35__string = "e5  ";
      default : _zz_35__string = "????";
    endcase
  end
  `endif

  assign lfsrLut_0 = (17'b11101001001011000);
  assign lfsrLut_1 = (17'b11001011000111111);
  assign lfsrLut_2 = (17'b01110001100110111);
  assign lfsrLut_3 = (17'b11001010111101010);
  assign lfsrLut_4 = (17'b10111111000000100);
  assign lfsrLut_5 = (17'b01011100011011101);
  assign lfsrLut_6 = (17'b00110000001000011);
  assign lfsrLut_7 = (17'b01100101001101100);
  assign lfsrLut_8 = (17'b11111111101101011);
  assign lfsrLut_9 = (17'b11100011110110100);
  assign lfsrLut_10 = (17'b00000100111010110);
  assign lfsrLut_11 = (17'b11111101011111110);
  assign lfsrLut_12 = (17'b10011111101100111);
  assign lfsrLut_13 = (17'b00111110100011000);
  assign lfsrLut_14 = (17'b01111000100001011);
  assign lfsrLut_15 = (17'b01101010110111111);
  assign lfsrLut_16 = (17'b11011100111101110);
  assign lfsrLut_17 = (17'b10010001111000001);
  assign lfsrLut_18 = (17'b10001010101110100);
  assign lfsrLut_19 = (17'b10100101011010100);
  assign lfsrLut_20 = (17'b11001100011010001);
  assign lfsrLut_21 = (17'b10110111001101000);
  assign lfsrLut_22 = (17'b00011101101100001);
  assign lfsrLut_23 = (17'b10100110001010000);
  assign lfsrLut_24 = (17'b10111100011000111);
  assign lfsrLut_25 = (17'b11100010011100000);
  assign lfsrLut_26 = (17'b01001100010010010);
  assign lfsrLut_27 = (17'b01000110011011001);
  assign lfsrLut_28 = (17'b11000101001010101);
  assign lfsrLut_29 = (17'b00011100110001100);
  assign lfsrLut_30 = (17'b00100001101010101);
  assign lfsrLut_31 = (17'b00110001011011110);
  assign lfsrLut_32 = (17'b10101011101110111);
  assign lfsrLut_33 = (17'b11101111011000001);
  assign lfsrLut_34 = (17'b01110100001110111);
  assign lfsrLut_35 = (17'b01011001111001000);
  assign lfsrLut_36 = (17'b11101100100010001);
  assign lfsrLut_37 = (17'b11000111100101000);
  assign lfsrLut_38 = (17'b00110001111101101);
  assign lfsrLut_39 = (17'b01011110011110010);
  assign lfsrLut_40 = (17'b10101011101101001);
  assign lfsrLut_41 = (17'b10110110111101111);
  assign lfsrLut_42 = (17'b01011101000010110);
  assign lfsrLut_43 = (17'b00011100101010111);
  assign lfsrLut_44 = (17'b11001100100011111);
  assign lfsrLut_45 = (17'b10111100011001011);
  assign lfsrLut_46 = (17'b01010000000110111);
  assign lfsrLut_47 = (17'b11001100001000011);
  assign lfsrLut_48 = (17'b10010101111010000);
  assign lfsrLut_49 = (17'b00010000110000101);
  assign lfsrLut_50 = (17'b00001101100110000);
  assign lfsrLut_51 = (17'b11001000010000111);
  assign lfsrLut_52 = (17'b11100111101110011);
  assign lfsrLut_53 = (17'b00001001100010010);
  assign lfsrLut_54 = (17'b00000011101110100);
  assign lfsrLut_55 = (17'b01000001101100001);
  assign lfsrLut_56 = (17'b10011011001011101);
  assign lfsrLut_57 = (17'b10100101100010101);
  assign lfsrLut_58 = (17'b11000000101011110);
  assign lfsrLut_59 = (17'b10101110001001110);
  assign lfsrLut_60 = (17'b11001011111110101);
  assign lfsrLut_61 = (17'b10011111110011000);
  assign lfsrLut_62 = (17'b11011000100001001);
  assign lfsrLut_63 = (17'b11111100100000100);
  assign lfsrLut_64 = (17'b11001010010100000);
  assign lfsrLut_65 = (17'b01100100001110101);
  assign lfsrLut_66 = (17'b11010011100110010);
  assign lfsrLut_67 = (17'b00000100000100100);
  assign lfsrLut_68 = (17'b11011001001111001);
  assign lfsrLut_69 = (17'b10001111001011001);
  assign lfsrLut_70 = (17'b11101101100010010);
  assign lfsrLut_71 = (17'b01010000111000110);
  assign lfsrLut_72 = (17'b10011101000110100);
  assign lfsrLut_73 = (17'b01101011111010110);
  assign lfsrLut_74 = (17'b11011010010001110);
  assign lfsrLut_75 = (17'b00111110011100111);
  assign lfsrLut_76 = (17'b11010111001000001);
  assign lfsrLut_77 = (17'b00010000000010101);
  assign lfsrLut_78 = (17'b11101011110011011);
  assign lfsrLut_79 = (17'b11000111111100111);
  assign lfsrLut_80 = (17'b11000000011010100);
  assign lfsrLut_81 = (17'b10100000001111011);
  assign lfsrLut_82 = (17'b11000111101111000);
  assign lfsrLut_83 = (17'b11111111101100101);
  assign lfsrLut_84 = (17'b10111100010010001);
  assign lfsrLut_85 = (17'b10100010000001010);
  assign lfsrLut_86 = (17'b11111100110001100);
  assign lfsrLut_87 = (17'b00010000100000010);
  assign lfsrLut_88 = (17'b10010111001100100);
  assign lfsrLut_89 = (17'b10110111100010010);
  assign lfsrLut_90 = (17'b00101111011101100);
  assign lfsrLut_91 = (17'b10000010011011011);
  assign lfsrLut_92 = (17'b10111110001110010);
  assign lfsrLut_93 = (17'b01101010011011100);
  assign lfsrLut_94 = (17'b01101001100001101);
  assign lfsrLut_95 = (17'b11100001010101011);
  assign lfsrLut_96 = (17'b11001110001101101);
  assign lfsrLut_97 = (17'b11110110010110001);
  assign lfsrLut_98 = (17'b00001100100011001);
  assign lfsrLut_99 = (17'b00100000101110010);
  assign lfsrLut_100 = (17'b10011111100110010);
  assign lfsrLut_101 = (17'b11101010001001111);
  assign lfsrLut_102 = (17'b00100111111000100);
  assign lfsrLut_103 = (17'b11111011000100001);
  assign lfsrLut_104 = (17'b11010111000010100);
  assign lfsrLut_105 = (17'b11000000111100001);
  assign lfsrLut_106 = (17'b11001010001001111);
  assign lfsrLut_107 = (17'b01111001001001011);
  assign lfsrLut_108 = (17'b10100111001110110);
  assign lfsrLut_109 = (17'b00011101100111110);
  assign lfsrLut_110 = (17'b01111011100000111);
  assign lfsrLut_111 = (17'b11100010000011111);
  assign lfsrLut_112 = (17'b10011110010010111);
  assign lfsrLut_113 = (17'b00000010101111101);
  assign lfsrLut_114 = (17'b10110001001001111);
  assign lfsrLut_115 = (17'b00111110001001100);
  assign lfsrLut_116 = (17'b10011000011001011);
  assign lfsrLut_117 = (17'b10110000101101110);
  assign lfsrLut_118 = (17'b11011001100011110);
  assign lfsrLut_119 = (17'b11111010000001001);
  assign lfsrLut_120 = (17'b10011011101010000);
  assign lfsrLut_121 = (17'b10011000111111010);
  assign lfsrLut_122 = (17'b01000001100011110);
  assign lfsrLut_123 = (17'b11111001101011011);
  assign lfsrLut_124 = (17'b11100101110001101);
  assign lfsrLut_125 = (17'b00011100110110010);
  assign lfsrLut_126 = (17'b10011001110110111);
  assign lfsrLut_127 = (17'b10010101001011000);
  always @ (*) begin
    done = (4'b0000);
    case(_zz_25_)
      `StateMachineEnum_defaultEncoding_e1 : begin
      end
      `StateMachineEnum_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_defaultEncoding_e4 : begin
      end
      `StateMachineEnum_defaultEncoding_e5 : begin
        done[0] = 1'b1;
      end
      default : begin
      end
    endcase
    case(_zz_28_)
      `StateMachineEnum_1_defaultEncoding_e1 : begin
      end
      `StateMachineEnum_1_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_1_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_1_defaultEncoding_e4 : begin
      end
      `StateMachineEnum_1_defaultEncoding_e5 : begin
        done[1] = 1'b1;
      end
      default : begin
      end
    endcase
    case(_zz_31_)
      `StateMachineEnum_2_defaultEncoding_e1 : begin
      end
      `StateMachineEnum_2_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_2_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_2_defaultEncoding_e4 : begin
      end
      `StateMachineEnum_2_defaultEncoding_e5 : begin
        done[2] = 1'b1;
      end
      default : begin
      end
    endcase
    case(_zz_34_)
      `StateMachineEnum_3_defaultEncoding_e1 : begin
      end
      `StateMachineEnum_3_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_3_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_3_defaultEncoding_e4 : begin
      end
      `StateMachineEnum_3_defaultEncoding_e5 : begin
        done[3] = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign io_done = (done != (4'b0000));
  assign io_found = found;
  assign io_offset = offset;
  assign _zz_3_ = _zz_37_;
  always @ (*) begin
    _zz_2_ = (7'b0000000);
    case(_zz_25_)
      `StateMachineEnum_defaultEncoding_e1 : begin
        _zz_2_ = ({2'd0,io_nPoly} <<< 2);
      end
      `StateMachineEnum_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_defaultEncoding_e4 : begin
      end
      `StateMachineEnum_defaultEncoding_e5 : begin
        _zz_2_ = ({2'd0,io_nPoly} <<< 2);
      end
      default : begin
      end
    endcase
  end

  assign _zz_9_ = _zz_38_;
  always @ (*) begin
    _zz_8_ = (7'b0000000);
    case(_zz_28_)
      `StateMachineEnum_1_defaultEncoding_e1 : begin
        _zz_8_ = ({2'd0,io_nPoly} <<< 2);
      end
      `StateMachineEnum_1_defaultEncoding_e2 : begin
        _zz_8_ = (_zz_49_ | (7'b0000001));
      end
      `StateMachineEnum_1_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_1_defaultEncoding_e4 : begin
      end
      `StateMachineEnum_1_defaultEncoding_e5 : begin
        _zz_8_ = ({2'd0,io_nPoly} <<< 2);
      end
      default : begin
      end
    endcase
  end

  assign _zz_15_ = _zz_39_;
  always @ (*) begin
    _zz_14_ = (7'b0000000);
    case(_zz_31_)
      `StateMachineEnum_2_defaultEncoding_e1 : begin
        _zz_14_ = ({2'd0,io_nPoly} <<< 2);
      end
      `StateMachineEnum_2_defaultEncoding_e2 : begin
        _zz_14_ = (_zz_50_ | (7'b0000010));
      end
      `StateMachineEnum_2_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_2_defaultEncoding_e4 : begin
      end
      `StateMachineEnum_2_defaultEncoding_e5 : begin
        _zz_14_ = ({2'd0,io_nPoly} <<< 2);
      end
      default : begin
      end
    endcase
  end

  assign _zz_21_ = _zz_40_;
  always @ (*) begin
    _zz_20_ = (7'b0000000);
    case(_zz_34_)
      `StateMachineEnum_3_defaultEncoding_e1 : begin
        _zz_20_ = ({2'd0,io_nPoly} <<< 2);
      end
      `StateMachineEnum_3_defaultEncoding_e2 : begin
        _zz_20_ = (_zz_51_ | (7'b0000011));
      end
      `StateMachineEnum_3_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_3_defaultEncoding_e4 : begin
      end
      `StateMachineEnum_3_defaultEncoding_e5 : begin
        _zz_20_ = ({2'd0,io_nPoly} <<< 2);
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_26_ = _zz_25_;
    case(_zz_25_)
      `StateMachineEnum_defaultEncoding_e1 : begin
        if(io_start)begin
          _zz_26_ = `StateMachineEnum_defaultEncoding_e2;
        end
      end
      `StateMachineEnum_defaultEncoding_e2 : begin
        _zz_26_ = `StateMachineEnum_defaultEncoding_e4;
      end
      `StateMachineEnum_defaultEncoding_e3 : begin
        _zz_26_ = `StateMachineEnum_defaultEncoding_e4;
      end
      `StateMachineEnum_defaultEncoding_e4 : begin
        if(_zz_41_)begin
          _zz_26_ = `StateMachineEnum_defaultEncoding_e5;
        end else begin
          if(_zz_42_)begin
            _zz_26_ = `StateMachineEnum_defaultEncoding_e5;
          end
        end
      end
      `StateMachineEnum_defaultEncoding_e5 : begin
        if(io_start)begin
          _zz_26_ = `StateMachineEnum_defaultEncoding_e2;
        end
        if(io_reset)begin
          _zz_26_ = `StateMachineEnum_defaultEncoding_e1;
        end
      end
      default : begin
        _zz_26_ = `StateMachineEnum_defaultEncoding_e1;
      end
    endcase
  end

  assign _zz_27_ = (_zz_5_ & _zz_4_);
  always @ (*) begin
    _zz_29_ = _zz_28_;
    case(_zz_28_)
      `StateMachineEnum_1_defaultEncoding_e1 : begin
        if(io_start)begin
          _zz_29_ = `StateMachineEnum_1_defaultEncoding_e2;
        end
      end
      `StateMachineEnum_1_defaultEncoding_e2 : begin
        _zz_29_ = `StateMachineEnum_1_defaultEncoding_e3;
      end
      `StateMachineEnum_1_defaultEncoding_e3 : begin
        _zz_29_ = `StateMachineEnum_1_defaultEncoding_e4;
      end
      `StateMachineEnum_1_defaultEncoding_e4 : begin
        if(_zz_43_)begin
          _zz_29_ = `StateMachineEnum_1_defaultEncoding_e5;
        end else begin
          if(_zz_44_)begin
            _zz_29_ = `StateMachineEnum_1_defaultEncoding_e5;
          end
        end
      end
      `StateMachineEnum_1_defaultEncoding_e5 : begin
        if(io_start)begin
          _zz_29_ = `StateMachineEnum_1_defaultEncoding_e2;
        end
        if(io_reset)begin
          _zz_29_ = `StateMachineEnum_1_defaultEncoding_e1;
        end
      end
      default : begin
        _zz_29_ = `StateMachineEnum_1_defaultEncoding_e1;
      end
    endcase
  end

  assign _zz_30_ = (_zz_11_ & _zz_10_);
  always @ (*) begin
    _zz_32_ = _zz_31_;
    case(_zz_31_)
      `StateMachineEnum_2_defaultEncoding_e1 : begin
        if(io_start)begin
          _zz_32_ = `StateMachineEnum_2_defaultEncoding_e2;
        end
      end
      `StateMachineEnum_2_defaultEncoding_e2 : begin
        _zz_32_ = `StateMachineEnum_2_defaultEncoding_e3;
      end
      `StateMachineEnum_2_defaultEncoding_e3 : begin
        _zz_32_ = `StateMachineEnum_2_defaultEncoding_e4;
      end
      `StateMachineEnum_2_defaultEncoding_e4 : begin
        if(_zz_45_)begin
          _zz_32_ = `StateMachineEnum_2_defaultEncoding_e5;
        end else begin
          if(_zz_46_)begin
            _zz_32_ = `StateMachineEnum_2_defaultEncoding_e5;
          end
        end
      end
      `StateMachineEnum_2_defaultEncoding_e5 : begin
        if(io_start)begin
          _zz_32_ = `StateMachineEnum_2_defaultEncoding_e2;
        end
        if(io_reset)begin
          _zz_32_ = `StateMachineEnum_2_defaultEncoding_e1;
        end
      end
      default : begin
        _zz_32_ = `StateMachineEnum_2_defaultEncoding_e1;
      end
    endcase
  end

  assign _zz_33_ = (_zz_17_ & _zz_16_);
  always @ (*) begin
    _zz_35_ = _zz_34_;
    case(_zz_34_)
      `StateMachineEnum_3_defaultEncoding_e1 : begin
        if(io_start)begin
          _zz_35_ = `StateMachineEnum_3_defaultEncoding_e2;
        end
      end
      `StateMachineEnum_3_defaultEncoding_e2 : begin
        _zz_35_ = `StateMachineEnum_3_defaultEncoding_e3;
      end
      `StateMachineEnum_3_defaultEncoding_e3 : begin
        _zz_35_ = `StateMachineEnum_3_defaultEncoding_e4;
      end
      `StateMachineEnum_3_defaultEncoding_e4 : begin
        if(_zz_47_)begin
          _zz_35_ = `StateMachineEnum_3_defaultEncoding_e5;
        end else begin
          if(_zz_48_)begin
            _zz_35_ = `StateMachineEnum_3_defaultEncoding_e5;
          end
        end
      end
      `StateMachineEnum_3_defaultEncoding_e5 : begin
        if(io_start)begin
          _zz_35_ = `StateMachineEnum_3_defaultEncoding_e2;
        end
        if(io_reset)begin
          _zz_35_ = `StateMachineEnum_3_defaultEncoding_e1;
        end
      end
      default : begin
        _zz_35_ = `StateMachineEnum_3_defaultEncoding_e1;
      end
    endcase
  end

  assign _zz_36_ = (_zz_23_ & _zz_22_);
  always @ (posedge Slow_clk) begin
    _zz_25_ <= _zz_26_;
    case(_zz_25_)
      `StateMachineEnum_defaultEncoding_e1 : begin
        found <= 1'b0;
      end
      `StateMachineEnum_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_defaultEncoding_e4 : begin
        if(_zz_41_)begin
          found <= 1'b1;
          offset <= {(2'b00),_zz_6_};
        end
      end
      `StateMachineEnum_defaultEncoding_e5 : begin
        if(io_start)begin
          found <= 1'b0;
        end
      end
      default : begin
      end
    endcase
    _zz_28_ <= _zz_29_;
    case(_zz_28_)
      `StateMachineEnum_1_defaultEncoding_e1 : begin
        found <= 1'b0;
      end
      `StateMachineEnum_1_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_1_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_1_defaultEncoding_e4 : begin
        if(_zz_43_)begin
          found <= 1'b1;
          offset <= {(2'b01),_zz_12_};
        end
      end
      `StateMachineEnum_1_defaultEncoding_e5 : begin
        if(io_start)begin
          found <= 1'b0;
        end
      end
      default : begin
      end
    endcase
    _zz_31_ <= _zz_32_;
    case(_zz_31_)
      `StateMachineEnum_2_defaultEncoding_e1 : begin
        found <= 1'b0;
      end
      `StateMachineEnum_2_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_2_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_2_defaultEncoding_e4 : begin
        if(_zz_45_)begin
          found <= 1'b1;
          offset <= {(2'b10),_zz_18_};
        end
      end
      `StateMachineEnum_2_defaultEncoding_e5 : begin
        if(io_start)begin
          found <= 1'b0;
        end
      end
      default : begin
      end
    endcase
    _zz_34_ <= _zz_35_;
    case(_zz_34_)
      `StateMachineEnum_3_defaultEncoding_e1 : begin
        found <= 1'b0;
      end
      `StateMachineEnum_3_defaultEncoding_e2 : begin
      end
      `StateMachineEnum_3_defaultEncoding_e3 : begin
      end
      `StateMachineEnum_3_defaultEncoding_e4 : begin
        if(_zz_47_)begin
          found <= 1'b1;
          offset <= {(2'b11),_zz_24_};
        end
      end
      `StateMachineEnum_3_defaultEncoding_e5 : begin
        if(io_start)begin
          found <= 1'b0;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (posedge Slow_clk) begin
    case(_zz_25_)
      `StateMachineEnum_defaultEncoding_e1 : begin
        _zz_6_ <= (15'b000000000000000);
      end
      `StateMachineEnum_defaultEncoding_e2 : begin
        _zz_4_ <= _zz_3_;
        _zz_5_ <= (17'b00000000000000001);
      end
      `StateMachineEnum_defaultEncoding_e3 : begin
        _zz_5_ <= _zz_3_;
      end
      `StateMachineEnum_defaultEncoding_e4 : begin
        if(! _zz_41_) begin
          if(! _zz_42_) begin
            _zz_6_ <= (_zz_6_ + (15'b000000000000001));
            _zz_5_ <= {_zz_5_[15 : 0],((((((((((((((_zz_56_ ^ _zz_57_) ^ _zz_27_[4]) ^ _zz_27_[5]) ^ _zz_27_[6]) ^ _zz_27_[7]) ^ _zz_27_[8]) ^ _zz_27_[9]) ^ _zz_27_[10]) ^ _zz_27_[11]) ^ _zz_27_[12]) ^ _zz_27_[13]) ^ _zz_27_[14]) ^ _zz_27_[15]) ^ _zz_27_[16])};
          end
        end
      end
      `StateMachineEnum_defaultEncoding_e5 : begin
      end
      default : begin
      end
    endcase
    case(_zz_28_)
      `StateMachineEnum_1_defaultEncoding_e1 : begin
        _zz_12_ <= (15'b000000000000000);
      end
      `StateMachineEnum_1_defaultEncoding_e2 : begin
        _zz_10_ <= _zz_9_;
      end
      `StateMachineEnum_1_defaultEncoding_e3 : begin
        _zz_11_ <= _zz_9_;
      end
      `StateMachineEnum_1_defaultEncoding_e4 : begin
        if(! _zz_43_) begin
          if(! _zz_44_) begin
            _zz_12_ <= (_zz_12_ + (15'b000000000000001));
            _zz_11_ <= {_zz_11_[15 : 0],((((((((((((((_zz_58_ ^ _zz_59_) ^ _zz_30_[4]) ^ _zz_30_[5]) ^ _zz_30_[6]) ^ _zz_30_[7]) ^ _zz_30_[8]) ^ _zz_30_[9]) ^ _zz_30_[10]) ^ _zz_30_[11]) ^ _zz_30_[12]) ^ _zz_30_[13]) ^ _zz_30_[14]) ^ _zz_30_[15]) ^ _zz_30_[16])};
          end
        end
      end
      `StateMachineEnum_1_defaultEncoding_e5 : begin
      end
      default : begin
      end
    endcase
    case(_zz_31_)
      `StateMachineEnum_2_defaultEncoding_e1 : begin
        _zz_18_ <= (15'b000000000000000);
      end
      `StateMachineEnum_2_defaultEncoding_e2 : begin
        _zz_16_ <= _zz_15_;
      end
      `StateMachineEnum_2_defaultEncoding_e3 : begin
        _zz_17_ <= _zz_15_;
      end
      `StateMachineEnum_2_defaultEncoding_e4 : begin
        if(! _zz_45_) begin
          if(! _zz_46_) begin
            _zz_18_ <= (_zz_18_ + (15'b000000000000001));
            _zz_17_ <= {_zz_17_[15 : 0],((((((((((((((_zz_60_ ^ _zz_61_) ^ _zz_33_[4]) ^ _zz_33_[5]) ^ _zz_33_[6]) ^ _zz_33_[7]) ^ _zz_33_[8]) ^ _zz_33_[9]) ^ _zz_33_[10]) ^ _zz_33_[11]) ^ _zz_33_[12]) ^ _zz_33_[13]) ^ _zz_33_[14]) ^ _zz_33_[15]) ^ _zz_33_[16])};
          end
        end
      end
      `StateMachineEnum_2_defaultEncoding_e5 : begin
      end
      default : begin
      end
    endcase
    case(_zz_34_)
      `StateMachineEnum_3_defaultEncoding_e1 : begin
        _zz_24_ <= (15'b000000000000000);
      end
      `StateMachineEnum_3_defaultEncoding_e2 : begin
        _zz_22_ <= _zz_21_;
      end
      `StateMachineEnum_3_defaultEncoding_e3 : begin
        _zz_23_ <= _zz_21_;
      end
      `StateMachineEnum_3_defaultEncoding_e4 : begin
        if(! _zz_47_) begin
          if(! _zz_48_) begin
            _zz_24_ <= (_zz_24_ + (15'b000000000000001));
            _zz_23_ <= {_zz_23_[15 : 0],((((((((((((((_zz_62_ ^ _zz_63_) ^ _zz_36_[4]) ^ _zz_36_[5]) ^ _zz_36_[6]) ^ _zz_36_[7]) ^ _zz_36_[8]) ^ _zz_36_[9]) ^ _zz_36_[10]) ^ _zz_36_[11]) ^ _zz_36_[12]) ^ _zz_36_[13]) ^ _zz_36_[14]) ^ _zz_36_[15]) ^ _zz_36_[16])};
          end
        end
      end
      `StateMachineEnum_3_defaultEncoding_e5 : begin
      end
      default : begin
      end
    endcase
  end

endmodule

module UartCtrlTx (
      input  [2:0] io_configFrame_dataLength,
      input  `UartStopType_defaultEncoding_type io_configFrame_stop,
      input  `UartParityType_defaultEncoding_type io_configFrame_parity,
      input   io_samplingTick,
      input   io_write_valid,
      output reg  io_write_ready,
      input  [7:0] io_write_payload,
      output  io_txd,
      input   Slow_clk);
  wire  _zz_1_;
  wire [0:0] _zz_2_;
  wire [2:0] _zz_3_;
  wire [0:0] _zz_4_;
  wire [2:0] _zz_5_;
  reg  clockDivider_counter_willIncrement;
  wire  clockDivider_counter_willClear;
  reg [2:0] clockDivider_counter_valueNext;
  reg [2:0] clockDivider_counter_value = (3'b000);
  wire  clockDivider_counter_willOverflowIfInc;
  wire  clockDivider_tick;
  reg [2:0] tickCounter_value;
  reg `UartCtrlTxState_defaultEncoding_type stateMachine_state = `UartCtrlTxState_defaultEncoding_IDLE;
  reg  stateMachine_parity;
  reg  stateMachine_txd;
  reg  stateMachine_txd_regNext = 1'b1;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif

  assign _zz_1_ = (tickCounter_value == io_configFrame_dataLength);
  assign _zz_2_ = clockDivider_counter_willIncrement;
  assign _zz_3_ = {2'd0, _zz_2_};
  assign _zz_4_ = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_5_ = {2'd0, _zz_4_};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick)begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == (3'b111));
  assign clockDivider_tick = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @ (*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_3_);
    if(clockDivider_counter_willClear)begin
      clockDivider_counter_valueNext = (3'b000);
    end
  end

  always @ (*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_write_ready = 1'b0;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_tick)begin
          if(_zz_1_)begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign io_txd = stateMachine_txd_regNext;
  always @ (posedge Slow_clk) begin
    clockDivider_counter_value <= clockDivider_counter_valueNext;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
        if((io_write_valid && clockDivider_tick))begin
          stateMachine_state <= `UartCtrlTxState_defaultEncoding_START;
        end
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_tick)begin
          stateMachine_state <= `UartCtrlTxState_defaultEncoding_DATA;
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_tick)begin
          if(_zz_1_)begin
            if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
              stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
            end else begin
              stateMachine_state <= `UartCtrlTxState_defaultEncoding_PARITY;
            end
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_tick)begin
          stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
        end
      end
      default : begin
        if(clockDivider_tick)begin
          if((tickCounter_value == _zz_5_))begin
            stateMachine_state <= (io_write_valid ? `UartCtrlTxState_defaultEncoding_START : `UartCtrlTxState_defaultEncoding_IDLE);
          end
        end
      end
    endcase
    stateMachine_txd_regNext <= stateMachine_txd;
  end

  always @ (posedge Slow_clk) begin
    if(clockDivider_tick)begin
      tickCounter_value <= (tickCounter_value + (3'b001));
    end
    if(clockDivider_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_tick)begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
          tickCounter_value <= (3'b000);
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_tick)begin
          if(_zz_1_)begin
            tickCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_tick)begin
          tickCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end

endmodule

module UartCtrlRx (
      input  [2:0] io_configFrame_dataLength,
      input  `UartStopType_defaultEncoding_type io_configFrame_stop,
      input  `UartParityType_defaultEncoding_type io_configFrame_parity,
      input   io_samplingTick,
      output  io_read_valid,
      output [7:0] io_read_payload,
      input   io_rxd,
      input   Slow_clk);
  wire  _zz_1_;
  wire  bufferCC_45__io_dataOut;
  wire  _zz_2_;
  wire  _zz_3_;
  wire [0:0] _zz_4_;
  wire [2:0] _zz_5_;
  wire  _zz_6_;
  wire  _zz_7_;
  wire  _zz_8_;
  wire  _zz_9_;
  wire  _zz_10_;
  wire  _zz_11_;
  wire  _zz_12_;
  wire  sampler_synchroniser;
  wire  sampler_samples_0;
  reg  sampler_samples_1 = 1'b1;
  reg  sampler_samples_2 = 1'b1;
  reg  sampler_samples_3 = 1'b1;
  reg  sampler_samples_4 = 1'b1;
  reg  sampler_value = 1'b1;
  reg  sampler_tick = 1'b0;
  reg [2:0] bitTimer_counter;
  reg  bitTimer_tick;
  reg [2:0] bitCounter_value;
  reg `UartCtrlRxState_defaultEncoding_type stateMachine_state = `UartCtrlRxState_defaultEncoding_IDLE;
  reg  stateMachine_parity;
  reg [7:0] stateMachine_shifter;
  reg  stateMachine_validReg = 1'b0;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif

  assign _zz_2_ = (sampler_tick && (! sampler_value));
  assign _zz_3_ = (bitCounter_value == io_configFrame_dataLength);
  assign _zz_4_ = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_5_ = {2'd0, _zz_4_};
  assign _zz_6_ = ((((1'b0 || ((_zz_11_ && sampler_samples_1) && sampler_samples_2)) || (((_zz_12_ && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_7_ = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_8_ = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_9_ = (1'b1 && sampler_samples_1);
  assign _zz_10_ = 1'b1;
  assign _zz_11_ = (1'b1 && sampler_samples_0);
  assign _zz_12_ = 1'b1;
  BufferCC bufferCC_45_ (
    .io_initial(_zz_1_),
    .io_dataIn(io_rxd),
    .io_dataOut(bufferCC_45__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  assign _zz_1_ = 1'b0;
  assign sampler_synchroniser = bufferCC_45__io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @ (*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick)begin
      if((bitTimer_counter == (3'b000)))begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign io_read_valid = stateMachine_validReg;
  assign io_read_payload = stateMachine_shifter;
  always @ (posedge Slow_clk) begin
    if(io_samplingTick)begin
      sampler_samples_1 <= sampler_samples_0;
    end
    if(io_samplingTick)begin
      sampler_samples_2 <= sampler_samples_1;
    end
    if(io_samplingTick)begin
      sampler_samples_3 <= sampler_samples_2;
    end
    if(io_samplingTick)begin
      sampler_samples_4 <= sampler_samples_3;
    end
    sampler_value <= ((((((_zz_6_ || _zz_7_) || (_zz_8_ && sampler_samples_4)) || ((_zz_9_ && sampler_samples_2) && sampler_samples_4)) || (((_zz_10_ && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
    sampler_tick <= io_samplingTick;
    stateMachine_validReg <= 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(_zz_2_)begin
          stateMachine_state <= `UartCtrlRxState_defaultEncoding_START;
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick)begin
          stateMachine_state <= `UartCtrlRxState_defaultEncoding_DATA;
          if((sampler_value == 1'b1))begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick)begin
          if(_zz_3_)begin
            if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_PARITY;
            end
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          if((stateMachine_parity == sampler_value))begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
            stateMachine_validReg <= 1'b1;
          end else begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
          end
        end
      end
      default : begin
        if(bitTimer_tick)begin
          if((! sampler_value))begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
          end else begin
            if((bitCounter_value == _zz_5_))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
      end
    endcase
  end

  always @ (posedge Slow_clk) begin
    if(sampler_tick)begin
      bitTimer_counter <= (bitTimer_counter - (3'b001));
    end
    if(bitTimer_tick)begin
      bitCounter_value <= (bitCounter_value + (3'b001));
    end
    if(bitTimer_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(_zz_2_)begin
          bitTimer_counter <= (3'b010);
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick)begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(_zz_3_)begin
            bitCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end

endmodule

module BufferCC_9_ (
      input   io_dataIn,
      output  io_dataOut,
      input   Core_clk);
  reg  buffers_0;
  reg  buffers_1;
  assign io_dataOut = buffers_1;
  always @ (posedge Core_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule


//BufferCC_10_ remplaced by BufferCC_9_


//BufferCC_11_ remplaced by BufferCC_9_


//BufferCC_12_ remplaced by BufferCC_9_


//BufferCC_13_ remplaced by BufferCC_9_


//BufferCC_14_ remplaced by BufferCC_9_

module DdrBmcDecoder (
      input   io_signal_v_0,
      input   io_signal_v_1,
      input   io_enable,
      output  io_output_valid,
      output  io_output_payload,
      output  io_synchronized,
      input   Core_clk);
  wire  _zz_1_;
  wire  _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire  _zz_5_;
  wire  _zz_6_;
  wire  _zz_7_;
  wire  _zz_8_;
  wire  _zz_9_;
  wire  _zz_10_;
  reg  data_valid;
  reg  data_payload;
  reg [21:0] counter_sr = (22'b0000000000000000000001);
  reg  synchronized = 1'b0;
  reg  decodingOne = 1'b0;
  reg [21:0] sample = (22'b0000000000000000000000);
  reg  io_signal_v_1_regNext;
  reg  io_signal_v_1_regNext_1_;
  reg  io_signal_v_1_regNext_2_;
  assign _zz_1_ = (! io_enable);
  assign _zz_2_ = (! synchronized);
  assign _zz_3_ = (counter_sr[21 : 21] != (1'b0));
  assign _zz_4_ = (io_signal_v_1_regNext_2_ ^ io_signal_v_0);
  assign _zz_5_ = (counter_sr[10 : 0] != (11'b00000000000));
  assign _zz_6_ = (! io_enable);
  assign _zz_7_ = (! synchronized);
  assign _zz_8_ = (counter_sr[21 : 21] != (1'b0));
  assign _zz_9_ = (io_signal_v_0 ^ io_signal_v_1);
  assign _zz_10_ = (counter_sr[9 : 0] != (10'b0000000000));
  assign io_output_valid = data_valid;
  assign io_output_payload = data_payload;
  assign io_synchronized = synchronized;
  always @ (*) begin
    data_valid = 1'b0;
    if(! _zz_1_) begin
      if(! _zz_2_) begin
        if(! _zz_3_) begin
          if(_zz_4_)begin
            if(_zz_5_)begin
              if(decodingOne)begin
                data_valid = 1'b1;
              end
            end else begin
              data_valid = 1'b1;
            end
          end
        end
      end
    end
    if(! _zz_6_) begin
      if(! _zz_7_) begin
        if(! _zz_8_) begin
          if(_zz_9_)begin
            if(_zz_10_)begin
              if(decodingOne)begin
                data_valid = 1'b1;
              end
            end else begin
              data_valid = 1'b1;
            end
          end
        end
      end
    end
  end

  always @ (*) begin
    data_payload = 1'b0;
    if(! _zz_1_) begin
      if(! _zz_2_) begin
        if(! _zz_3_) begin
          if(_zz_4_)begin
            if(_zz_5_)begin
              if(decodingOne)begin
                data_payload = 1'b1;
              end
            end else begin
              data_payload = 1'b0;
            end
          end
        end
      end
    end
    if(! _zz_6_) begin
      if(! _zz_7_) begin
        if(! _zz_8_) begin
          if(_zz_9_)begin
            if(_zz_10_)begin
              if(decodingOne)begin
                data_payload = 1'b1;
              end
            end else begin
              data_payload = 1'b0;
            end
          end
        end
      end
    end
  end

  always @ (posedge Core_clk) begin
    if((io_signal_v_1_regNext ^ io_signal_v_0))begin
      counter_sr <= (22'b0000000000000000000010);
      sample <= counter_sr;
    end else begin
      if((io_signal_v_0 ^ io_signal_v_1))begin
        counter_sr <= (22'b0000000000000000000001);
        sample <= {counter_sr[20 : 0],counter_sr[21 : 21]};
      end else begin
        counter_sr <= {counter_sr[19 : 0],counter_sr[21 : 20]};
      end
    end
    if(_zz_1_)begin
      synchronized <= 1'b0;
    end else begin
      if(_zz_2_)begin
        decodingOne <= 1'b0;
        if((io_signal_v_1_regNext_1_ ^ io_signal_v_0))begin
          synchronized <= 1'b1;
        end
      end else begin
        if(_zz_3_)begin
          synchronized <= 1'b0;
          decodingOne <= 1'b0;
        end else begin
          if(_zz_4_)begin
            if(_zz_5_)begin
              if(decodingOne)begin
                decodingOne <= 1'b0;
              end else begin
                decodingOne <= 1'b1;
              end
            end else begin
              decodingOne <= 1'b0;
            end
          end
        end
      end
    end
    if(_zz_6_)begin
      synchronized <= 1'b0;
    end else begin
      if(_zz_7_)begin
        decodingOne <= 1'b0;
        if((io_signal_v_0 ^ io_signal_v_1))begin
          synchronized <= 1'b1;
        end
      end else begin
        if(_zz_8_)begin
          synchronized <= 1'b0;
          decodingOne <= 1'b0;
        end else begin
          if(_zz_9_)begin
            if(_zz_10_)begin
              if(decodingOne)begin
                decodingOne <= 1'b0;
              end else begin
                decodingOne <= 1'b1;
              end
            end else begin
              decodingOne <= 1'b0;
            end
          end
        end
      end
    end
  end

  always @ (posedge Core_clk) begin
    io_signal_v_1_regNext <= io_signal_v_1;
  end

  always @ (posedge Core_clk) begin
    io_signal_v_1_regNext_1_ <= io_signal_v_1;
  end

  always @ (posedge Core_clk) begin
    io_signal_v_1_regNext_2_ <= io_signal_v_1;
  end

endmodule

module ShiftBuffer (
      input   io_dataIn_valid,
      output  io_dataIn_ready,
      input   io_dataIn_payload,
      output  io_dataOut_valid,
      input   io_dataOut_ready,
      output [16:0] io_dataOut_payload,
      input   io_resetBuffer,
      input   Core_clk);
  reg [17:0] buffer_1_ = (18'b000000000000000001);
  wire  stalled;
  reg  read = 1'b0;
  assign stalled = buffer_1_[17];
  assign io_dataIn_ready = (! stalled);
  assign io_dataOut_valid = (stalled && (! read));
  assign io_dataOut_payload = buffer_1_[16 : 0];
  always @ (posedge Core_clk) begin
    if(io_resetBuffer)begin
      buffer_1_ <= (18'b000000000000000001);
      read <= 1'b0;
    end else begin
      if(((! stalled) && (io_dataIn_valid && io_dataIn_ready)))begin
        buffer_1_[17 : 1] <= buffer_1_[16 : 0];
        buffer_1_[0] <= io_dataIn_payload;
      end
    end
    if((io_dataOut_valid && io_dataOut_ready))begin
      read <= 1'b1;
    end
  end

endmodule


//BufferCC_15_ remplaced by BufferCC_9_


//BufferCC_16_ remplaced by BufferCC_9_


//BufferCC_17_ remplaced by BufferCC_9_


//BufferCC_18_ remplaced by BufferCC_9_


//BufferCC_19_ remplaced by BufferCC_9_


//BufferCC_20_ remplaced by BufferCC_9_


//DdrBmcDecoder_1_ remplaced by DdrBmcDecoder


//ShiftBuffer_1_ remplaced by ShiftBuffer


//BufferCC_21_ remplaced by BufferCC_9_


//BufferCC_22_ remplaced by BufferCC_9_


//BufferCC_23_ remplaced by BufferCC_9_


//BufferCC_24_ remplaced by BufferCC_9_


//BufferCC_25_ remplaced by BufferCC_9_


//BufferCC_26_ remplaced by BufferCC_9_


//DdrBmcDecoder_2_ remplaced by DdrBmcDecoder


//ShiftBuffer_2_ remplaced by ShiftBuffer


//BufferCC_27_ remplaced by BufferCC_9_


//BufferCC_28_ remplaced by BufferCC_9_


//BufferCC_29_ remplaced by BufferCC_9_


//BufferCC_30_ remplaced by BufferCC_9_


//BufferCC_31_ remplaced by BufferCC_9_


//BufferCC_32_ remplaced by BufferCC_9_


//DdrBmcDecoder_3_ remplaced by DdrBmcDecoder


//ShiftBuffer_3_ remplaced by ShiftBuffer

module BufferCC_33_ (
      input   io_dataIn,
      output  io_dataOut,
      input   Slow_clk);
  reg  buffers_0;
  reg  buffers_1;
  assign io_dataOut = buffers_1;
  always @ (posedge Slow_clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end

endmodule


//BufferCC_34_ remplaced by BufferCC_33_

module PulseTimer (
      input  [23:0] io_time,
      input   io_e,
      output  io_pulse_valid,
      output [15:0] io_pulse_payload_width,
      output [23:0] io_pulse_payload_timestamp,
      input   Slow_clk);
  wire  _zz_1_;
  wire [23:0] _zz_2_;
  reg [23:0] timestamp;
  reg [15:0] width;
  reg  valid;
  reg  valid_regNext;
  reg  io_e_regNext;
  reg  io_e_regNext_1_;
  assign _zz_1_ = (io_e && (! io_e_regNext_1_));
  assign _zz_2_ = (io_time - timestamp);
  assign io_pulse_payload_timestamp = timestamp;
  assign io_pulse_payload_width = width;
  always @ (*) begin
    valid = 1'b0;
    if(_zz_1_)begin
      valid = 1'b1;
    end
  end

  assign io_pulse_valid = valid_regNext;
  always @ (posedge Slow_clk) begin
    valid_regNext <= valid;
    io_e_regNext <= io_e;
    if(((! io_e) && io_e_regNext))begin
      timestamp <= io_time;
    end
    io_e_regNext_1_ <= io_e;
    if(_zz_1_)begin
      width <= _zz_2_[15:0];
    end
  end

endmodule


//BufferCC_35_ remplaced by BufferCC_33_

module StreamCCByToggle (
      input   io_input_valid,
      output reg  io_input_ready,
      input  [16:0] io_input_payload,
      output  io_output_valid,
      input   io_output_ready,
      output [16:0] io_output_payload,
      input   Core_clk,
      input   Slow_clk);
  wire  _zz_1_;
  wire  _zz_2_;
  wire  bufferCC_45__io_dataOut;
  wire  bufferCC_46__io_dataOut;
  wire  _zz_3_;
  wire  outHitSignal;
  wire  pushArea_hit;
  reg  pushArea_target = 1'b0;
  reg [16:0] pushArea_data;
  wire  popArea_target;
  reg  popArea_hit = 1'b0;
  wire  popArea_stream_valid;
  wire  popArea_stream_ready;
  wire [16:0] popArea_stream_payload;
  wire  popArea_stream_m2sPipe_valid;
  wire  popArea_stream_m2sPipe_ready;
  wire [16:0] popArea_stream_m2sPipe_payload;
  reg  popArea_stream_m2sPipe_rValid = 1'b0;
  reg [16:0] popArea_stream_m2sPipe_rData;
  assign _zz_3_ = (io_input_valid && (pushArea_hit == pushArea_target));
  BufferCC_1_ bufferCC_45_ (
    .io_initial(_zz_1_),
    .io_dataIn(outHitSignal),
    .io_dataOut(bufferCC_45__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC bufferCC_46_ (
    .io_initial(_zz_2_),
    .io_dataIn(pushArea_target),
    .io_dataOut(bufferCC_46__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  assign _zz_1_ = 1'b0;
  assign pushArea_hit = bufferCC_45__io_dataOut;
  always @ (*) begin
    io_input_ready = 1'b0;
    if(_zz_3_)begin
      io_input_ready = 1'b1;
    end
  end

  assign _zz_2_ = 1'b0;
  assign popArea_target = bufferCC_46__io_dataOut;
  assign outHitSignal = popArea_hit;
  assign popArea_stream_valid = (popArea_target != popArea_hit);
  assign popArea_stream_payload = pushArea_data;
  assign popArea_stream_ready = ((1'b1 && (! popArea_stream_m2sPipe_valid)) || popArea_stream_m2sPipe_ready);
  assign popArea_stream_m2sPipe_valid = popArea_stream_m2sPipe_rValid;
  assign popArea_stream_m2sPipe_payload = popArea_stream_m2sPipe_rData;
  assign io_output_valid = popArea_stream_m2sPipe_valid;
  assign popArea_stream_m2sPipe_ready = io_output_ready;
  assign io_output_payload = popArea_stream_m2sPipe_payload;
  always @ (posedge Core_clk) begin
    if(_zz_3_)begin
      pushArea_target <= (! pushArea_target);
    end
  end

  always @ (posedge Core_clk) begin
    if(_zz_3_)begin
      pushArea_data <= io_input_payload;
    end
  end

  always @ (posedge Slow_clk) begin
    if((popArea_stream_valid && popArea_stream_ready))begin
      popArea_hit <= (! popArea_hit);
    end
    if(popArea_stream_ready)begin
      popArea_stream_m2sPipe_rValid <= popArea_stream_valid;
    end
  end

  always @ (posedge Slow_clk) begin
    if(popArea_stream_ready)begin
      popArea_stream_m2sPipe_rData <= popArea_stream_payload;
    end
  end

endmodule

module StreamFifo (
      input   io_push_valid,
      output  io_push_ready,
      input  [1:0] io_push_payload_id,
      input  [15:0] io_push_payload_pulse_width,
      input  [23:0] io_push_payload_pulse_timestamp,
      input  [16:0] io_push_payload_beamWord,
      output  io_pop_valid,
      input   io_pop_ready,
      output [1:0] io_pop_payload_id,
      output [15:0] io_pop_payload_pulse_width,
      output [23:0] io_pop_payload_pulse_timestamp,
      output [16:0] io_pop_payload_beamWord,
      input   io_flush,
      output [1:0] io_occupancy,
      output [1:0] io_availability,
      input   Slow_clk);
  reg [58:0] _zz_5_;
  wire [0:0] _zz_6_;
  wire  _zz_7_;
  wire [58:0] _zz_8_;
  reg  _zz_1_;
  reg  logic_pushPtr_willIncrement;
  reg  logic_pushPtr_willClear;
  reg [0:0] logic_pushPtr_valueNext;
  reg [0:0] logic_pushPtr_value = (1'b0);
  wire  logic_pushPtr_willOverflowIfInc;
  wire  logic_pushPtr_willOverflow;
  reg  logic_popPtr_willIncrement;
  reg  logic_popPtr_willClear;
  reg [0:0] logic_popPtr_valueNext;
  reg [0:0] logic_popPtr_value = (1'b0);
  wire  logic_popPtr_willOverflowIfInc;
  wire  logic_popPtr_willOverflow;
  wire  logic_ptrMatch;
  reg  logic_risingOccupancy = 1'b0;
  wire  logic_pushing;
  wire  logic_popping;
  wire  logic_empty;
  wire  logic_full;
  reg  _zz_2_ = 1'b0;
  wire [58:0] _zz_3_;
  wire [39:0] _zz_4_;
  wire [0:0] logic_ptrDif;
  reg [58:0] logic_ram [0:1];
  assign _zz_6_ = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_7_ = 1'b1;
  assign _zz_8_ = {io_push_payload_beamWord,{{io_push_payload_pulse_timestamp,io_push_payload_pulse_width},io_push_payload_id}};
  always @ (posedge Slow_clk) begin
    if(_zz_7_) begin
      _zz_5_ <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge Slow_clk) begin
    if(_zz_1_) begin
      logic_ram[logic_pushPtr_value] <= _zz_8_;
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(logic_pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == (1'b1));
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + logic_pushPtr_willIncrement);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = (1'b0);
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == (1'b1));
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + logic_popPtr_willIncrement);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = (1'b0);
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2_ && (! logic_full))));
  assign _zz_3_ = _zz_5_;
  assign _zz_4_ = _zz_3_[41 : 2];
  assign io_pop_payload_id = _zz_3_[1 : 0];
  assign io_pop_payload_pulse_width = _zz_4_[15 : 0];
  assign io_pop_payload_pulse_timestamp = _zz_4_[39 : 16];
  assign io_pop_payload_beamWord = _zz_3_[58 : 42];
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_6_};
  always @ (posedge Slow_clk) begin
    logic_pushPtr_value <= logic_pushPtr_valueNext;
    logic_popPtr_value <= logic_popPtr_valueNext;
    _zz_2_ <= (logic_popPtr_valueNext == logic_pushPtr_value);
    if((logic_pushing != logic_popping))begin
      logic_risingOccupancy <= logic_pushing;
    end
    if(io_flush)begin
      logic_risingOccupancy <= 1'b0;
    end
  end

endmodule


//BufferCC_36_ remplaced by BufferCC_33_


//BufferCC_37_ remplaced by BufferCC_33_


//PulseTimer_1_ remplaced by PulseTimer


//BufferCC_38_ remplaced by BufferCC_33_


//StreamCCByToggle_1_ remplaced by StreamCCByToggle


//StreamFifo_1_ remplaced by StreamFifo


//BufferCC_39_ remplaced by BufferCC_33_


//BufferCC_40_ remplaced by BufferCC_33_


//PulseTimer_2_ remplaced by PulseTimer


//BufferCC_41_ remplaced by BufferCC_33_


//StreamCCByToggle_2_ remplaced by StreamCCByToggle


//StreamFifo_2_ remplaced by StreamFifo


//BufferCC_42_ remplaced by BufferCC_33_


//BufferCC_43_ remplaced by BufferCC_33_


//PulseTimer_3_ remplaced by PulseTimer


//BufferCC_44_ remplaced by BufferCC_33_


//StreamCCByToggle_3_ remplaced by StreamCCByToggle


//StreamFifo_3_ remplaced by StreamFifo

module StreamArbiter (
      input   io_inputs_0_valid,
      output  io_inputs_0_ready,
      input  [1:0] io_inputs_0_payload_id,
      input  [15:0] io_inputs_0_payload_pulse_width,
      input  [23:0] io_inputs_0_payload_pulse_timestamp,
      input  [16:0] io_inputs_0_payload_beamWord,
      input   io_inputs_1_valid,
      output  io_inputs_1_ready,
      input  [1:0] io_inputs_1_payload_id,
      input  [15:0] io_inputs_1_payload_pulse_width,
      input  [23:0] io_inputs_1_payload_pulse_timestamp,
      input  [16:0] io_inputs_1_payload_beamWord,
      input   io_inputs_2_valid,
      output  io_inputs_2_ready,
      input  [1:0] io_inputs_2_payload_id,
      input  [15:0] io_inputs_2_payload_pulse_width,
      input  [23:0] io_inputs_2_payload_pulse_timestamp,
      input  [16:0] io_inputs_2_payload_beamWord,
      input   io_inputs_3_valid,
      output  io_inputs_3_ready,
      input  [1:0] io_inputs_3_payload_id,
      input  [15:0] io_inputs_3_payload_pulse_width,
      input  [23:0] io_inputs_3_payload_pulse_timestamp,
      input  [16:0] io_inputs_3_payload_beamWord,
      output  io_output_valid,
      input   io_output_ready,
      output [1:0] io_output_payload_id,
      output [15:0] io_output_payload_pulse_width,
      output [23:0] io_output_payload_pulse_timestamp,
      output [16:0] io_output_payload_beamWord,
      output [1:0] io_chosen,
      output [3:0] io_chosenOH,
      input   Slow_clk);
  reg [1:0] _zz_9_;
  reg [15:0] _zz_10_;
  reg [23:0] _zz_11_;
  reg [16:0] _zz_12_;
  wire [3:0] _zz_13_;
  reg  locked = 1'b0;
  wire  maskProposal_0;
  wire  maskProposal_1;
  wire  maskProposal_2;
  wire  maskProposal_3;
  reg  maskLocked_0;
  reg  maskLocked_1;
  reg  maskLocked_2;
  reg  maskLocked_3;
  wire  maskRouted_0;
  wire  maskRouted_1;
  wire  maskRouted_2;
  wire  maskRouted_3;
  wire [3:0] _zz_1_;
  wire [3:0] _zz_2_;
  wire  _zz_3_;
  wire  _zz_4_;
  wire [1:0] _zz_5_;
  wire  _zz_6_;
  wire  _zz_7_;
  wire  _zz_8_;
  assign _zz_13_ = (_zz_1_ - (4'b0001));
  always @(*) begin
    case(_zz_5_)
      2'b00 : begin
        _zz_9_ = io_inputs_0_payload_id;
        _zz_10_ = io_inputs_0_payload_pulse_width;
        _zz_11_ = io_inputs_0_payload_pulse_timestamp;
        _zz_12_ = io_inputs_0_payload_beamWord;
      end
      2'b01 : begin
        _zz_9_ = io_inputs_1_payload_id;
        _zz_10_ = io_inputs_1_payload_pulse_width;
        _zz_11_ = io_inputs_1_payload_pulse_timestamp;
        _zz_12_ = io_inputs_1_payload_beamWord;
      end
      2'b10 : begin
        _zz_9_ = io_inputs_2_payload_id;
        _zz_10_ = io_inputs_2_payload_pulse_width;
        _zz_11_ = io_inputs_2_payload_pulse_timestamp;
        _zz_12_ = io_inputs_2_payload_beamWord;
      end
      default : begin
        _zz_9_ = io_inputs_3_payload_id;
        _zz_10_ = io_inputs_3_payload_pulse_width;
        _zz_11_ = io_inputs_3_payload_pulse_timestamp;
        _zz_12_ = io_inputs_3_payload_beamWord;
      end
    endcase
  end

  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign maskRouted_2 = (locked ? maskLocked_2 : maskProposal_2);
  assign maskRouted_3 = (locked ? maskLocked_3 : maskProposal_3);
  assign _zz_1_ = {io_inputs_3_valid,{io_inputs_2_valid,{io_inputs_1_valid,io_inputs_0_valid}}};
  assign _zz_2_ = (_zz_1_ & (~ _zz_13_));
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_2_[1];
  assign maskProposal_2 = _zz_2_[2];
  assign maskProposal_3 = _zz_2_[3];
  assign io_output_valid = ((((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1)) || (io_inputs_2_valid && maskRouted_2)) || (io_inputs_3_valid && maskRouted_3));
  assign _zz_3_ = (maskRouted_1 || maskRouted_3);
  assign _zz_4_ = (maskRouted_2 || maskRouted_3);
  assign _zz_5_ = {_zz_4_,_zz_3_};
  assign io_output_payload_id = _zz_9_;
  assign io_output_payload_pulse_width = _zz_10_;
  assign io_output_payload_pulse_timestamp = _zz_11_;
  assign io_output_payload_beamWord = _zz_12_;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_inputs_2_ready = (maskRouted_2 && io_output_ready);
  assign io_inputs_3_ready = (maskRouted_3 && io_output_ready);
  assign io_chosenOH = {maskRouted_3,{maskRouted_2,{maskRouted_1,maskRouted_0}}};
  assign _zz_6_ = io_chosenOH[3];
  assign _zz_7_ = (io_chosenOH[1] || _zz_6_);
  assign _zz_8_ = (io_chosenOH[2] || _zz_6_);
  assign io_chosen = {_zz_8_,_zz_7_};
  always @ (posedge Slow_clk) begin
    if(io_output_valid)begin
      locked <= 1'b1;
    end
    if((io_output_valid && io_output_ready))begin
      locked <= 1'b0;
    end
  end

  always @ (posedge Slow_clk) begin
    if(io_output_valid)begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
      maskLocked_2 <= maskRouted_2;
      maskLocked_3 <= maskRouted_3;
    end
  end

endmodule

module StreamFifo_4_ (
      input   io_push_valid,
      output  io_push_ready,
      input  [1:0] io_push_payload_id,
      input  [15:0] io_push_payload_pulse_width,
      input  [23:0] io_push_payload_pulse_timestamp,
      input  [16:0] io_push_payload_beamWord,
      output  io_pop_valid,
      input   io_pop_ready,
      output [1:0] io_pop_payload_id,
      output [15:0] io_pop_payload_pulse_width,
      output [23:0] io_pop_payload_pulse_timestamp,
      output [16:0] io_pop_payload_beamWord,
      input   io_flush,
      output [7:0] io_occupancy,
      output [7:0] io_availability,
      input   Slow_clk);
  reg [58:0] _zz_5_;
  wire [0:0] _zz_6_;
  wire [6:0] _zz_7_;
  wire [0:0] _zz_8_;
  wire [6:0] _zz_9_;
  wire [6:0] _zz_10_;
  wire  _zz_11_;
  wire [58:0] _zz_12_;
  reg  _zz_1_;
  reg  logic_pushPtr_willIncrement;
  reg  logic_pushPtr_willClear;
  reg [6:0] logic_pushPtr_valueNext;
  reg [6:0] logic_pushPtr_value = (7'b0000000);
  wire  logic_pushPtr_willOverflowIfInc;
  wire  logic_pushPtr_willOverflow;
  reg  logic_popPtr_willIncrement;
  reg  logic_popPtr_willClear;
  reg [6:0] logic_popPtr_valueNext;
  reg [6:0] logic_popPtr_value = (7'b0000000);
  wire  logic_popPtr_willOverflowIfInc;
  wire  logic_popPtr_willOverflow;
  wire  logic_ptrMatch;
  reg  logic_risingOccupancy = 1'b0;
  wire  logic_pushing;
  wire  logic_popping;
  wire  logic_empty;
  wire  logic_full;
  reg  _zz_2_ = 1'b0;
  wire [58:0] _zz_3_;
  wire [39:0] _zz_4_;
  wire [6:0] logic_ptrDif;
  reg [58:0] logic_ram [0:127];
  assign _zz_6_ = logic_pushPtr_willIncrement;
  assign _zz_7_ = {6'd0, _zz_6_};
  assign _zz_8_ = logic_popPtr_willIncrement;
  assign _zz_9_ = {6'd0, _zz_8_};
  assign _zz_10_ = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_11_ = 1'b1;
  assign _zz_12_ = {io_push_payload_beamWord,{{io_push_payload_pulse_timestamp,io_push_payload_pulse_width},io_push_payload_id}};
  always @ (posedge Slow_clk) begin
    if(_zz_11_) begin
      _zz_5_ <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge Slow_clk) begin
    if(_zz_1_) begin
      logic_ram[logic_pushPtr_value] <= _zz_12_;
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(logic_pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == (7'b1111111));
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_7_);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = (7'b0000000);
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == (7'b1111111));
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_9_);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = (7'b0000000);
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2_ && (! logic_full))));
  assign _zz_3_ = _zz_5_;
  assign _zz_4_ = _zz_3_[41 : 2];
  assign io_pop_payload_id = _zz_3_[1 : 0];
  assign io_pop_payload_pulse_width = _zz_4_[15 : 0];
  assign io_pop_payload_pulse_timestamp = _zz_4_[39 : 16];
  assign io_pop_payload_beamWord = _zz_3_[58 : 42];
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_10_};
  always @ (posedge Slow_clk) begin
    logic_pushPtr_value <= logic_pushPtr_valueNext;
    logic_popPtr_value <= logic_popPtr_valueNext;
    _zz_2_ <= (logic_popPtr_valueNext == logic_pushPtr_value);
    if((logic_pushing != logic_popping))begin
      logic_risingOccupancy <= logic_pushing;
    end
    if(io_flush)begin
      logic_risingOccupancy <= 1'b0;
    end
  end

endmodule

module PulseIdentifier (
      input   io_pulseIn_valid,
      output reg  io_pulseIn_ready,
      input  [1:0] io_pulseIn_payload_id,
      input  [15:0] io_pulseIn_payload_pulse_width,
      input  [23:0] io_pulseIn_payload_pulse_timestamp,
      input  [16:0] io_pulseIn_payload_beamWord,
      output reg  io_pulseOut_valid,
      input   io_pulseOut_ready,
      output [5:0] io_pulseOut_payload_npoly,
      output [15:0] io_pulseOut_payload_pulse_width,
      output [23:0] io_pulseOut_payload_pulse_timestamp,
      output [16:0] io_pulseOut_payload_beamWord,
      output [1:0] io_pulseOut_payload_id,
      input   Slow_clk);
  wire [9:0] _zz_1_;
  reg  _zz_2_;
  wire  _zz_3_;
  wire  polyFinder_1__io_start_ready;
  wire  polyFinder_1__io_found;
  wire [4:0] polyFinder_1__io_polyFound;
  wire  polyFinder_1__io_done_valid;
  wire  _zz_4_;
  wire  _zz_5_;
  wire  _zz_6_;
  wire [21:0] _zz_7_;
  wire [21:0] _zz_8_;
  wire [21:0] _zz_9_;
  reg [16:0] lastState;
  reg [23:0] lastTimestamp;
  wire [23:0] pulseDelta;
  reg [5:0] nPoly;
  wire  fsm_wantExit;
  reg `fsm_enumDefinition_defaultEncoding_type fsm_stateReg = `fsm_enumDefinition_defaultEncoding_boot;
  reg `fsm_enumDefinition_defaultEncoding_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [111:0] fsm_stateReg_string;
  reg [111:0] fsm_stateNext_string;
  `endif

  assign _zz_4_ = (io_pulseOut_valid && io_pulseOut_ready);
  assign _zz_5_ = (_zz_9_ < (22'b0000000000010000000000));
  assign _zz_6_ = (polyFinder_1__io_done_valid && _zz_3_);
  assign _zz_7_ = (_zz_8_ + (22'b0000000000000000000010));
  assign _zz_8_ = (pulseDelta >>> 2);
  assign _zz_9_ = (pulseDelta >>> 2);
  PolyFinder polyFinder_1_ (
    .io_startState(lastState),
    .io_targetState(io_pulseIn_payload_beamWord),
    .io_maxTick(_zz_1_),
    .io_start_valid(_zz_2_),
    .io_start_ready(polyFinder_1__io_start_ready),
    .io_found(polyFinder_1__io_found),
    .io_polyFound(polyFinder_1__io_polyFound),
    .io_done_valid(polyFinder_1__io_done_valid),
    .io_done_ready(_zz_3_),
    .Slow_clk(Slow_clk)
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_defaultEncoding_boot : fsm_stateReg_string = "boot          ";
      `fsm_enumDefinition_defaultEncoding_fsm_idle : fsm_stateReg_string = "fsm_idle      ";
      `fsm_enumDefinition_defaultEncoding_fsm_testDelta : fsm_stateReg_string = "fsm_testDelta ";
      `fsm_enumDefinition_defaultEncoding_fsm_waitFinder : fsm_stateReg_string = "fsm_waitFinder";
      `fsm_enumDefinition_defaultEncoding_fsm_sendResult : fsm_stateReg_string = "fsm_sendResult";
      default : fsm_stateReg_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_defaultEncoding_boot : fsm_stateNext_string = "boot          ";
      `fsm_enumDefinition_defaultEncoding_fsm_idle : fsm_stateNext_string = "fsm_idle      ";
      `fsm_enumDefinition_defaultEncoding_fsm_testDelta : fsm_stateNext_string = "fsm_testDelta ";
      `fsm_enumDefinition_defaultEncoding_fsm_waitFinder : fsm_stateNext_string = "fsm_waitFinder";
      `fsm_enumDefinition_defaultEncoding_fsm_sendResult : fsm_stateNext_string = "fsm_sendResult";
      default : fsm_stateNext_string = "??????????????";
    endcase
  end
  `endif

  assign _zz_3_ = 1'b1;
  assign pulseDelta = (io_pulseIn_payload_pulse_timestamp - lastTimestamp);
  assign _zz_1_ = _zz_7_[9:0];
  assign io_pulseOut_payload_npoly = nPoly;
  assign io_pulseOut_payload_pulse_width = io_pulseIn_payload_pulse_width;
  assign io_pulseOut_payload_pulse_timestamp = io_pulseIn_payload_pulse_timestamp;
  assign io_pulseOut_payload_beamWord = io_pulseIn_payload_beamWord;
  assign io_pulseOut_payload_id = io_pulseIn_payload_id;
  assign fsm_wantExit = 1'b0;
  always @ (*) begin
    io_pulseOut_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_testDelta : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_waitFinder : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_sendResult : begin
        io_pulseOut_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_pulseIn_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_testDelta : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_waitFinder : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_sendResult : begin
        if(_zz_4_)begin
          io_pulseIn_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_testDelta : begin
        if(_zz_5_)begin
          _zz_2_ = 1'b1;
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_waitFinder : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_sendResult : begin
      end
      default : begin
      end
    endcase
    if(((! (fsm_stateReg == `fsm_enumDefinition_defaultEncoding_fsm_waitFinder)) && (fsm_stateNext == `fsm_enumDefinition_defaultEncoding_fsm_waitFinder)))begin
      _zz_2_ = 1'b1;
    end
  end

  always @ (*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_defaultEncoding_fsm_idle : begin
        if(io_pulseIn_valid)begin
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_testDelta;
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_testDelta : begin
        if(_zz_5_)begin
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_waitFinder;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_sendResult;
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_waitFinder : begin
        if(_zz_6_)begin
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_sendResult;
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_sendResult : begin
        if(_zz_4_)begin
          fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_idle;
        end
      end
      default : begin
        fsm_stateNext = `fsm_enumDefinition_defaultEncoding_fsm_idle;
      end
    endcase
  end

  always @ (posedge Slow_clk) begin
    fsm_stateReg <= fsm_stateNext;
  end

  always @ (posedge Slow_clk) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_defaultEncoding_fsm_testDelta : begin
        if(! _zz_5_) begin
          nPoly <= (6'b111111);
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_waitFinder : begin
        if(_zz_6_)begin
          if(polyFinder_1__io_found)begin
            nPoly <= {1'd0, polyFinder_1__io_polyFound};
          end else begin
            nPoly <= (6'b111111);
          end
        end
      end
      `fsm_enumDefinition_defaultEncoding_fsm_sendResult : begin
        lastTimestamp <= io_pulseIn_payload_pulse_timestamp;
        lastState <= io_pulseIn_payload_beamWord;
      end
      default : begin
      end
    endcase
  end

endmodule

module PulseOffsetFinder (
      input   io_pulseIn_valid,
      output reg  io_pulseIn_ready,
      input  [5:0] io_pulseIn_payload_npoly,
      input  [15:0] io_pulseIn_payload_pulse_width,
      input  [23:0] io_pulseIn_payload_pulse_timestamp,
      input  [16:0] io_pulseIn_payload_beamWord,
      input  [1:0] io_pulseIn_payload_id,
      output reg  io_pulseOut_valid,
      input   io_pulseOut_ready,
      output reg [16:0] io_pulseOut_payload_offset,
      output [5:0] io_pulseOut_payload_npoly,
      output [15:0] io_pulseOut_payload_pulse_width,
      output [23:0] io_pulseOut_payload_pulse_timestamp,
      output [16:0] io_pulseOut_payload_beamWord,
      output [1:0] io_pulseOut_payload_id,
      input   Slow_clk);
  reg  _zz_1_;
  reg  _zz_2_;
  wire [4:0] _zz_3_;
  wire  offsetFinder_1__io_done;
  wire  offsetFinder_1__io_found;
  wire [16:0] offsetFinder_1__io_offset;
  wire  _zz_4_;
  wire  _zz_5_;
  wire [21:0] _zz_6_;
  reg [23:0] lastTimestamp;
  wire [23:0] pulseDelta;
  reg [5:0] lastNPoly;
  wire  fsm_wantExit;
  reg `fsm_enumDefinition_1_defaultEncoding_type fsm_stateReg = `fsm_enumDefinition_1_defaultEncoding_boot;
  reg `fsm_enumDefinition_1_defaultEncoding_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [111:0] fsm_stateReg_string;
  reg [111:0] fsm_stateNext_string;
  `endif

  assign _zz_4_ = (io_pulseOut_valid && io_pulseOut_ready);
  assign _zz_5_ = ((io_pulseIn_payload_npoly != (6'b111111)) && (((22'b0000000000100000000000) < _zz_6_) || (io_pulseIn_payload_npoly != lastNPoly)));
  assign _zz_6_ = (pulseDelta >>> 2);
  OffsetFinder offsetFinder_1_ (
    .io_start(_zz_1_),
    .io_done(offsetFinder_1__io_done),
    .io_reset(_zz_2_),
    .io_nPoly(_zz_3_),
    .io_targetState(io_pulseIn_payload_beamWord),
    .io_found(offsetFinder_1__io_found),
    .io_offset(offsetFinder_1__io_offset),
    .Slow_clk(Slow_clk)
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_1_defaultEncoding_boot : fsm_stateReg_string = "boot          ";
      `fsm_enumDefinition_1_defaultEncoding_fsm_idle : fsm_stateReg_string = "fsm_idle      ";
      `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta : fsm_stateReg_string = "fsm_testDelta ";
      `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder : fsm_stateReg_string = "fsm_waitFinder";
      `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult : fsm_stateReg_string = "fsm_sendResult";
      default : fsm_stateReg_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_1_defaultEncoding_boot : fsm_stateNext_string = "boot          ";
      `fsm_enumDefinition_1_defaultEncoding_fsm_idle : fsm_stateNext_string = "fsm_idle      ";
      `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta : fsm_stateNext_string = "fsm_testDelta ";
      `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder : fsm_stateNext_string = "fsm_waitFinder";
      `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult : fsm_stateNext_string = "fsm_sendResult";
      default : fsm_stateNext_string = "??????????????";
    endcase
  end
  `endif

  assign _zz_3_ = io_pulseIn_payload_npoly[4:0];
  assign pulseDelta = (io_pulseIn_payload_pulse_timestamp - lastTimestamp);
  assign io_pulseOut_payload_pulse_width = io_pulseIn_payload_pulse_width;
  assign io_pulseOut_payload_pulse_timestamp = io_pulseIn_payload_pulse_timestamp;
  assign io_pulseOut_payload_beamWord = io_pulseIn_payload_beamWord;
  assign io_pulseOut_payload_id = io_pulseIn_payload_id;
  assign io_pulseOut_payload_npoly = io_pulseIn_payload_npoly;
  always @ (*) begin
    io_pulseOut_payload_offset = (17'b00000000000000000);
    if(offsetFinder_1__io_found)begin
      io_pulseOut_payload_offset = offsetFinder_1__io_offset;
    end
  end

  always @ (*) begin
    io_pulseOut_valid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult : begin
        io_pulseOut_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_pulseIn_ready = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult : begin
        if(_zz_4_)begin
          io_pulseIn_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta : begin
        if(_zz_5_)begin
          _zz_1_ = 1'b1;
        end
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult : begin
      end
      default : begin
      end
    endcase
    if(((! (fsm_stateReg == `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder)) && (fsm_stateNext == `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder)))begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta : begin
        if(! _zz_5_) begin
          _zz_2_ = 1'b1;
        end
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult : begin
        if(_zz_4_)begin
          _zz_2_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign fsm_wantExit = 1'b0;
  always @ (*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_1_defaultEncoding_fsm_idle : begin
        if(io_pulseIn_valid)begin
          fsm_stateNext = `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta;
        end
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta : begin
        if(_zz_5_)begin
          fsm_stateNext = `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder;
        end else begin
          fsm_stateNext = `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult;
        end
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder : begin
        if(offsetFinder_1__io_done)begin
          fsm_stateNext = `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult;
        end
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult : begin
        if(_zz_4_)begin
          fsm_stateNext = `fsm_enumDefinition_1_defaultEncoding_fsm_idle;
        end
      end
      default : begin
        fsm_stateNext = `fsm_enumDefinition_1_defaultEncoding_fsm_idle;
      end
    endcase
  end

  always @ (posedge Slow_clk) begin
    fsm_stateReg <= fsm_stateNext;
  end

  always @ (posedge Slow_clk) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_1_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_testDelta : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_waitFinder : begin
      end
      `fsm_enumDefinition_1_defaultEncoding_fsm_sendResult : begin
        if(offsetFinder_1__io_found)begin
          lastTimestamp <= io_pulseIn_payload_pulse_timestamp;
        end
        lastNPoly <= io_pulseIn_payload_npoly;
      end
      default : begin
      end
    endcase
  end

endmodule

module StreamArbiter_1_ (
      input   io_inputs_0_valid,
      output  io_inputs_0_ready,
      input  [95:0] io_inputs_0_payload,
      input   io_inputs_1_valid,
      output  io_inputs_1_ready,
      input  [95:0] io_inputs_1_payload,
      output  io_output_valid,
      input   io_output_ready,
      output [95:0] io_output_payload,
      output [0:0] io_chosen,
      output [1:0] io_chosenOH,
      input   Slow_clk);
  wire [1:0] _zz_3_;
  wire [1:0] _zz_4_;
  reg  locked = 1'b0;
  wire  maskProposal_0;
  wire  maskProposal_1;
  reg  maskLocked_0;
  reg  maskLocked_1;
  wire  maskRouted_0;
  wire  maskRouted_1;
  wire [1:0] _zz_1_;
  wire  _zz_2_;
  assign _zz_3_ = (_zz_1_ & (~ _zz_4_));
  assign _zz_4_ = (_zz_1_ - (2'b01));
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_1_ = {io_inputs_1_valid,io_inputs_0_valid};
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_3_[1];
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload = (maskRouted_0 ? io_inputs_0_payload : io_inputs_1_payload);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_2_ = io_chosenOH[1];
  assign io_chosen = _zz_2_;
  always @ (posedge Slow_clk) begin
    if(io_output_valid)begin
      locked <= 1'b1;
    end
    if((io_output_valid && io_output_ready))begin
      locked <= 1'b0;
    end
  end

  always @ (posedge Slow_clk) begin
    if(io_output_valid)begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end

endmodule

module UartCtrl (
      input  [2:0] io_config_frame_dataLength,
      input  `UartStopType_defaultEncoding_type io_config_frame_stop,
      input  `UartParityType_defaultEncoding_type io_config_frame_parity,
      input  [19:0] io_config_clockDivider,
      input   io_write_valid,
      output  io_write_ready,
      input  [7:0] io_write_payload,
      output  io_read_valid,
      output [7:0] io_read_payload,
      output  io_uart_txd,
      input   io_uart_rxd,
      input   Slow_clk);
  wire  tx_io_write_ready;
  wire  tx_io_txd;
  wire  rx_io_read_valid;
  wire [7:0] rx_io_read_payload;
  reg [19:0] clockDivider_counter = (20'b00000000000000000000);
  wire  clockDivider_tick;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif

  UartCtrlTx tx (
    .io_configFrame_dataLength(io_config_frame_dataLength),
    .io_configFrame_stop(io_config_frame_stop),
    .io_configFrame_parity(io_config_frame_parity),
    .io_samplingTick(clockDivider_tick),
    .io_write_valid(io_write_valid),
    .io_write_ready(tx_io_write_ready),
    .io_write_payload(io_write_payload),
    .io_txd(tx_io_txd),
    .Slow_clk(Slow_clk)
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength(io_config_frame_dataLength),
    .io_configFrame_stop(io_config_frame_stop),
    .io_configFrame_parity(io_config_frame_parity),
    .io_samplingTick(clockDivider_tick),
    .io_read_valid(rx_io_read_valid),
    .io_read_payload(rx_io_read_payload),
    .io_rxd(io_uart_rxd),
    .Slow_clk(Slow_clk)
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_defaultEncoding_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_defaultEncoding_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == (20'b00000000000000000000));
  assign io_write_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  always @ (posedge Slow_clk) begin
    clockDivider_counter <= (clockDivider_counter - (20'b00000000000000000001));
    if(clockDivider_tick)begin
      clockDivider_counter <= io_config_clockDivider;
    end
  end

endmodule

module StreamFifo_5_ (
      input   io_push_valid,
      output  io_push_ready,
      input  [95:0] io_push_payload,
      output  io_pop_valid,
      input   io_pop_ready,
      output [95:0] io_pop_payload,
      input   io_flush,
      output [7:0] io_occupancy,
      output [7:0] io_availability,
      input   Slow_clk);
  reg [95:0] _zz_3_;
  wire [0:0] _zz_4_;
  wire [6:0] _zz_5_;
  wire [0:0] _zz_6_;
  wire [6:0] _zz_7_;
  wire [6:0] _zz_8_;
  wire  _zz_9_;
  reg  _zz_1_;
  reg  logic_pushPtr_willIncrement;
  reg  logic_pushPtr_willClear;
  reg [6:0] logic_pushPtr_valueNext;
  reg [6:0] logic_pushPtr_value = (7'b0000000);
  wire  logic_pushPtr_willOverflowIfInc;
  wire  logic_pushPtr_willOverflow;
  reg  logic_popPtr_willIncrement;
  reg  logic_popPtr_willClear;
  reg [6:0] logic_popPtr_valueNext;
  reg [6:0] logic_popPtr_value = (7'b0000000);
  wire  logic_popPtr_willOverflowIfInc;
  wire  logic_popPtr_willOverflow;
  wire  logic_ptrMatch;
  reg  logic_risingOccupancy = 1'b0;
  wire  logic_pushing;
  wire  logic_popping;
  wire  logic_empty;
  wire  logic_full;
  reg  _zz_2_ = 1'b0;
  wire [6:0] logic_ptrDif;
  reg [95:0] logic_ram [0:127];
  assign _zz_4_ = logic_pushPtr_willIncrement;
  assign _zz_5_ = {6'd0, _zz_4_};
  assign _zz_6_ = logic_popPtr_willIncrement;
  assign _zz_7_ = {6'd0, _zz_6_};
  assign _zz_8_ = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_9_ = 1'b1;
  always @ (posedge Slow_clk) begin
    if(_zz_9_) begin
      _zz_3_ <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge Slow_clk) begin
    if(_zz_1_) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(logic_pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == (7'b1111111));
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_5_);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = (7'b0000000);
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == (7'b1111111));
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_7_);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = (7'b0000000);
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2_ && (! logic_full))));
  assign io_pop_payload = _zz_3_;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_8_};
  always @ (posedge Slow_clk) begin
    logic_pushPtr_value <= logic_pushPtr_valueNext;
    logic_popPtr_value <= logic_popPtr_valueNext;
    _zz_2_ <= (logic_popPtr_valueNext == logic_pushPtr_value);
    if((logic_pushing != logic_popping))begin
      logic_risingOccupancy <= logic_pushing;
    end
    if(io_flush)begin
      logic_risingOccupancy <= 1'b0;
    end
  end

endmodule

module CommandHandler (
      input   io_input_valid,
      input  [7:0] io_input_payload,
      output  io_ledCommand_valid,
      output [7:0] io_ledCommand_payload,
      output  io_resetCommand_valid,
      output [7:0] io_resetCommand_payload,
      input   Slow_clk);
  wire  _zz_1_;
  reg [7:0] command;
  reg [7:0] argument;
  reg  ledCommandValid;
  reg  ledCommandValid_regNext;
  reg  resetCommandValid;
  reg  resetCommandValid_regNext;
  wire  fsm_wantExit;
  reg `fsm_enumDefinition_2_defaultEncoding_type fsm_stateReg = `fsm_enumDefinition_2_defaultEncoding_boot;
  reg `fsm_enumDefinition_2_defaultEncoding_type fsm_stateNext;
  `ifndef SYNTHESIS
  reg [111:0] fsm_stateReg_string;
  reg [111:0] fsm_stateNext_string;
  `endif

  assign _zz_1_ = (io_input_payload != (8'b11111111));
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      `fsm_enumDefinition_2_defaultEncoding_boot : fsm_stateReg_string = "boot          ";
      `fsm_enumDefinition_2_defaultEncoding_fsm_idle : fsm_stateReg_string = "fsm_idle      ";
      `fsm_enumDefinition_2_defaultEncoding_fsm_receiveArg : fsm_stateReg_string = "fsm_receiveArg";
      default : fsm_stateReg_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      `fsm_enumDefinition_2_defaultEncoding_boot : fsm_stateNext_string = "boot          ";
      `fsm_enumDefinition_2_defaultEncoding_fsm_idle : fsm_stateNext_string = "fsm_idle      ";
      `fsm_enumDefinition_2_defaultEncoding_fsm_receiveArg : fsm_stateNext_string = "fsm_receiveArg";
      default : fsm_stateNext_string = "??????????????";
    endcase
  end
  `endif

  assign io_ledCommand_payload = argument;
  assign io_resetCommand_payload = argument;
  always @ (*) begin
    ledCommandValid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_2_defaultEncoding_fsm_receiveArg : begin
        if(io_input_valid)begin
          if(_zz_1_)begin
            if((command == (8'b00000001)))begin
              ledCommandValid = 1'b1;
            end
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign io_ledCommand_valid = ledCommandValid_regNext;
  always @ (*) begin
    resetCommandValid = 1'b0;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_defaultEncoding_fsm_idle : begin
      end
      `fsm_enumDefinition_2_defaultEncoding_fsm_receiveArg : begin
        if(io_input_valid)begin
          if(_zz_1_)begin
            if((command == (8'b10111100)))begin
              resetCommandValid = 1'b1;
            end
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign io_resetCommand_valid = resetCommandValid_regNext;
  assign fsm_wantExit = 1'b0;
  always @ (*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_defaultEncoding_fsm_idle : begin
        if(io_input_valid)begin
          if(((io_input_payload == (8'b00000001)) || (io_input_payload == (8'b10111100))))begin
            fsm_stateNext = `fsm_enumDefinition_2_defaultEncoding_fsm_receiveArg;
          end
        end
      end
      `fsm_enumDefinition_2_defaultEncoding_fsm_receiveArg : begin
        if(io_input_valid)begin
          fsm_stateNext = `fsm_enumDefinition_2_defaultEncoding_fsm_idle;
        end
      end
      default : begin
        fsm_stateNext = `fsm_enumDefinition_2_defaultEncoding_fsm_idle;
      end
    endcase
  end

  always @ (posedge Slow_clk) begin
    ledCommandValid_regNext <= ledCommandValid;
    resetCommandValid_regNext <= resetCommandValid;
    case(fsm_stateReg)
      `fsm_enumDefinition_2_defaultEncoding_fsm_idle : begin
        if(io_input_valid)begin
          command <= io_input_payload;
        end
      end
      `fsm_enumDefinition_2_defaultEncoding_fsm_receiveArg : begin
        if(io_input_valid)begin
          argument <= io_input_payload;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (posedge Slow_clk) begin
    fsm_stateReg <= fsm_stateNext;
  end

endmodule

module LighthouseTopLevel (
      input   Core_clk,
      inout  io_e_0,
      inout  io_e_1,
      inout  io_e_2,
      inout  io_e_3,
      inout  io_d_0,
      inout  io_d_1,
      inout  io_d_2,
      inout  io_d_3,
      output  io_uart_txd,
      input   io_uart_rxd,
      output  io_led0,
      output  io_led1,
      output  io_led2);
  wire  _zz_58_;
  wire  _zz_59_;
  wire  _zz_60_;
  wire  _zz_61_;
  wire  _zz_62_;
  wire  _zz_63_;
  wire  _zz_64_;
  wire  _zz_65_;
  wire  _zz_66_;
  wire  _zz_67_;
  wire  _zz_68_;
  wire  _zz_69_;
  wire  _zz_70_;
  wire  _zz_71_;
  wire  _zz_72_;
  wire  _zz_73_;
  wire  _zz_74_;
  wire  _zz_75_;
  wire  _zz_76_;
  wire  _zz_77_;
  wire  _zz_78_;
  wire [1:0] _zz_79_;
  wire  _zz_80_;
  wire  _zz_81_;
  wire [1:0] _zz_82_;
  wire  _zz_83_;
  wire  _zz_84_;
  wire [1:0] _zz_85_;
  wire  _zz_86_;
  wire  _zz_87_;
  wire [1:0] _zz_88_;
  wire  _zz_89_;
  wire  _zz_90_;
  wire [2:0] _zz_91_;
  wire `UartStopType_defaultEncoding_type _zz_92_;
  wire `UartParityType_defaultEncoding_type _zz_93_;
  wire [19:0] _zz_94_;
  wire [7:0] _zz_95_;
  wire  _zz_96_;
  wire  _zz_97_;
  wire  _zz_98_;
  wire  _zz_99_;
  wire  _zz_100_;
  reg [7:0] _zz_101_;
  //wire  clkCtrl_pll_clock_out;
  wire  clkCtrl_pll_locked;
  wire  sB_IO_1__D_IN_0;
  wire  sB_IO_1__D_IN_1;
  wire  bufferCC_45__io_dataOut;
  wire  bufferCC_46__io_dataOut;
  wire  bufferCC_47__io_dataOut;
  wire  sB_IO_2__D_IN_0;
  wire  sB_IO_2__D_IN_1;
  wire  bufferCC_48__io_dataOut;
  wire  bufferCC_49__io_dataOut;
  wire  bufferCC_50__io_dataOut;
  wire  ddrBmcDecoder_4__io_output_valid;
  wire  ddrBmcDecoder_4__io_output_payload;
  wire  ddrBmcDecoder_4__io_synchronized;
  wire  shiftBuffer_4__io_dataIn_ready;
  wire  shiftBuffer_4__io_dataOut_valid;
  wire [16:0] shiftBuffer_4__io_dataOut_payload;
  wire  sB_IO_3__D_IN_0;
  wire  sB_IO_3__D_IN_1;
  wire  bufferCC_51__io_dataOut;
  wire  bufferCC_52__io_dataOut;
  wire  bufferCC_53__io_dataOut;
  wire  sB_IO_4__D_IN_0;
  wire  sB_IO_4__D_IN_1;
  wire  bufferCC_54__io_dataOut;
  wire  bufferCC_55__io_dataOut;
  wire  bufferCC_56__io_dataOut;
  wire  ddrBmcDecoder_5__io_output_valid;
  wire  ddrBmcDecoder_5__io_output_payload;
  wire  ddrBmcDecoder_5__io_synchronized;
  wire  shiftBuffer_5__io_dataIn_ready;
  wire  shiftBuffer_5__io_dataOut_valid;
  wire [16:0] shiftBuffer_5__io_dataOut_payload;
  wire  sB_IO_5__D_IN_0;
  wire  sB_IO_5__D_IN_1;
  wire  bufferCC_57__io_dataOut;
  wire  bufferCC_58__io_dataOut;
  wire  bufferCC_59__io_dataOut;
  wire  sB_IO_6__D_IN_0;
  wire  sB_IO_6__D_IN_1;
  wire  bufferCC_60__io_dataOut;
  wire  bufferCC_61__io_dataOut;
  wire  bufferCC_62__io_dataOut;
  wire  ddrBmcDecoder_6__io_output_valid;
  wire  ddrBmcDecoder_6__io_output_payload;
  wire  ddrBmcDecoder_6__io_synchronized;
  wire  shiftBuffer_6__io_dataIn_ready;
  wire  shiftBuffer_6__io_dataOut_valid;
  wire [16:0] shiftBuffer_6__io_dataOut_payload;
  wire  sB_IO_7__D_IN_0;
  wire  sB_IO_7__D_IN_1;
  wire  bufferCC_63__io_dataOut;
  wire  bufferCC_64__io_dataOut;
  wire  bufferCC_65__io_dataOut;
  wire  sB_IO_8__D_IN_0;
  wire  sB_IO_8__D_IN_1;
  wire  bufferCC_66__io_dataOut;
  wire  bufferCC_67__io_dataOut;
  wire  bufferCC_68__io_dataOut;
  wire  ddrBmcDecoder_7__io_output_valid;
  wire  ddrBmcDecoder_7__io_output_payload;
  wire  ddrBmcDecoder_7__io_synchronized;
  wire  shiftBuffer_7__io_dataIn_ready;
  wire  shiftBuffer_7__io_dataOut_valid;
  wire [16:0] shiftBuffer_7__io_dataOut_payload;
  wire  ts4231Configurator_1__configured;
  wire  ts4231Configurator_1__d_out;
  wire  ts4231Configurator_1__d_oe;
  wire  ts4231Configurator_1__e_out;
  wire  ts4231Configurator_1__e_oe;
  wire  bufferCC_69__io_dataOut;
  wire  bufferCC_70__io_dataOut;
  wire  pulseTimer_4__io_pulse_valid;
  wire [15:0] pulseTimer_4__io_pulse_payload_width;
  wire [23:0] pulseTimer_4__io_pulse_payload_timestamp;
  wire  bufferCC_71__io_dataOut;
  wire  streamCCByToggle_4__io_input_ready;
  wire  streamCCByToggle_4__io_output_valid;
  wire [16:0] streamCCByToggle_4__io_output_payload;
  wire  streamFifo_6__io_push_ready;
  wire  streamFifo_6__io_pop_valid;
  wire [1:0] streamFifo_6__io_pop_payload_id;
  wire [15:0] streamFifo_6__io_pop_payload_pulse_width;
  wire [23:0] streamFifo_6__io_pop_payload_pulse_timestamp;
  wire [16:0] streamFifo_6__io_pop_payload_beamWord;
  wire [1:0] streamFifo_6__io_occupancy;
  wire [1:0] streamFifo_6__io_availability;
  wire  ts4231Configurator_2__configured;
  wire  ts4231Configurator_2__d_out;
  wire  ts4231Configurator_2__d_oe;
  wire  ts4231Configurator_2__e_out;
  wire  ts4231Configurator_2__e_oe;
  wire  bufferCC_72__io_dataOut;
  wire  bufferCC_73__io_dataOut;
  wire  pulseTimer_5__io_pulse_valid;
  wire [15:0] pulseTimer_5__io_pulse_payload_width;
  wire [23:0] pulseTimer_5__io_pulse_payload_timestamp;
  wire  bufferCC_74__io_dataOut;
  wire  streamCCByToggle_5__io_input_ready;
  wire  streamCCByToggle_5__io_output_valid;
  wire [16:0] streamCCByToggle_5__io_output_payload;
  wire  streamFifo_7__io_push_ready;
  wire  streamFifo_7__io_pop_valid;
  wire [1:0] streamFifo_7__io_pop_payload_id;
  wire [15:0] streamFifo_7__io_pop_payload_pulse_width;
  wire [23:0] streamFifo_7__io_pop_payload_pulse_timestamp;
  wire [16:0] streamFifo_7__io_pop_payload_beamWord;
  wire [1:0] streamFifo_7__io_occupancy;
  wire [1:0] streamFifo_7__io_availability;
  wire  ts4231Configurator_3__configured;
  wire  ts4231Configurator_3__d_out;
  wire  ts4231Configurator_3__d_oe;
  wire  ts4231Configurator_3__e_out;
  wire  ts4231Configurator_3__e_oe;
  wire  bufferCC_75__io_dataOut;
  wire  bufferCC_76__io_dataOut;
  wire  pulseTimer_6__io_pulse_valid;
  wire [15:0] pulseTimer_6__io_pulse_payload_width;
  wire [23:0] pulseTimer_6__io_pulse_payload_timestamp;
  wire  bufferCC_77__io_dataOut;
  wire  streamCCByToggle_6__io_input_ready;
  wire  streamCCByToggle_6__io_output_valid;
  wire [16:0] streamCCByToggle_6__io_output_payload;
  wire  streamFifo_8__io_push_ready;
  wire  streamFifo_8__io_pop_valid;
  wire [1:0] streamFifo_8__io_pop_payload_id;
  wire [15:0] streamFifo_8__io_pop_payload_pulse_width;
  wire [23:0] streamFifo_8__io_pop_payload_pulse_timestamp;
  wire [16:0] streamFifo_8__io_pop_payload_beamWord;
  wire [1:0] streamFifo_8__io_occupancy;
  wire [1:0] streamFifo_8__io_availability;
  wire  ts4231Configurator_4__configured;
  wire  ts4231Configurator_4__d_out;
  wire  ts4231Configurator_4__d_oe;
  wire  ts4231Configurator_4__e_out;
  wire  ts4231Configurator_4__e_oe;
  wire  bufferCC_78__io_dataOut;
  wire  bufferCC_79__io_dataOut;
  wire  pulseTimer_7__io_pulse_valid;
  wire [15:0] pulseTimer_7__io_pulse_payload_width;
  wire [23:0] pulseTimer_7__io_pulse_payload_timestamp;
  wire  bufferCC_80__io_dataOut;
  wire  streamCCByToggle_7__io_input_ready;
  wire  streamCCByToggle_7__io_output_valid;
  wire [16:0] streamCCByToggle_7__io_output_payload;
  wire  streamFifo_9__io_push_ready;
  wire  streamFifo_9__io_pop_valid;
  wire [1:0] streamFifo_9__io_pop_payload_id;
  wire [15:0] streamFifo_9__io_pop_payload_pulse_width;
  wire [23:0] streamFifo_9__io_pop_payload_pulse_timestamp;
  wire [16:0] streamFifo_9__io_pop_payload_beamWord;
  wire [1:0] streamFifo_9__io_occupancy;
  wire [1:0] streamFifo_9__io_availability;
  wire  streamArbiter_2__io_inputs_0_ready;
  wire  streamArbiter_2__io_inputs_1_ready;
  wire  streamArbiter_2__io_inputs_2_ready;
  wire  streamArbiter_2__io_inputs_3_ready;
  wire  streamArbiter_2__io_output_valid;
  wire [1:0] streamArbiter_2__io_output_payload_id;
  wire [15:0] streamArbiter_2__io_output_payload_pulse_width;
  wire [23:0] streamArbiter_2__io_output_payload_pulse_timestamp;
  wire [16:0] streamArbiter_2__io_output_payload_beamWord;
  wire [1:0] streamArbiter_2__io_chosen;
  wire [3:0] streamArbiter_2__io_chosenOH;
  wire  io_output_fifo_io_push_ready;
  wire  io_output_fifo_io_pop_valid;
  wire [1:0] io_output_fifo_io_pop_payload_id;
  wire [15:0] io_output_fifo_io_pop_payload_pulse_width;
  wire [23:0] io_output_fifo_io_pop_payload_pulse_timestamp;
  wire [16:0] io_output_fifo_io_pop_payload_beamWord;
  wire [7:0] io_output_fifo_io_occupancy;
  wire [7:0] io_output_fifo_io_availability;
  wire  slowArea_pulseIdentifier_io_pulseIn_ready;
  wire  slowArea_pulseIdentifier_io_pulseOut_valid;
  wire [5:0] slowArea_pulseIdentifier_io_pulseOut_payload_npoly;
  wire [15:0] slowArea_pulseIdentifier_io_pulseOut_payload_pulse_width;
  wire [23:0] slowArea_pulseIdentifier_io_pulseOut_payload_pulse_timestamp;
  wire [16:0] slowArea_pulseIdentifier_io_pulseOut_payload_beamWord;
  wire [1:0] slowArea_pulseIdentifier_io_pulseOut_payload_id;
  wire  slowArea_pulseOffsetFinder_io_pulseIn_ready;
  wire  slowArea_pulseOffsetFinder_io_pulseOut_valid;
  wire [16:0] slowArea_pulseOffsetFinder_io_pulseOut_payload_offset;
  wire [5:0] slowArea_pulseOffsetFinder_io_pulseOut_payload_npoly;
  wire [15:0] slowArea_pulseOffsetFinder_io_pulseOut_payload_pulse_width;
  wire [23:0] slowArea_pulseOffsetFinder_io_pulseOut_payload_pulse_timestamp;
  wire [16:0] slowArea_pulseOffsetFinder_io_pulseOut_payload_beamWord;
  wire [1:0] slowArea_pulseOffsetFinder_io_pulseOut_payload_id;
  wire  streamArbiter_3__io_inputs_0_ready;
  wire  streamArbiter_3__io_inputs_1_ready;
  wire  streamArbiter_3__io_output_valid;
  wire [95:0] streamArbiter_3__io_output_payload;
  wire [0:0] streamArbiter_3__io_chosen;
  wire [1:0] streamArbiter_3__io_chosenOH;
  wire  slowArea_uartCtrl_io_write_ready;
  wire  slowArea_uartCtrl_io_read_valid;
  wire [7:0] slowArea_uartCtrl_io_read_payload;
  wire  slowArea_uartCtrl_io_uart_txd;
  wire  io_output_fifo_1__io_push_ready;
  wire  io_output_fifo_1__io_pop_valid;
  wire [95:0] io_output_fifo_1__io_pop_payload;
  wire [7:0] io_output_fifo_1__io_occupancy;
  wire [7:0] io_output_fifo_1__io_availability;
  wire  slowArea_commandHandler_io_ledCommand_valid;
  wire [7:0] slowArea_commandHandler_io_ledCommand_payload;
  wire  slowArea_commandHandler_io_resetCommand_valid;
  wire [7:0] slowArea_commandHandler_io_resetCommand_payload;
  wire  _zz_102_;
  wire  _zz_103_;
  wire  _zz_104_;
  wire  _zz_105_;
  wire [1:0] _zz_106_;
  wire [1:0] _zz_107_;
  wire [1:0] _zz_108_;
  wire [0:0] _zz_109_;
  wire [23:0] _zz_110_;
  wire [0:0] _zz_111_;
  wire [3:0] _zz_112_;
  wire [0:0] _zz_113_;
  wire [23:0] _zz_114_;
  wire [0:0] _zz_115_;
  wire [21:0] _zz_116_;
  //wire  Core_clk;
  wire  Slow_clk;
  reg  slowClkCtrl_slowClk = 1'b0;
  wire  e_0;
  wire  e_1;
  wire  e_2;
  wire  e_3;
  wire  e_out_0;
  wire  e_out_1;
  wire  e_out_2;
  wire  e_out_3;
  wire  e_oe_0;
  wire  e_oe_1;
  wire  e_oe_2;
  wire  e_oe_3;
  wire  d_0;
  wire  d_1;
  wire  d_2;
  wire  d_3;
  wire  d_out_0;
  wire  d_out_1;
  wire  d_out_2;
  wire  d_out_3;
  wire  d_oe_0;
  wire  d_oe_1;
  wire  d_oe_2;
  wire  d_oe_3;
  wire  core_beamWords_0_valid;
  wire  core_beamWords_0_ready;
  wire [16:0] core_beamWords_0_payload;
  wire  core_beamWords_1_valid;
  wire  core_beamWords_1_ready;
  wire [16:0] core_beamWords_1_payload;
  wire  core_beamWords_2_valid;
  wire  core_beamWords_2_ready;
  wire [16:0] core_beamWords_2_payload;
  wire  core_beamWords_3_valid;
  wire  core_beamWords_3_ready;
  wire [16:0] core_beamWords_3_payload;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  _zz_3_;
  reg  _zz_4_;
  reg  sB_IO_1__D_IN_0_regNext;
  reg  sB_IO_1__D_IN_0_regNext_regNext;
  wire  _zz_5_;
  reg  _zz_6_;
  reg  _zz_7_ = 1'b0;
  reg  _zz_8_;
  reg  sB_IO_1__D_IN_0_regNext_1_;
  reg  sB_IO_1__D_IN_0_regNext_1__regNext;
  reg  _zz_9_;
  wire  shiftBuffer_4__io_dataOut_m2sPipe_valid;
  wire  shiftBuffer_4__io_dataOut_m2sPipe_ready;
  wire [16:0] shiftBuffer_4__io_dataOut_m2sPipe_payload;
  reg  shiftBuffer_4__io_dataOut_m2sPipe_rValid = 1'b0;
  reg [16:0] shiftBuffer_4__io_dataOut_m2sPipe_rData;
  reg  _zz_10_;
  reg  _zz_11_;
  reg  _zz_12_;
  reg  _zz_13_;
  reg  sB_IO_3__D_IN_0_regNext;
  reg  sB_IO_3__D_IN_0_regNext_regNext;
  wire  _zz_14_;
  reg  _zz_15_;
  reg  _zz_16_ = 1'b0;
  reg  _zz_17_;
  reg  sB_IO_3__D_IN_0_regNext_1_;
  reg  sB_IO_3__D_IN_0_regNext_1__regNext;
  reg  _zz_18_;
  wire  shiftBuffer_5__io_dataOut_m2sPipe_valid;
  wire  shiftBuffer_5__io_dataOut_m2sPipe_ready;
  wire [16:0] shiftBuffer_5__io_dataOut_m2sPipe_payload;
  reg  shiftBuffer_5__io_dataOut_m2sPipe_rValid = 1'b0;
  reg [16:0] shiftBuffer_5__io_dataOut_m2sPipe_rData;
  reg  _zz_19_;
  reg  _zz_20_;
  reg  _zz_21_;
  reg  _zz_22_;
  reg  sB_IO_5__D_IN_0_regNext;
  reg  sB_IO_5__D_IN_0_regNext_regNext;
  wire  _zz_23_;
  reg  _zz_24_;
  reg  _zz_25_ = 1'b0;
  reg  _zz_26_;
  reg  sB_IO_5__D_IN_0_regNext_1_;
  reg  sB_IO_5__D_IN_0_regNext_1__regNext;
  reg  _zz_27_;
  wire  shiftBuffer_6__io_dataOut_m2sPipe_valid;
  wire  shiftBuffer_6__io_dataOut_m2sPipe_ready;
  wire [16:0] shiftBuffer_6__io_dataOut_m2sPipe_payload;
  reg  shiftBuffer_6__io_dataOut_m2sPipe_rValid = 1'b0;
  reg [16:0] shiftBuffer_6__io_dataOut_m2sPipe_rData;
  reg  _zz_28_;
  reg  _zz_29_;
  reg  _zz_30_;
  reg  _zz_31_;
  reg  sB_IO_7__D_IN_0_regNext;
  reg  sB_IO_7__D_IN_0_regNext_regNext;
  wire  _zz_32_;
  reg  _zz_33_;
  reg  _zz_34_ = 1'b0;
  reg  _zz_35_;
  reg  sB_IO_7__D_IN_0_regNext_1_;
  reg  sB_IO_7__D_IN_0_regNext_1__regNext;
  reg  _zz_36_;
  wire  shiftBuffer_7__io_dataOut_m2sPipe_valid;
  wire  shiftBuffer_7__io_dataOut_m2sPipe_ready;
  wire [16:0] shiftBuffer_7__io_dataOut_m2sPipe_payload;
  reg  shiftBuffer_7__io_dataOut_m2sPipe_rValid = 1'b0;
  reg [16:0] shiftBuffer_7__io_dataOut_m2sPipe_rData;
  reg [23:0] slowArea_time = (24'b000000000000000000000000);
  wire  slowArea_idBeamWords_0_valid;
  wire  slowArea_idBeamWords_0_ready;
  wire [1:0] slowArea_idBeamWords_0_payload_id;
  wire [15:0] slowArea_idBeamWords_0_payload_pulse_width;
  wire [23:0] slowArea_idBeamWords_0_payload_pulse_timestamp;
  wire [16:0] slowArea_idBeamWords_0_payload_beamWord;
  wire  slowArea_idBeamWords_1_valid;
  wire  slowArea_idBeamWords_1_ready;
  wire [1:0] slowArea_idBeamWords_1_payload_id;
  wire [15:0] slowArea_idBeamWords_1_payload_pulse_width;
  wire [23:0] slowArea_idBeamWords_1_payload_pulse_timestamp;
  wire [16:0] slowArea_idBeamWords_1_payload_beamWord;
  wire  slowArea_idBeamWords_2_valid;
  wire  slowArea_idBeamWords_2_ready;
  wire [1:0] slowArea_idBeamWords_2_payload_id;
  wire [15:0] slowArea_idBeamWords_2_payload_pulse_width;
  wire [23:0] slowArea_idBeamWords_2_payload_pulse_timestamp;
  wire [16:0] slowArea_idBeamWords_2_payload_beamWord;
  wire  slowArea_idBeamWords_3_valid;
  wire  slowArea_idBeamWords_3_ready;
  wire [1:0] slowArea_idBeamWords_3_payload_id;
  wire [15:0] slowArea_idBeamWords_3_payload_pulse_width;
  wire [23:0] slowArea_idBeamWords_3_payload_pulse_timestamp;
  wire [16:0] slowArea_idBeamWords_3_payload_beamWord;
  reg  _zz_37_ = 1'b0;
  reg [16:0] _zz_38_;
  wire  _zz_39_;
  reg  _zz_40_ = 1'b0;
  reg [16:0] _zz_41_;
  wire  _zz_42_;
  reg  _zz_43_ = 1'b0;
  reg [16:0] _zz_44_;
  wire  _zz_45_;
  reg  _zz_46_ = 1'b0;
  reg [16:0] _zz_47_;
  wire  _zz_48_;
  wire  slowArea_identifiedBeamStream_valid;
  wire  slowArea_identifiedBeamStream_ready;
  wire [95:0] slowArea_identifiedBeamStream_payload;
  wire  slowArea_syncStream_valid;
  wire  slowArea_syncStream_ready;
  wire [95:0] slowArea_syncStream_payload;
  reg  slowArea_syncTimeout_state = 1'b0;
  reg  slowArea_syncTimeout_stateRise;
  wire  slowArea_syncTimeout_counter_willIncrement;
  reg  slowArea_syncTimeout_counter_willClear;
  reg [23:0] slowArea_syncTimeout_counter_valueNext;
  reg [23:0] slowArea_syncTimeout_counter_value = (24'b000000000000000000000000);
  wire  slowArea_syncTimeout_counter_willOverflowIfInc;
  wire  slowArea_syncTimeout_counter_willOverflow;
  wire  slowArea_syncStream_m2sPipe_valid;
  wire  slowArea_syncStream_m2sPipe_ready;
  wire [95:0] slowArea_syncStream_m2sPipe_payload;
  reg  slowArea_syncStream_m2sPipe_rValid = 1'b0;
  reg [95:0] slowArea_syncStream_m2sPipe_rData;
  wire  slowArea_identifiedBeamStream_m2sPipe_valid;
  wire  slowArea_identifiedBeamStream_m2sPipe_ready;
  wire [95:0] slowArea_identifiedBeamStream_m2sPipe_payload;
  reg  slowArea_identifiedBeamStream_m2sPipe_rValid = 1'b0;
  reg [95:0] slowArea_identifiedBeamStream_m2sPipe_rData;
  reg  _zz_49_;
  reg [3:0] _zz_50_;
  reg [3:0] _zz_51_ = (4'b0000);
  wire  _zz_52_;
  wire  _zz_53_;
  wire [95:0] _zz_54_;
  reg [7:0] slowArea_ledControl;
  reg  slowArea_slowBlink = 1'b0;
  reg  slowArea_slowBlinkTimer_state = 1'b0;
  reg  slowArea_slowBlinkTimer_stateRise;
  wire  slowArea_slowBlinkTimer_counter_willIncrement;
  reg  slowArea_slowBlinkTimer_counter_willClear;
  reg [23:0] slowArea_slowBlinkTimer_counter_valueNext;
  reg [23:0] slowArea_slowBlinkTimer_counter_value = (24'b000000000000000000000000);
  wire  slowArea_slowBlinkTimer_counter_willOverflowIfInc;
  wire  slowArea_slowBlinkTimer_counter_willOverflow;
  reg  slowArea_fastBlink = 1'b0;
  reg  slowArea_fastBlinkTimer_state = 1'b0;
  reg  slowArea_fastBlinkTimer_stateRise;
  wire  slowArea_fastBlinkTimer_counter_willIncrement;
  reg  slowArea_fastBlinkTimer_counter_willClear;
  reg [21:0] slowArea_fastBlinkTimer_counter_valueNext;
  reg [21:0] slowArea_fastBlinkTimer_counter_value = (22'b0000000000000000000000);
  wire  slowArea_fastBlinkTimer_counter_willOverflowIfInc;
  wire  slowArea_fastBlinkTimer_counter_willOverflow;
  reg  _zz_55_;
  reg  _zz_56_;
  reg  _zz_57_;
  reg [7:0] slowArea_resetControl;
  assign _zz_102_ = ((1'b1 && (! _zz_5_)) || _zz_6_);
  assign _zz_103_ = ((1'b1 && (! _zz_14_)) || _zz_15_);
  assign _zz_104_ = ((1'b1 && (! _zz_23_)) || _zz_24_);
  assign _zz_105_ = ((1'b1 && (! _zz_32_)) || _zz_33_);
  assign _zz_106_ = slowArea_ledControl[1 : 0];
  assign _zz_107_ = slowArea_ledControl[3 : 2];
  assign _zz_108_ = slowArea_ledControl[5 : 4];
  assign _zz_109_ = slowArea_syncTimeout_counter_willIncrement;
  assign _zz_110_ = {23'd0, _zz_109_};
  assign _zz_111_ = _zz_49_;
  assign _zz_112_ = {3'd0, _zz_111_};
  assign _zz_113_ = slowArea_slowBlinkTimer_counter_willIncrement;
  assign _zz_114_ = {23'd0, _zz_113_};
  assign _zz_115_ = slowArea_fastBlinkTimer_counter_willIncrement;
  assign _zz_116_ = {21'd0, _zz_115_};
  /*pll clkCtrl_pll (
    .clock_in(io_clk12MHz),
    .clock_out(clkCtrl_pll_clock_out),
    .locked(clkCtrl_pll_locked)
  );*/

  wire clk12MHz;
    reg reg_clk12MHz = 1'b0;
    assign clk12MHz = reg_clk12MHz;//(start_lighthouse)?reg_clk12MHz:1'b0;// reg_clk12MHz;

  always @(posedge Slow_clk) begin : half_clk2
      reg_clk12MHz <= !reg_clk12MHz;
  end

  wire clk6MHz;
    reg reg_clk6MHz = 1'b0;
    assign clk6MHz = reg_clk6MHz;//(start_lighthouse)?reg_clk6MHz:1'b0;// reg_clk12MHz;

  always @(posedge clk12MHz) begin : half_clk3
      reg_clk6MHz <= !reg_clk6MHz;
  end


  SB_IO #(
    .PIN_TYPE((6'b110000))
  ) sB_IO_1_ (
    .PACKAGE_PIN(io_e_0),
    .CLOCK_ENABLE(_zz_58_),
    .INPUT_CLK(Core_clk),
    .OUTPUT_CLK(Core_clk),
    .OUTPUT_ENABLE(bufferCC_45__io_dataOut),
    .D_OUT_0(bufferCC_46__io_dataOut),
    .D_OUT_1(bufferCC_47__io_dataOut),
    .D_IN_0(sB_IO_1__D_IN_0),
    .D_IN_1(sB_IO_1__D_IN_1)
  );
  BufferCC_9_ bufferCC_45_ (
    .io_dataIn(e_oe_0),
    .io_dataOut(bufferCC_45__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_46_ (
    .io_dataIn(e_out_0),
    .io_dataOut(bufferCC_46__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_47_ (
    .io_dataIn(e_out_0),
    .io_dataOut(bufferCC_47__io_dataOut),
    .Core_clk(Core_clk)
  );
  SB_IO #(
    .PIN_TYPE((6'b110000))
  ) sB_IO_2_ (
    .PACKAGE_PIN(io_d_0),
    .CLOCK_ENABLE(_zz_59_),
    .INPUT_CLK(Core_clk),
    .OUTPUT_CLK(Core_clk),
    .OUTPUT_ENABLE(bufferCC_48__io_dataOut),
    .D_OUT_0(bufferCC_49__io_dataOut),
    .D_OUT_1(bufferCC_50__io_dataOut),
    .D_IN_0(sB_IO_2__D_IN_0),
    .D_IN_1(sB_IO_2__D_IN_1)
  );
  BufferCC_9_ bufferCC_48_ (
    .io_dataIn(d_oe_0),
    .io_dataOut(bufferCC_48__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_49_ (
    .io_dataIn(d_out_0),
    .io_dataOut(bufferCC_49__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_50_ (
    .io_dataIn(d_out_0),
    .io_dataOut(bufferCC_50__io_dataOut),
    .Core_clk(Core_clk)
  );
  DdrBmcDecoder ddrBmcDecoder_4_ (
    .io_signal_v_0(_zz_3_),
    .io_signal_v_1(_zz_4_),
    .io_enable(_zz_60_),
    .io_output_valid(ddrBmcDecoder_4__io_output_valid),
    .io_output_payload(ddrBmcDecoder_4__io_output_payload),
    .io_synchronized(ddrBmcDecoder_4__io_synchronized),
    .Core_clk(Core_clk)
  );
  ShiftBuffer shiftBuffer_4_ (
    .io_dataIn_valid(_zz_9_),
    .io_dataIn_ready(shiftBuffer_4__io_dataIn_ready),
    .io_dataIn_payload(_zz_8_),
    .io_dataOut_valid(shiftBuffer_4__io_dataOut_valid),
    .io_dataOut_ready(_zz_61_),
    .io_dataOut_payload(shiftBuffer_4__io_dataOut_payload),
    .io_resetBuffer(_zz_62_),
    .Core_clk(Core_clk)
  );
  SB_IO #(
    .PIN_TYPE((6'b110000))
  ) sB_IO_3_ (
    .PACKAGE_PIN(io_e_1),
    .CLOCK_ENABLE(_zz_63_),
    .INPUT_CLK(Core_clk),
    .OUTPUT_CLK(Core_clk),
    .OUTPUT_ENABLE(bufferCC_51__io_dataOut),
    .D_OUT_0(bufferCC_52__io_dataOut),
    .D_OUT_1(bufferCC_53__io_dataOut),
    .D_IN_0(sB_IO_3__D_IN_0),
    .D_IN_1(sB_IO_3__D_IN_1)
  );
  BufferCC_9_ bufferCC_51_ (
    .io_dataIn(e_oe_1),
    .io_dataOut(bufferCC_51__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_52_ (
    .io_dataIn(e_out_1),
    .io_dataOut(bufferCC_52__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_53_ (
    .io_dataIn(e_out_1),
    .io_dataOut(bufferCC_53__io_dataOut),
    .Core_clk(Core_clk)
  );
  SB_IO #(
    .PIN_TYPE((6'b110000))
  ) sB_IO_4_ (
    .PACKAGE_PIN(io_d_1),
    .CLOCK_ENABLE(_zz_64_),
    .INPUT_CLK(Core_clk),
    .OUTPUT_CLK(Core_clk),
    .OUTPUT_ENABLE(bufferCC_54__io_dataOut),
    .D_OUT_0(bufferCC_55__io_dataOut),
    .D_OUT_1(bufferCC_56__io_dataOut),
    .D_IN_0(sB_IO_4__D_IN_0),
    .D_IN_1(sB_IO_4__D_IN_1)
  );
  BufferCC_9_ bufferCC_54_ (
    .io_dataIn(d_oe_1),
    .io_dataOut(bufferCC_54__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_55_ (
    .io_dataIn(d_out_1),
    .io_dataOut(bufferCC_55__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_56_ (
    .io_dataIn(d_out_1),
    .io_dataOut(bufferCC_56__io_dataOut),
    .Core_clk(Core_clk)
  );
  DdrBmcDecoder ddrBmcDecoder_5_ (
    .io_signal_v_0(_zz_12_),
    .io_signal_v_1(_zz_13_),
    .io_enable(_zz_65_),
    .io_output_valid(ddrBmcDecoder_5__io_output_valid),
    .io_output_payload(ddrBmcDecoder_5__io_output_payload),
    .io_synchronized(ddrBmcDecoder_5__io_synchronized),
    .Core_clk(Core_clk)
  );
  ShiftBuffer shiftBuffer_5_ (
    .io_dataIn_valid(_zz_18_),
    .io_dataIn_ready(shiftBuffer_5__io_dataIn_ready),
    .io_dataIn_payload(_zz_17_),
    .io_dataOut_valid(shiftBuffer_5__io_dataOut_valid),
    .io_dataOut_ready(_zz_66_),
    .io_dataOut_payload(shiftBuffer_5__io_dataOut_payload),
    .io_resetBuffer(_zz_67_),
    .Core_clk(Core_clk)
  );
  SB_IO #(
    .PIN_TYPE((6'b110000))
  ) sB_IO_5_ (
    .PACKAGE_PIN(io_e_2),
    .CLOCK_ENABLE(_zz_68_),
    .INPUT_CLK(Core_clk),
    .OUTPUT_CLK(Core_clk),
    .OUTPUT_ENABLE(bufferCC_57__io_dataOut),
    .D_OUT_0(bufferCC_58__io_dataOut),
    .D_OUT_1(bufferCC_59__io_dataOut),
    .D_IN_0(sB_IO_5__D_IN_0),
    .D_IN_1(sB_IO_5__D_IN_1)
  );
  BufferCC_9_ bufferCC_57_ (
    .io_dataIn(e_oe_2),
    .io_dataOut(bufferCC_57__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_58_ (
    .io_dataIn(e_out_2),
    .io_dataOut(bufferCC_58__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_59_ (
    .io_dataIn(e_out_2),
    .io_dataOut(bufferCC_59__io_dataOut),
    .Core_clk(Core_clk)
  );
  SB_IO #(
    .PIN_TYPE((6'b110000))
  ) sB_IO_6_ (
    .PACKAGE_PIN(io_d_2),
    .CLOCK_ENABLE(_zz_69_),
    .INPUT_CLK(Core_clk),
    .OUTPUT_CLK(Core_clk),
    .OUTPUT_ENABLE(bufferCC_60__io_dataOut),
    .D_OUT_0(bufferCC_61__io_dataOut),
    .D_OUT_1(bufferCC_62__io_dataOut),
    .D_IN_0(sB_IO_6__D_IN_0),
    .D_IN_1(sB_IO_6__D_IN_1)
  );
  BufferCC_9_ bufferCC_60_ (
    .io_dataIn(d_oe_2),
    .io_dataOut(bufferCC_60__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_61_ (
    .io_dataIn(d_out_2),
    .io_dataOut(bufferCC_61__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_62_ (
    .io_dataIn(d_out_2),
    .io_dataOut(bufferCC_62__io_dataOut),
    .Core_clk(Core_clk)
  );
  DdrBmcDecoder ddrBmcDecoder_6_ (
    .io_signal_v_0(_zz_21_),
    .io_signal_v_1(_zz_22_),
    .io_enable(_zz_70_),
    .io_output_valid(ddrBmcDecoder_6__io_output_valid),
    .io_output_payload(ddrBmcDecoder_6__io_output_payload),
    .io_synchronized(ddrBmcDecoder_6__io_synchronized),
    .Core_clk(Core_clk)
  );
  ShiftBuffer shiftBuffer_6_ (
    .io_dataIn_valid(_zz_27_),
    .io_dataIn_ready(shiftBuffer_6__io_dataIn_ready),
    .io_dataIn_payload(_zz_26_),
    .io_dataOut_valid(shiftBuffer_6__io_dataOut_valid),
    .io_dataOut_ready(_zz_71_),
    .io_dataOut_payload(shiftBuffer_6__io_dataOut_payload),
    .io_resetBuffer(_zz_72_),
    .Core_clk(Core_clk)
  );
  SB_IO #(
    .PIN_TYPE((6'b110000))
  ) sB_IO_7_ (
    .PACKAGE_PIN(io_e_3),
    .CLOCK_ENABLE(_zz_73_),
    .INPUT_CLK(Core_clk),
    .OUTPUT_CLK(Core_clk),
    .OUTPUT_ENABLE(bufferCC_63__io_dataOut),
    .D_OUT_0(bufferCC_64__io_dataOut),
    .D_OUT_1(bufferCC_65__io_dataOut),
    .D_IN_0(sB_IO_7__D_IN_0),
    .D_IN_1(sB_IO_7__D_IN_1)
  );
  BufferCC_9_ bufferCC_63_ (
    .io_dataIn(e_oe_3),
    .io_dataOut(bufferCC_63__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_64_ (
    .io_dataIn(e_out_3),
    .io_dataOut(bufferCC_64__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_65_ (
    .io_dataIn(e_out_3),
    .io_dataOut(bufferCC_65__io_dataOut),
    .Core_clk(Core_clk)
  );
  SB_IO #(
    .PIN_TYPE((6'b110000))
  ) sB_IO_8_ (
    .PACKAGE_PIN(io_d_3),
    .CLOCK_ENABLE(_zz_74_),
    .INPUT_CLK(Core_clk),
    .OUTPUT_CLK(Core_clk),
    .OUTPUT_ENABLE(bufferCC_66__io_dataOut),
    .D_OUT_0(bufferCC_67__io_dataOut),
    .D_OUT_1(bufferCC_68__io_dataOut),
    .D_IN_0(sB_IO_8__D_IN_0),
    .D_IN_1(sB_IO_8__D_IN_1)
  );
  BufferCC_9_ bufferCC_66_ (
    .io_dataIn(d_oe_3),
    .io_dataOut(bufferCC_66__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_67_ (
    .io_dataIn(d_out_3),
    .io_dataOut(bufferCC_67__io_dataOut),
    .Core_clk(Core_clk)
  );
  BufferCC_9_ bufferCC_68_ (
    .io_dataIn(d_out_3),
    .io_dataOut(bufferCC_68__io_dataOut),
    .Core_clk(Core_clk)
  );
  DdrBmcDecoder ddrBmcDecoder_7_ (
    .io_signal_v_0(_zz_30_),
    .io_signal_v_1(_zz_31_),
    .io_enable(_zz_75_),
    .io_output_valid(ddrBmcDecoder_7__io_output_valid),
    .io_output_payload(ddrBmcDecoder_7__io_output_payload),
    .io_synchronized(ddrBmcDecoder_7__io_synchronized),
    .Core_clk(Core_clk)
  );
  ShiftBuffer shiftBuffer_7_ (
    .io_dataIn_valid(_zz_36_),
    .io_dataIn_ready(shiftBuffer_7__io_dataIn_ready),
    .io_dataIn_payload(_zz_35_),
    .io_dataOut_valid(shiftBuffer_7__io_dataOut_valid),
    .io_dataOut_ready(_zz_76_),
    .io_dataOut_payload(shiftBuffer_7__io_dataOut_payload),
    .io_resetBuffer(_zz_77_),
    .Core_clk(Core_clk)
  );
  /*
  ts4231Configurator ts4231Configurator_1_ (
    .clk(Slow_clk),
    .reconfigure(_zz_37_),
    .configured(ts4231Configurator_1__configured),
    .d_in(bufferCC_69__io_dataOut),
    .d_out(ts4231Configurator_1__d_out),
    .d_oe(ts4231Configurator_1__d_oe),
    .e_in(bufferCC_70__io_dataOut),
    .e_out(ts4231Configurator_1__e_out),
    .e_oe(ts4231Configurator_1__e_oe)
  );*/
  TS4231_init #(
      .CLK_FREQ_HZ(48_000_000)
    ) ts4231Configurator_1_ (
        .clk                (Core_clk),
        .clk_slow           (clk6MHz),
        .reset              (1'b0),

        .d_io               (bufferCC_69__io_dataOut),
        .oD_out             (ts4231Configurator_1__d_out),
        .oD_state_out       (ts4231Configurator_1__d_oe),

        .e_io               (bufferCC_70__io_dataOut),
        .oE_out             (ts4231Configurator_1__e_out),
        .oE_state_out       (ts4231Configurator_1__e_oe),

        .cfg_done           (ts4231Configurator_1__configured),
        .CONFIG_inital_delay   (1'b1)

    );
  BufferCC_33_ bufferCC_69_ (
    .io_dataIn(d_0),
    .io_dataOut(bufferCC_69__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  BufferCC_33_ bufferCC_70_ (
    .io_dataIn(e_0),
    .io_dataOut(bufferCC_70__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  PulseTimer pulseTimer_4_ (
    .io_time(slowArea_time),
    .io_e(bufferCC_71__io_dataOut),
    .io_pulse_valid(pulseTimer_4__io_pulse_valid),
    .io_pulse_payload_width(pulseTimer_4__io_pulse_payload_width),
    .io_pulse_payload_timestamp(pulseTimer_4__io_pulse_payload_timestamp),
    .Slow_clk(Slow_clk)
  );
  BufferCC_33_ bufferCC_71_ (
    .io_dataIn(e_0),
    .io_dataOut(bufferCC_71__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  StreamCCByToggle streamCCByToggle_4_ (
    .io_input_valid(core_beamWords_0_valid),
    .io_input_ready(streamCCByToggle_4__io_input_ready),
    .io_input_payload(core_beamWords_0_payload),
    .io_output_valid(streamCCByToggle_4__io_output_valid),
    .io_output_ready(_zz_78_),
    .io_output_payload(streamCCByToggle_4__io_output_payload),
    .Core_clk(Core_clk),
    .Slow_clk(Slow_clk)
  );
  StreamFifo streamFifo_6_ (
    .io_push_valid(_zz_39_),
    .io_push_ready(streamFifo_6__io_push_ready),
    .io_push_payload_id(_zz_79_),
    .io_push_payload_pulse_width(pulseTimer_4__io_pulse_payload_width),
    .io_push_payload_pulse_timestamp(pulseTimer_4__io_pulse_payload_timestamp),
    .io_push_payload_beamWord(_zz_38_),
    .io_pop_valid(streamFifo_6__io_pop_valid),
    .io_pop_ready(slowArea_idBeamWords_0_ready),
    .io_pop_payload_id(streamFifo_6__io_pop_payload_id),
    .io_pop_payload_pulse_width(streamFifo_6__io_pop_payload_pulse_width),
    .io_pop_payload_pulse_timestamp(streamFifo_6__io_pop_payload_pulse_timestamp),
    .io_pop_payload_beamWord(streamFifo_6__io_pop_payload_beamWord),
    .io_flush(_zz_80_),
    .io_occupancy(streamFifo_6__io_occupancy),
    .io_availability(streamFifo_6__io_availability),
    .Slow_clk(Slow_clk)
  );
  /*
  ts4231Configurator ts4231Configurator_2_ (
    .clk(Slow_clk),
    .reconfigure(_zz_40_),
    .configured(ts4231Configurator_2__configured),
    .d_in(bufferCC_72__io_dataOut),
    .d_out(ts4231Configurator_2__d_out),
    .d_oe(ts4231Configurator_2__d_oe),
    .e_in(bufferCC_73__io_dataOut),
    .e_out(ts4231Configurator_2__e_out),
    .e_oe(ts4231Configurator_2__e_oe)
  );*/

  TS4231_init #(
      .CLK_FREQ_HZ(48_000_000)
    ) ts4231Configurator_2_ (
        .clk                (Core_clk),
        .clk_slow           (clk6MHz),
        .reset              (1'b0),

        .d_io               (bufferCC_72__io_dataOut),
        .oD_out             (ts4231Configurator_2__d_out),
        .oD_state_out       (ts4231Configurator_2__d_oe),

        .e_io               (bufferCC_73__io_dataOut),
        .oE_out             (ts4231Configurator_2__e_out),
        .oE_state_out       (ts4231Configurator_2__e_oe),

        .cfg_done           (ts4231Configurator_2__configured),
        .CONFIG_inital_delay   (1'b1)

    );

  BufferCC_33_ bufferCC_72_ (
    .io_dataIn(d_1),
    .io_dataOut(bufferCC_72__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  BufferCC_33_ bufferCC_73_ (
    .io_dataIn(e_1),
    .io_dataOut(bufferCC_73__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  PulseTimer pulseTimer_5_ (
    .io_time(slowArea_time),
    .io_e(bufferCC_74__io_dataOut),
    .io_pulse_valid(pulseTimer_5__io_pulse_valid),
    .io_pulse_payload_width(pulseTimer_5__io_pulse_payload_width),
    .io_pulse_payload_timestamp(pulseTimer_5__io_pulse_payload_timestamp),
    .Slow_clk(Slow_clk)
  );
  BufferCC_33_ bufferCC_74_ (
    .io_dataIn(e_1),
    .io_dataOut(bufferCC_74__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  StreamCCByToggle streamCCByToggle_5_ (
    .io_input_valid(core_beamWords_1_valid),
    .io_input_ready(streamCCByToggle_5__io_input_ready),
    .io_input_payload(core_beamWords_1_payload),
    .io_output_valid(streamCCByToggle_5__io_output_valid),
    .io_output_ready(_zz_81_),
    .io_output_payload(streamCCByToggle_5__io_output_payload),
    .Core_clk(Core_clk),
    .Slow_clk(Slow_clk)
  );
  StreamFifo streamFifo_7_ (
    .io_push_valid(_zz_42_),
    .io_push_ready(streamFifo_7__io_push_ready),
    .io_push_payload_id(_zz_82_),
    .io_push_payload_pulse_width(pulseTimer_5__io_pulse_payload_width),
    .io_push_payload_pulse_timestamp(pulseTimer_5__io_pulse_payload_timestamp),
    .io_push_payload_beamWord(_zz_41_),
    .io_pop_valid(streamFifo_7__io_pop_valid),
    .io_pop_ready(slowArea_idBeamWords_1_ready),
    .io_pop_payload_id(streamFifo_7__io_pop_payload_id),
    .io_pop_payload_pulse_width(streamFifo_7__io_pop_payload_pulse_width),
    .io_pop_payload_pulse_timestamp(streamFifo_7__io_pop_payload_pulse_timestamp),
    .io_pop_payload_beamWord(streamFifo_7__io_pop_payload_beamWord),
    .io_flush(_zz_83_),
    .io_occupancy(streamFifo_7__io_occupancy),
    .io_availability(streamFifo_7__io_availability),
    .Slow_clk(Slow_clk)
  );
  /*
  ts4231Configurator ts4231Configurator_3_ (
    .clk(Slow_clk),
    .reconfigure(_zz_43_),
    .configured(ts4231Configurator_3__configured),
    .d_in(bufferCC_75__io_dataOut),
    .d_out(ts4231Configurator_3__d_out),
    .d_oe(ts4231Configurator_3__d_oe),
    .e_in(bufferCC_76__io_dataOut),
    .e_out(ts4231Configurator_3__e_out),
    .e_oe(ts4231Configurator_3__e_oe)
  );*/
  TS4231_init #(
      .CLK_FREQ_HZ(48_000_000)
    ) ts4231Configurator_3_ (
        .clk                (Core_clk),
        .clk_slow           (clk6MHz),
        .reset              (1'b0),

        .d_io               (bufferCC_75__io_dataOut),
        .oD_out             (ts4231Configurator_3__d_out),
        .oD_state_out       (ts4231Configurator_3__d_oe),

        .e_io               (bufferCC_76__io_dataOut),
        .oE_out             (ts4231Configurator_3__e_out),
        .oE_state_out       (ts4231Configurator_3__e_oe),

        .cfg_done           (ts4231Configurator_3__configured),
        .CONFIG_inital_delay   (1'b1)

    );

  BufferCC_33_ bufferCC_75_ (
    .io_dataIn(d_2),
    .io_dataOut(bufferCC_75__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  BufferCC_33_ bufferCC_76_ (
    .io_dataIn(e_2),
    .io_dataOut(bufferCC_76__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  PulseTimer pulseTimer_6_ (
    .io_time(slowArea_time),
    .io_e(bufferCC_77__io_dataOut),
    .io_pulse_valid(pulseTimer_6__io_pulse_valid),
    .io_pulse_payload_width(pulseTimer_6__io_pulse_payload_width),
    .io_pulse_payload_timestamp(pulseTimer_6__io_pulse_payload_timestamp),
    .Slow_clk(Slow_clk)
  );
  BufferCC_33_ bufferCC_77_ (
    .io_dataIn(e_2),
    .io_dataOut(bufferCC_77__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  StreamCCByToggle streamCCByToggle_6_ (
    .io_input_valid(core_beamWords_2_valid),
    .io_input_ready(streamCCByToggle_6__io_input_ready),
    .io_input_payload(core_beamWords_2_payload),
    .io_output_valid(streamCCByToggle_6__io_output_valid),
    .io_output_ready(_zz_84_),
    .io_output_payload(streamCCByToggle_6__io_output_payload),
    .Core_clk(Core_clk),
    .Slow_clk(Slow_clk)
  );
  StreamFifo streamFifo_8_ (
    .io_push_valid(_zz_45_),
    .io_push_ready(streamFifo_8__io_push_ready),
    .io_push_payload_id(_zz_85_),
    .io_push_payload_pulse_width(pulseTimer_6__io_pulse_payload_width),
    .io_push_payload_pulse_timestamp(pulseTimer_6__io_pulse_payload_timestamp),
    .io_push_payload_beamWord(_zz_44_),
    .io_pop_valid(streamFifo_8__io_pop_valid),
    .io_pop_ready(slowArea_idBeamWords_2_ready),
    .io_pop_payload_id(streamFifo_8__io_pop_payload_id),
    .io_pop_payload_pulse_width(streamFifo_8__io_pop_payload_pulse_width),
    .io_pop_payload_pulse_timestamp(streamFifo_8__io_pop_payload_pulse_timestamp),
    .io_pop_payload_beamWord(streamFifo_8__io_pop_payload_beamWord),
    .io_flush(_zz_86_),
    .io_occupancy(streamFifo_8__io_occupancy),
    .io_availability(streamFifo_8__io_availability),
    .Slow_clk(Slow_clk)
  );

  /*
  ts4231Configurator ts4231Configurator_4_ (
    .clk(Slow_clk),
    .reconfigure(_zz_46_),
    .configured(ts4231Configurator_4__configured),
    .d_in(bufferCC_78__io_dataOut),
    .d_out(ts4231Configurator_4__d_out),
    .d_oe(ts4231Configurator_4__d_oe),
    .e_in(bufferCC_79__io_dataOut),
    .e_out(ts4231Configurator_4__e_out),
    .e_oe(ts4231Configurator_4__e_oe)
  );*/

  TS4231_init #(
      .CLK_FREQ_HZ(48_000_000)
    ) ts4231Configurator_4_ (
        .clk                (Core_clk),
        .clk_slow           (clk6MHz),
        .reset              (1'b0),

        .d_io               (bufferCC_78__io_dataOut),
        .oD_out             (ts4231Configurator_4__d_out),
        .oD_state_out       (ts4231Configurator_4__d_oe),

        .e_io               (bufferCC_79__io_dataOut),
        .oE_out             (ts4231Configurator_4__e_out),
        .oE_state_out       (ts4231Configurator_4__e_oe),

        .cfg_done           (ts4231Configurator_4__configured),
        .CONFIG_inital_delay   (1'b1)

    );
  BufferCC_33_ bufferCC_78_ (
    .io_dataIn(d_3),
    .io_dataOut(bufferCC_78__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  BufferCC_33_ bufferCC_79_ (
    .io_dataIn(e_3),
    .io_dataOut(bufferCC_79__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  PulseTimer pulseTimer_7_ (
    .io_time(slowArea_time),
    .io_e(bufferCC_80__io_dataOut),
    .io_pulse_valid(pulseTimer_7__io_pulse_valid),
    .io_pulse_payload_width(pulseTimer_7__io_pulse_payload_width),
    .io_pulse_payload_timestamp(pulseTimer_7__io_pulse_payload_timestamp),
    .Slow_clk(Slow_clk)
  );
  BufferCC_33_ bufferCC_80_ (
    .io_dataIn(e_3),
    .io_dataOut(bufferCC_80__io_dataOut),
    .Slow_clk(Slow_clk)
  );
  StreamCCByToggle streamCCByToggle_7_ (
    .io_input_valid(core_beamWords_3_valid),
    .io_input_ready(streamCCByToggle_7__io_input_ready),
    .io_input_payload(core_beamWords_3_payload),
    .io_output_valid(streamCCByToggle_7__io_output_valid),
    .io_output_ready(_zz_87_),
    .io_output_payload(streamCCByToggle_7__io_output_payload),
    .Core_clk(Core_clk),
    .Slow_clk(Slow_clk)
  );
  StreamFifo streamFifo_9_ (
    .io_push_valid(_zz_48_),
    .io_push_ready(streamFifo_9__io_push_ready),
    .io_push_payload_id(_zz_88_),
    .io_push_payload_pulse_width(pulseTimer_7__io_pulse_payload_width),
    .io_push_payload_pulse_timestamp(pulseTimer_7__io_pulse_payload_timestamp),
    .io_push_payload_beamWord(_zz_47_),
    .io_pop_valid(streamFifo_9__io_pop_valid),
    .io_pop_ready(slowArea_idBeamWords_3_ready),
    .io_pop_payload_id(streamFifo_9__io_pop_payload_id),
    .io_pop_payload_pulse_width(streamFifo_9__io_pop_payload_pulse_width),
    .io_pop_payload_pulse_timestamp(streamFifo_9__io_pop_payload_pulse_timestamp),
    .io_pop_payload_beamWord(streamFifo_9__io_pop_payload_beamWord),
    .io_flush(_zz_89_),
    .io_occupancy(streamFifo_9__io_occupancy),
    .io_availability(streamFifo_9__io_availability),
    .Slow_clk(Slow_clk)
  );
  StreamArbiter streamArbiter_2_ (
    .io_inputs_0_valid(slowArea_idBeamWords_0_valid),
    .io_inputs_0_ready(streamArbiter_2__io_inputs_0_ready),
    .io_inputs_0_payload_id(slowArea_idBeamWords_0_payload_id),
    .io_inputs_0_payload_pulse_width(slowArea_idBeamWords_0_payload_pulse_width),
    .io_inputs_0_payload_pulse_timestamp(slowArea_idBeamWords_0_payload_pulse_timestamp),
    .io_inputs_0_payload_beamWord(slowArea_idBeamWords_0_payload_beamWord),
    .io_inputs_1_valid(slowArea_idBeamWords_1_valid),
    .io_inputs_1_ready(streamArbiter_2__io_inputs_1_ready),
    .io_inputs_1_payload_id(slowArea_idBeamWords_1_payload_id),
    .io_inputs_1_payload_pulse_width(slowArea_idBeamWords_1_payload_pulse_width),
    .io_inputs_1_payload_pulse_timestamp(slowArea_idBeamWords_1_payload_pulse_timestamp),
    .io_inputs_1_payload_beamWord(slowArea_idBeamWords_1_payload_beamWord),
    .io_inputs_2_valid(slowArea_idBeamWords_2_valid),
    .io_inputs_2_ready(streamArbiter_2__io_inputs_2_ready),
    .io_inputs_2_payload_id(slowArea_idBeamWords_2_payload_id),
    .io_inputs_2_payload_pulse_width(slowArea_idBeamWords_2_payload_pulse_width),
    .io_inputs_2_payload_pulse_timestamp(slowArea_idBeamWords_2_payload_pulse_timestamp),
    .io_inputs_2_payload_beamWord(slowArea_idBeamWords_2_payload_beamWord),
    .io_inputs_3_valid(slowArea_idBeamWords_3_valid),
    .io_inputs_3_ready(streamArbiter_2__io_inputs_3_ready),
    .io_inputs_3_payload_id(slowArea_idBeamWords_3_payload_id),
    .io_inputs_3_payload_pulse_width(slowArea_idBeamWords_3_payload_pulse_width),
    .io_inputs_3_payload_pulse_timestamp(slowArea_idBeamWords_3_payload_pulse_timestamp),
    .io_inputs_3_payload_beamWord(slowArea_idBeamWords_3_payload_beamWord),
    .io_output_valid(streamArbiter_2__io_output_valid),
    .io_output_ready(io_output_fifo_io_push_ready),
    .io_output_payload_id(streamArbiter_2__io_output_payload_id),
    .io_output_payload_pulse_width(streamArbiter_2__io_output_payload_pulse_width),
    .io_output_payload_pulse_timestamp(streamArbiter_2__io_output_payload_pulse_timestamp),
    .io_output_payload_beamWord(streamArbiter_2__io_output_payload_beamWord),
    .io_chosen(streamArbiter_2__io_chosen),
    .io_chosenOH(streamArbiter_2__io_chosenOH),
    .Slow_clk(Slow_clk)
  );
  StreamFifo_4_ io_output_fifo (
    .io_push_valid(streamArbiter_2__io_output_valid),
    .io_push_ready(io_output_fifo_io_push_ready),
    .io_push_payload_id(streamArbiter_2__io_output_payload_id),
    .io_push_payload_pulse_width(streamArbiter_2__io_output_payload_pulse_width),
    .io_push_payload_pulse_timestamp(streamArbiter_2__io_output_payload_pulse_timestamp),
    .io_push_payload_beamWord(streamArbiter_2__io_output_payload_beamWord),
    .io_pop_valid(io_output_fifo_io_pop_valid),
    .io_pop_ready(slowArea_pulseIdentifier_io_pulseIn_ready),
    .io_pop_payload_id(io_output_fifo_io_pop_payload_id),
    .io_pop_payload_pulse_width(io_output_fifo_io_pop_payload_pulse_width),
    .io_pop_payload_pulse_timestamp(io_output_fifo_io_pop_payload_pulse_timestamp),
    .io_pop_payload_beamWord(io_output_fifo_io_pop_payload_beamWord),
    .io_flush(_zz_90_),
    .io_occupancy(io_output_fifo_io_occupancy),
    .io_availability(io_output_fifo_io_availability),
    .Slow_clk(Slow_clk)
  );
  PulseIdentifier slowArea_pulseIdentifier (
    .io_pulseIn_valid(io_output_fifo_io_pop_valid),
    .io_pulseIn_ready(slowArea_pulseIdentifier_io_pulseIn_ready),
    .io_pulseIn_payload_id(io_output_fifo_io_pop_payload_id),
    .io_pulseIn_payload_pulse_width(io_output_fifo_io_pop_payload_pulse_width),
    .io_pulseIn_payload_pulse_timestamp(io_output_fifo_io_pop_payload_pulse_timestamp),
    .io_pulseIn_payload_beamWord(io_output_fifo_io_pop_payload_beamWord),
    .io_pulseOut_valid(slowArea_pulseIdentifier_io_pulseOut_valid),
    .io_pulseOut_ready(slowArea_pulseOffsetFinder_io_pulseIn_ready),
    .io_pulseOut_payload_npoly(slowArea_pulseIdentifier_io_pulseOut_payload_npoly),
    .io_pulseOut_payload_pulse_width(slowArea_pulseIdentifier_io_pulseOut_payload_pulse_width),
    .io_pulseOut_payload_pulse_timestamp(slowArea_pulseIdentifier_io_pulseOut_payload_pulse_timestamp),
    .io_pulseOut_payload_beamWord(slowArea_pulseIdentifier_io_pulseOut_payload_beamWord),
    .io_pulseOut_payload_id(slowArea_pulseIdentifier_io_pulseOut_payload_id),
    .Slow_clk(Slow_clk)
  );
  PulseOffsetFinder slowArea_pulseOffsetFinder (
    .io_pulseIn_valid(slowArea_pulseIdentifier_io_pulseOut_valid),
    .io_pulseIn_ready(slowArea_pulseOffsetFinder_io_pulseIn_ready),
    .io_pulseIn_payload_npoly(slowArea_pulseIdentifier_io_pulseOut_payload_npoly),
    .io_pulseIn_payload_pulse_width(slowArea_pulseIdentifier_io_pulseOut_payload_pulse_width),
    .io_pulseIn_payload_pulse_timestamp(slowArea_pulseIdentifier_io_pulseOut_payload_pulse_timestamp),
    .io_pulseIn_payload_beamWord(slowArea_pulseIdentifier_io_pulseOut_payload_beamWord),
    .io_pulseIn_payload_id(slowArea_pulseIdentifier_io_pulseOut_payload_id),
    .io_pulseOut_valid(slowArea_pulseOffsetFinder_io_pulseOut_valid),
    .io_pulseOut_ready(slowArea_identifiedBeamStream_ready),
    .io_pulseOut_payload_offset(slowArea_pulseOffsetFinder_io_pulseOut_payload_offset),
    .io_pulseOut_payload_npoly(slowArea_pulseOffsetFinder_io_pulseOut_payload_npoly),
    .io_pulseOut_payload_pulse_width(slowArea_pulseOffsetFinder_io_pulseOut_payload_pulse_width),
    .io_pulseOut_payload_pulse_timestamp(slowArea_pulseOffsetFinder_io_pulseOut_payload_pulse_timestamp),
    .io_pulseOut_payload_beamWord(slowArea_pulseOffsetFinder_io_pulseOut_payload_beamWord),
    .io_pulseOut_payload_id(slowArea_pulseOffsetFinder_io_pulseOut_payload_id),
    .Slow_clk(Slow_clk)
  );
  StreamArbiter_1_ streamArbiter_3_ (
    .io_inputs_0_valid(slowArea_syncStream_m2sPipe_valid),
    .io_inputs_0_ready(streamArbiter_3__io_inputs_0_ready),
    .io_inputs_0_payload(slowArea_syncStream_m2sPipe_payload),
    .io_inputs_1_valid(slowArea_identifiedBeamStream_m2sPipe_valid),
    .io_inputs_1_ready(streamArbiter_3__io_inputs_1_ready),
    .io_inputs_1_payload(slowArea_identifiedBeamStream_m2sPipe_payload),
    .io_output_valid(streamArbiter_3__io_output_valid),
    .io_output_ready(io_output_fifo_1__io_push_ready),
    .io_output_payload(streamArbiter_3__io_output_payload),
    .io_chosen(streamArbiter_3__io_chosen),
    .io_chosenOH(streamArbiter_3__io_chosenOH),
    .Slow_clk(Slow_clk)
  );
  UartCtrl slowArea_uartCtrl (
    .io_config_frame_dataLength(_zz_91_),
    .io_config_frame_stop(_zz_92_),
    .io_config_frame_parity(_zz_93_),
    .io_config_clockDivider(_zz_94_),
    .io_write_valid(io_output_fifo_1__io_pop_valid),
    .io_write_ready(slowArea_uartCtrl_io_write_ready),
    .io_write_payload(_zz_95_),
    .io_read_valid(slowArea_uartCtrl_io_read_valid),
    .io_read_payload(slowArea_uartCtrl_io_read_payload),
    .io_uart_txd(slowArea_uartCtrl_io_uart_txd),
    .io_uart_rxd(io_uart_rxd),
    .Slow_clk(Slow_clk)
  );
  StreamFifo_5_ io_output_fifo_1_ (
    .io_push_valid(streamArbiter_3__io_output_valid),
    .io_push_ready(io_output_fifo_1__io_push_ready),
    .io_push_payload(streamArbiter_3__io_output_payload),
    .io_pop_valid(io_output_fifo_1__io_pop_valid),
    .io_pop_ready(_zz_96_),
    .io_pop_payload(io_output_fifo_1__io_pop_payload),
    .io_flush(_zz_97_),
    .io_occupancy(io_output_fifo_1__io_occupancy),
    .io_availability(io_output_fifo_1__io_availability),
    .Slow_clk(Slow_clk)
  );
  CommandHandler slowArea_commandHandler (
    .io_input_valid(slowArea_uartCtrl_io_read_valid),
    .io_input_payload(slowArea_uartCtrl_io_read_payload),
    .io_ledCommand_valid(slowArea_commandHandler_io_ledCommand_valid),
    .io_ledCommand_payload(slowArea_commandHandler_io_ledCommand_payload),
    .io_resetCommand_valid(slowArea_commandHandler_io_resetCommand_valid),
    .io_resetCommand_payload(slowArea_commandHandler_io_resetCommand_payload),
    .Slow_clk(Slow_clk)
  );
  SB_WARMBOOT slowArea_warmBoot (
    .BOOT(_zz_98_),
    .S1(_zz_99_),
    .S0(_zz_100_)
  );
  always @(*) begin
    case(_zz_51_)
      4'b0000 : begin
        _zz_101_ = _zz_54_[7 : 0];
      end
      4'b0001 : begin
        _zz_101_ = _zz_54_[15 : 8];
      end
      4'b0010 : begin
        _zz_101_ = _zz_54_[23 : 16];
      end
      4'b0011 : begin
        _zz_101_ = _zz_54_[31 : 24];
      end
      4'b0100 : begin
        _zz_101_ = _zz_54_[39 : 32];
      end
      4'b0101 : begin
        _zz_101_ = _zz_54_[47 : 40];
      end
      4'b0110 : begin
        _zz_101_ = _zz_54_[55 : 48];
      end
      4'b0111 : begin
        _zz_101_ = _zz_54_[63 : 56];
      end
      4'b1000 : begin
        _zz_101_ = _zz_54_[71 : 64];
      end
      4'b1001 : begin
        _zz_101_ = _zz_54_[79 : 72];
      end
      4'b1010 : begin
        _zz_101_ = _zz_54_[87 : 80];
      end
      default : begin
        _zz_101_ = _zz_54_[95 : 88];
      end
    endcase
  end

  //assign Core_clk = clkCtrl_pll_clock_out;
  assign Slow_clk = slowClkCtrl_slowClk;
  assign _zz_58_ = 1'b1;
  assign e_0 = sB_IO_1__D_IN_0;
  assign _zz_59_ = 1'b1;
  assign d_0 = sB_IO_2__D_IN_0;
  assign _zz_60_ = 1'b1;
  assign _zz_62_ = ((! sB_IO_1__D_IN_0_regNext) && sB_IO_1__D_IN_0_regNext_regNext);
  assign _zz_5_ = _zz_7_;
  always @ (*) begin
    _zz_9_ = _zz_5_;
    if(sB_IO_1__D_IN_0_regNext_1__regNext)begin
      _zz_9_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_6_ = shiftBuffer_4__io_dataIn_ready;
    if(sB_IO_1__D_IN_0_regNext_1__regNext)begin
      _zz_6_ = 1'b1;
    end
  end

  assign _zz_61_ = ((1'b1 && (! shiftBuffer_4__io_dataOut_m2sPipe_valid)) || shiftBuffer_4__io_dataOut_m2sPipe_ready);
  assign shiftBuffer_4__io_dataOut_m2sPipe_valid = shiftBuffer_4__io_dataOut_m2sPipe_rValid;
  assign shiftBuffer_4__io_dataOut_m2sPipe_payload = shiftBuffer_4__io_dataOut_m2sPipe_rData;
  assign core_beamWords_0_valid = shiftBuffer_4__io_dataOut_m2sPipe_valid;
  assign shiftBuffer_4__io_dataOut_m2sPipe_ready = core_beamWords_0_ready;
  assign core_beamWords_0_payload = shiftBuffer_4__io_dataOut_m2sPipe_payload;
  assign _zz_63_ = 1'b1;
  assign e_1 = sB_IO_3__D_IN_0;
  assign _zz_64_ = 1'b1;
  assign d_1 = sB_IO_4__D_IN_0;
  assign _zz_65_ = 1'b1;
  assign _zz_67_ = ((! sB_IO_3__D_IN_0_regNext) && sB_IO_3__D_IN_0_regNext_regNext);
  assign _zz_14_ = _zz_16_;
  always @ (*) begin
    _zz_18_ = _zz_14_;
    if(sB_IO_3__D_IN_0_regNext_1__regNext)begin
      _zz_18_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_15_ = shiftBuffer_5__io_dataIn_ready;
    if(sB_IO_3__D_IN_0_regNext_1__regNext)begin
      _zz_15_ = 1'b1;
    end
  end

  assign _zz_66_ = ((1'b1 && (! shiftBuffer_5__io_dataOut_m2sPipe_valid)) || shiftBuffer_5__io_dataOut_m2sPipe_ready);
  assign shiftBuffer_5__io_dataOut_m2sPipe_valid = shiftBuffer_5__io_dataOut_m2sPipe_rValid;
  assign shiftBuffer_5__io_dataOut_m2sPipe_payload = shiftBuffer_5__io_dataOut_m2sPipe_rData;
  assign core_beamWords_1_valid = shiftBuffer_5__io_dataOut_m2sPipe_valid;
  assign shiftBuffer_5__io_dataOut_m2sPipe_ready = core_beamWords_1_ready;
  assign core_beamWords_1_payload = shiftBuffer_5__io_dataOut_m2sPipe_payload;
  assign _zz_68_ = 1'b1;
  assign e_2 = sB_IO_5__D_IN_0;
  assign _zz_69_ = 1'b1;
  assign d_2 = sB_IO_6__D_IN_0;
  assign _zz_70_ = 1'b1;
  assign _zz_72_ = ((! sB_IO_5__D_IN_0_regNext) && sB_IO_5__D_IN_0_regNext_regNext);
  assign _zz_23_ = _zz_25_;
  always @ (*) begin
    _zz_27_ = _zz_23_;
    if(sB_IO_5__D_IN_0_regNext_1__regNext)begin
      _zz_27_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_24_ = shiftBuffer_6__io_dataIn_ready;
    if(sB_IO_5__D_IN_0_regNext_1__regNext)begin
      _zz_24_ = 1'b1;
    end
  end

  assign _zz_71_ = ((1'b1 && (! shiftBuffer_6__io_dataOut_m2sPipe_valid)) || shiftBuffer_6__io_dataOut_m2sPipe_ready);
  assign shiftBuffer_6__io_dataOut_m2sPipe_valid = shiftBuffer_6__io_dataOut_m2sPipe_rValid;
  assign shiftBuffer_6__io_dataOut_m2sPipe_payload = shiftBuffer_6__io_dataOut_m2sPipe_rData;
  assign core_beamWords_2_valid = shiftBuffer_6__io_dataOut_m2sPipe_valid;
  assign shiftBuffer_6__io_dataOut_m2sPipe_ready = core_beamWords_2_ready;
  assign core_beamWords_2_payload = shiftBuffer_6__io_dataOut_m2sPipe_payload;
  assign _zz_73_ = 1'b1;
  assign e_3 = sB_IO_7__D_IN_0;
  assign _zz_74_ = 1'b1;
  assign d_3 = sB_IO_8__D_IN_0;
  assign _zz_75_ = 1'b1;
  assign _zz_77_ = ((! sB_IO_7__D_IN_0_regNext) && sB_IO_7__D_IN_0_regNext_regNext);
  assign _zz_32_ = _zz_34_;
  always @ (*) begin
    _zz_36_ = _zz_32_;
    if(sB_IO_7__D_IN_0_regNext_1__regNext)begin
      _zz_36_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_33_ = shiftBuffer_7__io_dataIn_ready;
    if(sB_IO_7__D_IN_0_regNext_1__regNext)begin
      _zz_33_ = 1'b1;
    end
  end

  assign _zz_76_ = ((1'b1 && (! shiftBuffer_7__io_dataOut_m2sPipe_valid)) || shiftBuffer_7__io_dataOut_m2sPipe_ready);
  assign shiftBuffer_7__io_dataOut_m2sPipe_valid = shiftBuffer_7__io_dataOut_m2sPipe_rValid;
  assign shiftBuffer_7__io_dataOut_m2sPipe_payload = shiftBuffer_7__io_dataOut_m2sPipe_rData;
  assign core_beamWords_3_valid = shiftBuffer_7__io_dataOut_m2sPipe_valid;
  assign shiftBuffer_7__io_dataOut_m2sPipe_ready = core_beamWords_3_ready;
  assign core_beamWords_3_payload = shiftBuffer_7__io_dataOut_m2sPipe_payload;
  assign d_out_0 = ts4231Configurator_1__d_out;
  assign d_oe_0 = ts4231Configurator_1__d_oe;
  assign e_out_0 = ts4231Configurator_1__e_out;
  assign e_oe_0 = ts4231Configurator_1__e_oe;
  assign core_beamWords_0_ready = streamCCByToggle_4__io_input_ready;
  assign _zz_78_ = 1'b1;
  assign _zz_39_ = pulseTimer_4__io_pulse_valid;
  assign _zz_79_ = (2'b00);
  assign slowArea_idBeamWords_0_valid = streamFifo_6__io_pop_valid;
  assign slowArea_idBeamWords_0_payload_id = streamFifo_6__io_pop_payload_id;
  assign slowArea_idBeamWords_0_payload_pulse_width = streamFifo_6__io_pop_payload_pulse_width;
  assign slowArea_idBeamWords_0_payload_pulse_timestamp = streamFifo_6__io_pop_payload_pulse_timestamp;
  assign slowArea_idBeamWords_0_payload_beamWord = streamFifo_6__io_pop_payload_beamWord;
  assign d_out_1 = ts4231Configurator_2__d_out;
  assign d_oe_1 = ts4231Configurator_2__d_oe;
  assign e_out_1 = ts4231Configurator_2__e_out;
  assign e_oe_1 = ts4231Configurator_2__e_oe;
  assign core_beamWords_1_ready = streamCCByToggle_5__io_input_ready;
  assign _zz_81_ = 1'b1;
  assign _zz_42_ = pulseTimer_5__io_pulse_valid;
  assign _zz_82_ = (2'b01);
  assign slowArea_idBeamWords_1_valid = streamFifo_7__io_pop_valid;
  assign slowArea_idBeamWords_1_payload_id = streamFifo_7__io_pop_payload_id;
  assign slowArea_idBeamWords_1_payload_pulse_width = streamFifo_7__io_pop_payload_pulse_width;
  assign slowArea_idBeamWords_1_payload_pulse_timestamp = streamFifo_7__io_pop_payload_pulse_timestamp;
  assign slowArea_idBeamWords_1_payload_beamWord = streamFifo_7__io_pop_payload_beamWord;
  assign d_out_2 = ts4231Configurator_3__d_out;
  assign d_oe_2 = ts4231Configurator_3__d_oe;
  assign e_out_2 = ts4231Configurator_3__e_out;
  assign e_oe_2 = ts4231Configurator_3__e_oe;
  assign core_beamWords_2_ready = streamCCByToggle_6__io_input_ready;
  assign _zz_84_ = 1'b1;
  assign _zz_45_ = pulseTimer_6__io_pulse_valid;
  assign _zz_85_ = (2'b10);
  assign slowArea_idBeamWords_2_valid = streamFifo_8__io_pop_valid;
  assign slowArea_idBeamWords_2_payload_id = streamFifo_8__io_pop_payload_id;
  assign slowArea_idBeamWords_2_payload_pulse_width = streamFifo_8__io_pop_payload_pulse_width;
  assign slowArea_idBeamWords_2_payload_pulse_timestamp = streamFifo_8__io_pop_payload_pulse_timestamp;
  assign slowArea_idBeamWords_2_payload_beamWord = streamFifo_8__io_pop_payload_beamWord;
  assign d_out_3 = ts4231Configurator_4__d_out;
  assign d_oe_3 = ts4231Configurator_4__d_oe;
  assign e_out_3 = ts4231Configurator_4__e_out;
  assign e_oe_3 = ts4231Configurator_4__e_oe;
  assign core_beamWords_3_ready = streamCCByToggle_7__io_input_ready;
  assign _zz_87_ = 1'b1;
  assign _zz_48_ = pulseTimer_7__io_pulse_valid;
  assign _zz_88_ = (2'b11);
  assign slowArea_idBeamWords_3_valid = streamFifo_9__io_pop_valid;
  assign slowArea_idBeamWords_3_payload_id = streamFifo_9__io_pop_payload_id;
  assign slowArea_idBeamWords_3_payload_pulse_width = streamFifo_9__io_pop_payload_pulse_width;
  assign slowArea_idBeamWords_3_payload_pulse_timestamp = streamFifo_9__io_pop_payload_pulse_timestamp;
  assign slowArea_idBeamWords_3_payload_beamWord = streamFifo_9__io_pop_payload_beamWord;
  assign slowArea_idBeamWords_0_ready = streamArbiter_2__io_inputs_0_ready;
  assign slowArea_idBeamWords_1_ready = streamArbiter_2__io_inputs_1_ready;
  assign slowArea_idBeamWords_2_ready = streamArbiter_2__io_inputs_2_ready;
  assign slowArea_idBeamWords_3_ready = streamArbiter_2__io_inputs_3_ready;
  assign slowArea_identifiedBeamStream_valid = slowArea_pulseOffsetFinder_io_pulseOut_valid;
  assign slowArea_identifiedBeamStream_payload = {{{{{{{slowArea_pulseOffsetFinder_io_pulseOut_payload_pulse_timestamp,(7'b0000000)},slowArea_pulseOffsetFinder_io_pulseOut_payload_beamWord},(7'b0000000)},slowArea_pulseOffsetFinder_io_pulseOut_payload_offset},slowArea_pulseOffsetFinder_io_pulseOut_payload_pulse_width},slowArea_pulseOffsetFinder_io_pulseOut_payload_npoly},slowArea_pulseOffsetFinder_io_pulseOut_payload_id};
  assign slowArea_syncStream_payload = (96'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111);
  always @ (*) begin
    slowArea_syncTimeout_stateRise = 1'b0;
    if(slowArea_syncTimeout_counter_willOverflow)begin
      slowArea_syncTimeout_stateRise = (! slowArea_syncTimeout_state);
    end
    if(slowArea_syncTimeout_state)begin
      slowArea_syncTimeout_stateRise = 1'b0;
    end
  end

  always @ (*) begin
    slowArea_syncTimeout_counter_willClear = 1'b0;
    if(slowArea_syncTimeout_state)begin
      slowArea_syncTimeout_counter_willClear = 1'b1;
    end
  end

  assign slowArea_syncTimeout_counter_willOverflowIfInc = (slowArea_syncTimeout_counter_value == (24'b101101110001101011111111));
  assign slowArea_syncTimeout_counter_willOverflow = (slowArea_syncTimeout_counter_willOverflowIfInc && slowArea_syncTimeout_counter_willIncrement);
  always @ (*) begin
    if(slowArea_syncTimeout_counter_willOverflow)begin
      slowArea_syncTimeout_counter_valueNext = (24'b000000000000000000000000);
    end else begin
      slowArea_syncTimeout_counter_valueNext = (slowArea_syncTimeout_counter_value + _zz_110_);
    end
    if(slowArea_syncTimeout_counter_willClear)begin
      slowArea_syncTimeout_counter_valueNext = (24'b000000000000000000000000);
    end
  end

  assign slowArea_syncTimeout_counter_willIncrement = 1'b1;
  assign slowArea_syncStream_valid = slowArea_syncTimeout_state;
  assign slowArea_syncStream_ready = ((1'b1 && (! slowArea_syncStream_m2sPipe_valid)) || slowArea_syncStream_m2sPipe_ready);
  assign slowArea_syncStream_m2sPipe_valid = slowArea_syncStream_m2sPipe_rValid;
  assign slowArea_syncStream_m2sPipe_payload = slowArea_syncStream_m2sPipe_rData;
  assign slowArea_identifiedBeamStream_ready = ((1'b1 && (! slowArea_identifiedBeamStream_m2sPipe_valid)) || slowArea_identifiedBeamStream_m2sPipe_ready);
  assign slowArea_identifiedBeamStream_m2sPipe_valid = slowArea_identifiedBeamStream_m2sPipe_rValid;
  assign slowArea_identifiedBeamStream_m2sPipe_payload = slowArea_identifiedBeamStream_m2sPipe_rData;
  assign slowArea_syncStream_m2sPipe_ready = streamArbiter_3__io_inputs_0_ready;
  assign slowArea_identifiedBeamStream_m2sPipe_ready = streamArbiter_3__io_inputs_1_ready;
  assign _zz_94_ = (20'b00000000000000001100);
  assign _zz_91_ = (3'b111);
  assign _zz_93_ = `UartParityType_defaultEncoding_NONE;
  assign _zz_92_ = `UartStopType_defaultEncoding_ONE;
  assign io_uart_txd = slowArea_uartCtrl_io_uart_txd;
  always @ (*) begin
    _zz_49_ = 1'b0;
    if((io_output_fifo_1__io_pop_valid && slowArea_uartCtrl_io_write_ready))begin
      _zz_49_ = 1'b1;
    end
  end

  assign _zz_52_ = (_zz_51_ == (4'b1011));
  assign _zz_53_ = (_zz_52_ && _zz_49_);
  always @ (*) begin
    if(_zz_53_)begin
      _zz_50_ = (4'b0000);
    end else begin
      _zz_50_ = (_zz_51_ + _zz_112_);
    end
    if(1'b0)begin
      _zz_50_ = (4'b0000);
    end
  end

  assign _zz_54_ = io_output_fifo_1__io_pop_payload;
  assign _zz_95_ = _zz_101_;
  assign _zz_96_ = (slowArea_uartCtrl_io_write_ready && _zz_52_);
  always @ (*) begin
    slowArea_slowBlinkTimer_stateRise = 1'b0;
    if(slowArea_slowBlinkTimer_counter_willOverflow)begin
      slowArea_slowBlinkTimer_stateRise = (! slowArea_slowBlinkTimer_state);
    end
    if(slowArea_slowBlinkTimer_state)begin
      slowArea_slowBlinkTimer_stateRise = 1'b0;
    end
  end

  always @ (*) begin
    slowArea_slowBlinkTimer_counter_willClear = 1'b0;
    if(slowArea_slowBlinkTimer_state)begin
      slowArea_slowBlinkTimer_counter_willClear = 1'b1;
    end
  end

  assign slowArea_slowBlinkTimer_counter_willOverflowIfInc = (slowArea_slowBlinkTimer_counter_value == (24'b101101110001101011111111));
  assign slowArea_slowBlinkTimer_counter_willOverflow = (slowArea_slowBlinkTimer_counter_willOverflowIfInc && slowArea_slowBlinkTimer_counter_willIncrement);
  always @ (*) begin
    if(slowArea_slowBlinkTimer_counter_willOverflow)begin
      slowArea_slowBlinkTimer_counter_valueNext = (24'b000000000000000000000000);
    end else begin
      slowArea_slowBlinkTimer_counter_valueNext = (slowArea_slowBlinkTimer_counter_value + _zz_114_);
    end
    if(slowArea_slowBlinkTimer_counter_willClear)begin
      slowArea_slowBlinkTimer_counter_valueNext = (24'b000000000000000000000000);
    end
  end

  assign slowArea_slowBlinkTimer_counter_willIncrement = 1'b1;
  always @ (*) begin
    slowArea_fastBlinkTimer_stateRise = 1'b0;
    if(slowArea_fastBlinkTimer_counter_willOverflow)begin
      slowArea_fastBlinkTimer_stateRise = (! slowArea_fastBlinkTimer_state);
    end
    if(slowArea_fastBlinkTimer_state)begin
      slowArea_fastBlinkTimer_stateRise = 1'b0;
    end
  end

  always @ (*) begin
    slowArea_fastBlinkTimer_counter_willClear = 1'b0;
    if(slowArea_fastBlinkTimer_state)begin
      slowArea_fastBlinkTimer_counter_willClear = 1'b1;
    end
  end

  assign slowArea_fastBlinkTimer_counter_willOverflowIfInc = (slowArea_fastBlinkTimer_counter_value == (22'b1011011100011010111111));
  assign slowArea_fastBlinkTimer_counter_willOverflow = (slowArea_fastBlinkTimer_counter_willOverflowIfInc && slowArea_fastBlinkTimer_counter_willIncrement);
  always @ (*) begin
    if(slowArea_fastBlinkTimer_counter_willOverflow)begin
      slowArea_fastBlinkTimer_counter_valueNext = (22'b0000000000000000000000);
    end else begin
      slowArea_fastBlinkTimer_counter_valueNext = (slowArea_fastBlinkTimer_counter_value + _zz_116_);
    end
    if(slowArea_fastBlinkTimer_counter_willClear)begin
      slowArea_fastBlinkTimer_counter_valueNext = (22'b0000000000000000000000);
    end
  end

  assign slowArea_fastBlinkTimer_counter_willIncrement = 1'b1;
  always @ (*) begin
    _zz_55_ = 1'bx;
    case(_zz_106_)
      2'b00 : begin
        _zz_55_ = 1'b0;
      end
      2'b01 : begin
        _zz_55_ = slowArea_slowBlink;
      end
      2'b10 : begin
        _zz_55_ = slowArea_fastBlink;
      end
      default : begin
        _zz_55_ = 1'b1;
      end
    endcase
  end

  assign io_led0 = (! _zz_55_);
  always @ (*) begin
    _zz_56_ = 1'bx;
    case(_zz_107_)
      2'b00 : begin
        _zz_56_ = 1'b0;
      end
      2'b01 : begin
        _zz_56_ = slowArea_slowBlink;
      end
      2'b10 : begin
        _zz_56_ = slowArea_fastBlink;
      end
      default : begin
        _zz_56_ = 1'b1;
      end
    endcase
  end

  assign io_led1 = (! _zz_56_);
  always @ (*) begin
    _zz_57_ = 1'bx;
    case(_zz_108_)
      2'b00 : begin
        _zz_57_ = 1'b0;
      end
      2'b01 : begin
        _zz_57_ = slowArea_slowBlink;
      end
      2'b10 : begin
        _zz_57_ = slowArea_fastBlink;
      end
      default : begin
        _zz_57_ = 1'b1;
      end
    endcase
  end

  assign io_led2 = (! _zz_57_);
  assign _zz_100_ = 1'b0;
  assign _zz_99_ = 1'b0;
  assign _zz_98_ = (slowArea_resetControl == (8'b11001111));
  assign _zz_80_ = 1'b0;
  assign _zz_83_ = 1'b0;
  assign _zz_86_ = 1'b0;
  assign _zz_89_ = 1'b0;
  assign _zz_90_ = 1'b0;
  assign _zz_97_ = 1'b0;
  always @ (posedge Core_clk) begin
    slowClkCtrl_slowClk <= (! slowClkCtrl_slowClk);
    if(_zz_102_)begin
      _zz_7_ <= ddrBmcDecoder_4__io_output_valid;
    end
    if(_zz_61_)begin
      shiftBuffer_4__io_dataOut_m2sPipe_rValid <= shiftBuffer_4__io_dataOut_valid;
    end
    if(_zz_103_)begin
      _zz_16_ <= ddrBmcDecoder_5__io_output_valid;
    end
    if(_zz_66_)begin
      shiftBuffer_5__io_dataOut_m2sPipe_rValid <= shiftBuffer_5__io_dataOut_valid;
    end
    if(_zz_104_)begin
      _zz_25_ <= ddrBmcDecoder_6__io_output_valid;
    end
    if(_zz_71_)begin
      shiftBuffer_6__io_dataOut_m2sPipe_rValid <= shiftBuffer_6__io_dataOut_valid;
    end
    if(_zz_105_)begin
      _zz_34_ <= ddrBmcDecoder_7__io_output_valid;
    end
    if(_zz_76_)begin
      shiftBuffer_7__io_dataOut_m2sPipe_rValid <= shiftBuffer_7__io_dataOut_valid;
    end
  end

  always @ (posedge Core_clk) begin
    _zz_1_ <= sB_IO_2__D_IN_0;
    _zz_2_ <= sB_IO_2__D_IN_1;
    _zz_3_ <= _zz_1_;
    _zz_4_ <= _zz_2_;
    sB_IO_1__D_IN_0_regNext <= sB_IO_1__D_IN_0;
    sB_IO_1__D_IN_0_regNext_regNext <= sB_IO_1__D_IN_0_regNext;
    if(_zz_102_)begin
      _zz_8_ <= ddrBmcDecoder_4__io_output_payload;
    end
    sB_IO_1__D_IN_0_regNext_1_ <= sB_IO_1__D_IN_0;
    sB_IO_1__D_IN_0_regNext_1__regNext <= sB_IO_1__D_IN_0_regNext_1_;
    if(_zz_61_)begin
      shiftBuffer_4__io_dataOut_m2sPipe_rData <= shiftBuffer_4__io_dataOut_payload;
    end
    _zz_10_ <= sB_IO_4__D_IN_0;
    _zz_11_ <= sB_IO_4__D_IN_1;
    _zz_12_ <= _zz_10_;
    _zz_13_ <= _zz_11_;
    sB_IO_3__D_IN_0_regNext <= sB_IO_3__D_IN_0;
    sB_IO_3__D_IN_0_regNext_regNext <= sB_IO_3__D_IN_0_regNext;
    if(_zz_103_)begin
      _zz_17_ <= ddrBmcDecoder_5__io_output_payload;
    end
    sB_IO_3__D_IN_0_regNext_1_ <= sB_IO_3__D_IN_0;
    sB_IO_3__D_IN_0_regNext_1__regNext <= sB_IO_3__D_IN_0_regNext_1_;
    if(_zz_66_)begin
      shiftBuffer_5__io_dataOut_m2sPipe_rData <= shiftBuffer_5__io_dataOut_payload;
    end
    _zz_19_ <= sB_IO_6__D_IN_0;
    _zz_20_ <= sB_IO_6__D_IN_1;
    _zz_21_ <= _zz_19_;
    _zz_22_ <= _zz_20_;
    sB_IO_5__D_IN_0_regNext <= sB_IO_5__D_IN_0;
    sB_IO_5__D_IN_0_regNext_regNext <= sB_IO_5__D_IN_0_regNext;
    if(_zz_104_)begin
      _zz_26_ <= ddrBmcDecoder_6__io_output_payload;
    end
    sB_IO_5__D_IN_0_regNext_1_ <= sB_IO_5__D_IN_0;
    sB_IO_5__D_IN_0_regNext_1__regNext <= sB_IO_5__D_IN_0_regNext_1_;
    if(_zz_71_)begin
      shiftBuffer_6__io_dataOut_m2sPipe_rData <= shiftBuffer_6__io_dataOut_payload;
    end
    _zz_28_ <= sB_IO_8__D_IN_0;
    _zz_29_ <= sB_IO_8__D_IN_1;
    _zz_30_ <= _zz_28_;
    _zz_31_ <= _zz_29_;
    sB_IO_7__D_IN_0_regNext <= sB_IO_7__D_IN_0;
    sB_IO_7__D_IN_0_regNext_regNext <= sB_IO_7__D_IN_0_regNext;
    if(_zz_105_)begin
      _zz_35_ <= ddrBmcDecoder_7__io_output_payload;
    end
    sB_IO_7__D_IN_0_regNext_1_ <= sB_IO_7__D_IN_0;
    sB_IO_7__D_IN_0_regNext_1__regNext <= sB_IO_7__D_IN_0_regNext_1_;
    if(_zz_76_)begin
      shiftBuffer_7__io_dataOut_m2sPipe_rData <= shiftBuffer_7__io_dataOut_payload;
    end
  end

  always @ (posedge Slow_clk) begin
    slowArea_time <= (slowArea_time + (24'b000000000000000000000001));
    _zz_37_ <= 1'b1;
    _zz_40_ <= 1'b1;
    _zz_43_ <= 1'b1;
    _zz_46_ <= 1'b1;
    slowArea_syncTimeout_counter_value <= slowArea_syncTimeout_counter_valueNext;
    if(slowArea_syncTimeout_counter_willOverflow)begin
      slowArea_syncTimeout_state <= 1'b1;
    end
    if(slowArea_syncTimeout_state)begin
      slowArea_syncTimeout_state <= 1'b0;
    end
    if(slowArea_syncStream_ready)begin
      slowArea_syncStream_m2sPipe_rValid <= slowArea_syncStream_valid;
    end
    if(slowArea_identifiedBeamStream_ready)begin
      slowArea_identifiedBeamStream_m2sPipe_rValid <= slowArea_identifiedBeamStream_valid;
    end
    _zz_51_ <= _zz_50_;
    slowArea_slowBlinkTimer_counter_value <= slowArea_slowBlinkTimer_counter_valueNext;
    if(slowArea_slowBlinkTimer_counter_willOverflow)begin
      slowArea_slowBlinkTimer_state <= 1'b1;
    end
    if(slowArea_slowBlinkTimer_state)begin
      slowArea_slowBlinkTimer_state <= 1'b0;
      slowArea_slowBlink <= (! slowArea_slowBlink);
    end
    slowArea_fastBlinkTimer_counter_value <= slowArea_fastBlinkTimer_counter_valueNext;
    if(slowArea_fastBlinkTimer_counter_willOverflow)begin
      slowArea_fastBlinkTimer_state <= 1'b1;
    end
    if(slowArea_fastBlinkTimer_state)begin
      slowArea_fastBlinkTimer_state <= 1'b0;
      slowArea_fastBlink <= (! slowArea_fastBlink);
    end
  end

  always @ (posedge Slow_clk) begin
    if((streamCCByToggle_4__io_output_valid && _zz_78_))begin
      _zz_38_ <= streamCCByToggle_4__io_output_payload;
    end
    if(_zz_39_)begin
      _zz_38_ <= (17'b00000000000000000);
    end
    if((streamCCByToggle_5__io_output_valid && _zz_81_))begin
      _zz_41_ <= streamCCByToggle_5__io_output_payload;
    end
    if(_zz_42_)begin
      _zz_41_ <= (17'b00000000000000000);
    end
    if((streamCCByToggle_6__io_output_valid && _zz_84_))begin
      _zz_44_ <= streamCCByToggle_6__io_output_payload;
    end
    if(_zz_45_)begin
      _zz_44_ <= (17'b00000000000000000);
    end
    if((streamCCByToggle_7__io_output_valid && _zz_87_))begin
      _zz_47_ <= streamCCByToggle_7__io_output_payload;
    end
    if(_zz_48_)begin
      _zz_47_ <= (17'b00000000000000000);
    end
    if(slowArea_syncStream_ready)begin
      slowArea_syncStream_m2sPipe_rData <= slowArea_syncStream_payload;
    end
    if(slowArea_identifiedBeamStream_ready)begin
      slowArea_identifiedBeamStream_m2sPipe_rData <= slowArea_identifiedBeamStream_payload;
    end
    if(slowArea_commandHandler_io_ledCommand_valid)begin
      slowArea_ledControl <= slowArea_commandHandler_io_ledCommand_payload;
    end
    if(slowArea_commandHandler_io_resetCommand_valid)begin
      slowArea_resetControl <= slowArea_commandHandler_io_resetCommand_payload;
    end
  end

endmodule
