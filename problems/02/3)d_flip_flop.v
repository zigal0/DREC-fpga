module d_flip_flop(
input D, clk,
output reg Q, 
output reg nQ);


always @(posedge clk)
begin
	Q <= D;
	nQ <= !D;
end

endmodule
