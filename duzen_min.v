module duzen_min(CLK, adm, bdm, cdm, ddm, edm, fdm, gdm);
	
	input CLK;
	output adm, bdm, cdm, ddm, edm, fdm, gdm;
	
	wire Q1, Q1_, Q2, Q2_;
	
	dFlipFlop(Q1, Q1_);
	dFlipFlop(Q2_, Q1_, Q2);
	
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
