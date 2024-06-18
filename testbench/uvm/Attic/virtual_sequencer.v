class virtual_sequencer extends uvm_sequencer;

   `uvm_component_utils(virtual_sequencer)
   
    sequencer_pkt_tx sequencer_pkt_tx_0;
    sequencer_pkt_wb sequencer_pkt_wb_0;
    sequencer_pkt_rst sequencer_pkt_rst_0;
   
    function new(input string n, input uvm_component p);
       super.new(n, p);
    endfunction 

endclass 
