module d_latch(
input D, E,
output Q, nQ);

wire a1;
wire b1;
wire b2;

NOT not1 (.out(a1), .in(D));
AND and1 (.out(b1), .in1(a1), .in2(E));
AND and2 (.out(b2), .in1(E), .in2(D));


sr srlatch(.s(b2), .r(b1), .Q(Q), .nQ(nQ));

endmodule
