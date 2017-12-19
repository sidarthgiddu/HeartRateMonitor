module signextend(IMM_IN, IMM_OUT);
	input [5:0] IMM_IN;
	output [7:0] IMM_OUT;
	
	assign IMM_OUT[5:0] = IMM_IN;
	assign IMM_OUT[7:6] = {IMM_IN[5],IMM_IN[5]}; 
endmodule