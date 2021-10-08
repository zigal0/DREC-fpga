 module master(
input sclk, reset,
output reg mosi
);

reg [255:0] counter;
reg [7:0] shift_regm;
reg [3:0] bit_counter;


reg [25:0] c;
reg clk_count = 0; //синхросигнал изменения счетчика
always @(posedge sclk)
begin
	if (c == 26'b10111110101111000010000000)
	begin
		c <= 0;
		clk_count <= !clk_count;
	end
	else
		c <= c + 1;
end

always @(posedge clk_count)
begin
	
	if (!reset)
	begin
		shift_regm <= 8'h0;
		counter <= 8'h1;
		bit_counter <= 0;
	end
	else
	begin
		if (bit_counter == 8)
		begin
			bit_counter <= 0;
			if (counter == 8'hFF)
				counter <= 8'h0;
			else
			begin
				counter <= counter + 1;
				shift_regm <= counter;
			end
		end
		else
		begin
			shift_regm <= {shift_regm[0], shift_regm[7:1]};
			bit_counter <= bit_counter + 1;
		end
	end
	
end

always @(posedge sclk)
begin

	mosi <= shift_regm[0];

end

endmodule