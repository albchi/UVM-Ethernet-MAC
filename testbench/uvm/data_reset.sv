`ifndef _DATA_RESET_ 
`define _DATA_RESET_ 

class data_reset extends uvm_sequence_item;
   rand bit reset_;
   rand int cycles; 

   // Your code here
   `uvm_object_utils_begin(data_reset)
      `uvm_field_int (reset_, UVM_ALL_ON)
      `uvm_field_int (cycles, UVM_ALL_ON)
   `uvm_object_utils_end // packe

   // constraint constraint_0 {
   //    reset_ == 1'b0;
   //    cycles < 1000;
   // }

endclass

`endif // _DATA_RESET_ 
