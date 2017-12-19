module shifter(A, LA, LR, Y, C); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input LA, LR;

  // outputs
  output [7:0] Y;
  output C;

  // reg and internal variable definitions
  wire [7:0] YSRA, YSRL, YSLL;
  wire CSRA, CSRL, CSLL;
  
  // implement module here
  assign YSRA = {A[7],A[7:1]};
  assign YSRL = {1'b0,A[7:1]};
  assign YSLL = {A[6:0],1'b0};
  assign CSRA = A[0];
  assign CSRL = A[0];
  assign CSLL = A[7];
  assign Y = ~LR ? YSLL : (LA ? YSRA : YSRL);
  assign C = ~LR ? CSLL : (LA ? CSRA : CSRL);
  
endmodule