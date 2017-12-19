module adder(A, B, CI, Y, C, V);

  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;
  
  // outputs
  output [7:0] Y; //8 bit output
  output C; //carry out value
  output V; //1 if overflow occurs
  
  wire G0,P0,C0,G1,P1,C1,G2,P2,C2,G3,P3,C3,G4,P4,C4,G5,P5,C5,G6,P6,C6,G7,P7,C7;
  
  assign G0 = A[0]&&B[0];
  assign P0 = A[0]||B[0];
  assign C0 = G0||(P0&&CI);
  assign Y[0] = A[0]^B[0]^CI;
  
  assign G1 = A[1]&&B[1];
  assign P1 = A[1]||B[1];
  assign C1 = G1||(P1&&C0);
  assign Y[1] = A[1]^B[1]^C0;
  
  assign G2 = A[2]&&B[2];
  assign P2 = A[2]||B[2];
  assign C2 = G2||(P2&&C1);
  assign Y[2] = A[2]^B[2]^C1;
  
  assign G3 = A[3]&&B[3];
  assign P3 = A[3]||B[3];
  assign C3 = G3||(P3&&C2);
  assign Y[3] = A[3]^B[3]^C2;
  
  assign G4 = A[4]&&B[4];
  assign P4 = A[4]||B[4];
  assign C4 = G4||(P4&&C3);
  assign Y[4] = A[4]^B[4]^C3;
  
  assign G5 = A[5]&&B[5];
  assign P5 = A[5]||B[5];
  assign C5 = G5||(P5&&C4);
  assign Y[5] = A[5]^B[5]^C4;
  
  assign G6 = A[6]&&B[6];
  assign P6 = A[6]||B[6];
  assign C6 = G6||(P6&&C5);
  assign Y[6] = A[6]^B[6]^C5;
  
  assign G7 = A[7]&&B[7];
  assign P7 = A[7]||B[7];
  assign C7 = G7||(P7&&C6);
  assign Y[7] = A[7]^B[7]^C6;
  
  assign C = C7;
  assign V = (C == C6) ? 0 : 1;
  
endmodule