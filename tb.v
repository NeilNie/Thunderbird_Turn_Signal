//
// The Test Bench File for 
// Thunderbird Turn Signal
// 
// Neil Nie
// (c) 2018, All Rights Reserved
//


module tb ();

	reg clk, reset;
	reg left, right;
	wire la, lb, lc, ra, rb, rc;
	reg [5:0] expected;
	reg [31:0] vectornum, errors;
	reg [7:0] testvectors[10000:0];
	
	// instantiate device under test. 
	Thunderbird_Turn_Signal dut(.clk(clk), .reset(reset), 
										 .left_sw(left), .right_sw(right), 
										 .la(la), .lb(lb), .lc(lc), 
										 .ra(ra), .rb(rb), .rc(rc));
	
	initial
		begin
			$readmemb("C:/Users/USER1/Digital Logic/Thunderbird_Turn_Signal/thunderbird.tv", testvectors);
			clk = 0; 
			vectornum = 0; 
			errors = 0; 
		end
	
	always 
		begin
			#5 clk = !clk;
		end
	
	// apply test vectors at the rising edge of the clock. 
	always @ (negedge clk)
		begin
			#1; {left, right, expected} = testvectors[vectornum];
		end
	
	always @ (posedge clk) begin
		if ({la, lb, lc, ra, rb, rc} != expected) begin
			$display("Error: input = %b", {left, right});
			$display("Outputs = %b %b %b %b %b %b (%b expected)", la, lb, lc, ra, rb, rc, expected);
			errors = errors + 1;
		end
		vectornum = vectornum + 1;
		if (vectornum == 20) begin
			$display("%d tests completed with %d errors", vectornum, errors);
			$stop;
		end	
	end
	
endmodule
