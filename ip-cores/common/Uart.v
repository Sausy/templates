/*=================================
use this tool with UartDebug.py
UART Frame

2*16bit frames first sync with CMD
also 4*8bit

0                   1
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|   customCMD |   CMD        	|
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|       Debug DATA1        	  |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|       Debug DATA1        	  |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|             \   SyncDATA    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


VALID commands

16'hffff ... SYNC

16'hxx00 ... raw_data needs to be translated into ascii
16'hxx01 ... 1:1 data transmission
16'hxx   ... Project Specific Identifyer

16'hx01x...

16'hx1xx ... wait for DATA
16'hx0xx...  Last pice of DATA


/*=================================*/
module Uart (
	input clk,

	input [7:0] cmd,
	input [7:0] custom_cmd,
	input [15:0] data1,
  input [15:0] data2,
  input [7:0] data3,

  input enableTrans,
	output transDone,
	output tx,
	input rx

)/* synthesis syn_noprune=1 */;
parameter BAUD = 9600;

localparam  SYNC 				= 16'hffff;
localparam  RAW_DATA		= 2'b00;
localparam  ASCII_DATA	= 2'b01;

//wire [31:0] out_data;
//assign out_data = (r_custom_cmd<<24) | (r_cmd<<16) | r_data ;


reg [7:0] 	r_cmd;
reg [7:0] 	r_custom_cmd;
reg [15:0] 	r_data = 16'd65;
reg [15:0] 	r_data2 = SYNC;
reg [7:0] 	r_data3 = SYNC;
reg [7:0]  r_sync = SYNC;

reg flag_frame_sent = 0;
always @ (posedge clk ) begin
		if(enableTrans)begin
			r_cmd					<= cmd;
			r_custom_cmd	<= custom_cmd;
			r_data 				<= data1;
      r_data2				<= data2;
      r_data3       <= data3;
      r_sync 				<= SYNC;
		end
end

//	!!!!! ================example call =======+!!!!!!!!!!!!
//PS.:
//ASCII 65 to 90 equals A to Z
//and new line + cr ===

//---TX regs and wires
reg        i_Tx_DV = 1;
reg [7:0]  i_Tx_Byte = 8'd68;
wire       o_Tx_Enable, o_Tx_Done, o_Tx_Active;

reg        i_Tx_DV2 = 1;
reg [7:0]  i_Tx_Byte2; //= 8'd68;
wire       o_Tx_Enable2, o_Tx_Done2, o_Tx_Active2;


uart_tx u1_tx(
	.i_Clock(clk),
	.i_Tx_DV(i_Tx_DV),
	.i_Tx_Byte(i_Tx_Byte),
	.o_Tx_Active(o_Tx_Active),
	.o_Tx_Serial(tx), ///TX PIN
	.o_Tx_Enable(o_Tx_Enable),
	.o_Tx_Done(o_Tx_Done)
)/* synthesis syn_noprune=1 */;

//---RX regs and wires
wire       o_Rx_DV;
wire [7:0] o_Rx_Byte;

reg [7:0]  rx_DATA [0:4];// = 8'd69;

uart_rx u1_rx(
   .i_Clock(clk),
   .i_Rx_Serial(rx),
   .o_Rx_DV(o_Rx_DV),
   .o_Rx_Byte(o_Rx_Byte)
)/* synthesis syn_noprune=1 */;

reg flag_SYNC_CMD = 0;
reg flag_SYNC_END_CMD = 0;
reg CMD_Clear = 0;
reg [7:0] echoData = 8'd65;

integer i;
always @ ( posedge clk ) begin
  if(CMD_Clear)begin
    flag_SYNC_CMD <= 0;
    flag_SYNC_END_CMD <= 0;
  end
  if(o_Rx_DV)begin
    rx_DATA[0] <= o_Rx_Byte;
    for(i=1; i <= 4; i = i + 1)begin
      rx_DATA[i] <=  rx_DATA[i-1];
    end
    /*
    case (o_Rx_Byte)
      8'd65: flag_SYNC_CMD <= 1;
      8'd66: flag_SYNC_END_CMD <= 1;
      default: flag_SYNC_CMD <= 0;
    endcase*/
    case (rx_DATA[1])
      8'd65: flag_SYNC_CMD <= 1;
      8'd66: flag_SYNC_END_CMD <= 1;
      default: flag_SYNC_CMD <= 0;
    endcase
  end

end


	reg   [7:0]     sendcounter = 0;
	reg   [7:0]     foo_cnt = 0;
	reg         		waitflag_tx = 0;
	reg 						r_flag_allow_new_data = 1;
	assign 					transDone = r_flag_allow_new_data;

	reg [63:0] out_data;
	//assign out_data = (r_custom_cmd<<24) | (r_cmd<<16) | r_data ;

	reg [7:0] cnt_sync = 0;
	reg [7:0]	init_data  = 8'hff;
	reg flag_init_done = 0;
  reg flag_sync_started = 0;

	always @(posedge clk) begin
		waitflag_tx <= o_Tx_Done & !o_Tx_Active;
		i_Tx_DV <= 0;
		if(waitflag_tx == 1)begin
				sendcounter <= sendcounter + 1;
				flag_frame_sent <= 0;
				r_flag_allow_new_data <= 0;

				case(sendcounter)
           8'd0: i_Tx_Byte <= out_data[63:56];
           8'd1: i_Tx_Byte <= out_data[55:48];
           8'd2: i_Tx_Byte <= out_data[47:40];
           8'd3: i_Tx_Byte <= out_data[39:32];
					 8'd4: i_Tx_Byte <= out_data[31:24];
					 8'd5: i_Tx_Byte <= out_data[23:16];
					 8'd6: i_Tx_Byte <= out_data[15:8];
					 8'd7: begin
					 					i_Tx_Byte <= out_data[7:0];
										flag_frame_sent <= 1;
										sendcounter <= 0;
										r_flag_allow_new_data <= 1;

										out_data <= (r_custom_cmd<<56) | (r_cmd<<48) | (r_data<<32) | (r_data2<<16) | (r_data3<<8) | r_sync;
										//out_data <= 32'h00f1;
								end
					 default : begin
										i_Tx_Byte <= 8'hff;
										sendcounter <= 0;
										r_flag_allow_new_data <= 1;
				 				end
				endcase

        /*if(!flag_init_done)begin
					i_Tx_Byte <= 8'd65;//init_data;//echoData;//8'd65;//init_data;
					//cnt_sync <= cnt_sync + 1;
          if(flag_SYNC_CMD)begin
            flag_init_done <= 1;
            i_Tx_Byte <= 8'hff;
          end
				end*/

        /*
        if(cnt_sync == 8'd12)begin
					flag_init_done <= 1;

          cnt_sync <= 8'd13;
				end*/

        /*
        if(!flag_init_done)begin
          i_Tx_Byte <= 8'hff;
          cnt_sync <= cnt_sync + 1;
          if(flag_SYNC_CMD)begin
            flag_init_done <= 1;
            i_Tx_Byte <= 8'haa;
          end
        end else begin
          if(flag_SYNC_CMD)begin
            flag_init_done <= 0;
            //cnt_sync <= cnt_sync + 1;
            cnt_sync <= 0;
            i_Tx_Byte <= 8'hbb;
          end
        end

        if(cnt_sync >= 8'd12)begin
					flag_init_done <= 1;
          i_Tx_Byte <= 8'haa;
          cnt_sync <= 0;
				end
        */


        /*i_Tx_Byte <= 8'hcc;
        if(!flag_init_done)begin
            i_Tx_Byte <= 8'hff;//d68;
        end
        //if(!flag_sync_done)begin
        //    i_Tx_Byte <= 8'hff;
        //end

        if(flag_SYNC_END_CMD)begin
          flag_init_done <= 1;
          i_Tx_Byte <= 8'hbb;
          cnt_sync <= 0;
          flag_sync_done <= 1;
          sendcounter <= 0;
        end

        if(flag_SYNC_CMD)begin
          flag_sync_done <= 0;
          flag_init_done <= 0;//1;
          sendcounter <= 0;
          i_Tx_Byte <= 8'haa;
        end*/

        /*i_Tx_Byte <= echoData;
        if(flag_SYNC_END_CMD)begin
          echoData <= 8'd67;
          i_Tx_Byte <= 8'd67;
        end*/


        CMD_Clear <= 0;

        if(flag_SYNC_CMD)begin
          //Start writing Helo
          //flag_init_done <= 0;
          i_Tx_Byte <= 8'd72;
          flag_sync_started <= 1;
          //if(!flag_sync_started)
          cnt_sync <= 0;
          sendcounter <= 0;
          CMD_Clear <= 1;
        end

        if(flag_sync_started)begin
          cnt_sync <= cnt_sync + 1;
          sendcounter <= 0;
          case (cnt_sync)
            8'd0: i_Tx_Byte <= 8'd72;
            8'd1: i_Tx_Byte <= 8'd72;
            8'd2: i_Tx_Byte <= 8'd101;
            8'd3: i_Tx_Byte <= 8'd108;
            8'd4: i_Tx_Byte <= 8'd111;
            //8'd5: i_Tx_Byte <= 8'hff;
            default: begin
                //flag_init_done <= 1;
                r_flag_allow_new_data <= 1;
                i_Tx_Byte <= 8'hff;
                cnt_sync <= 0;
                flag_sync_started <= 0;
              end
          endcase






          /*
          if(cnt_sync >= 8'd20)begin
              i_Tx_Byte <= 8'h69;
              if(cnt_sync <= 8'hdf)begin
                  i_Tx_Byte <= 8'hff;
              end
              if(cnt_sync <= 8'd50)begin
                  i_Tx_Byte <= 8'd68;
              end
          end
          if(cnt_sync == 8'hff)begin
            flag_sync_started <= 0;
            flag_init_done <= 1;
          end*/
        end



				waitflag_tx <= 0;
				i_Tx_DV <= 1;
		end
	end

endmodule

//////////////////////////////////////////////////////////////////////
// File Downloaded from http://www.nandland.com
//////////////////////////////////////////////////////////////////////
// This file contains the UART Transmitter.  This transmitter is able
// to transmit 8 bits of serial data, one start bit, one stop bit,
// and no parity bit.  When transmit is complete o_Tx_done will be
// driven high for one clock cycle.
//
// Set Parameter CLKS_PER_BIT as follows:
// CLKS_PER_BIT = (Frequency of i_Clock)/(Frequency of UART)
// Example: 10 MHz Clock, 115200 baud UART
// (10000000)/(115200) = 87

module uart_tx #(parameter CLK_FREQ_HZ = 16_000_000,parameter CLKS_PER_BIT=139)//, BAUDRATE = 9600)
  (
   input       i_Clock,
   input       i_Tx_DV,
   input [7:0] i_Tx_Byte,
   output      o_Tx_Active,
   output reg  o_Tx_Serial,
   output      o_Tx_Enable,
   output      o_Tx_Done
   );
  //reg [31:0] CLKS_PER_BIT = 32'd5000;//32'd139;
  //localparam CLKS_PER_BIT   = CLK_FREQ_HZ/BAUDRATE; // 139 at 16MHz this is 115200 baudrate, 64 at 16MHz is 250000

  localparam s_IDLE         = 3'b000;
  localparam s_TX_START_BIT = 3'b001;
  localparam s_TX_DATA_BITS = 3'b010;
  localparam s_TX_STOP_BIT  = 3'b011;
  localparam s_CLEANUP      = 3'b100;

  reg [2:0]    r_SM_Main     = 0;
  reg [31:0]   r_Clock_Count = 0;
  reg [2:0]    r_Bit_Index   = 0;
  reg [7:0]    r_Tx_Data     = 0;
  reg          r_Tx_Done     = 0;
  reg          r_Tx_Active   = 0;

  assign o_Tx_Enable = !o_Tx_Serial;

  //always @(posedge i_Clock) begin change_BAUDE:
  //  CLKS_PER_BIT <= CLK_FREQ_HZ/i_BAUD;
  //end

  always @(posedge i_Clock)
    begin

      case (r_SM_Main)
        s_IDLE :
          begin
            o_Tx_Serial   <= 1'b1;         // Drive Line High for Idle
            r_Tx_Done     <= 1'b0;
            r_Clock_Count <= 0;
            r_Bit_Index   <= 0;

            if (i_Tx_DV == 1'b1)
              begin
                r_Tx_Active <= 1'b1;
                r_Tx_Data   <= i_Tx_Byte;
                r_SM_Main   <= s_TX_START_BIT;
              end
            else
              r_SM_Main <= s_IDLE;
          end // case: s_IDLE


        // Send out Start Bit. Start bit = 0
        s_TX_START_BIT :
          begin
            o_Tx_Serial <= 1'b0;

            // Wait CLKS_PER_BIT-1 clock cycles for start bit to finish
            if (r_Clock_Count < CLKS_PER_BIT-1)
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_TX_START_BIT;
              end
            else
              begin
                r_Clock_Count <= 0;
                r_SM_Main     <= s_TX_DATA_BITS;
              end
          end // case: s_TX_START_BIT


        // Wait CLKS_PER_BIT-1 clock cycles for data bits to finish
        s_TX_DATA_BITS :
          begin
            o_Tx_Serial <= r_Tx_Data[r_Bit_Index];

            if (r_Clock_Count < CLKS_PER_BIT-1)
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_TX_DATA_BITS;
              end
            else
              begin
                r_Clock_Count <= 0;

                // Check if we have sent out all bits
                if (r_Bit_Index < 7)
                  begin
                    r_Bit_Index <= r_Bit_Index + 1;
                    r_SM_Main   <= s_TX_DATA_BITS;
                  end
                else
                  begin
                    r_Bit_Index <= 0;
                    r_SM_Main   <= s_TX_STOP_BIT;
                  end
              end
          end // case: s_TX_DATA_BITS


        // Send out Stop bit.  Stop bit = 1
        s_TX_STOP_BIT :
          begin
            o_Tx_Serial <= 1;
						// Wait CLKS_PER_BIT-1 clock cycles for Stop bit to finish
            if (r_Clock_Count < CLKS_PER_BIT-1)
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_TX_STOP_BIT;
              end
            else
              begin
                r_Tx_Done     <= 1'b1;
                r_Clock_Count <= 0;
                r_SM_Main     <= s_CLEANUP;
                r_Tx_Active   <= 1'b0;
              end
          end // case: s_Tx_STOP_BIT


        // Stay here 1 clock
        s_CLEANUP :
          begin
            r_Tx_Done <= 1'b1;
            r_SM_Main <= s_IDLE;
          end


        default :
          r_SM_Main <= s_IDLE;

      endcase
    end

  assign o_Tx_Active = r_Tx_Active;
  assign o_Tx_Done   = r_Tx_Done;

endmodule


module uart_rx #(parameter CLK_FREQ_HZ = 16_000_000, parameter CLKS_PER_BIT = 139)
  (
   input        i_Clock,
   input        i_Rx_Serial,
   output       o_Rx_DV,
   output [7:0] o_Rx_Byte
   );

  //reg [31:0] CLKS_PER_BIT = 32'd5000;//32'd139;
  //localparam CLKS_PER_BIT   = CLK_FREQ_HZ/BAUDRATE; // 139 at 16MHz this is 115200 baudrate, 64 at 16MHz is 250000
  localparam s_IDLE         = 3'b000;
  localparam s_RX_START_BIT = 3'b001;
  localparam s_RX_DATA_BITS = 3'b010;
  localparam s_RX_STOP_BIT  = 3'b011;
  localparam s_CLEANUP      = 3'b100;

  reg           r_Rx_Data_R = 1'b1;
  reg           r_Rx_Data   = 1'b1;

  reg [31:0]     r_Clock_Count = 0;
  reg [2:0]     r_Bit_Index   = 0; //8 bits total
  reg [7:0]     r_Rx_Byte     = 0;
  reg           r_Rx_DV       = 0;
  reg [2:0]     r_SM_Main     = 0;

  //always @(posedge i_Clock) begin change_BAUDE:
  //  CLKS_PER_BIT <= CLK_FREQ_HZ/i_BAUD;
  //end

  // Purpose: Double-register the incoming data.
  // This allows it to be used in the UART RX Clock Domain.
  // (It removes problems caused by metastability)
  always @(posedge i_Clock)
    begin
      r_Rx_Data_R <= i_Rx_Serial;
      r_Rx_Data   <= r_Rx_Data_R;
    end


  // Purpose: Control RX state machine
  always @(posedge i_Clock)
    begin

      case (r_SM_Main)
        s_IDLE :
          begin
            r_Rx_DV       <= 1'b0;
            r_Clock_Count <= 0;
            r_Bit_Index   <= 0;

            if (r_Rx_Data == 1'b0)          // Start bit detected
              r_SM_Main <= s_RX_START_BIT;
            else
              r_SM_Main <= s_IDLE;
          end

        // Check middle of start bit to make sure it's still low
        s_RX_START_BIT :
          begin
            if (r_Clock_Count == (CLKS_PER_BIT-1)/2)
              begin
                if (r_Rx_Data == 1'b0)
                  begin
                    r_Clock_Count <= 0;  // reset counter, found the middle
                    r_SM_Main     <= s_RX_DATA_BITS;
                  end
                else
                  r_SM_Main <= s_IDLE;
              end
            else
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_RX_START_BIT;
              end
          end // case: s_RX_START_BIT


        // Wait CLKS_PER_BIT-1 clock cycles to sample serial data
        s_RX_DATA_BITS :
          begin
            if (r_Clock_Count < CLKS_PER_BIT-1)
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_RX_DATA_BITS;
              end
            else
              begin
                r_Clock_Count          <= 0;
                r_Rx_Byte[r_Bit_Index] <= r_Rx_Data;

                // Check if we have received all bits
                if (r_Bit_Index < 7)
                  begin
                    r_Bit_Index <= r_Bit_Index + 1;
                    r_SM_Main   <= s_RX_DATA_BITS;
                  end
                else
                  begin
                    r_Bit_Index <= 0;
                    r_SM_Main   <= s_RX_STOP_BIT;
                  end
              end
          end // case: s_RX_DATA_BITS


        // Receive Stop bit.  Stop bit = 1
        s_RX_STOP_BIT :
          begin
            // Wait CLKS_PER_BIT-1 clock cycles for Stop bit to finish
            if (r_Clock_Count < CLKS_PER_BIT-1)
              begin
                r_Clock_Count <= r_Clock_Count + 1;
                r_SM_Main     <= s_RX_STOP_BIT;
              end
            else
              begin
                r_Rx_DV       <= 1'b1;
                r_Clock_Count <= 0;
                r_SM_Main     <= s_CLEANUP;
              end
          end // case: s_RX_STOP_BIT


        // Stay here 1 clock
        s_CLEANUP :
          begin
            r_SM_Main <= s_IDLE;
            r_Rx_DV   <= 1'b0;
          end


        default :
          r_SM_Main <= s_IDLE;

      endcase
    end

  assign o_Rx_DV   = r_Rx_DV;
  assign o_Rx_Byte = r_Rx_Byte;

endmodule // uart_rx
