//=========
//===[MAIN MODUL]========
//=======================
module TS4231_init #(parameter CLK_FREQ_HZ = 48_000_000)
  (
    input clk,
    input clk_slow,  // clock
    input reset,  // reset

    input d_io,
      output reg oD_state_out = 0,
      output reg oD_out = 0,
    input e_io,
      output reg oE_state_out = 0,
      output reg oE_out = 1,

    output [0:14] cfg_data_reply,
    output cfg_done,
    output debug_flag_read_done,
    output debug_flag_write_done,

    input CONFIG_inital_delay,

    output [15:0] debug_LUT_cnt,
    output debug_cstatus,
    output debug_nstatus,
    output debug_difclk
  );

  //==== BASIC ENABLE/DISABLE block ======

  reg flag_start_config = 0;

  wire clock;
    assign clock = (flag_start_config)? 1'b0:clk;
  wire clock_slow;
    assign clock_slow = (flag_start_config)? 1'b0:clk_slow;


  reg [21:0] delayed_cnt_CLK = 0;
  always @ (posedge clk_slow, posedge reset) begin
   if(reset)begin
     delayed_cnt_CLK <= 0;
     flag_start_config <= 0;
   end else begin
      if(CONFIG_inital_delay)
        delayed_cnt_CLK <= delayed_cnt_CLK + 1;

     if(delayed_cnt_CLK == 32'd4194176)begin
       flag_start_config <= 1;
       delayed_cnt_CLK <= 32'd4194176;
     end
   end
  end



  /*
  parameter   real DELAY_short_ns = 200;
    localparam  real DELAY_CoreCLK_ns = 1_000_000_000 / CLK_FREQ_HZ;
    localparam  real DELAY_short_CNT = DELAY_short_ns/DELAY_CoreCLK_ns;
  parameter   real T_lighthouse_ms = 200;




  wire clk_halfe_main;
    reg reg_clk_halfe_main = 1'b0;
    assign clk_halfe_main = reg_clk_halfe_main;

  assign clock_out = (counter<DELAY_short_CNT/2)?1'b0:1'b1;//clock_out_reg;

     always @(posedge clock)
       counter <= counter + 32'd1;
       if(counter>=(DELAY_short_CNT-32'd1))begin
         counter <= 32'd0;
       end

     end

  reg [7:0] clk_div_cnt = 0;
  always @(posedge clock) begin : half_clk
      clk_div_cnt <= clk_div_cnt + 1;
      reg_clk_halfe_main <= !reg_clk_halfe_main;
  end
  */


  localparam ISOUT = 1;
  localparam ISIN = 0;



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



  //config length = 14 ... !!!
  //Config  = (0x392B << 1) == 7256
  localparam [0:14]config_value = 16'h392B; //shall be sent from the begining to the and ... starting with 3 1

  reg [0:19] LUT_E_INIT_INOUT   = 20'b0111_1111_1000_0000_0000; // //b0011_1111_1111_1111_1110
  reg [0:19] LUT_E_INIT         = 20'b0010_0111_1111_1111_1111; //  //b0000_1110_0011_1111_1111
  //first block init_w/r_cfg-data(16bit))
  //(init)_(w/r)_cfg_cfg_cfg
  //config _data 0011_1001_0010_1011
  reg [0:19] LUT_D_INIT_INOUT  =  20'b0000_0011_0000_0000_0000; // // b0000_0000_0000_0111_1110
  reg [0:19] LUT_D_INIT        =  20'b0100_0001_1000_1111_1111; // // b0000_0000_0000_0000_1111


  reg [0:47] LUT_E_INOUT        = 48'b0111_1111_11111111_11111111_11111111_111111_111111_1110;// b0011_1111_11111111_11111111_11111111_111111_111111_1110
  reg [0:47] LUT_E              = 48'b0111_1000_10101010_10101010_10101010_101010_000111_1111; //0111    b0011_1010_10101010_10101010_10101010_101010_111111_1110
  //first block init_w/r_cfg-data(16bit))
  //(init)_(w/r)_cfg_cfg_cfg
  //config _data 0011_1001_0010_1011
  reg [0:47] LUT_D_INOUT        = 48'b0011_1111_11111111_11111111_11111111_111111_111111_1110;//    b0001_1111_11111111_11111111_11111111_111111_111111_1110
  reg [0:47] LUT_D              = 48'b0011_0000_00111111_00001100_00110011_001111_000000_1111;//    b0001_0000_00111111_00001100_00110011_001111_111100_0000


  reg [0:51] LUT_E_READ_INOUT   = 52'b0111_1111_1111_11111111_11111111_11111111_111111_111111_1110;// b0011_1111_11111111_11111111_11111111_111111_111111_1110
  reg [0:51] LUT_E_READ         = 52'b1111_1000_1100_10101010_10101010_10101010_101010_000011_1111;// b0011_1010_10101010_10101010_10101010_101010_111001_1111
  //first block init_w/r_cfg-data(16bit))
  //(init)_(w/r)_cfg_cfg_cfg
  //config _data 0011_1001_0010_1011
  reg [0:51] LUT_D_READ_INOUT  =  52'b0011_1111_1000_00000000_00000000_00000000_000000_001111_1110;//b0011_1110_00000000_00000000_00000000_000000_111111_1111
  reg [0:51] LUT_D_READ        =  52'b1110_0011_1111_00000000_00000000_00000000_000000_000000_1111;// b0011_0011_00000000_00000000_00000000_000000_011100_0000

  //Trigger Watch_State
  reg [0:15] LUT_E_WATCH_INOUT   = 16'b0111_1000_0000_0000; //b0111_1100_0000_0000 //b0011_1000_0000_0000
  reg [0:15] LUT_E_WATCH         = 16'b1100_1100_0000_0000; // b1110_0111_0000_0000 //b1000_1100_0000_0000
  //first block init_w/r_cfg-data(16bit))
  //(init)_(w/r)_cfg_cfg_cfg
  //config _data 0011_1001_0010_1011
  reg [0:15] LUT_D_WATCH_INOUT  =  16'b0011_0000_0000_0000; //b0011_1000_0000_0000 // b0111_0000_0000_0000
  reg [0:15] LUT_D_WATCH        =  16'b1110_0000_0000_0000; //b111_0000_0000_0000 //b1110_0000_0000_0000

  reg [0:15] read_back_data;

  //localparam  LUT_STATE_WAIT = param_value;

  //regs for IN-OUT
  //reg e_state_out = 1;
  //reg D_out = 0;
  reg E_out_del = 0;
  reg E_state_out_del = 0;
  reg E_out = 0;
  reg E_state_out = 0;
  //reg E_out_delayed = 0;

  reg flag_E_delayed = 0;

  assign oE_out = (flag_E_delayed)?E_out_del:E_out;
  assign oE_state_out = (flag_E_delayed)?E_state_out_del:E_state_out;

  //assign d_io = (d_state_out)?D_out:1'bz;
  //assign e_io = (e_state_out)?E_out_delayed:1'bz;

  //===========================================

  reg [15:0] e_out_delay_cnt = 0;
  always @(posedge clock, posedge reset) begin: output_to_clk_delay
    if(reset)begin
      //oE_out <= 1;
      e_out_delay_cnt <= 0;
    end else begin
      e_out_delay_cnt <= e_out_delay_cnt + 1;
      if(e_out_delay_cnt >= 8'd3)begin
        E_out_del <= E_out;
        E_state_out_del <= E_state_out;
        e_out_delay_cnt <= 0;
      end
    end
  end


  //===========================================

  //===========================================

  reg flag_restart_watch;
  reg flag_restart_watch_approved;
  reg [31:0] watch_time_out;





  //===========================================
  reg [15:0] LUT_cnt = 16'd0;

  reg flag_startup_trigger_delay = 0;
  reg flag_allow_write = 0;
  reg flag_allow_read = 0;
  reg flag_write_done = 0;
  reg flag_read_done = 0;
  reg flag_LUT_overflow_triggerd = 0;

  reg flag_data_recording;
  reg flag_data_recording_done;


  reg flag_lighthouse_detected = 0;
  reg [0:14] reg_cfg_data_reply = 0;
  reg flag_cfg_done = 0;
  //assign outputs with ther responding regs
  assign lighthouse_detected  = flag_lighthouse_detected;
  assign cfg_data_reply       = reg_cfg_data_reply;//sync_reg;//reg_cfg_data_reply;
  assign cfg_done             = flag_cfg_done;


  reg [0:15] sync_reg;
  reg [15:0] foo_cnt = 0;

  reg loopBACK_wasHIGH;
  //reg loopBACK_wasLOW;
  reg [7:0] cnt_highlow_swaps;
  reg flag_init_done;

  //TODO...when D never goes to LOW TS43231 chip needs to be reseted
  //BASICLY a timeouta

  //reg reg_d_io
  reg flag_time_out_triggerd =0;
  reg [15:0] reg_time_out = 0;
  reg flag_first_boot = 0;
  always @(posedge clock, posedge reset)begin: sync_block//posedge dif_clk, posedge reset) begin: sync_block
    if(reset)begin
        cnt_highlow_swaps <= 0;
        loopBACK_wasHIGH  <= 0;
        flag_init_done <= 0;
        sync_reg <= 0;
        reg_time_out <= 0;
        flag_time_out_triggerd <= 0;
        flag_first_boot <= 0;
        //loopBACK_wasLOW   <= 0;
    end else begin

      /*
        if(hard_reset_ts4321)begin
          if(!flag_lighthouse_detected)begin
            //reg_time_out <= reg_time_out + 1;
            if(!oD_state_out)begin
              if(flag_first_boot)begin
                if(d_io == 1'b1) begin
                  loopBACK_wasHIGH <= 1;
                  sync_reg <= 16'h0001 | sync_reg;

                  if(loopBACK_wasHIGH)
                    sync_reg <= 16'hf000 | sync_reg;

                end else if (d_io == 1'b0) begin //if(d_io == 1'b1) begin
                  sync_reg <= 16'h00f0 | sync_reg;
                  loopBACK_wasHIGH <= 0;
                  if(loopBACK_wasHIGH)begin
                    reg_time_out <=0;
                    cnt_highlow_swaps <= cnt_highlow_swaps + 1;
                  end
                end//if(d_io == 1'b1) begin
              end else begin  //if(!flag_first_boot)begin
                  flag_first_boot <= 1;
                  sync_reg <= 16'hb00b;
                  if(d_io == 1'b1) begin
                    flag_first_boot <= 0;
                    flag_init_done <= 1;
                    sync_reg <= 16'haaa0 | (16'h000f & sync_reg);
                  end else begin
                    if(e_io == 1'b1) begin
                      flag_first_boot <= 0;
                      flag_init_done <= 1;
                      sync_reg <= 16'hbbb0 | (16'h000f & sync_reg);
                    end
                  end
              end//if(!flag_first_boot)begin
            end
            if(cnt_highlow_swaps >= 8'd4)begin
              cnt_highlow_swaps   <= 8'd5;
              flag_init_done      <= 1;
            end
          end
        end else begin
          flag_init_done <=0;
          cnt_highlow_swaps <= 8'd0;
          reg_time_out <= 0;
        end*/
        /*
          if(reg_time_out >= 16'd6100)begin
            reg_time_out <= 0;
            flag_time_out_triggerd <= 1;
            sync_reg <= 16'h0f00 | sync_reg;
          end*/

    end
  end

  always @(posedge oE_out, posedge reset)begin: reply_sync//posedge dif_clk, posedge reset) begin: sync_block
    if(reset)begin
        reg_cfg_data_reply <= 0;
    end else begin
      //DEBUG:Coment for normal
      //flag_data_recording <= 1;
      if(flag_allow_read)begin
        if(!oD_state_out)begin
          if(LUT_cnt <= 16'd37)begin
            if(LUT_cnt >= 16'd8)begin
              //flag_data_recording <= 1;
               //E is shiftet by one clock impuls ... and the low impuls is important there for data is greped befor we switch to high.
              if(d_io == 1'b1)begin
                  reg_cfg_data_reply <= (reg_cfg_data_reply<<1) | 1;//LUT_D_INOUT[LUT_cnt]<<LUT_cnt;//(reg_cfg_data_reply << 1) | LUT_D_INOUT[LUT_cnt]; //

              end else if(d_io == 1'b0) begin
                  reg_cfg_data_reply <= (reg_cfg_data_reply<<1) | 0;
              end

            end else begin
              //reg_cfg_data_reply <= 0;
            end
          end  //else begin ///if(LUT_cnt <= 16'd36)begin

          //end
        end//if(!oD_state_out)begin
      end//if(flag_allow_read)begin
    end
  end

  reg [31:0] IDLE_CNT = 0;

  reg [31:0] INIT_IDLE = 0;
  reg [31:0] INIT_CNT_LUT = 0;

  reg [15:0] POST_CNT = 0;

  reg flag_start_post = 0;

  always @(posedge clock_slow, posedge reset) begin: INIT
    if(reset)begin
      LUT_cnt <= 16'd0;
      oD_state_out <= 0;
      E_state_out <= 0;
      oD_out <= 0;
      E_out <= 1;
      flag_write_done <= 0;
      flag_read_done <= 0;
      flag_allow_write <= 0;
      flag_allow_read <= 0;
  		flag_startup_trigger_delay <= 0;
  		flag_data_recording <= 0;
  		flag_lighthouse_detected <= 0;
  		flag_data_recording_done <= 0;
      flag_cfg_done <= 0;
		  //reg_cfg_data_reply <=16'd0;// 16'h392B;
      //sync_reg <= 16'h0010;
      //hard_reset_ts4321 <= 0;
      flag_restart_watch_approved <= 0;
      //hard_reset_delay <= 0;
      flag_LUT_overflow_triggerd <= 0;


      flag_E_delayed <= 0;
    end else begin//if (dif_clk) begin
		  if(!flag_write_done)begin
          flag_start_post <= 0;
          flag_cfg_done <= 0;
          flag_read_done <= 0;
          if(flag_allow_write)begin
            LUT_cnt <= LUT_cnt + 16'd1;
          end else begin
            //hard_reset_delay
            LUT_cnt <= 16'd0;
            //if(hard_reset_ts4321 == 1'b0)begin
            //  hard_reset_ts4321 <= 1;
            //end else begin
              /*if(flag_init_done)begin
                flag_lighthouse_detected <= 1;
                flag_allow_write <= 1;
              end*/
            //end
          end

          oD_state_out <= LUT_D_INOUT[LUT_cnt];
          E_state_out <= LUT_E_INOUT[LUT_cnt];
          oD_out <= LUT_D[LUT_cnt];
          E_out <= LUT_E[LUT_cnt];

//always @ (posedge clk24MHz) begin : IDLE_RECONFIG
        	INIT_IDLE <= INIT_IDLE + 1;
          if(!flag_allow_write) begin
          	if(INIT_IDLE >= 32'd60000)begin
              flag_E_delayed <= 1;
              if(INIT_IDLE <= 32'd60100)begin
                oD_state_out <= LUT_D_INIT_INOUT[INIT_CNT_LUT];
                E_state_out <= LUT_E_INIT_INOUT[INIT_CNT_LUT];
                oD_out <= LUT_D_INIT[INIT_CNT_LUT];
                E_out <= LUT_E_INIT[INIT_CNT_LUT];
              end else begin
                INIT_CNT_LUT <= INIT_CNT_LUT + 1;
                if(INIT_CNT_LUT == 8'd19)begin
                  INIT_CNT_LUT <= 8'd19;
                end else begin
                  INIT_IDLE <= 32'd60000;
                end

              end
              if(INIT_IDLE == 32'd70100)begin
                flag_lighthouse_detected <= 1;
                flag_allow_write <= 1;
              end

          	end


            /*
            if(LUT_cnt == 3)begin
              #1000;
            end
            if(LUT_cnt == 4)begin
              #1000;
            end
            if(LUT_cnt == 5)begin
              #1000;
            end*/



          end


  				/*//DEBUG:Coment for normal
  				if(LUT_cnt <= 16'd36)begin
  					if(LUT_cnt >= 16'd8)begin
  						flag_data_recording <= 1;
              if(LUT_E_READ[LUT_cnt] == 1)begin //E is shiftet by one clock impuls ... and the low impuls is important there for data is greped befor we switch to high.
                sync_reg <= (sync_reg<<1) | LUT_D[LUT_cnt];//LUT_D_INOUT[LUT_cnt]<<LUT_cnt;//(reg_cfg_data_reply << 1) | LUT_D_INOUT[LUT_cnt]; //
              end
  					end //else begin
            //  reg_cfg_data_reply <= 0;
            //end
  				end// else begin
  				//	flag_data_recording_done <= 1;
  				//end
          //==========
*/
          //reg_cfg_data_reply <= LUT_cnt;
          /*
          if(LUT_cnt <= 16'd36)begin
            reg_cfg_data_reply <= 16'haaaa;
            if(LUT_cnt >= 16'd8)begin
              reg_cfg_data_reply <= 16'hcccc;
            end
          end else begin
            reg_cfg_data_reply <= 0;
          end

          if(LUT_cnt >= 16'd8)begin
            reg_cfg_data_reply <= 16'hcccc;
          end*/





          /*
          if(!flag_time_out_triggerd)begin
            if(reg_time_out >= 16'd4000)begin
              oD_out <= 0;
              oD_state_out <= 1;
              LUT_cnt <= 0;
            end
            if(reg_time_out >= 16'd5000)begin
              E_out <= 1;
              E_state_out <= 1;
              LUT_cnt <= 0;
            end
          end*/

          if(LUT_cnt == 16'd47)begin
            LUT_cnt <= 0;
            flag_allow_write <= 0;
            flag_write_done <= 1;
    				flag_read_done <= 0;
    				flag_data_recording <= 0;
            //reg_cfg_data_reply <= 0;
            flag_allow_read <= 0;
            //hard_reset_ts4321 <= 0;
            //DEBUG
            //flag_cfg_done <= 1;
            //flag_allow_read <= 1;
            //flag_read_done <= 1;
          end
        end else begin
  		    if(!flag_read_done)begin
    				 if(flag_allow_read)begin
    				     LUT_cnt <= LUT_cnt + 16'd1;
    				 end else begin
      					oD_state_out <= 0;
      					E_state_out <= 0;
      					LUT_cnt <= 0;
    					//if(e_io)begin
    					  flag_allow_read <= 1;
    					//end
    				 end
    				 oD_state_out <= LUT_D_READ_INOUT[LUT_cnt];
    				 E_state_out <= LUT_E_READ_INOUT[LUT_cnt];
    				 oD_out <= LUT_D_READ[LUT_cnt];
    				 E_out <= LUT_E_READ[LUT_cnt];


    				 if(LUT_cnt == 16'd51)begin
      					LUT_cnt <= 0;
                flag_allow_read <= 0;
      					flag_read_done <= 1;
      					flag_start_post <= 1;
      					flag_data_recording_done <= 0;
      					flag_data_recording <= 0;
                flag_LUT_overflow_triggerd <= 1;
                IDLE_CNT <= 0;
    				 end
          end
        end
        if(flag_start_post)begin

          IDLE_CNT <= IDLE_CNT + 1;
          if(IDLE_CNT >= 32'd20000)begin
            POST_CNT <= POST_CNT + 1;


            case (POST_CNT)
              8'd0  : E_out         <= 1;
              8'd1  : E_state_out   <= 1;
              8'd2  : oD_out        <= 1;
              8'd3  : oD_state_out  <= 1;
              8'd4  : E_out         <= 0;
              8'd5  : oD_out        <= 0;
              8'd6  : oD_state_out  <= 0;
              8'd7  : E_out         <= 1;
              8'd8  : E_state_out   <= 0;
              8'd9  : flag_cfg_done <= 1;
              default : POST_CNT <= 8'd20;
            endcase
            /*
            case (POST_CNT)
              8'd0  : oD_out        <= 1;
              8'd1  : oD_state_out  <= 1;
              8'd2  : E_out         <= 0;
              8'd3  : E_state_out   <= 1;
              8'd4  : oD_out        <= 0;
              8'd5  : oD_state_out  <= 0;
              8'd6  : E_out         <= 1;
              8'd7  : E_state_out   <= 0;
              8'd8  : ;
              8'd9  : ;
              default : POST_CNT <= 8'd20;
            endcase
            */
            if(IDLE_CNT == 32'd20020)begin
              LUT_cnt <= LUT_cnt + 1;
              IDLE_CNT <= 32'd20000;
            end

            if(LUT_cnt == 16'd15)begin
               LUT_cnt <= 16'd15;
               IDLE_CNT <= 0;
            end






          end


        end
    end
  end



  //----- [DEBUG STUFF] -----
  /*always @(posedge clock) begin: DEBUG_DATA
		debug_cstatus <= 1;
		//debug_nstatus <=
		debug_difclk <= dif_clk;
		//debug_flag_read_done <=
		debug_flag_write_done <= flag_allow_write;
  end*/
  //assign debug_difclk = dif_clk;
  assign debug_flag_write_done = flag_write_done;//flag_allow_read;//flag_write_done;//flag_write_done;
  assign debug_flag_read_done = flag_read_done;
  assign debug_cstatus = LUT_D[LUT_cnt];
  assign debug_nstatus = flag_LUT_overflow_triggerd;
  assign debug_LUT_cnt = sync_reg;

endmodule

/*module ts4231Configurator (
  input clk,

  input reconfigure,
  output reg configured,

  input d_in,
  output reg d_out = 0,
  output reg d_oe = 0,

  input e_in,
  output reg e_out = 0,
  output reg e_oe = 0
);

  reg config_enable = 0;
  reg [5:0] config_enable_crt = 0;
  always @(posedge clk) begin
    if (config_enable_crt == 23) begin
      config_enable_crt <= 0;
      config_enable <= 1;
    end else begin
      config_enable_crt <= config_enable_crt + 1;
      config_enable <= 0;
    end
  end

  // Configuration state machine
  initial configured = 0;

  localparam CONFIG_IDLE = 0;
  localparam CONFIG_WAIT_PULSE = 1;
  localparam CONFIG_START_CFG = 2;
  localparam CONFIG_WRITE_START = 3;
  localparam CONFIG_WRITE_E_LOW = 4;
  localparam CONFIG_WRITE_BIT = 5;
  localparam CONFIG_WRITE_E_HIGH = 6;
  localparam CONFIG_WRITE_STOP = 7;
  localparam CONFIG_WATCH_ELOW = 8;
  localparam CONFIG_WATCH_DLOW = 9;
  localparam CONGIG_WATCH_EHIGH = 10;

  reg [3:0] config_state = CONFIG_IDLE;

  reg prev_reconfigure = 0;
  reg config_prev_d = 0;
  reg [5:0] config_bit_counter = 0;
  reg [14:0] config_value = {14'h392b, 1'b0};
  reg config_bit = 0;
  always @(posedge clk) begin
    if (config_enable) begin
      prev_reconfigure <= reconfigure;
      config_prev_d <= d_in;

      case (config_state)
        CONFIG_IDLE: if (prev_reconfigure == 0 && reconfigure == 1) config_state <= CONFIG_WAIT_PULSE;
        CONFIG_WAIT_PULSE: if (config_prev_d == 1 && d_in == 0) config_state <= CONFIG_START_CFG;
        CONFIG_START_CFG: config_state <= CONFIG_WRITE_START;
        CONFIG_WRITE_START: begin
          config_bit_counter <= 0;
          config_state <= CONFIG_WRITE_E_LOW;
        end
        CONFIG_WRITE_E_LOW: begin
          config_state <= CONFIG_WRITE_BIT;
          config_bit <= config_value[15-config_bit_counter];
        end
        CONFIG_WRITE_BIT: begin
          config_state <= CONFIG_WRITE_E_HIGH;
        end
        CONFIG_WRITE_E_HIGH: begin
          config_bit_counter <= config_bit_counter + 1;
          if (config_bit_counter == 15) config_state <= CONFIG_WRITE_STOP;
          else config_state <= CONFIG_WRITE_E_LOW;
        end
        CONFIG_WRITE_STOP: config_state <= CONFIG_WATCH_ELOW;
        CONFIG_WATCH_ELOW: config_state <= CONFIG_WATCH_DLOW;
        CONFIG_WATCH_DLOW: config_state <= CONGIG_WATCH_EHIGH;
        CONGIG_WATCH_EHIGH: begin
          config_state <= CONFIG_IDLE;
          configured <= 1;
        end
      endcase
    end
  end

  always @* begin
    (* parallel_case *)
    case (config_state)
      CONFIG_START_CFG: begin
        e_out = 1;
        e_oe  = 1;
        d_out = 0;
        d_oe  = 0;
      end
      CONFIG_WRITE_START: begin
        e_out = 1;
        e_oe  = 1;
        d_out = 0;
        d_oe  = 1;
      end
      CONFIG_WRITE_E_LOW, CONFIG_WRITE_BIT: begin
        e_out = 0;
        e_oe  = 1;
        d_out = config_bit;
        d_oe  = 1;
      end
      CONFIG_WRITE_E_HIGH: begin
        e_out = 1;
        e_oe  = 1;
        d_out = config_bit;
        d_oe  = 1;
      end
      CONFIG_WRITE_STOP: begin
        e_out = 1;
        e_oe  = 1;
        d_out = 1;
        d_oe  = 1;
      end
      CONFIG_WATCH_ELOW: begin
        e_out = 0;
        e_oe  = 1;
        d_out = 1;
        d_oe  = 1;
      end
      CONFIG_WATCH_DLOW: begin
        e_out = 0;
        e_oe  = 1;
        d_out = 0;
        d_oe  = 1;
      end
      CONGIG_WATCH_EHIGH: begin
        e_out = 1;
        e_oe  = 1;
        d_out = 0;
        d_oe  = 1;
      end
      default: begin
        d_out = 0;
        d_oe  = 0;
        e_out = 1;
        e_oe  = 0;
      end
    endcase
  end
endmodule
*/
