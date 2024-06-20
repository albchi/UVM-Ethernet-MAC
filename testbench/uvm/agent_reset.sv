`ifndef	_AGENT_RESET_
`define	_AGENT_RESET_

`include "data_reset.sv"
`include "driver_reset.sv"

typedef	uvm_sequencer #(data_reset)	sequencer_reset;

class agent_reset extends uvm_agent;

   `uvm_component_utils(agent_reset)

   sequencer_reset sequencer_reset_0; 
   driver_reset driver_reset_0;  

   function new(string name = "Agent for reset", uvm_component parent);
      super.new(name, parent);
   endfunction 

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if (is_active == UVM_ACTIVE) begin
         sequencer_reset_0 = sequencer_reset::type_id::create("sequencer_reset_0", this);
         driver_reset_0 = driver_reset::type_id::create("driver_reset_0", this);
      end
      // XAC need a reset monitor soon
   endfunction 
   
   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      // drv.seq_item_port.connect(seqr.seq_item_export);
      driver_reset_0.seq_item_port.connect(sequencer_reset_0.seq_item_export);
   endfunction 
endclass

`endif // _AGENT_RESET_
