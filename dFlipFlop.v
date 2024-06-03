module dFlipFlop (input d,  
		input rstn,  
		input clk,
		input set,

		output reg q,
		output q_);


	assign q_ = !q;
		  
	always @ (posedge clk or posedge set or posedge rstn) begin

		if (set)
			q <= 1;

		else if (rstn)
			q <= 0;
		else
			q <= d;
		end

endmodule
