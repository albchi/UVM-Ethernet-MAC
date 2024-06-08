`ifndef _DATA_RESET_ 
`define _DATA_RESET_ 

class data_reset extends uvm_sequence_item;
   rand bit reset_;
   rand bit [47:0] src_addr;
   rand bit [31:0] src_data;
   rand bit [47:0] dst_addr;
   rand bit [31:0] dst_data;
   rand bit [31:0] addr;
   rand bit r_wb;
   rand bit [7:0] data[];

   // Your code here
   `uvm_object_utils_begin(data_reset)
      `uvm_field_int (reset_, UVM_ALL_ON)
      `uvm_field_int (src_addr, UVM_ALL_ON)
      `uvm_field_int (src_data, UVM_ALL_ON)
      `uvm_field_int (dst_addr, UVM_ALL_ON)
      `uvm_field_int (dst_data, UVM_ALL_ON)
   `uvm_object_utils_end // packe

   //constraint constraint_0 {
   //   data.size() inside {[1:10]};
   //}

endclass

`endif // _DATA_RESET_ 
