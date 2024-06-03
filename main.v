module main(CLK, H, M, L, A, G, D1, D2, D3, D4, A7, B7, C7, D7, E7, F7, G7);
	
	input CLK, H, M, L, G, A;
	output A7, B7, C7, D7, E7, F7, G7, D1, D2, D3, D4;
	
	wire clk_divided, S7;
	
	wire AUS, BUS, CUS, DUS, EUS, FUS, GUS;
	wire ADS, BDS, CDS, DDS, EDS, FDS, GDS;
	wire AUM, BUM, CUM, DUM, EUM, FUM, GUM;
	wire ADM, BDM, CDM, DDM, EDM, FDM, GDM;
	
	wire wireclk, RST, Q1, Q2, Q1_, Q2_;
	
	wire CLK_OUT1, CLK_OUT2, CLK_OUT3;
	
	wire P, PH, PM, PL, PA, PG, Pn, Pi;
	
	//torna a mudança de nivel(subida ou descida) em pulso
	Levl_to_pulse(H, CLK, PH);
	Levl_to_pulse(M,CLK, PM);
	Levl_to_pulse(L, CLK, PL);
	Levl_to_pulse(G, CLK, PG);
	Levl_to_pulse(A, CLK, PA);
	
	or(Pn, PH, PM, PL);
	or(Pi, PG, PA);
	or(P, Pi, Pn);

	dFlipFlop(Q1_, RST, S7,(1'b0), Q1, Q1_);
	dFlipFlop(Q2_, RST, Q1_,(1'b0), Q2, Q2_);
	
	and(D1_, Q1_, Q2_);
	and(D2_, Q1, Q2_);
	and(D3_, Q2, Q1_);
	and(D4_, Q2, Q1);
	
	not(D1, D1_);
	not(D2, D2_);
	not(D3, D3_);
	not(D4, D4_);
	
	//and(D1, 1'b1);
	
	frequency_divisor(CLK, clk_divided, S7);
	
	// Unidade de Segundo
	unit_sec us(clk_divided, P, G, A, CLK_OUT1, AUS, BUS, CUS, DUS, EUS, FUS, GUS);
	
	and(AUS7, D4_, AUS);
	and(BUS7, D4_, BUS);
	and(CUS7, D4_, CUS);
	and(DUS7, D4_, DUS);
	and(EUS7, D4_, EUS);
	and(FUS7, D4_, FUS);
	and(GUS7, D4_, GUS);
	
	// Dezena de Segundo
	duzen_sec ds(CLK_OUT1, P, CLK_OUT2, ADS, BDS, CDS, DDS, EDS, FDS, GDS);
	
	and(ADS7, D3_, ADS);
	and(BDS7, D3_, BDS);
	and(CDS7, D3_, CDS);
	and(DDS7, D3_, DDS);
	and(EDS7, D3_, EDS);
	and(FDS7, D3_, FDS);
	and(GDS7, D3_, GDS);
	
	// Unidade De Minuto
	unit_min um(CLK_OUT2, P, M, G, A, CLK_OUT3, AUM, BUM, CUM, DUM, EUM, FUM, GUM);
	
	and(AUM7, D2_, AUM);
	and(BUM7, D2_, BUM);
	and(CUM7, D2_, CUM);
	and(DUM7, D2_, DUM);
	and(EUM7, D2_, EUM);
	and(FUM7, D2_, FUM);
	and(GUM7, D2_, GUM);
	
	// Dezena De Minuto
	duzen_min du(CLK_OUT3, P, H, M, L, G, A, ADM, BDM, CDM, DDM, EDM, FDM, GDM);
	
	and(ADM7, D1_, ADM);
	and(BDM7, D1_, BDM);
	and(CDM7, D1_, CDM);
	and(DDM7, D1_, DDM);
	and(EDM7, D1_, EDM);
	and(FDM7, D1_, FDM);
	and(GDM7, D1_, GDM);

	// REPRODUZINDO NA MATRIZ
	or(A7, AUS7, ADS7, AUM7);
	or(B7, BUS7, BDS7, BUM7);
	or(C7, CUS7, CDS7, CUM7);
	or(D7, DUS7, DDS7, DUM7);
	or(E7, EUS7, EDS7, EUM7);
	or(F7, FUS7, FDS7, FUM7);
	or(G7, GUS7, GDS7, GUM7);

endmodule
	
