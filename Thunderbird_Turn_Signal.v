// 
// Digital Logic Lab
// Thunderbird Turn Signal
// Neil Nie
// (c) 2018
// 

module Thunderbird_Turn_Signal (
	input clk, 
	input reset,
	input left_sw, right_sw,
	output la, lb, lc, ra, rb, rc
);

// flip flop for the left side
ped_flip_flop ff_la(.clk(clk), .D(next_la), .Q(la));
ped_flip_flop ff_lb(.clk(clk), .D(next_lb), .Q(lb));
ped_flip_flop ff_lc(.clk(clk), .D(next_lc), .Q(lc));

// flip flop for the right side
ped_flip_flop ff_ra(.clk(clk), .D(next_ra), .Q(ra));
ped_flip_flop ff_rb(.clk(clk), .D(next_rb), .Q(rb));
ped_flip_flop ff_rc(.clk(clk), .D(next_rc), .Q(rc));

// combinational logic for the next state (left)
assign next_la = (~la & lb & lc & left_sw);
assign next_lb = (~la & ~lb & lc & left_sw) | (~la & lb & lc & left_sw);
assign next_lc = (~la & ~lb & ~lc & left_sw) | (~la & ~lb & lc & left_sw) | (~la & lb & lc & left_sw);

// combinational logic for the next state (right)
assign next_ra = (~ra & rb & rc & right_sw);
assign next_rb = (~ra & ~rb & rc & right_sw) | (~ra & rb & rc & right_sw);
assign next_rc = (~ra & ~rb & ~rc & right_sw) | (~ra & ~rb & rc & right_sw) | (~ra & rb & rc & right_sw);

endmodule

