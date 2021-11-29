module spi_slave(
	input clk,
	input mosi,
	input ready,
	
	output [15:0] data,
	output miso
);

reg [7:0] cur = 8'b00000000;
reg [7:0] to_display = 8'b00000000;
reg [5:0] i;
reg my_miso = 1'b0;

assign data = {to_display, 8'h0};
assign miso = my_miso;

always @(posedge clk) begin
	if (ready == 1) begin
		cur <= (cur << 1) | mosi;
	end
	else 
		to_display <= cur;
end

endmodule