class scoreboard_pkt_tx extends uvm_scoreboard;

   function new(input string name = "sb", input uvm_component parent);
      super.new(name, parent);
   endfunction 
   `uvm_component_utils(scoreboard_pkt_tx)
 
    uvm_analysis_export#(data_pkt_tx) ap;

endclass 
