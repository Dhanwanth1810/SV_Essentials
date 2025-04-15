class driver extends component_base;
	sequencer seq;
	
	function new(component_base parent, string name);
		super.new(parent,name);
	endfunction
	
	task run();
		seq = new(this, "sequencer");
        $display("Driver Path: %s", path_name());
        $display("Sequencer Path: %s", seq.path_name());
    endtask
endclass
