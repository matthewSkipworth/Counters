//Matthew Skipworth
//TCES330, Friday Section
//Counter module to count to 9
module Counter(Clock, Enable, Clear, Q);
	input Clock;
	input Enable;
	input Clear;
	output reg [3:0] Q;
	
	always @(posedge Clock) begin
		if (Clear) begin
			Q <= 0;
		end
		else if (Enable) begin		
			if(Q == 9) begin
				Q <= 0;
			end else begin 
				Q++;
			end
		end
	end
endmodule	

module Counter_testbench;

	logic Clock;
	logic Enable;
	logic Clear;
	logic [3:0]Q;
	
	integer i;
	
	Counter dut(Clock, Enable, Clear, Q);
	/*
	always begin
		Clock = 0;
		#10;
		Clock = 1'b1;
		#10;
	end
	initial begin
		Enable = 1'b1;
		Clear = 0; 
		#83;
		Enable = 1'b1;
		#80;
		Clear = 1'b1; // clear
		# 210;
		Enable = 0;
		#80;
		Clear = 0;
		#100;
		$stop;
	end
*/
	assign Enable = 1;
	assign Clear = 0;
	
	initial begin
		
		for (i = 0; i < 16; i++) begin
			Clock = 0;
			#10;
			$monitor(Q);
			Clock = 1;
			#10;
			//$monitor(Q);
			//#10;
		end
	end	
endmodule	