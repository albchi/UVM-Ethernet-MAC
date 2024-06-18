class scoreboard_pkt_rx extends uvm_scoreboard;

   `uvm_component_utils(scoreboard_pkt_rx)

   `uvm_analysis_imp_decl(ap_from_rx)

    uvm_analysis_export#(data_pkt_rx) ap;

    function new(input string name = "sb", input uvm_component parent);
      super.new(name, parent);
    endfunction 

 

endclass 
