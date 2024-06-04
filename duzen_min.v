module duzen_min(CLK, P, H, M, L, G, A, adm, bdm, cdm, ddm, edm, fdm, gdm);
	
	input CLK, P, H, M, L, G, A;
	output adm, bdm, cdm, ddm, edm, fdm, gdm;
	
	wire Q1, Q1_, Q2, Q2_, RST, RST0, RST1, SET0, SET1;
	wire R0, R1, w1;
	
	//set do 1 flip flop
	and(wire1, G, !A, !H, !M, L, P);
	and(wire2, G, !A, !H, !M, !L, P);
	or(SET0, wire1, wire2);
	
	//reset do 1 flip flop
	and(wire4, G, !A, !H, !M, L);
	and(wire5, !G, A, !H, M, !L);
	and(wire6, !G, A, H, !M, L);
	and(wire7, G, !A, H, !M, !L);
	or(wire8, wire4, wire5, wire6, wire7);
	or(RST0, wire8, P);
	
	//set do 2 flip flop
	and(w1, G, !A, !H, M, L, P);
	and(w2, G, !A, !H, !M, !L);
	or(w6, w1, w2);
	or(SET1, w6, P);
	
	//reset do 2 flip flop
	and(w7, G, !A, H, !M, !L);
	or(RST1, w7, P);
		
	dFlipFlop(Q1_,RST0, CLK, SET0, Q1, Q1_);
	dFlipFlop(Q2_,RST1, Q1_, SET1, Q2, Q2_);
	
	//LED A
	and(adm, Q2, Q1_);
	
	//LED B
	and(bdm, 1'b0);
	
	//LED C
	and(cdm, Q2_, Q1);
	
	//LED D
	and(ddm, Q2, Q1_);
	
	//LED E
	and(edm, Q1_);
	
	//LED F
	or(fdm, Q2_, Q1_);
	
	//LED G
	and(gdm, Q2);
	
endmodule
