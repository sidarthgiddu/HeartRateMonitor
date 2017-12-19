module control(OP, BSEL, CISEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP, OSEL); // add other inputs and outputs here

  // inputs (add others here)
  input  [2:0]  OP;
  
  // outputs (add others here)
  output  CISEL, BSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP;
  output	[1:0] OSEL;
  
  // reg and internal variable definitions
  
  
  // implement module here (add other control signals below)
  //assign CISEL = (OP == 3'b001) ? 1'b1 : 1'b0;
  //assign BSEL = (OP == 3'b001) ? 1'b1 : 1'b0;
  //assign SHIFT_LA = (OP == 3'b010) ? 1'b1 : 1'b0;
  //assign SHIFT_LR = (OP == 3'b011) ? 1'b0 : 1'b1;
  //assign LOGICAL_OP = (OP == 3'b101) ? 1'b1 : 1'b0;
  //assign OSEL = (OP == 3'b000 || OP == )
  assign OSEL[1] = (OP[2]&~OP[1]&OP[0]) | (OP[2]&OP[1]&~OP[0]);
  assign OSEL[0] = (~OP[2]&OP[1]) | (OP[2]&~OP[1]&~OP[0]);
  assign BSEL = OP[0];
  assign CISEL = OP[0];
  assign SHIFT_LA = ~OP[0];
  assign SHIFT_LR = ~OP[2];
  assign LOGICAL_OP = OP[0];
  	
endmodule
