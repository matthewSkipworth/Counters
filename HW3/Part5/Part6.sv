//Matthew Skipworth
//Friday Session, Due: 20 April 2018

//This module instantiates the 3 bit wide 8 to 1 multiplexor to display and 
//left shift the word "HELLO".
module Part6(bits, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
//input/output assignments.
	input [2:0] bits;
	
	output reg [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;

	logic [2:0] S, H, E, L, O, B, M, M2, M3, M4, M5, M6, M7, M8;
	
	assign S = bits;
	
	assign H = 3'b000;
	assign E = 3'b001;
	assign L = 3'b010;
	assign O = 3'b011;
	assign B = 3'b111;
//module instantiations.	
	Mux_3w_8_to_1 G1(S, O, B, B, B, H, E, L, L, M);
	HexHELO H0(HEX0, M);
	
	Mux_3w_8_to_1 G2(S, L, O, B, B, B, H, E, L, M2);
	HexHELO H1(HEX1, M2);
	
	Mux_3w_8_to_1 G3(S, L, L, O, B, B, B, H, E, M3);
	HexHELO H2(HEX2, M3);
	
	Mux_3w_8_to_1 G4(S, E, L, L, O, B, B, B, H, M4);
	HexHELO H3(HEX3, M4);
	
	Mux_3w_8_to_1 G5(S, H, E, L, L, O, B, B, B, M5);
	HexHELO H4(HEX4, M5);
	
	Mux_3w_8_to_1 G6(S, B, H, E, L, L, O, B, B, M6);
	HexHELO H5(HEX5, M6);
	
	Mux_3w_8_to_1 G7(S, B, B, H, E, L, L, O, B, M7);
	HexHELO H6(HEX6, M7);
	
	Mux_3w_8_to_1 G8(S, B, B, B, H, E, L, L, O, M8);
	HexHELO H7(HEX7, M8);

endmodule