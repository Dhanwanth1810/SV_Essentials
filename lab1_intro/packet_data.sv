typedef enum logic [1:0] {ANY = 2'b00, SINGLE = 2'b01, MULTICAST = 2'b10, BROADCAST = 2'b11} pkt_type;
typedef enum logic [1:0] {HEX = 2'b00, DECIMAL = 2'b01, BINARY = 2'b10} print_f;

class packet;
	local string name;
	bit [3:0] target;
	bit [3:0] source; 
	bit [7:0] data;
	pkt_type ptype;
	
	function new(string name, integer port_no);
		this.ptype = ANY;
		this.source = 4'b0001 << port_no;
		this.name = name;
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
				$display("target-source-data = %0b-%0b-%0b, name = %0s, ptype = %0s", target, source, data, get_name(), get_type());
			end
		endcase
	endfunction
endclass
