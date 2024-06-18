`ifndef _DATA_PKT_TX_ 
`define _DATA_PKT_TX_ 

class data_pkt_tx extends uvm_sequence_item;

   rand bit [63:0]  data;
   // rand bit [63:0]  data [];
   rand bit [2:0]   mod;

   rand bit val;
   rand bit sop;
   rand bit eop;

   `uvm_object_utils_begin(data_pkt_tx)
      `uvm_field_int (data, UVM_ALL_ON)
      // `uvm_field_array_int (data, UVM_ALL_ON)
      `uvm_field_int (mod, UVM_ALL_ON)
      `uvm_field_int (val, UVM_ALL_ON)
      `uvm_field_int (sop, UVM_ALL_ON)
      `uvm_field_int (eop, UVM_ALL_ON)
   `uvm_object_utils_end

   // constrint cons_data {
   //    data.size() inside ([10:1000]);
   // }

endclass

`endif //  _DATA_PKT_TX_ 