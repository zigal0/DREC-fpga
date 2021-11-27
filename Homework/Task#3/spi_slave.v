module spi_slave( 
	input flag,
	input sclk,
	input mosi,
	
	output data 
);

reg i = 0;
reg [7:0] res = 8'h0;
reg [7:0] cur = 8'h0;

assign data = cur;

always @(negedge sclk) 
begin
	if (flag == 1)
	begin
		if (i < 8)
		begin
			res[i] = mosi;
			i = i + 1;
		end
		else
		begin
			i = 0;
			cur = res;
		end
	end
end

endmodule