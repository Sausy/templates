module clock_divider (
      input clock_in,
      input reset,
      output clock_out
      //input [27:0] divider
    )/* synthesis syn_noprune=1 */;
    reg[31:0] counter=32'd0;
    //TODO: !!!! CHANGED FOR DEBUG
	 parameter DIVISOR = 32'd10;
	 //DEBUG: !!!!
	 //parameter DIVISOR = 28'd4;

    always @(posedge clock_in, posedge reset)
      if(reset)begin
        counter <= 0;
      end else begin
        counter <= counter + 32'd1;
        if(counter>=(DIVISOR-32'd1))begin
          counter <= 32'd0;
        end
      end

    assign clock_out = (counter<DIVISOR/2)?1'b0:1'b1;//clock_out_reg;
endmodule

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
|       Debug DATA        	  |
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
module uartCTL (
	input clk,

	input [7:0] cmd,
	input [7:0] custom_cmd,
	input [15:0] data,

	output flag_allow_new_data,
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
reg [15:0] 	r_data = SYNC;

reg flag_frame_sent = 0;
always @ (posedge clk ) begin
		//if(flag_frame_sent)begin
			r_cmd					<= cmd;
			r_custom_cmd	<= custom_cmd;
			r_data 				<= data;
		//end
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

wire       o_Rx_DV;
wire [7:0] o_Rx_Byte;

reg [7:0]  rx_DATA [21:0];// = 8'd69;


uart_tx u1_tx(
	.i_Clock(clk),
	.i_Tx_DV(i_Tx_DV),
	.i_Tx_Byte(i_Tx_Byte),
	.o_Tx_Active(o_Tx_Active),
	.o_Tx_Serial(tx), ///TX PIN
	.o_Tx_Enable(o_Tx_Enable),
	.o_Tx_Done(o_Tx_Done)
)/* synthesis syn_noprune=1 */;



	reg   [7:0]     sendcounter = 0;
	reg   [7:0]     foo_cnt = 0;
	reg         		waitflag_tx = 0;
	reg 						r_flag_allow_new_data = 1;
	assign 					flag_allow_new_data = r_flag_allow_new_data;

	reg [31:0] out_data;
	//assign out_data = (r_custom_cmd<<24) | (r_cmd<<16) | r_data ;

	reg [4:0] cnt_sync = 0;
	reg [7:0]	init_data  = 8'hff;
	reg flag_init_done = 0;

	always @(posedge clk) begin
		waitflag_tx <= o_Tx_Done & !o_Tx_Active;
		i_Tx_DV <= 0;
		if(waitflag_tx == 1)begin
				sendcounter <= sendcounter + 1;
				flag_frame_sent <= 0;
				r_flag_allow_new_data <= 0;
				case(sendcounter)
					 8'd0: i_Tx_Byte <= out_data[31:24];
					 8'd1: i_Tx_Byte <= out_data[23:16];
					 8'd2: i_Tx_Byte <= out_data[15:8];
					 8'd3: begin
					 					i_Tx_Byte <= out_data[7:0];
										flag_frame_sent <= 1;
										sendcounter <= 0;
										r_flag_allow_new_data <= 1;

										out_data <= (r_custom_cmd<<24) | (r_cmd<<16) | r_data ;
										//out_data <= 32'h00f1;
								end
					 default : begin
										i_Tx_Byte <= 8'h65;
										sendcounter <= 0;
										r_flag_allow_new_data <= 1;
				 				end
				endcase

				if(!flag_init_done)begin
					i_Tx_Byte <= init_data;
					cnt_sync <= cnt_sync + 1;
				end
				if(cnt_sync == 8'd12)begin
					flag_init_done <= 1;
					i_Tx_Byte <= 8'hff;
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

module uart_tx #(parameter CLK_FREQ_HZ = 48_000_000,parameter CLKS_PER_BIT=5000)//, BAUDRATE = 9600)
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
