module master(
//input clk, 
input reset,
input clk_spi,
output reg [7:0] mosi);

reg [255:0] counter;
reg [7:0] shift_reg;
reg [3:0] bit_count;

reg [32:0] count_clk = 0;

reg clk;


always @(posedge clk_spi)
begin
	count_clk <= (count_clk == 16) ? 0 : count_clk + 1;
	clk <= (count_clk == 16) ? 0 : 1;
end


always @(posedge clk or negedge reset)
begin
	if (!reset)
	begin
		counter <= 8'h0;
		shift_reg <= counter;
		bit_count <= 0;
	end
	else
	begin
		if (bit_count == 8)
		begin
			//counter <= counter + 1;
			bit_count <= 0;
			if (counter == 8'hFF)
			begin
				counter <= 8'h0;
			end
			else
			begin
				counter <= counter + 8'h1;
			end
		end
		else
		begin
			bit_count <= bit_count + 1;
			shift_reg <= {shift_reg[0], shift_reg[7:1]};
		end
	end
end
//assign mosi = shift_reg[0];

always @(posedge clk_spi)
begin
	mosi <= shift_reg[0];
end

endmodule