

module d_flip_flop_tb();

reg D;
reg clk;
wire Q ;
wire nQ;

top_d i1(.D(D), .clk(clk), .Q(Q), .nQ(nQ));
initial
begin
	D = 0;
	clk = 0;
	#5 D = 1;
	#5 D = 0;
	#5 D = 1;
	#10 D = 0;
	#15 D = 1;
	#5 D = 0;
	#10 D = 1;
	#5 D = 0;
	#15 D = 1;
	#10 D = 0;
	#10 D = 1;
	#5 D = 0;
	#10 D = 1; 
	#5 D = 0;
	#5 D = 1;
	#5 D = 0;
	#5 D = 1;
end
always
begin
	#2 clk = !clk;
	
end
endmodule
