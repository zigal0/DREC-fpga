module top(
    input wire CLK,
	 input wire KEY1,
	 
    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP
);

reg [25:0] cnt = 26'd0;
reg [21:0] cnt1 = 21'd0;
reg [1:0] reset_sync;

wire [15:0] data;
wire counter_clk;
wire sclk;
wire [3:0] enpos;
wire [7:0] seg;

assign counter_clk = ~(| cnt);
assign sclk = ~(| cnt1);
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~enpos;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP} = seg;


always @(posedge CLK)
	reset_sync <= {reset_sync[0], KEY1};

always @(posedge CLK) begin
	if(cnt[25] == 1) begin
		cnt <= 26'd0;
	end
	else
		cnt <= cnt + 26'd1;
end

always @(posedge CLK) begin
	if(cnt1[21] == 1)
		cnt1 <= 0;
	else
		cnt1 <= cnt1 + 1;
end

spi_master master(.counter_clk(counter_clk), .clk(sclk), .miso(miso), .reset(reset_sync[1]), .mosi(mosi), .ready(rdy));
spi_slave slave(.clk(sclk), .mosi(mosi), .ready(rdy), .data(data), .miso(miso));
hex_display hex_display(.clk(CLK), .data(data), .enpos(enpos), .seg(seg));

endmodule