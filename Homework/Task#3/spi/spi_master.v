module spi_master(
	input counter_clk,
	input clk,
	input miso,
	input wire reset,
	
	output mosi,
	output ready
);

reg [7:0] cnt = 7'h0;
reg [4:0] i;
reg [7:0] compare = 7'h0;
reg rdy = 0;
reg my_mosi = 1'b0;

assign mosi = my_mosi;
assign ready = rdy;

always @(posedge counter_clk) begin
	if (reset == 1'b0) begin
		cnt <= 7'h0;
	end
	else 
		cnt <= cnt + 7'h1;
end

always @(posedge clk) begin
	if (cnt != compare) begin
		rdy = 1;
		if (i < 8) begin
		my_mosi <= cnt[7 - i];
		i = i + 1;
		end
		else begin
			i = 0;
			rdy = 0;
			compare <= cnt;
		end
	end
end

endmodule