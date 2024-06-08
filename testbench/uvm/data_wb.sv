`ifndef _DATA_WB_ 
`define _DATA_WB_ 

class data_wb extends uvm_sequence_item;
   rand bit [7:0]   adr;
   rand bit [31:0]  dat_i;
   rand bit [31:0]  dat_o;
   rand bit stb;
   rand bit we;
   rand bit cyc;
   // rand bit [7:0] data[];

   // Your code here
   `uvm_object_utils_begin(data_wb)
      `uvm_field_int (adr, UVM_ALL_ON)
      `uvm_field_int (dat_i, UVM_ALL_ON)
      `uvm_field_int (dat_o, UVM_ALL_ON)
      `uvm_field_int (cyc, UVM_ALL_ON)
      `uvm_field_int (we, UVM_ALL_ON)
      `uvm_field_int (stb, UVM_ALL_ON)
   `uvm_object_utils_end

   //constraint constraint_0 {
   //   data.size() inside {[1:10]};
   //}

endclass

`endif // _DATA_WB_ 
