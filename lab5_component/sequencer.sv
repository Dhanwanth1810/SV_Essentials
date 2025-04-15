class sequencer extends component_base;
	function new(component_base parent, string name);
		super.new(parent,name);
	endfunction

	task run();
		$display("Sequencer path: %s", path_name());
	endtask
endclass
