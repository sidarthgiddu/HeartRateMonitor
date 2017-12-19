module PC(CLK, RESET, PC, NextPC, SEL, OFFE);

input CLK, RESET;
input[1:0] SEL;
input[7:0] OFFE;
output [7:0] PC, NextPC;
reg [7:0] PC;

always @(posedge CLK, posedge RESET) begin
	if(RESET == 1) PC = 8'd0;
	else PC = NextPC;
end
assign NextPC = (SEL == 2'd0) ? PC + 8'd2 : ((SEL == 2'd1) ? PC + 8'd2 + OFFE : PC); 

endmodule