module counter(
	input clk,
	input wire KEY1,

	output [7:0]data
);

reg [7:0]cnt = 7'h0;

always @(posedge clk) begin
	if (KEY1 == 1'b0)
	begin
		cnt = 7'h0;
	end
	else 
	cnt <= cnt + 7'h1;
end

assign data = cnt;

endmodule
