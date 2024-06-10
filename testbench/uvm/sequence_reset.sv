
`ifndef _SEQUENCE_RESET_
`define _SEQUENCE_RESET_
`include "data_reset.sv"

class sequence_reset extends uvm_sequence#(data_reset);


   int icycles;
   logic irst_;

   `uvm_object_utils(sequence_reset)

   virtual task body();

      icycles = 3;
      irst_ = 1'b0;
      `uvm_info("Hey from RESET Sequence aka Generator","producing stim in body!", UVM_HIGH);

      `uvm_do_with(req, {reset_ == irst_; cycles  == icycles;})

      // repeat(10) `uvm_do(req);


      // finish_item(req);

   endtask
endclass
`endif //  _SEQUENCE_RESET_
