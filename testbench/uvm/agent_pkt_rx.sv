`ifndef	_AGENT_PKT_RX_
`define	_AGENT_PKT_RX_

`include "data_pkt_rx.sv"
`include "driver_pkt_rx.sv"
`include "monitor_pkt_rx.sv"

typedef	uvm_sequencer #(data_pkt_rx)	sequencer_pkt_rx;

class agent_pkt_rx extends uvm_agent;

   `uvm_component_utils(agent_pkt_rx)

   sequencer_pkt_rx sequencer_pkt_rx_0; 
   driver_pkt_rx driver_pkt_rx_0;  
   monitor_pkt_rx monitor_pkt_rx_0;  

   function new(string name = "Agent for WB", uvm_component parent);
      super.new(name, parent);
   endfunction 

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      sequencer_pkt_rx_0 = sequencer_pkt_rx::type_id::create("sequencer_pkt_rx_0", this);
      driver_pkt_rx_0 = driver_pkt_rx::type_id::create("driver_pkt_rx_0", this);
      monitor_pkt_rx_0 = monitor_pkt_rx::type_id::create("monitor_pkt_rx_0", this);
   endfunction 
   
   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      // drv.seq_item_port.connect(seqr.seq_item_export);
      driver_pkt_rx_0.seq_item_port.connect(sequencer_pkt_rx_0.seq_item_export);
   endfunction 
endclass

`endif // _AGENT_PKT_RX_
