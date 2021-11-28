module spi_slave(
	input clk,
	input mosi,
	
	output miso,
	output [15:0] data
);

reg [7:0] test = 8'h0;
reg my_miso = 1'b0;

assign data = {test, 8'h0};
assign miso = my_miso;

always @(posedge clk) begin
	my_miso <= test[7];
	test <= (test << 1) | mosi;
end

endmodule