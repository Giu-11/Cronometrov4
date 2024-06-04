module duzen_sec (CLK, P, CLK_OUT, ADS, BDS, CDS, DDS, EDS, FDS, GDS);
	input CLK, P;
	output CLK_OUT, ADS, BDS, CDS, DDS, EDS, FDS, GDS;
	
	wire Q1, Q1_, Q2, Q2_, Q3, Q3_, Q4, Q4_, RST, RST1, SET;
	
	
	and(SET, P);
	or(RST1, RST, SET);
	
	dFlipFlop(Q1_, RST, CLK, SET, Q1, Q1_);
	dFlipFlop(Q2_, RST1, Q1_, (1'b0), Q2, Q2_);
	dFlipFlop(Q3_, RST, Q2_, SET, Q3, Q3_);
	
	// LED A
	and(A1, Q3_, Q2_, Q1);
	and(A2, Q3, Q1_);
	or(ADS, A1, A2);
	
	// LED B
	and(BDS, Q1_, Q2_, Q3_);
	
	// LED C
	and(CDS, Q2, Q1);
	
	// LED D
	and(D1, Q2_, Q3_, Q1);
	and(D2, Q3, Q1_);
	or(DDS, D1, D2);

	// LED E
	and(E1, Q3_, Q2_);
	or(EDS, E1, Q1_);
	
	// LED F
	and(F1, Q3, Q1_);
	or(FDS, F1, Q2);
	
	// LED G
	and(GDS, Q3);
	
	// SETANDO RESET
	and(R1, Q1_, Q2);
	and(CLK_OUT, R1, Q3);
	and(RST, R1, Q3);

endmodule