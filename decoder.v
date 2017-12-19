module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, HALT, BS, OFF);
	input [15:0] INST;
	
	output reg [2:0] DR; //destination register
	output reg [2:0] SA; //register file read address A
	output reg [2:0] SB; //register file read address B
	output reg [5:0] IMM, OFF; //immediate value & offset
	output reg MB; // ALU input mux select
	output reg [2:0] FS; //function select for ALU
	output reg MD; //ALU/Dram select
	output reg LD; // register file write enable
	output reg MW; //memory write
	output reg HALT;
   output reg [2:0] BS;
	
	always @ (*) begin
		SA = INST[11:9];
		SB = INST[8:6];
		case (INST[15:12])
			4'b1111: begin 
						MB = 0;
						MD = 0;
						LD = 1;
						MW = 0;
						DR = INST[5:3];
						IMM = 6'b000000;
						FS = INST[2:0];
						HALT = 0;
						OFF = 6'b000000;
						BS = 3'b100;
						end
			4'b0111: begin 
						FS = 3'b110;
						LD = 1; 
						MW = 0; 
						MD = 0;
						HALT = 0;
						DR = INST[8:6];
						MB = 1;
						BS = 3'b100;	
						IMM = INST[5:0];
						OFF = 6'b000000;
						end
			4'b0110: begin 
						FS = 3'b101;
						LD = 1; 
						MW = 0;
						MD = 0; 
						HALT = 0;
						DR = INST[8:6];
						MB = 1;
						BS = 3'b100;
						IMM = INST[5:0];
						OFF = 6'b000000;
						end
			4'b0101: begin 
						FS = 3'b000;
						LD = 1;
						MW = 0;
						MD = 0;
						DR = INST[8:6];
						HALT = 0;
						MB = 1;
						BS = 3'b100;
						IMM = INST[5:0];
						OFF = 6'b000000;							
						end
			4'b0100: begin 
						FS = 3'b000;
						LD = 0;
						MW = 1;
						MD = 0;
						DR = INST[8:6];
						HALT = 0;
						MB = 1;
						BS = 3'b100;
						IMM = INST[5:0];
						OFF = 6'b000000;							
						end
			4'b0010: begin 
						FS = 3'b000;
						LD = 1;
						MW = 0;
						MD = 1;  
						DR = INST[8:6];
						HALT = 0;
						MB = 1;
						BS = 3'b100;
						IMM = INST[5:0];
						OFF = 6'b000000;							
						end
			4'b1000: begin 
						FS = 3'b001;
						LD = 0;
						MW = 0;
						MD = 1;  
						DR = INST[8:6];
						HALT = 0;
						MB = 0;
						BS = 3'b000;
						IMM = 6'b000000;
						OFF = INST[5:0];
						end
			4'b1001: begin 
						FS = 3'b001;
						LD = 0;
						MW = 0;
						MD = 1;  
						DR = INST[8:6];
						HALT = 0;
						MB = 0;
						BS = 3'b001;
						IMM = 6'b000000;
						OFF = INST[5:0];						
						end
			4'b1010: begin 
						FS = 3'b000;
						LD = 0;
						MW = 0;
						MD = 1;  
						DR = INST[8:6];
						HALT = 0;
						MB = 1;
						BS = 3'b010;
						IMM = 6'b000000;
						OFF = INST[5:0];							
						end
			4'b1011: begin 
						FS = 3'b000;
						LD = 1;
						MW = 0;
						MD = 1;  
						DR = INST[8:6];
						HALT = 0;
						MB = 1;
						BS = 3'b011;
						IMM = 6'b000000;
						OFF = INST[5:0];							
						end								
			default: begin
						FS = INST[2:0];
						LD = 0;
						MW = 0;
						MD = 0;
						MB = 0;
						DR = INST[8:6];
						HALT = INST[0];	
						BS = 3'b100;
						IMM = INST[5:0];
						OFF = 6'b000000;							
						end
		endcase
	end
endmodule
