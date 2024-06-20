`ifndef _DATA_PKT_ 
`define _DATA_PKT_ 

class data_pkt extends uvm_sequence_item;

   rand bit [63:0]  data;
   rand bit [63:0]  data2 [];

   rand bit val;
   rand bit sop;
   rand bit eop;
   rand bit [2:0] mod;

   rand int ifg;
   int len; // not used for pkt gen; used to pass len info to coverage
   
   `uvm_object_utils_begin(data_pkt)
      `uvm_field_int (data, UVM_ALL_ON)
      `uvm_field_array_int (data2, UVM_ALL_ON)
      `uvm_field_int (mod, UVM_ALL_ON)
      `uvm_field_int (val, UVM_ALL_ON)
      `uvm_field_int (sop, UVM_ALL_ON)
      `uvm_field_int (eop, UVM_ALL_ON)
      `uvm_field_int (ifg, UVM_ALL_ON)
   `uvm_object_utils_end


   constraint cons_ifg {
      ifg < 5000;
      ifg > 0;
   }
endclass

`endif //  _DATA_PKT_TX_ 
