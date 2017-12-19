module logical(A,B,OP,Y); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A,B;
  input OP;
  
  // outputs
  output [7:0] Y;
  
  // reg and internal variable definitions
  
  // implement module here
  assign Y = OP ? A&B : A|B;
	
endmodule