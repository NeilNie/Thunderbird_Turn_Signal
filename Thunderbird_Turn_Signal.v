// 
// Digital Logic Lab
// Thunderbird Turn Signal
// Neil Nie
// (c) 2018
// 

module Thunderbird_Turn_Signal (
	input clk, 
	input reset,
	input left_sw, right,
	output la, lb, lc, ra, rb, rc,
	output next_la, next_lb, next_lc
);

ped_flip_flop ff_la(.clk(clk), .D(next_la), .Q(la));
ped_flip_flop ff_lb(.clk(clk), .D(next_lb), .Q(lb));
ped_flip_flop ff_lc(.clk(clk), .D(next_lc), .Q(lc));

assign next_la = (~la & lb & lc & left_sw);
assign next_lb = (~la & ~lb & lc & left_sw) | (~la & lb & lc & left_sw);
assign next_lc = (~la & ~lb & ~lc & left_sw) | (~la & ~lb & lc & left_sw) | (~la & lb & lc & left_sw);


endmodule

