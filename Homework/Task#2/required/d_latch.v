`include "sr_latch.v"

module d_latch (
	D_i,
	E_i,
	Q_o,
	Qn_o
	);

input 	D_i;
input 	E_i;
output 	Q_o;
output 	Qn_o;

wire s1;
wire s2;

// and(s1, ~D, E);
// and(s2, D, E);

assign s1 = ~D_i & E_i;
assign s2 = D_i & E_i;

// sr_latch latch(s1, s2, Q, Qn);

sr_latch sr_latch_inst(
	.R_i(	s1),
	.S_i(	s2),
	.Q_o(	Q_o),
	.Qn_o(	Qn_o)
);

endmodule