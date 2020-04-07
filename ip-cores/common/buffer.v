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

module BufferCC_3_ (
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

module BufferCC_5_ (
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

module BufferCC_9_ (
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

module BufferCC_17_ (
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
