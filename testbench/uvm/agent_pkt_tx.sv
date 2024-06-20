`ifndef	_AGENT_PKT_TX_
`define	_AGENT_PKT_TX_

`include "data_pkt.sv"
`include "driver_pkt_tx.sv"
`include "monitor_pkt_tx.sv"

typedef	uvm_sequencer #(data_pkt)	sequencer_pkt_tx;

class agent_pkt_tx extends uvm_agent;

   `uvm_component_utils(agent_pkt_tx)

   sequencer_pkt_tx sequencer_pkt_tx_0; 
   driver_pkt_tx driver_pkt_tx_0;  
   monitor_pkt_tx monitor_pkt_tx_0;  

   uvm_analysis_port#(data_pkt) analysis_port;
   function new(string name = "Agent for WB", uvm_component parent);
      super.new(name, parent);
   endfunction 

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      if (is_active == UVM_ACTIVE) begin
         sequencer_pkt_tx_0 = sequencer_pkt_tx::type_id::create("sequencer_pkt_tx_0", this);
         driver_pkt_tx_0 = driver_pkt_tx::type_id::create("driver_pkt_tx_0", this);
      end
      else
         `uvm_fatal("AGENT_PKT_TX", "this agent is not active, so no driver and sequencer will be created");
      analysis_port = new("analysis_port", this);
      monitor_pkt_tx_0 = monitor_pkt_tx::type_id::create("monitor_pkt_tx_0", this);
   endfunction 
   
   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      // drv.seq_item_port.connect(seqr.seq_item_export);
      driver_pkt_tx_0.seq_item_port.connect(sequencer_pkt_tx_0.seq_item_export);
      this.analysis_port = monitor_pkt_tx_0.ap;
   endfunction 
endclass

`endif // _AGENT_PKT_TX_
