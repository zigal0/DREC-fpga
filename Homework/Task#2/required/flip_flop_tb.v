`timescale 1ns / 10ps
`include "flip_flop.v"

module flip_flop_tb();

realtime period = 10;
reg     clk;
integer j;

reg     D;
wire    Q;
wire    Qn;


always #(period/2) clk <= ~clk;

flip_flop flip_flop_inst(D, clk, Q, Qn);

initial begin
    
    $dumpfile("flip_flop_tb.vcd");
    $dumpvars(0, flip_flop_tb);

    clk = 1'b0;

    for (j = 0; j < 30; j = j + 1)
    begin
        D = $random;
        #(25);
    end

    // $display("Test complete");
    $finish;
end

// task flip_flop_test(
//     inout D,
//     input realtime  delay,
//     input integer iterations
// );

// integer  i;


// begin
//     for (i = 0; i < iterations; i = i + 1)
//     begin
//         #(delay);
//         D = ~D;
//     end
// end

// endtask

endmodule