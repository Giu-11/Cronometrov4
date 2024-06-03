module unit_sec(CLK_IN, P, G, A, CLK_OUT, aus, bus, cus, dus, eus, fus, gus);
	
	input CLK_IN, P, G, A;
	output CLK_OUT, aus, bus, cus, dus, eus, fus, gus;
	
	wire Q1_d, Q1, Q1_, Q2, Q2_, Q3, Q3_, Q4, Q4_, RST, RST1, SET, I, CLK;
	
	//desliga fornaciemnto de clock se não houver irrigação
	or(I, G, A);
	and(CLK, I, CLK_IN);
	
	and(SET, P);
	or(RST1, RST, P);
	
	dFlipFlop(Q1_, RST, CLK, SET, Q1, Q1_);
	dFlipFlop(Q2_, RST1, Q1_, (1'b0), Q2, Q2_);
	dFlipFlop(Q3_, RST1, Q2_, (1'b0), Q3, Q3_);
	dFlipFlop(Q4_, RST, Q3_, SET, Q4, Q4_);
	

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
