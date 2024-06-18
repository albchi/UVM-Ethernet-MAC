import uvm_pkg::*;

`include "env.sv"
`include "sequence_wb.sv"

class testcase_wb extends uvm_test;



   `uvm_component_utils(testcase_wb)


   env env_0;
   sequence_wb sequence_wb_0;

   function new(string n, uvm_component p);
      super.new(n, p);
   endfunction


  virtual function void build_phase(uvm_phase phase) ;
     super.build_phase(phase) ;
     env_0  = env::type_id::create("env_0", this);
     uvm_config_db#(virtual intf_rst)::set(this, "env_0.agent_reset_0.driver_reset_0", "vi", tb_top_xge_mac.intf_rst_0);
     uvm_config_db#(virtual intf_wb)::set(this, "env_0.agent_wb_0.driver_wb_0", "vi", tb_top_xge_mac.intf_wb_0);
  endfunction 

   virtual function void end_of_elaboration_phase(uvm_phase phase); 
      super.end_of_elaboration_phase(phase); 
      uvm_top.print_topology();
      factory.print();
   endfunction

virtual function void start_of_simulation_phase(input uvm_phase phase);
     super.start_of_simulation_phase(phase);
  endfunction 
   

  virtual task run_phase(input uvm_phase phase);
     super.run_phase(phase);
     // sq0 = packet_sequence_up::type_id::create("sq0", this);
     sequence_wb_0  = sequence_wb::type_id::create("sequence_wb_0", this);
     // env0  = env::type_id::create("env0", this); // illegal runtime
  endtask

  virtual task main_phase(uvm_phase phase) ;
     super.main_phase(phase) ;
     phase.raise_objection(this);
     // sequence_reset_0.start(env0.agent_in.seqr);
     sequence_wb_0.start(env_0.agent_wb_0.sequencer_wb_0);
     phase.drop_objection(this);
  endtask 

endclass 