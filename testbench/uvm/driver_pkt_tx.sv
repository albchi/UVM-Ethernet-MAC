`ifndef _DRIVER_PKT_TX_
`define _DRIVER_PKT_TX_

class driver_pkt_tx extends uvm_driver #(data_pkt_tx);

   `uvm_component_utils(driver_pkt_tx)


   virtual intf_pkt_tx vi;

   function new(input string name="Driver for PKT_TX", input uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void  build_phase(input uvm_phase phase);
      super.build_phase(phase);
      uvm_config_db#(virtual intf_pkt_tx)::get(this, "", "vi", vi);
      if (vi == null) begin
         `uvm_fatal("Driver for PKT TX ", "VI for DRIVER not in CONFIG_DB");
      end
   endfunction 

   virtual task run_phase(input uvm_phase phase);

      `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);

      forever begin

         `uvm_info("DRIVER CLASS", "before get_next", UVM_HIGH);
         seq_item_port.get_next_item(req);
         `uvm_info("DRIVER CLASS", "after get_next", UVM_HIGH);

         `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);

         @(posedge vi.clk);
         vi.pkt_tx_val <= 1'b1;

         @(posedge vi.clk);
         @(posedge vi.clk);
         // vi.reset_156m25_n <= 1'b1;
         vi.pkt_tx_sop <= 1'b0;
         vi.pkt_tx_eop <= 1'b0;
         vi.pkt_tx_val <= 1'b0;
         @(posedge vi.clk);
         vi.pkt_tx_sop <= 1'b1;
         vi.pkt_tx_val <= 1'b1; // req.val; 
         vi.pkt_tx_data <= req.data; 
         vi.pkt_tx_mod <= req.mod; 
         @(posedge vi.clk);
         vi.pkt_tx_sop <= 1'b0;
         vi.pkt_tx_data <= req.data + 64'h1000; 
         vi.pkt_tx_mod <= req.mod; 
         @(posedge vi.clk);
         vi.pkt_tx_data <= req.data + 64'h1000; 
         vi.pkt_tx_mod <= req.mod; 
         vi.pkt_tx_eop <= 1'b1;
         @(posedge vi.clk);
         vi.pkt_tx_val <= 1'b0;
         vi.pkt_tx_eop <= 1'b0;
         repeat(80)
            @(posedge vi.clk);

      seq_item_port.item_done();
         vi.pkt_tx_sop <= 1'b0;
 

   end // forever

   endtask

endclass

`endif // _DRIVER_PKT_TX_

