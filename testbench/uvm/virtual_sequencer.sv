`ifndef _VIRTUAL_SEQUENCER_
`define _VIRTUAL_SEQUENCER_
class virtual_sequencer extends uvm_sequencer;

   `uvm_component_utils(virtual_sequencer)
   
    sequencer_pkt_tx sequencer_pkt_tx_0;
    sequencer_reset sequencer_reset_0;
    sequencer_wb sequencer_wb_0;
   
    function new(input string n, input uvm_component p);
       super.new(n, p);
    endfunction 

endclass 
`endif //  _VIRTUAL_SEQUENCER_
