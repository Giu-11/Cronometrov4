module unit_sec(CLK, CLK_OUT, aus, bus, cus, dus, eus, fus, gus);
	
	input CLK;
	output CLK_OUT, aus, bus, cus, dus, eus, fus, gus;
	
	wire Q1_d, Q1, Q1_, Q2, Q2_, Q3, Q3_, Q4, Q4_, RST;
	
	dFlipFlop(Q1_, RST, CLK, Q1, Q1_);
	dFlipFlop(Q2_, RST, Q1_, Q2, Q2_);
	dFlipFlop(Q3_, RST, Q2_, Q3, Q3_);
	dFlipFlop(Q4_, RST, Q3_, Q4, Q4_);

	// LED A
	and(A1, Q3, Q2_, Q1);
	and(A2, Q4, Q1_);
	or(aus, A1, A2);
	
	// LED B
	and(B1, Q3_, Q2, Q1);
	and(B2, Q3, Q2_, Q1_);
	or(bus, B1, B2);
	
	// LED C
	and(cus, Q3, Q2, Q1);
	
	// LED D
	and(D1, Q3_, Q2, Q1_);
	and(D2, Q3, Q2_, Q1);
	and(D3, Q4, Q1_);
	or(dus, D1, D2, D3);
	
	// LED E
	and(E1, Q3, Q2_);
	or(eus, Q1_, E1);
	
	// LED F
	and(F1, Q2, Q1_);
	and(F2, Q3, Q2);
	and(F3, Q4, Q1_);
	or(fus, F1, F2, F3);
	
	// LED G
	and(G1, Q3_, Q2, Q1_);
	or(gus, Q4, G1);
	
	// SETANDO RESET
	and(R1, Q1_, Q2);
	and(R2, Q3_, Q4);
	and(R3, R1, R2);
	and(CLK_OUT, R3);
	and(RST, R3);
	
endmodule
