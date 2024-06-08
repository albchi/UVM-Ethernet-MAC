class testcase2 extends uvm_test;

   `uvm_component_utils(testcase2)

   function new(string n, uvm_component p);
      super.new(n, p);
   endfunction

   virtual function void end_of_elaboration_phase(uvm_phase phase); 
      super.end_of_elaboration_phase(phase); 
      uvm_top.print_topology();
      factory.print();
   endfunction
endclass 
