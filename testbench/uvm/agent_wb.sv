`ifndef	_AGENT_WB_
`define	_AGENT_WB_

`include "data_wb.sv"
`include "driver_wb.sv"
`include "monitor_wb.sv"

typedef	uvm_sequencer #(data_wb)	sequencer_wb;

class agent_wb extends uvm_agent;

   `uvm_component_utils(agent_wb)

   sequencer_wb sequencer_wb_0; 
   driver_wb driver_wb_0;  
   monitor_wb monitor_wb_0;

   function new(string name = "Agent for WB", uvm_component parent);
      super.new(name, parent);
   endfunction 

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      sequencer_wb_0 = sequencer_wb::type_id::create("sequencer_wb_0", this);
      driver_wb_0 = driver_wb::type_id::create("driver_wb_0", this);
      monitor_wb_0 = monitor_wb::type_id::create("monitor_wb_0", this);
   endfunction 
   
   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      // drv.seq_item_port.connect(seqr.seq_item_export);
      driver_wb_0.seq_item_port.connect(sequencer_wb_0.seq_item_export);
   endfunction 
endclass

`endif // _AGENT_WB_
