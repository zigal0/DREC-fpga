`include "d_latch.v"

module flip_flop(
    D_i,
    E_i,
    Q_o,
    Qn_o
    );

input D_i;
input E_i;
output Q_o;
output Qn_o;
wire s1;
wire s2;

// d_latch latch1(D_i, ~E_i, s1, s2);

d_latch d_latch_inst1(
	.D_i(	D_i),
	.E_i(	~E_i),
	.Q_o(	s1),
	.Qn_o(	s2)
);

// d_latch latch2(s1, E_i, Q_o, Qn_o);

d_latch d_latch_inst2(
	.D_i(	s1),
	.E_i(	E_i),
	.Q_o(	Q_o),
	.Qn_o(	Qn_o)
);

endmodule

