module slave(
input sclk,
input mosi,
output reg [7:0] data_indikators);

reg [7:0] shift_regs;
reg [3:0] bit_counter;

always @(posedge sclk)
begin
	if (bit_counter == 8)
	begin
		shift_regs[0] <= mosi;
		bit_counter <= 0;
		data_indikators <= shift_regs;
	end
	else
	begin
		shift_regs <= {shift_regs[0], shift_regs[7:1]};
		bit_counter <= bit_counter + 1;
	end
end


endmodule
