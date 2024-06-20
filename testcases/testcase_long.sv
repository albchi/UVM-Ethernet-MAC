import uvm_pkg::*;

`include "env.sv"
// `include "sequence_pkt_tx.sv"
`include "sequence_pkt_tx_long.sv"
`include "virtual_sequencer.sv"
`include "virtual_sequence.sv"

class testcase_long extends testcase_base;


   `uvm_component_utils(testcase_long)


   // env env_0; // in testcase_base
   sequence_reset sequence_reset_0; 
   // sequence_pkt_tx sequence_pkt_tx_0;
   sequence_pkt_tx_long sequence_pkt_tx_long_0;
   virtual_sequencer  virtual_sequencer_0;

   function new(string n, uvm_component p);
      super.new(n, p);
   endfunction


  virtual function void build_phase(uvm_phase phase) ;
     super.build_phase(phase) ;
        virtual_sequencer_0  = virtual_sequencer::type_id::create("virtual_sequencer_0", this);
  endfunction 

   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      virtual_sequencer_0.sequencer_pkt_tx_0 = env_0.agent_pkt_tx_0.sequencer_pkt_tx_0;
      virtual_sequencer_0.sequencer_reset_0 = env_0.agent_reset_0.sequencer_reset_0;
     // uvm_config_db #(uvm_object_wrapper)::set(this, "virtual_sequencer_0.reset_phase", "default_sequence", virtual_sequence::get_type());
     // uvm_config_db #(uvm_object_wrapper)::set(this, "v_seqr_0.reset_phase", "default_sequence", virtual_sequence::get_type());
   endfunction // connect_phase


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
     sequence_pkt_tx_long_0 = sequence_pkt_tx_long::type_id::create("sequence_pkt_tx_long_0", this);
     sequence_reset_0 = sequence_reset::type_id::create("sequence_reset_0", this);
     // virtual_sequencer_0  = virtual_sequencer::type_id::create("virtual_sequencer_0", this);
  endtask

  virtual task main_phase(uvm_phase phase) ;

     uvm_objection objection;

     super.main_phase(phase) ;

     phase.raise_objection(this);
     // sequence_pkt_tx_0.start(env_0.agent_pkt_tx_0.sequencer_pkt_tx_0);
     sequence_pkt_tx_long_0.start(virtual_sequencer_0.sequencer_pkt_tx_0);
     // sequence_reset_0.start(env_0.agent_reset_0.sequencer_reset_0);
     sequence_reset_0.start(virtual_sequencer_0.sequencer_reset_0);
     phase.drop_objection(this);
     // phase.phase_done.set_drain_time(this, 100us); // didn't do much

     // from Benjamin's book
     objection = phase.get_objection();
     objection.set_drain_time(this, 1000us);  



  endtask 

endclass 