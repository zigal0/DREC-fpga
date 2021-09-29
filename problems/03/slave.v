module slave(
input clk_spi,
input [7:0] i_data,
output reg [7:0] o_data);

slave master(.i_data(mosi), .clk_spi(clk_spi));

always @(posedge clk_spi)
begin
	o_data <= i_data;
end

endmodule
