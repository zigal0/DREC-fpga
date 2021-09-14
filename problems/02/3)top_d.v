module top_d(
input clk, D,
output Q, nQ);

d_flip_flop d_connection(.D(D), .clk(clk), .Q(Q), .nQ(nQ));

endmodule
