`ifndef _SEQUENCNE_WB_
`define _SEQUENCNE_WB_
`include "data_wb.sv"

class sequence_wb extends uvm_sequence#(data_wb);



   `uvm_object_utils(sequence_wb)

   virtual task body();

      reg [7:0] paddr; 
      reg [31:0] pdata; 

/*
      if(starting_phase != null) begin
         start_phase.raise_objection(this);
      end
*/

      // method #1 just randomize using uvm_do
      // repeat(10) `uvm_do(req);
      `uvm_info("XAC Hey from WB Sequence aka Generator","producing stim in body!", UVM_HIGH);
      // `uvm_do(req);
      // `uvm_info("XAC Hey from WB Sequence aka Generator","producing stim in body!", UVM_HIGH);
      // `uvm_do(req);


      // method #2 randomize using uvm_do_with
      // paddr = 48'h1234; 
      // pdata = 32'h5678;
      // $display("XAC Hey from Sequence aka Generator uvm_do_with ","producing addr=%h data=%h", paddr, pdata);
      // `uvm_do_with(req, {src_addr == this.paddr; src_data == this.pdata;})

      // `uvm_do_with(req, {src_addr != 48'h1234; src_data != 32'h5678;})

      // method #3  using start_item and finish_item
      paddr = 8'hAB;
      pdata = 32'h00112233;
      $display("XAC Hey from Sequence aka Generator start_item ","producing addr=%h data=%h", paddr, pdata);
      req = data_wb::type_id::create("req");
      start_item(req);
      req.adr = paddr;
      req.dat_i = pdata;
      req.we = 1;
      finish_item(req);

      paddr = 8'hCD;
      pdata = 32'h33001122;
      $display("XAC Hey from Sequence aka Generator start_item ","producing addr=%h data=%h", paddr, pdata);
      req = data_wb::type_id::create("req");
      start_item(req);
      req.adr = paddr;
      req.dat_i = pdata;
      req.we = 1;

      finish_item(req);


   endtask
endclass
`endif //  _SEQUENCNE_WB_
