//Matthew Skipworth
//Friday Session, Due: 20 April 2018

//This module describes a 8 to 1 multplexor.
module Mux_8_to_1(S, A, B, C, D, E, F, G, H, M);
//input/output assignments
	input [2:0] S;
	input A, B, C, D, E, F, G, H;
	output reg M;

	wire N, O, P, Q, X, Y;
//multplexor logic.
	assign N = (~S[0] & A) || (S[0] & B);
	assign O = (~S[0] & C) || (S[0] & D);
	assign P = (~S[0] & E) || (S[0] & F);
	assign Q = (~S[0] & G) || (S[0] & H);

	assign X = (~S[1] & N) || (S[1] & O);
	assign Y = (~S[1] & P) || (S[1] & Q);

	assign M = (~S[2] & X) || (S[2] & Y);

endmodule

//module Mux_8_to_1_testbench();
//testbench code is borrowed from canvas help session files.

//********************************************//
// 			    	 Testbench 			      //
//********************************************//
module MuxN_testbench;
	localparam TESTN = 1;
	logic [2:0] S; // mux select line
	logic [TESTN-1:0] A, B, C, D, E, F, G, H; // mux inputs
	logic [TESTN-1:0] M; // mux output

Mux_8_to_1 /*#(.N(TESTN))*/ DUT( S, A, B, C, D, E, F, G, H, M );

integer unsigned I, RX, RA, RB, RC, RD, RE, RF, RG, RH;
initial begin
	RX = $urandom( 111 ); // set the seed (assignment for compiler)
	for (I=0; I<9; I++ ) begin
		RA = $urandom(); // random number
		A = RA[TESTN-1:0];
		RB = $urandom();
		B = RB[TESTN-1:0];
		RC = $urandom(); // random number
		C = RC[TESTN-1:0];
		RD = $urandom();
		D = RD[TESTN-1:0];
		RE = $urandom(); // random number
		E = RE[TESTN-1:0];
		RF = $urandom();
		F = RF[TESTN-1:0];
		RG = $urandom(); // random number
		G = RG[TESTN-1:0];
		RH = $urandom();
		H = RH[TESTN-1:0];
		S[0] = 0;
		S[1] = 0;
		S[2] = 0;
		#5;
		assert( M == A );
		#10;
		S[0] = 1;
		S[1] = 0;
		S[2] = 0;
		#10;
		assert( M == B );
		S[0] = 0;
		S[1] = 1;
		S[2] = 0;
		#10;
		assert( M == C );
		#10;
		S[0] = 1;
		S[1] = 1;	
		S[2] = 0;
		#10;
		assert( M == D );
		#10;
		S[0] = 0;
		S[1] = 0;
		S[2] = 1;
		assert( M == E );
		#10;
		S[0] = 1;
		S[1] = 0;	
		S[2] = 1;
		#10;
		assert( M == F );
		#10;
		S[0] = 0;
		S[1] = 1;
		S[2] = 1;
		assert( M == G );
		#10;	
		S[0] = 1;
		S[1] = 1;	
		S[2] = 1;
		#10;
		assert( M == H );
		#10;
		end
		$stop;
	end
	
	initial begin
	$display( " I A B C D E F G H S M" );
	$monitor( "%d %4b %4b %4b %4b %4b %4b %4b %4b %b %4b", I, A, B, C, D, E, F, G, H, S, M );
	end
	
endmodule
