//`include "packet_pkg.sv"
import packet_pkg::*;

module packet_test;
	
	packet pk1,pk2;
	
	initial begin
	/*
		pk1 = new("first_packet", 2);
		
		pk1.data = 8'd6;
		pk1.target = 4'd8;
		
		pk1.print(BINARY);
		pk1.print(DECIMAL);
	*/
	/*	
		for(int i = 0; i < 10; i++)begin
			pk1.randomize();
			//pk1.randomize() with {target == 4'hf;};
			pk1.getcount();
			pk1.print(DECIMAL);
		end
	*/	
			
		pk1 = new("first packet",1);
		pk1.tagmode = IDED;
		pk1.randomize();
		pk1.print(DECIMAL);
		
		pk2 = new("second packet",2);
		pk2.tagmode = UNIDED;
		pk2.randomize();
		pk2.print(DECIMAL);
		
		$display("Packet count = %0d", packet::get_count());	
		
	end
endmodule
