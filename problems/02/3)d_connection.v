module d_connection (
input clk, D,
output Q, nQ);

wire D2; // вход защелки slave
wire a; // ~clk
wire QM; // выход защелки master

NOT not1(.out(a), .in1(clk));
d_latch d_slave (.D(D2), .E(clk), .Q(Q), .nQ(nQ));
d_latch d_master(.D(D), .E(a), .Q(D2)); 

endmodule
