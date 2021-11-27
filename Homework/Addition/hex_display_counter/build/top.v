module top(
    input CLK,
	 input wire KEY1,
	 

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP
);

reg [23:0] cnt1 = 24'h0000;

always @(posedge CLK) begin
	if(cnt1[23] == 1'h1)
		cnt1 <= 24'h000;
	else
		cnt1 <= cnt1 + 1'h1;
end

wire counter_clk = (cnt1 == 0);

reg [19:0] cnt2 = 20'h0000;

always @(posedge CLK) begin
	if(cnt2[19] == 1'h1)
		cnt2 <= 20'h000;
	else
		cnt2 <= cnt2 + 1'h1;
end

wire to_update = (cnt2 == 0);

wire mosi;
//wire miso;
wire flag = 0;

spi_master master(.clk(counter_clk), .sclk(to_update), .flag(flag), .mosi(mosi));

wire [7:0] data;
spi_slave slave(.flag(flag), .sclk(to_update), .mosi(mosi), .data(data) );

wire [3:0] enpos;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~enpos;

wire [7:0] seg;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP} = seg;

hex_display hex_display(.clk(CLK), .data(data), .enpos(enpos), .seg(seg));

endmodule