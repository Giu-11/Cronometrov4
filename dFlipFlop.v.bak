module dFlipFlop (input d,  
	input rstn,  
		input clk,  
		output reg q,
	output q_);

	assign q_ = !q;
		  
		always @ (posedge clk or posedge rstn)  begin
	if (rstn)  
	q <= 0;  
			else  
				q <= d;  
	end

endmodule
