`include "timescale.v"
module tb_ts4231;

reg         clock                   ;
reg         reset                   ;
wire        d_io                    ;
wire        e_io                    ;
wire        cfg_done                ;
wire        debug_cstatus           ;
wire        debug_nstatus           ;
wire        debug_difclk            ;
wire        debug_flag_read_done    ;

ts4231 uut (
    .clock                   (    clock                   ),
    .reset                   (    reset                   ),
    .d_io                    (    d_io                    ),
    .e_io                    (    e_io                    ),
    .cfg_done                (    cfg_done                ),
    .debug_cstatus           (    debug_cstatus           ),
    .debug_nstatus           (    debug_nstatus           ),
    .debug_difclk            (    debug_difclk            ),
    .debug_flag_read_done    (    debug_flag_read_done    )
);

parameter PERIOD = 10;

initial begin
    $dumpfile("db_tb_ts4231.vcd");
    $dumpvars(0, tb_ts4231);
    clock = 1'b0;
    #(PERIOD/2);
    forever
        #(PERIOD/2) clock = ~clock;
end

endmodule
