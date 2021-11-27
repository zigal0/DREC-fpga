module hex_display (
	input clk,
	input [15:0] data,

	output [3:0] enpos,
	output [7:0] seg
);

reg [12:0] cnt;

always @(posedge clk) begin
	if(cnt == 5000)
		cnt <= 0;
	else
		cnt <= cnt + 1;
end

assign divided_clk = (cnt == 0);

reg [1:0] i = 2'h0;
wire [3:0] curData = data[i * 4 +: 4];

assign enpos = (4'b1 << i);

hex_to_seg hex_to_seg(.data(curData), .seg(seg));

always @(posedge divided_clk) begin
	i <= i + 1'h1;
end

endmodule