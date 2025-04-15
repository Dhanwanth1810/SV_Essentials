class packet_vc extends component_base;
	agent agt;
	
	function new(component_base parent, string name);
		super.new(parent,name);
		
		agt = new(this, "agent");
	endfunction
	
	task run();
		fork
            agt.drv.run();
			//agt.seq.run();
            agt.mon.run();
        join
	endtask
endclass
