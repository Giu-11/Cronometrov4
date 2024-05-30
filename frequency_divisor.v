module frequency_divisor(CLK, CLK_OUT, S7);
	
	input CLK;
	output CLK_OUT, S7;
	
	wire wire1, wire2;
	
	delay(CLK, CLK_OUT1);
	delay(CLK_OUT1, CLK_OUT2);
	delay(CLK_OUT2, CLK_OUT3);
	and(S7, CLK_OUT2);
	delay(CLK_OUT3, CLK_OUT4);
	
	dFlipFlop F0 (
        .d(Q_F0),
        .rstn(1'b0),
        .clk(CLK_OUT4),
        .q(),
        .q_(Q_F0)
    );

    dFlipFlop F1 (
        .d(Q_F1),
        .rstn(1'b0),
        .clk(Q_F0),
        .q(CLK_OUT),
        .q_(Q_F1)
    );

endmodule
