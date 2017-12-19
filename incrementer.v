module incrementer(ADDRCURR, ADDRNEXT);
	input [7:0] ADDRCURR;
	output [7:0] ADDRNEXT;
	
	assign ADDRNEXT = ADDRCURR + 8'd2;
endmodule