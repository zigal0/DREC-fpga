module top(
    input CLK,
	 input wire KEY1,
	 
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

wire counter_clk = (cnt == 0);

reg [21:0] cnt1 = 0;

always @(posedge CLK) begin
	if(cnt1[21] == 1)
		cnt1 <= 0;
	else
		cnt1 <= cnt1 + 1;
end

wire clk1 = (cnt1 == 0);

wire [15:0] data;
//wire miso;
//wire mosi;
spi_master master(.counter_clk(counter_clk), .clk(clk1), .miso(miso), .reset(KEY1), .mosi(mosi), .ready(rdy));
spi_slave slave(.clk(clk1), .mosi(mosi), .ready(rdy), .data(data), .miso(miso));

wire [3:0] enpos;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~enpos;

wire [7:0] seg;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP} = seg;

hex_display hex_display(.clk(CLK), .data(data), .enpos(enpos), .seg(seg));

endmodule