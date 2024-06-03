module duzen_min(CLK, P, H, M, L, G, A, adm, bdm, cdm, ddm, edm, fdm, gdm);
	
	input CLK, P, H, M, L, G, A;
	output adm, bdm, cdm, ddm, edm, fdm, gdm;
	
	wire Q1, Q1_, Q2, Q2_, RST, RST0, RST1, SET0, SET1;
	wire R0, R1, w1;
	
	//set do 1 flip flop
	and(w1, A, L);
	and(w2, G, M);
	or(SET0, w1, w2);
	
	//reset do 1 flip flop
	or(w3, M, H);
	or(w4, L, H);
	and(w5, w3, A);
	and(w6, w4, G);
	or(RST0, w6, w5, RST);
	
	//set do 2 flip flop
	or(w7, L, M, H);
	or(w8, L, M);
	and(w9, w7, A);
	and(W10, W8, G);
	or(SET1, w9, w10);
	
	//reset do 2 flip flop
	and(w11, G, H);
	or(RST1, w11, RST);
		
	dFlipFlop(Q1_,RST0, CLK, SET0, Q1, Q1_);
	dFlipFlop(Q2_,RST1, Q1_, SET1, Q2, Q2_);
	
	//LED A
	and(adm, Q2, Q1_);
	
	//LED B
	and(bdm, 1'b1);
	
	//LED C
	and(cdm, Q2_, Q1);
	
	//LED D
	and(ddm, Q2, Q1_);
	
	//LED E
	and(edm, Q1_);
	
	//LED F
	or(Q2_, Q1_);
	
	//LED G
	and(gdm, Q2);
	
endmodule
