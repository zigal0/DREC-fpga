module hex_display (
	input clk,
	input [15:0] data,

	output [3:0] enpos,
	output [7:0] seg
);

reg [11:0] cnt;
reg [1:0] i = 2'h0;

wire display_clk;
wire [3:0] curData = data[i * 4 +: 4];

assign display_clk = ~(| cnt);
assign enpos = (4'b1 << i);

always @(posedge clk) begin
	if(cnt[11] == 1)
		cnt <= 0;
	else
		cnt <= cnt + 1;
end


hex_to_seg hex_to_seg(.data(curData), .seg(seg));

always @(posedge display_clk) begin
	i <= i + 1'h1;
end

endmodule
