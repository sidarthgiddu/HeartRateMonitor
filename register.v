module register(CLK, RESET, SA, SB, LD, DR, D_in, DataA, DataB);
	input CLK;
	input RESET;
	input [2:0] SA;
	input [2:0] SB;
	input [2:0] DR;
	input [7:0] D_in;
	input LD;
	
	output reg [7:0] DataA;
	output reg [7:0] DataB;
	
	reg [7:0] r[7:0];
	
	always @(*) begin
		DataA <= r[SA];
		DataB <= r[SB];
	end
	
	always @(posedge CLK, posedge RESET) begin
		if(RESET == 1) begin
			r[0] <= 8'b00000000;
			r[1] <= 8'b00000000;
			r[2] <= 8'b00000000;
			r[3] <= 8'b00000000;
			r[4] <= 8'b00000000;
			r[5] <= 8'b00000000;
			r[6] <= 8'b00000000;
			r[7] <= 8'b00000000;
		end
		else if(LD == 1'b1) begin
			r[DR] <= D_in;
		end
	end
endmodule