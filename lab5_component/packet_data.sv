typedef enum logic [1:0] {ANY = 2'b00, SINGLE = 2'b01, MULTICAST = 2'b10, BROADCAST = 2'b11} pkt_type;
typedef enum logic [1:0] {HEX = 2'b00, DECIMAL = 2'b01, BINARY = 2'b10} print_f;

class packet;
	local string name;
	rand bit [3:0] target;
	bit [3:0] source; 
	rand bit [7:0] data;
	pkt_type ptype;
	
	constraint target_c1{target != 4'b0000;}
	constraint target_c2{if(ptype!=BROADCAST)!(target & source);}
	/*
	constraint target_c3 {
        if (ptype == SINGLE) target inside {4'b0001, 4'b0010, 4'b0100, 4'b1000};  
        if (ptype == MULTICAST) $countones(target) inside {2, 3};                
        if (ptype == BROADCAST) target == 4'b1111;                                
    }
	*/
	function new(string name, integer port_no);
		this.ptype = ANY;
		this.source = 4'b0001 << port_no;
	endfunction
	
	function string get_type();
		return ptype.name();
	endfunction
	
	function string get_name();
		return name;
	endfunction
	
	function print(print_f pf = DECIMAL);
		case(pf)
			HEX: begin
				$display("target-source-data = %0h-%0h-%0h, name = %0s, ptype = %0s", target, source, data, get_name(), get_type());
			end
			DECIMAL: begin
				$display("target-source-data = %0d-%0d-%0d, name = %0s, ptype = %0s", target, source, data, get_name(), get_type());
			end
			BINARY: begin
				$display("target-source-data = %4b-%4b-%8b, name = %0s, ptype = %0s", target, source, data, get_name(), get_type());
			end
		endcase
	endfunction
	
	function void validate();
		bit c1, c2, c3;
		if (ptype == SINGLE) c1 = ~(target & source);
		if (ptype == MULTICAST) c2 = (($countones(target) == 2)||($countones(target) == 3));
		if (ptype == BROADCAST) c3 = (target = 4'd15);
		
		if(c1 | c2 | c3) $display("validation check passed");
		else $display("validation failed!!");
	endfunction
endclass

class psingle extends packet;
	constraint target_c4 {target inside {4'b0001,4'b0010,4'b0100,4'b1000};}
	
	function new(string name, bit [3:0] source);
		super.new(name,source);
		this.ptype = SINGLE;
	endfunction
endclass

class pmulticast extends packet;
	constraint target_c5 {target inside {3,[5:7],[9:14]};}
	
	function new(string name, bit [3:0] source);
		super.new(name,source);
		this.ptype = MULTICAST;
	endfunction
endclass

class pbroadcast extends packet;
	constraint target_c6 {target == 15;}
	
	function new(string name, bit [3:0] source);
		super.new(name,source);
		this.ptype = BROADCAST;
	endfunction
endclass

