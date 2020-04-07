module ts4231 //#(parameter CLK_FREQ_HZ = 50_000_000)
  (
    input clock,  // clock
    input reset,  // reset

    inout d_io,
    inout e_io,

    output cfg_done,

    output debug_cstatus,
    output debug_nstatus,
    output debug_difclk,
    output debug_flag_read_done,
    output debug_flag_write_done
  );

  localparam ISOUT = 1;
  localparam ISIN = 0;

  wire dif_clk;
 // clock_divider u0 (clock, dif_clk);

  //since every waiting time exeds the precision of 50MHz a 100ns delay will be used.
  //100ns was chosen because it would also work on another testboard with 4MHz clk
  localparam T_WAIT_SETUP = CLK_FREQ_HZ/1_000_000;
    //Tstart 80 ns
    //Tpw    40 ns
    //Tsetup 15 ns
    //Thold  15 ns
    //Tend   80 ns
    //Tread  20 ns
  localparam BIT_TRANSMIT_FREQ = CLK_FREQ_HZ/1_000_000;//1MHz
  //Freq Input pulse 1-10 MHz

  localparam [15:0]config_value = 32'h392B; //shall be sent from the begining to the and ... starting with 3 1


  reg [0:47] LUT_E_INOUT  = 16'b0011_1111_11111111_11111111_11111111_11111111_1111_1000
  reg [0:47] LUT_E        = 16'b0011_1010_10101010_10101010_10101010_10101010_1111_1000
  //first block init_w/r_cfg-data(16bit))
  //(init)_(w/r)_cfg_cfg_cfg
  //config _data 0011_1001_0010_1011
  reg [0:47] LUT_D_INOUT  = 16'b0001_1111_11111111_11111111_11111111_11111111_1111_1000
  reg [0:47] LUT_D        = 16'b0000_0000_00001111_11000011_00001100_11001111_0001_1000


  reg [0:47] LUT_E_READ_INOUT   = 16'b0011_1111_11111111_11111111_11111111_11111111_1111_1000
  reg [0:47] LUT_E_READ         = 16'b0011_1010_10101010_10101010_10101010_10101010_1111_1000
  //first block init_w/r_cfg-data(16bit))
  //(init)_(w/r)_cfg_cfg_cfg
  //config _data 0011_1001_0010_1011
  reg [0:47] LUT_D_READ_INOUT  = 16'b0001_1111_00000000_00000000_00000000_00000000_1111_1000
  reg [0:47] LUT_D_READ        = 16'b0000_1111_00000000_00000000_00000000_00000000_0001_1000

  reg [0:15] read_back_data;

  //localparam  LUT_STATE_WAIT = param_value;

  //regs for IN-OUT
  reg d_state_out, e_state_out;
  reg D_out, E_out;
  reg E_out_delayed;

  assign d_io = (d_state_out)?D_out:1'bz;
  assign e_io = (e_state_out)?E_out_delayed:1'bz;

  always @(posedge clk, posedge reset) begin: output_to_clk_delay
    if(reset)begin
      E_out_delayed <= 0;
    end else begin
      E_out_delayed <= E_out;
    end
  end

  reg [15:0] LUT_cnt;
  reg flag_allow_write;
  reg flag_allow_read;
  reg flag_write_done;
  reg flag_read_done;
  always @(posedge dif_clk, posedge reset) begin: INIT
    if(reset)begin
      LUT_cnt <= 15'd0;
      init_flag <= 0;
      d_state_out <= 0;
      e_state_out <= 0;
      D_out <= 0;
      E_out <= 0;
      flag_write_done <= 0;
      flag_read_done <= 0;
      flag_allow_write <= 0;
      flag_allow_read <= 0;
    end else begin
        //TODO: ADD flag_write_done as parameter for if to allow input.
        //if(flag_write_done)begin
        /*
          if(flag_allow_read)begin
            LUT_cnt <= LUT_cnt + 15'd1;
          end else begin
            d_state_out <= 0;
            e_state_out <= 0;
            LUT_cnt <= 0;
            if(e_io)begin
              flag_allow_read <= 1;
            end
          end
          d_state_out <= LUT_E_INOUT[LUT_cnt];
          e_state_out <= LUT_D_INOUT[LUT_cnt];
          D_out <= LUT_D[LUT_cnt];
          E_out <= LUT_E[LUT_cnt];

          if(LUT_cnt == 15'd42)begin
            LUT_cnt <= 0;
            flag_read_done <= 1;
          end
        */
        //end else begin
          if(flag_allow_write)begin
            LUT_cnt <= LUT_cnt + 15'd1;
          end else begin
            LUT_cnt <= 0;
            if(e_io)begin
              flag_allow_write <= 1;
            end
          end
          d_state_out <= LUT_E_INOUT[LUT_cnt];
          e_state_out <= LUT_D_INOUT[LUT_cnt];
          D_out <= LUT_D[LUT_cnt];
          E_out <= LUT_E[LUT_cnt];

          if(LUT_cnt == 15'd42)begin
            LUT_cnt <= 0;
            flag_allow_write <= 0;
            flag_write_done <= 1;
          end
        //end
    end
  end


  endmodule
