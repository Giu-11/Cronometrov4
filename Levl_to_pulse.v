module Levl_to_pulse(L, CLK,P);
	input L, CLK;
	output P;
	
	dFlipFlop(L,(1'b0), CLK,(1'b0), q, q_);
	
	xor (P,L,q);
	
endmodule