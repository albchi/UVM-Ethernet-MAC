`ifndef	_ENV_
`define	_ENV_

`include "agent_pkt_tx.sv"
`include "sequence_pkt_tx.sv"
`include "scoreboard_pkt.sv"

`include "agent_pkt_rx.sv"
`include "sequence_pkt_rx.sv"

`include "agent_reset.sv"
`include "sequence_reset.sv"

`include "agent_wb.sv"
`include "sequence_wb.sv"

`include "coverage.sv"

class env extends uvm_env;

   `uvm_component_utils(env)

   // input_agent agent_in;
   agent_reset agent_reset_0; 
   agent_wb agent_wb_0; 
   agent_pkt_tx agent_pkt_tx_0; 
   agent_pkt_rx agent_pkt_rx_0; 
   scoreboard_pkt scoreboard_pkt_0;
   coverage coverage_0;

   function new(string name = "10 GBEth Env", uvm_component parent);
      super.new(name,parent);
   endfunction 

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      agent_reset_0 = agent_reset::type_id::create("agent_reset_0", this);
      agent_wb_0 = agent_wb::type_id::create("agent_wb_0", this);
      agent_pkt_tx_0 = agent_pkt_tx::type_id::create("agent_pkt_tx_0", this);
      agent_pkt_rx_0 = agent_pkt_rx::type_id::create("agent_pkt_rx_0", this);
      scoreboard_pkt_0 = scoreboard_pkt::type_id::create("scoreboard_pkt_0", this);
      coverage_0 = coverage::type_id::create("coverage_0", this);
   endfunction 
   virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      agent_pkt_tx_0.analysis_port.connect(scoreboard_pkt_0.from_agent_out); // agent_in to RTL
      agent_pkt_rx_0.analysis_port.connect(scoreboard_pkt_0.from_agent_in); // agent_out from RTL
      agent_pkt_rx_0.analysis_port.connect(coverage_0.analysis_export); // agent_out from RTL
   endfunction 

endclass

`endif // _ENV_
