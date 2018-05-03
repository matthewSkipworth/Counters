//Matthew Skipworth
//TCES 330, Friday Section
//16-Bit Counter driver module.
module Part1(KEY, SW, LEDR, HEX0, HEX1, HEX2, HEX3);
	input KEY[0:0];
	input [1:0] SW;
	output [1:0] LEDR;
	output [0:6] HEX3, HEX2, HEX1, HEX0;
	
	logic [15:0]q;
	
	assign LEDR = SW;
	
	Sixteen_Bit_Counter C1(SW[0], KEY[0], SW[1], q);
	
	HexHEXI H0(HEX0, q[3:0]);
	HexHEXI H1(HEX1, q[7:4]);
	HexHEXI H2(HEX2, q[11:8]);
	HexHEXI H3(HEX3, q[15:12]);

endmodule