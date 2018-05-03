module Part5(CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input CLOCK_50;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	logic Out;
	logic [2:0] q;
	
	KHzCLock( CLOCK_50, Out );
	Count_to_Seven(Out, q);
	
	Part6 hello(q, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
endmodule