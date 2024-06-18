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
/*
   virtual task run_phase(input uvm_phase phase);

       int data_array_cnt;
       int i;

      `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);

      forever begin

         `uvm_info("DRIVER CLASS", "before get_next", UVM_HIGH);
         seq_item_port.get_next_item(req);
         `uvm_info("DRIVER CLASS", "after get_next", UVM_HIGH);

         `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);

         data_array_cnt = req.data.size();

         for(i=0;i<=req.data.size();i++)  begin

            if (i == 0) 
               vi.pkt_tx_sop <= 1'b1;
            else
               vi.pkt_tx_sop <= 1'b0;
            vi.pkt_tx_val <= 1'b1;
            vi.pkt_tx_mod <= 3'b000;
            vi.pkt_tx_data <= req.data[i];

            if (i == ( req.data.size() - 1) )
               vi.pkt_tx_eop <= 1'b1;
            else
               vi.pkt_tx_eop <= 1'b0;

            @(posedge vi.clk);

            // `uvm_info("XAC PKT TX DRIVER run_phase : sop ", vi.pkt_tx_sop, UVM_HIGH);
            $display("XAC PKT TX DRIVER run_phase : sop is %h", vi.pkt_tx_sop);
            // `uvm_info("XAC PKT TX DRIVER run_phase : val ", vi.pkt_tx_val, UVM_HIGH);
            $display("XAC PKT TX DRIVER run_phase : val is %h", vi.pkt_tx_val);
            // `uvm_info("XAC PKT TX DRIVER run_phase : eop ", vi.pkt_tx_eop, UVM_HIGH);
            $display("XAC PKT TX DRIVER run_phase : eop is %h", vi.pkt_tx_eop);
            // `uvm_info("XAC PKT TX DRIVER run_phase : data ", vi.pkt_tx_data, UVM_HIGH);
            $display("XAC PKT TX DRIVER run_phase : data is %h", vi.pkt_tx_data);

          end // for 

         seq_item_port.item_done();

         repeat(req.ifg)
            @(posedge vi.clk);

 

   end // forever

   endtask
*/


   virtual task run_phase(input uvm_phase phase);

       int data_array_cnt;
       int i;

      `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);

      forever begin

         `uvm_info("DRIVER CLASS", "before get_next", UVM_HIGH);
         seq_item_port.get_next_item(req);
         `uvm_info("DRIVER CLASS", "after get_next", UVM_HIGH);

         `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);

         data_array_cnt = req.data.size();


         vi.pkt_tx_sop <= 1'b1;
         vi.pkt_tx_val <= 1'b1;
         vi.pkt_tx_mod <= 3'b000;
         vi.pkt_tx_data <= 64'h00112233; // req.data[i];
         vi.pkt_tx_eop <= 1'b0;
         @(posedge vi.clk);

         $display("XAC PKT TX DRIVER run_phase : sop is %h", vi.pkt_tx_sop);
         $display("XAC PKT TX DRIVER run_phase : val is %h", vi.pkt_tx_val);
         $display("XAC PKT TX DRIVER run_phase : eop is %h", vi.pkt_tx_eop);
         $display("XAC PKT TX DRIVER run_phase : data is %h", vi.pkt_tx_data);

         vi.pkt_tx_sop <= 1'b0;
         vi.pkt_tx_val <= 1'b1;
         vi.pkt_tx_mod <= 3'b000;
         vi.pkt_tx_data <= 64'h44556677; // req.data[i];
         vi.pkt_tx_eop <= 1'b1;
         @(posedge vi.clk);
         $display("XAC PKT TX DRIVER run_phase : sop is %h", vi.pkt_tx_sop);
         $display("XAC PKT TX DRIVER run_phase : val is %h", vi.pkt_tx_val);
         $display("XAC PKT TX DRIVER run_phase : eop is %h", vi.pkt_tx_eop);
         $display("XAC PKT TX DRIVER run_phase : data is %h", vi.pkt_tx_data);


         vi.pkt_tx_sop <= 1'b0;
         vi.pkt_tx_val <= 1'b0;
         vi.pkt_tx_mod <= 3'b000;
         vi.pkt_tx_data <= 64'h44556677; // req.data[i];
         vi.pkt_tx_eop <= 1'b0;
         @(posedge vi.clk);
         $display("XAC PKT TX DRIVER run_phase : sop is %h", vi.pkt_tx_sop);
         $display("XAC PKT TX DRIVER run_phase : val is %h", vi.pkt_tx_val);
         $display("XAC PKT TX DRIVER run_phase : eop is %h", vi.pkt_tx_eop);
         $display("XAC PKT TX DRIVER run_phase : data is %h", vi.pkt_tx_data);






         seq_item_port.item_done();
         `uvm_info("DRIVER_PKT_TX ", "after item_done, going back around", UVM_HIGH);

         // repeat(req.ifg)
         //    @(posedge vi.clk);

 

   end // forever

   endtask

endclass

`endif // _DRIVER_PKT_TX_

