module top(
    input CLK,
	 
    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP
);

reg [25:0] cnt = 0;

always @(posedge CLK) begin
	if(cnt[25] == 1)
		cnt <= 0;
	else
		cnt <= cnt + 1;
end

wire new_clk = (cnt == 0);

wire [15:0] data;

spi_master master(.clk(new_clk), .miso(miso), .mosi(mosi));
spi_slave slave(.clk(new_clk), .mosi(mosi), .miso(miso), .data(data));

wire [3:0] enpos;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~enpos;

wire [7:0] seg;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP} = seg;

hex_display hex_display(.clk(CLK), .data(data), .enpos(enpos), .seg(seg));

endmodule