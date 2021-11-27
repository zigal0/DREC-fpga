module spi_master(
	input counter_clk,
	input clk,
	input miso,
	
	output mosi
);

reg [7:0] cnt = 7'h0;
reg [4:0] i;

always @(posedge counter_clk) begin
	cnt <= cnt + 7'h1;
end

reg my_mosi = 1'b0;

always @(posedge clk) begin
	if (i < 8) begin
		my_mosi <= cnt[7 - i];
		i = i + 1;
	end
	else
		i = 0;
end

assign mosi = my_mosi;

endmodule