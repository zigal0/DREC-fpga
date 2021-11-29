module counter(
	input clk
);

reg [7:0] cnt = 8'h0;

always @(posedge clk) begin
	cnt <= cnt + 1;
end

endmodule