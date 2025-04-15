`include "packet_pkg.sv"

module packet_test;
	import packet_pkg::*;
	
	packet parray[15:0];
	psingle ps;
	pmulticast pm;
	pbroadcast pb;

	initial begin
	/*
		pk1 = new("first_packet", 2);
		
		pk1.data = 8'd6;
		pk1.target = 4'd8;
		
		pk1.print(BINARY);
		pk1.print(DECIMAL);
	*/
	/*
		pk1 = new("first_packet", 2);
		for(int i = 0; i < 10; i++)begin
			pk1.randomize();
			//pk1.randomize() with {target == 4'hf;};
			pk1.print(DECIMAL);
		end
	*/
	        //////////
		foreach(parray[i]) begin
			randcase
				1: begin
					ps = new("packet_s",1);
					ps.randomize();
					parray[i] = ps;
				end
				1: begin
					pm = new("packet_m",2);
					pm.randomize();
					parray[i] = pm;
				end
				1: begin
					pb = new("packet_b",3);
					pb.randomize();
					parray[i] = pb;
				end
			endcase
		end
		/////////////
		foreach(parray[i]) begin
			parray[i].print(BINARY);
			parray[i].validate();
		end
		//////////////////

			
	end
endmodule
