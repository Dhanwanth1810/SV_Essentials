class monitor extends component_base;

	function new(component_base parent, string name);
		super.new(parent,name);
	endfunction
	
	task run();
        //$display("Driver Path: %s", path_name());
        $display("Monitor Path: %s", path_name());
    endtask
endclass
