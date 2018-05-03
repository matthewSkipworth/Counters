//Matthew Skipworth
//TCES330, Friday Section
//Counter module to count to 9
module Count_to_Seven(Clock, /*Enable, Clear,*/ Q);
	input Clock;
	//input Enable;
	//input Clear;
	output reg [2:0] Q;
	
	always @(posedge Clock) begin
		//if (Clear) begin
		//	Q <= 0;
		//end
		//else if (Enable) begin		
			if(Q == 7) begin
				Q <= 0;
			end else begin 
				Q++;
			end
		//end
	end
endmodule	
