module spi_master(
	input clk,
	input sclk,
	
	inout flag,
	output mosi
);

reg [7:0] cnt = 7'h0;
reg i = 0;
reg my_flag = 0;
reg cur = 0;

assign flag = my_flag;
assign mosi = cur;

always @(posedge clk) 
begin 
	cnt <= cnt + 7'h1;
	my_flag = 1;
end

always @(posedge sclk) 
begin
	if (my_flag == 1)
	begin
		if (i < 8)
		begin
			cur <= cnt[7 - i];
			i = i + 1;
		end
		else
		begin
			my_flag = 0;
			i = 0;
		end
	end
end

endmodule