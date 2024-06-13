`ifndef _SEQUENCNE_PKT_TX_
`define _SEQUENCNE_PKT_TX_
`include "data_pkt_tx.sv"

class sequence_pkt_tx extends uvm_sequence#(data_pkt_tx);



   `uvm_object_utils(sequence_pkt_tx)

   virtual task body();

      reg [7:0] taddr; 
      reg [31:0] tdata; 

/*
      if(starting_phase != null) begin
         start_phase.raise_objection(this);
      end
*/

      // method #1 just randomize using uvm_do
      // repeat(10) `uvm_do(req);
      `uvm_info("XAC Hey from PKT_TX Sequence aka Generator","producing stim in body!", UVM_HIGH);
      // `uvm_do(req);
      // `uvm_info("XAC Hey from PKT_TX Sequence aka Generator","producing stim in body!", UVM_HIGH);
      // `uvm_do(req);


      // method #2 randomize using uvm_do_with
      // taddr = 48'h1234; 
      // tdata = 32'h5678;
      // $display("XAC Hey from Sequence aka Generator uvm_do_with ","producing addr=%h data=%h", taddr, tdata);
      // `uvm_do_with(req, {src_addr == this.taddr; src_data == this.tdata;})

      // `uvm_do_with(req, {src_addr != 48'h1234; src_data != 32'h5678;})

      `uvm_do_with(req, {data == 64'h11223344; val == 1'b1; sop == 1'b1; eop == 1'b1; })
      `uvm_do_with(req, {data == 64'haabbccdd; val == 1'b1; sop == 1'b1; eop == 1'b1; })
      `uvm_do_with(req, {data == 64'hfacebeef; val == 1'b1; sop == 1'b1; eop == 1'b1; })
      `uvm_do_with(req, {data == 64'hdeadcafe; val == 1'b1; sop == 1'b1; eop == 1'b1; })
      `uvm_do_with(req, {data == 64'hbad00bad; val == 1'b1; sop == 1'b1; eop == 1'b1; })
         


      // method #3  using start_item and finish_item
/*
      taddr = 8'hAB;
      tdata = 32'h00112233;
      $display("XAC Hey from Sequence aka Generator start_item ","producing addr=%h data=%h", taddr, tdata);
      req = data_pkt_tx::type_id::create("req");
      start_item(req);
      req.adr = taddr;
      req.dat_i = tdata;
      req.we = 1;
      req.cyc = 1;
      req.stb = 1;
      finish_item(req);

      taddr = 8'hBA;
      tdata = 32'h33001122;
      $display("XAC Hey from Sequence aka Generator start_item ","producing addr=%h data=%h", taddr, tdata);
      req = data_pkt_tx::type_id::create("req");
      start_item(req);
      req.adr = taddr;
      req.dat_i = tdata;
      req.we = 1;
      req.cyc = 1;
      req.stb = 1;

      finish_item(req);
*/


   endtask
endclass
`endif //  _SEQUENCNE_PKT_TX_
