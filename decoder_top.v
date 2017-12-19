module decoder_top(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW);
	input [15:0] INST;
	
	output [2:0] DR; //destination register
	output [2:0] SA; //register file read address A
	output [2:0] SB; //register file read address B
	output [5:0] IMM; //immediate value
	output MB; // ALU input mux select
	output [2:0] FS; //function select for ALU
	output MD; //ALU/Dram select
	output LD; // register file write enable
	output MW; //memory write
	
	
	decoder Decoder(
		.INST(INST),
		.DR(DR),
		.SA(SA),
		.SB(SB),
		.IMM(IMM),
		.MB(MB),
		.FS(FS),
		.MD(MD),
		.LD(LD),
		.MW(MW)
	);

endmodule