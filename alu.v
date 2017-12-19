module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;

  wire BSEL, CISEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP;
  wire [1:0] OSEL;
  wire [7:0] Bwire, Yadder, Yshifter, Ylogical;
  wire Cadder, Cshifter, Vadder;
 
  // ADD YOUR CODE BELOW THIS LINE
  assign Bwire = BSEL ? ~B : B;
  
  adder Adder(
    .A(A),
	 .B(Bwire),
	 .CI(CISEL),
	 .Y(Yadder),
	 .C(Cadder),
	 .V(Vadder)
  );
  
  shifter Shifter(
    .A(A),
	 .LA(SHIFT_LA),
	 .LR(SHIFT_LR),
	 .Y(Yshifter),
	 .C(Cshifter)
  );
  
  logical Logical(
    .A(A),
	 .B(B),
	 .OP(LOGICAL_OP),
	 .Y(Ylogical)
  );
  
  control Control(
    .OP(OP),
	 .BSEL(BSEL),
	 .CISEL(CISEL), 
	 .SHIFT_LA(SHIFT_LA), 
	 .SHIFT_LR(SHIFT_LR), 
	 .LOGICAL_OP(LOGICAL_OP), 
	 .OSEL(OSEL)
  );
  
  assign Y = (OSEL == 2'b00) ? Yadder : ((OSEL == 2'b01) ? Yshifter: Ylogical);
  assign C = (OSEL == 2'b00) ? Cadder : ((OSEL == 2'b01) ? Cshifter: 0);
  assign V = (OSEL == 2'b00) ? Vadder: 0;
  assign Z = (Y == 8'd0) ? 1'b1 : 1'b0;
  assign N = Y[7];
  
  // ADD YOUR CODE ABOVE THIS LINE


endmodule
