module top(
input sclk, reset,
output [3:0] indikators,
output [6:0] segments);

wire mosi;
wire [7:0] data_indikators;

master m1(.reset(reset), .sclk(sclk), .mosi(mosi));
slave s1(.sclk(sclk), .mosi(mosi), .data_indikators(data_indikators));
to_indikators ind(.sclk(sclk), .data_indikators(data_indikators), .indikators(indikators), .segments(segments));
endmodule