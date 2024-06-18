class scoreboard_pkt_tx extends uvm_scoreboard;

   `uvm_component_utils(scoreboard_pkt_tx)

   uvm_analysis_export#(data_pkt_tx) from_agent_in;
   uvm_analysis_export#(data_pkt_tx) from_agent_out;

   function new(input string name = "sb", input uvm_component parent);
      super.new(name, parent);
   endfunction 
 
   function void build_phase(input uvm_phase phase);
      super.build_phase(phase);
      from_agent_in = new("from_agent_in", this);
      from_agent_out = new("from_agent_out", this);
   endfunction 
 


endclass 
