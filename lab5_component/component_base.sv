class component_base;
	protected string name;
	component_base parent;
	
	function new(component_base parent, string name);
		this.parent = parent;
		this.name = name;
	endfunction
	
	function string path_name();
		if (parent != null) return {parent.path_name(), "/", name};
		else return name;
	endfunction
	
	function string get_name();
		return name;
	endfunction
	
	function void print();
		$display("name : %0s  path_name : %0s", name, path_name());
	endfunction
endclass
