module unit_min(CLK, P, H, M, L, G, A, CLK_OUT, AUM, BUM, CUM, DUM, EUM, FUM, GUM);
	
	input CLK, P, H, M, L, G, A;
	output CLK_OUT, AUM, BUM, CUM, DUM, EUM, FUM, GUM;
	
	wire Q1_d, Q1, Q1_, Q2, Q2_, Q3, Q3_, Q4, Q4_, RST, SR1, SR2, RST0, RST1, RST2;
	wire w1;

	//and(w1, M, !G);
	//or(w2, G, w1);
	//and(SR1, P, w2); 
	
	//and(SR2, !G, !M);
	
	//or(RST0, RST, SR1, SR2);
	//or(RST1, RST, SR1);
	//or(RST2, RST, SR2);
	
	and(w1, A, !H, M);
	or(w2, w1, G);
	and(SR1, w1, P);
	or(RST1, SR1, RST);
	
	and(w3, !M, L);
	or(w4, w3, H);
	and(SR2, w4, !G, P);
	
	or(RST0, RST, SR1, SR2);
	
	dFlipFlop(Q1_, RST2, CLK, SR1, Q1, Q1_);
	dFlipFlop(Q2_, RST0, Q1_, (1'b0), Q2, Q2_);
	dFlipFlop(Q3_, RST1, Q2_, SR2, Q3, Q3_);
	dFlipFlop(Q4_, RST2, Q3_, SR1, Q4, Q4_);

	// LED A
	and(A1, Q3, Q2_, Q1);
	and(A2, Q4, Q1_);
	or(AUM, A1, A2);
	
	// LED B
	and(B1, Q3_, Q2, Q1);
	and(B2, Q3, Q2_, Q1_);
	or(BUM, B1, B2);
	
	// LED C
	and(CUM, Q3, Q2, Q1);
	
	// LED D
	and(D1, Q3_, Q2, Q1_);
	and(D2, Q3, Q2_, Q1);
	and(D3, Q4, Q1_);
	or(DUM, D1, D2, D3);
	
	// LED E
	and(E1, Q3, Q2_);
	or(EUM, E1, Q1_);
	
	// LED F
	and(F1, Q2, Q1_);
	and(F2, Q3, Q2);
	and(F3, Q4, Q1_);
	or(FUM, F1, F2, F3);
	
	// LED G
	and(G1, Q3_, Q2, Q1_);
	or(GUM, G1, Q4);
	
	// SETANDO RESET
	and(R1, Q1, Q2_);
	and(R2, Q3_, Q4);
	and(CLK_OUT, R1, R2);
	and(RST, R1, R2);
	
endmodule
