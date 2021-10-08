module to_indikators(
input [7:0] data_indikators,
input clk,
output reg [3:0] indikators,
output reg [6:0] segments);


reg [16:0] cnt;
reg [1:0] c; //регистр указателя номера семисегментного индикатора
always @(posedge clk)
begin
	if (cnt == 17'd200000)
	begin
		cnt <= 0;
		if (c == 2'b11)
		begin
			c <= 2'b00;
		end
		else
		
			c <= c + 1'b1;
		
	end
	else
		cnt <= cnt + 1;
end

always @(posedge clk)
begin
	if (c == 2'b00) 
	begin
		indikators <= 4'b0111;
		case (data_indikators[7:4])
		4'h0: segments <= 7'b0000001;
		4'h1: segments <= 7'b1001111;
		4'h2: segments <= 7'b0010010;
		4'h3: segments <= 7'b0000110;
		4'h4: segments <= 7'b1001100;
		4'h5: segments <= 7'b0100100;
		4'h6: segments <= 7'b0100000;
		4'h7: segments <= 7'b0001111;
		4'h8: segments <= 7'b0000000;
		4'h9: segments <= 7'b0000100;
		4'hA: segments <= 7'b0001000;
		4'hB: segments <= 7'b1100000;
		4'hC: segments <= 7'b0110001;
		4'hD: segments <= 7'b1000010;
		4'hE: segments <= 7'b0110000;
		4'hF: segments <= 7'b0111000;
		default: segments <= 7'b0000001;
		endcase 
	end 
	if (c == 2'b01)  
	begin
		indikators <= 4'b1011;
		case (data_indikators[3:0])
		4'h0: segments <= 7'b0000001;
		4'h1: segments <= 7'b1001111;
		4'h2: segments <= 7'b0010010;
		4'h3: segments <= 7'b0000110;
		4'h4: segments <= 7'b1001100;
		4'h5: segments <= 7'b0100100;
		4'h6: segments <= 7'b0100000;
		4'h7: segments <= 7'b0001111;
		4'h8: segments <= 7'b0000000;
		4'h9: segments <= 7'b0000100;
		4'hA: segments <= 7'b0001000;
		4'hB: segments <= 7'b1100000;
		4'hC: segments <= 7'b0110001;
		4'hD: segments <= 7'b1000010;
		4'hE: segments <= 7'b0110000;
		4'hF: segments <= 7'b0111000;
		default: segments <= 7'b0000001;
		endcase 
	end
	if (c == 2'b10)
	begin
		indikators <= 4'b1101;
		
		segments <= 7'b0000001;
		 
	end
	if (c == 2'b11)
	begin
		indikators <= 4'b1110;
		
		segments <= 7'b0000001;
		
	end
end
endmodule
