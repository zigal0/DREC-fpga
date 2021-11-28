module spi_master(
	input clk,
	input miso,
	
	output mosi
);

reg [7:0] test = 8'hff;
reg my_mosi = 1'b0;

assign mosi = my_mosi;

always @(posedge clk) begin
	my_mosi <= test[7];
	test <= (test << 1) | miso;
end

endmodule