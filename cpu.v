module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  //reg [7:0] PC;
  //reg [7:0] NextPC;
  
  wire MD, LD, MB, HALT, H, MP;
  wire C,V,N,Z;
  wire[1:0] SEL;
  wire[2:0] DR, SA, SB, FS, BS;
  wire[5:0] IMM, OFF; //this declared IMME before
  wire[7:0] IMME, OFFE;
  
  wire [7:0] DA, DB, DC, DD; 
  
  // ADD YOUR CODE BELOW THIS LINE
  assign OFFE = {OFF[5], OFF, 1'b0};
  assign MP = (BS == 3'd4) ? 1'b0 : ((BS == 3'd3) ? N : ((BS == 3'd2) ? ~N : ((BS == 3'd1) ? ~Z : Z)));  
  //assign MP = BS[2] ? 1'b0 : 
  assign H = EN_L & HALT;
  assign SEL = {H,MP};
  assign DC = MD ? Din : DD;
  assign DataA = DA;
  assign DataB = DB;
  assign DataC = DC;
  assign DataD = DD; 
  
  PC pc(
	.CLK(CLK),
	.RESET(RESET),
	.PC(PC),
	.NextPC(NextPC),
	.SEL(SEL),
	.OFFE(OFFE)
  );
  
  decoder dec(
	.INST(Iin),
	.DR(DR),
	.SA(SA),
	.SB(SB),
	.FS(FS),
	.IMM(IMM),
	.MB(MB),
	.MD(MD),
	.LD(LD),
	.MW(MW),
	.HALT(HALT),
	.OFF(OFF),
	.BS(BS)
  );
  
  register r(
	.CLK(CLK),
	.RESET(RESET),
	.SA(SA),
	.SB(SB),
	.LD(LD),
	.DR(DR),
	.D_in(DC),
	.DataA(DA),
	.DataB(DB)
  );
  
  signextend se(
	.IMM_IN(IMM),
	.IMM_OUT(IMME)
  );
  
  alu a(
	.A(DA),
	.B(MB ? IMME : DB),
	.OP(FS),
	.Y(DD),
	.C(C),
	.V(V),
	.N(N),
	.Z(Z)
  );
  // ADD YOUR CODE ABOVE THIS LINE

endmodule
