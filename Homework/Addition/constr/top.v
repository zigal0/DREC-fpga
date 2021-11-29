module top(
	clk
	);

input wire clk;
wire clk2;

reg [2:0] cnt = 24'h0000;
reg [23:0] cnt2 = 24'h0000;

assign clk2 = ~(| cnt);

always @(posedge clk)
begin
	cnt = cnt + 24'h1;
end

always @(posedge clk2)
begin
	cnt2 = cnt2 + 24'h1;
end

counter counter(.clk(clk2));
	
endmodule