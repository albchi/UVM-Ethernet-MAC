`ifndef	_ENV_
`define	_ENV_

`include "agent_pkt_tx.sv"

`include "agent_reset.sv"
`include "sequence_reset.sv"

`include "agent_wb.sv"
`include "sequence_wb.sv"

class env extends uvm_env;

   `uvm_component_utils(env)

   // input_agent agent_in;
   agent_reset agent_reset_0; 
   agent_wb agent_wb_0; 
   agent_pkt_tx agent_pkt_tx_0; 

   function new(string name = "10 GBEth Env", uvm_component parent);
      super.new(name,parent);
   endfunction 

   virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      agent_reset_0 = agent_reset::type_id::create("agent_reset_0", this);
      agent_wb_0 = agent_wb::type_id::create("agent_wb_0", this);
      agent_pkt_tx_0 = agent_pkt_tx::type_id::create("agent_pkt_tx_0", this);
   endfunction 

endclass

`endif // _ENV_
