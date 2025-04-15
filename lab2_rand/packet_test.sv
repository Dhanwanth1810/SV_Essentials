`include "packet_pkg.sv"

module packet_test;
	import packet_pkg::*;
	
	packet pk1;
	
	initial begin
	/*
		pk1 = new("first_packet", 2);
		
		pk1.data = 8'd6;
		pk1.target = 4'd8;
		
		pk1.print(BINARY);
		pk1.print(DECIMAL);
	*/
		pk1 = new("first_packet", 2);
		for(int i = 0; i < 10; i++)begin
			pk1.randomize();
			//pk1.randomize() with {target == 4'hf;};
			pk1.print(DECIMAL);
		end	
	end
endmodule
