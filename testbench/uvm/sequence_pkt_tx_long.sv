`ifndef _SEQUENCNE_PKT_TX_LONG_
`define _SEQUENCNE_PKT_TX_LONG_
`include "data_pkt.sv"

class sequence_pkt_tx_long extends uvm_sequence#(data_pkt);



   `uvm_object_utils(sequence_pkt_tx_long)

   virtual task body();

      reg [7:0] taddr; 
      reg [31:0] tdata; 

/*
      if(starting_phase != null) begin
         start_phase.raise_objection(this);
      end
*/


      `uvm_do_with(req, {data == 64'h80009000;data2.size() > 1000; data2.size() < 1500; });

   endtask

endclass


`endif //  _SEQUENCNE_PKT_TX_LONG_
