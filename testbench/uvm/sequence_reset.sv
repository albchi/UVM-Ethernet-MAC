
`ifndef _SEQUENCE_RESET_
`define _SEQUENCE_RESET_
`include "data_reset.sv"

class sequence_reset extends uvm_sequence#(data_reset);


   bit [47:0] paddr;
   bit [31:0] pdata;

   `uvm_object_utils(sequence_reset)

   virtual task body();

      `uvm_info("Hey from Sequence aka Generator","producing stim in body!", UVM_HIGH);

      /* compile error
      if(starting_phase != null) begin
         start_phase.raise_objection(this);
      end
      */

      // method #1 just randomize using uvm_do
      repeat(10) `uvm_do(req);


      // method #2 randomize using uvm_do_with
      paddr = 48'h1234; 
      pdata = 32'h5678;
      $display("XAC Hey from Sequence aka Generator uvm_do_with ","producing addr=%h data=%h",
 paddr, pdata);
      `uvm_do_with(req, {src_addr == this.paddr; src_data == this.pdata;})

      `uvm_do_with(req, {src_addr != 48'h1234; src_data != 32'h5678;})

      // method #3  using start_item and finish_item
      paddr = 48'h80000000;
      pdata = 32'h00112233;
      $display("XAC Hey from Sequence aka Generator start_item ","producing addr=%h data=%h", 
paddr, pdata);
      req = data_reset::type_id::create("req");
      start_item(req);
      req.src_addr = paddr;
      req.src_data = pdata;
      finish_item(req);

   endtask
endclass
`endif //  _SEQUENCE_RESET_
