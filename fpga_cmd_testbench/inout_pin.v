module hello;
  reg clock;
  reg reset;
  wire io_pin;
  wire INOUT_PIN_wire;

  wire INOUT_PIN;

  parameter PERIOD = 10;
  integer i = 0;

  reg   [2:0]debug_reg = 0;
  wire  [2:0]debug_wire;
  /*
    dbg reg
    0: pin direction
    1: pin value

    dbg wire
    0: actual set io value
    1: nc

  */

  reg io_dir = 0;
  reg io_val = 0;

  reg [2:0] reply;
  reg reply_io;
  reg dbg_io_dat;

  tran (INOUT_PIN,io_pin);

  assign io_pin = (io_dir)?io_val:1'bz;
  //assign INOUT_PIN_wire =

  //tran (io_pin,INOUT_PIN_wire);

  m_A uA(clock,reset, io_pin, debug_reg, debug_wire);
  //m_C uC0(clock,reset, io_pin);

  wire uniDirWire;
  /*assign uniDirWire = (io_pin==1'b0) ?   1'b0 :
                      (io_pin==1'b1) ?   1'b1 :
                                     1'b0;
*/
  assign uniDirWire = (io_dir) ? io_pin:io_pin;
  //and t_a0(uniDirWire, foo1, foo2);
  //assign uniDirWire = foo1 & foo2;
  //and tor1(uniDirWire,1,io_pin);
  //assign uniDirWire = io_pin $;
  //assign uniDirWire = (io_pin == 1'bz)?0:io_pin;
  m_C uC1(clock,reset, uniDirWire);



  always @(posedge clock, posedge reset) begin: dbreply
      if(reset)begin
        dbg_io_dat <= 0;
      end else begin
        $display("value uin %b | value dbg_io_dat %b", uniDirWire, dbg_io_dat);
        if(io_pin)
          dbg_io_dat <= 1;
        else
          dbg_io_dat <= 0;
      end

  end

  initial
    begin
      $display("[value: given value of main]");
      clock = 1'b0;
      for (i = 0; i < 20; i = i + 1) begin
      	#(PERIOD/2) clock = 0;
        case (i)
          0:  reset = 1;
          1:  reset = 0;
          3:  debug_reg = 2'd1;
          6:  debug_reg = 2'd3;
          7:  debug_reg = 2'd2;
          8:  begin
                io_dir = 1;
                $display("INTERNAL IO to OUTPUT  ... EXTERNAL seen as INPUT");
              end
          9:  io_val = 1;
          10: io_dir = 0;
          11: begin
                $display("INTERNAL IO to INPUT  ... EXTERNAL seen as INPUT");
                debug_reg = 2'd0;
                io_dir = 1;
              end
          12: io_val = 1;
          13: begin
                $display("INTERNAL IO to INPUT  ... EXTERNAL seen as OUTPUT");
                io_dir = 0;
              end
        endcase

        #(PERIOD/2) clock = 1;
        #(PERIOD/2) clock = 0;
        #(PERIOD/2) clock = 1;
        #(PERIOD/2) clock = 0;
        reply = debug_wire;
        //reply_io = io_pin;

        $display("IO PIN: [%b:%b] | dir: [%b:%b] | val: [%b:%b]", io_val, io_pin, debug_reg[0], reply[0], debug_reg[1], reply[1]);
      	#(PERIOD/2) clock = 1;
        //$display("IO PIN: %b | ldir dir %b | val %b |CLK = 1", io_pin, io_dir, debug_reg);
      end
      $finish ;
    end
endmodule

//================================
module m_A(
	input clock,
	input reset,

	inout io,

  input  [2:0]debug_in,
  output [2:0]debug_out
);

  wire wio;
  reg dbg_io_dat;

  //assign wio = io;
  tran (wio,io);

  always @(posedge clock, posedge reset) begin: dbinfo
      if(reset)begin
        dbg_io_dat <= 0;
      end else begin
        if(wio)
          dbg_io_dat <= 1;
        else if (!wio)
          dbg_io_dat <= 0;
        else
          dbg_io_dat <= 1'bz;
      end

      //$display("  PIN: %b | 1 IO PIN2: %b", dbg_io_dat, debug_out[1]);
  end


  m_B uB(clock,reset,wio, debug_in, debug_out);

endmodule

//================================
module m_B(
	input clock,
	input reset,

	inout io,

  input  [2:0]debug_in,
  output reg [2:0]debug_out
);

reg io_dir;
reg io_val;

assign io = (io_dir)?io_val:1'bz;

always @(posedge clock, posedge reset) begin: dbgroutin
    if(reset)begin
      io_dir <= 0;
      io_val <= 0;
      debug_out[1] <= 0;
    end else begin
      io_dir <= debug_in[0];
      io_val <= debug_in[1];
      debug_out[0] <= io_dir;
      debug_out[1] <= io_val;
      /*if(io)
        debug_out[1] <= 1;
      else if (!io)
        debug_out[1] <= 0;
      else
        debug_out[1] <= 1'bz;*/

      //$display("2 IO PIN: %b | dir %b | val %b", debug_out[1], debug_in[0], debug_in[1]);
    end
end


endmodule

module m_C (
    input clock,
    input reset,

    input data
  );

  always @(posedge clock, posedge reset) begin: Cloop

    if(reset)begin
    end else begin
      $display("DATA %b", data);
    end

  end

endmodule // m_C
