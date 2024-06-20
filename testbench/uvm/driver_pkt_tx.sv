`ifndef _DRIVER_PKT_TX_
`define _DRIVER_PKT_TX_

`include "data_pkt.sv";

class driver_pkt_tx extends uvm_driver #(data_pkt);

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
       int pkt_remain = 0;
       int i; // loop count
       int len; // len of data array

      `uvm_info("DRIVER_PKT_TX", "HIERARCHY: %m", UVM_HIGH);

      
      forever begin

         `uvm_info("DRIVER_PKT_TX", "before get_next", UVM_HIGH);
         seq_item_port.get_next_item(req);
         len = req.data2.size();
         `uvm_info("DRIVER_PKT_TX", "after get_next", UVM_HIGH);

         `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);

          repeat(req.ifg) begin
              vi.pkt_tx_sop <= 1'b0;
              vi.pkt_tx_val <= 1'b0;
              vi.pkt_tx_eop <= 1'b0;
              @(posedge vi.clk);
          end // repeat(req.ifg) begin
        

          // $display("XAC PKT TX DRIVER - after IFG - drove sop=%b val=%b eop=%b data=%h \n",vi.pkt_tx_sop, vi.pkt_tx_val, vi.pkt_tx_eop, vi.pkt_tx_data);
         // `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);
         
         for(i = 0 ; i < len ; i++)  begin

            // $display("XAC PKT TX DRIVER - in Phase 0 \n");
         // `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);
            if ( i == 0) begin
               // phase 0
               vi.pkt_tx_sop <= 1'b1;
               vi.pkt_tx_val <= 1'b1;
               vi.pkt_tx_eop <= 1'b0;
               vi.pkt_tx_data <= req.data; 
               // vi.pkt_tx_data <= req.data2[i]; 
            end // if ( i == 0) begin
            else if (i == (len - 1)) begin
               // $display("XAC PKT TX DRIVER - in Phase 2");
         // `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);

               // phase2
               vi.pkt_tx_sop <= 1'b0;
               vi.pkt_tx_val <= 1'b1;
               vi.pkt_tx_eop <= 1'b1;
               // vi.pkt_tx_data <= req.data; 
               vi.pkt_tx_data <= req.data2[i]; 
               vi.pkt_tx_mod <= req.mod; 

            end // else if (i == (len - 1)) begin
            else begin

               // $display("XAC PKT TX DRIVER - in Phase 1 \n");
         // `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);
               // phase1
               vi.pkt_tx_sop <= 1'b0;
               vi.pkt_tx_val <= 1'b1;
               vi.pkt_tx_eop <= 1'b0;
               vi.pkt_tx_data <= req.data2[i]; 
               vi.pkt_tx_mod <= req.mod; 

            end
            @(posedge vi.clk);
            // $display("XAC PKT TX DRIVER drove sop=%b val=%b eop=%b  data=%h \n",vi.pkt_tx_sop, vi.pkt_tx_val, vi.pkt_tx_eop, vi.pkt_tx_data);
         // `uvm_info("XAC PKT TX DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);
 

      end // for
      seq_item_port.item_done();
   end // forever

   endtask

endclass

`endif // _DRIVER_PKT_TX_

