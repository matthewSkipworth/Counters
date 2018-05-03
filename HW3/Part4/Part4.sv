//Matthew Skipworth
//TCES330
//SystemVerilog LPM Counter Using 50MHz clock



module Part4(/*KEY,*/ SW, CLOCK_50, HEX0/*, HEX1, HEX2, HEX3*/);
	
	input CLOCK_50;
	//input [0:0] KEY;
	input [1:0] SW;
	output [0:6] HEX0/*, HEX1, HEX2, HEX3*/;
	logic [15:0] q;
	logic Out;
	
	
	KHzCLock( CLOCK_50, Out );
	
	//Altera_Counter_Sixteen_Bit	Altera_Counter_Sixteen_Bit_inst (.clock ( Out ), .cnt_en ( SW[0] ), .sclr ( SW[1] ), .q ( q ));
	Counter counterInst(.Clock(Out), .Enable(SW[0]), .Clear(SW[1]), .Q(q));
	
	HexHEXI H0(HEX0, q[3:0]);
	//HexHEXI H1(HEX1, q[7:4]);
	//HexHEXI H2(HEX2, q[11:8]);
	//HexHEXI H3(HEX3, q[15:12]);

endmodule


