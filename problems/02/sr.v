module sr(
input s, r,
output Q, nQ);

nor2 my_nor1(.out(Q), .in1(r), .in2(nQ));
nor2 my_nor2(.out(nQ), .in1(s), .in2(Q));


endmodule
