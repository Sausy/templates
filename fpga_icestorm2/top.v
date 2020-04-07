// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
    input CLK,    // 16MHz clock
    input io_uart_rxd,
    output io_uart_txd,

    inout io_e_0,
    inout io_d_0,
    inout io_e_1,
    inout io_d_1,
    inout io_e_2,
    inout io_d_2,
    inout io_e_3,
    inout io_d_3,

    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
    wire clk48MHz;
    wire pll_looked;

    pll upll1(
      .clock_in   (CLK),
      .clock_out  (clk48MHz),
      .locked     (pll_looked)
    )/* synthesis syn_noprune=1 */;

    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    ////////
    // make a simple blink circuit
    ////////

    // keep track of time and location in blink_pattern
    reg [25:0] blink_counter;

    // pattern that will be flashed over the LED over time
    wire [31:0] blink_pattern = 32'b101010001110111011100010101;

    // increment the blink_counter every clock
    always @(posedge CLK) begin
        blink_counter <= blink_counter + 1;
    end

    // light up the LED according to the pattern
    assign LED = blink_pattern[blink_counter[25:21]];




    LighthouseTopLevel uinterf(
      .Core_clk     (clk48MHz),//(iCLK_delayed),
      .io_e_0       (io_e_0),
      .io_e_1       (io_e_1),
      .io_e_2       (io_e_2),
      .io_e_3       (io_e_3),
      .io_d_0       (io_d_0),
      .io_d_1       (io_d_1),
      .io_d_2       (io_d_2),
      .io_d_3       (io_d_3),
		  .io_uart_txd  (io_uart_txd),
		  .io_uart_rxd  (io_uart_rxd)
    )/* synthesis syn_noprune=1 */;


endmodule
