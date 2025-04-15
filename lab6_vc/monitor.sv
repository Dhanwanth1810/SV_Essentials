class monitor extends component_base;
  
  virtual port_if vif;  
  packet pkt;        

  function new(string name, component_base parent = null);
    super.new(name, parent);
  endfunction

  task run();
    $display("Monitor Path: %s", pathname());

    forever begin
      vif.collect_packet(pkt); 
      pkt.print();             
    end
  endtask

endclass

