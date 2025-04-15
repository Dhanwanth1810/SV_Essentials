class agent extends component_base;
	sequencer seq;
	driver drv;
	monitor mon;
	
	function new(component_base parent, string name);
		super.new(parent,name);
		
		seq = new(this, "sequencer");
		drv = new(this, "driver");
		mon = new(this, "mon");
		
		//drv.seq = seq;
	endfunction
endclass
