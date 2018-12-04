
module gated_d_latch(clk, D, Q);

input clk, D;
output reg Q;

always @ (D, clk)
	if (clk)
		Q = D;

endmodule
