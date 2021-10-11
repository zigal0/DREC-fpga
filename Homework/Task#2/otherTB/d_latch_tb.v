
`include "d_latch.v"

module d_latch_tb;

reg D;
reg E;
wire Q;
wire Qn;

d_latch latch(D, E, Q, Qn);

initial begin
    
    $dumpfile("d_latch_tb.vcd");
    $dumpvars(0, d_latch_tb);

    E = 1;
    D = 0;
    #20;

    D = 1;
    #20;

    E = 0;
    #20;

    D = 0;
    #20;

    $display("Test complete");
end

endmodule