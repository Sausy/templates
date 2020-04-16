module tri_state (
    input CLK,
    inout pin,
    input out,
    input oe,
    output in
  );

  //assign in = io_d_0;
  /*assign pin = (oe) ?  out : 1'bz;

  always @ ( posedge CLK ) begin
      in <= pin;
  end*/
  /*
  SB_IO #(
      .PIN_TYPE(6'b1010_01),
      .PULLUP(1'b0)
  ) tri_d0 (
      .PACKAGE_PIN(io_d_0),
      .OUTPUT_ENABLE(d_oe[0]),
      .D_OUT_0(d_output[0]),
      .D_IN_0(d_input[0])
  );*/

  SB_IO #(
      .PIN_TYPE(6'b1010_01),
      .PULLUP(1'b0)
  ) tri_d0 (
      .PACKAGE_PIN(pin),
      .OUTPUT_ENABLE(oe),
      .D_OUT_0(out),
      .D_IN_0(in)
  );

endmodule // tri_state
