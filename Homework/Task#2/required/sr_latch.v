module sr_latch (
	R_i,
	S_i,
	Q_o,
	Qn_o
	);

input	S_i; 
input   R_i;
output  Q_o;
output  Qn_o;

// nor(Q, R, Qn);
// nor(Qn, S, Q);

assign Q_o = ~(R_i | Qn_o);
assign Qn_o = ~(S_i | Q_o);

endmodule