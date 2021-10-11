
`include "sr_latch.v"

module sr_latch_tb;

reg S;
reg R;
wire Q;
wire Qn;

// sr_latch latch(S, R, Q, Qn);
sr_latch sr_latch_inst(
    .R(     R),
    .S(     S),
    .Q(     Q),
    .Qn(    Qn)
);

initial begin
    
    $dumpfile("sr_latch_tb.vcd");
    $dumpvars(0, sr_latch_tb);

    S = 1;
    R = 0;
    #20;

    R = 1;
    S = 0;
    #20;
    R = 0;
    S = 0;

    $display("Test complete");
end

endmodule