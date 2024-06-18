`ifndef _DRIVER_RESET_
`define _DRIVER_RESET_

class driver_reset extends uvm_driver #(data_reset);

   `uvm_component_utils(driver_reset)


   virtual intf_rst vi;

   function new(input string name="Driver for reset", input uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void  build_phase(input uvm_phase phase);
      super.build_phase(phase);
      uvm_config_db#(virtual intf_rst)::get(this, "", "vi", vi);
      if (vi == null) begin
         `uvm_fatal("Driver for reset ", "VI for DRIVER not in CONFIG_DB");
      end
   endfunction 

   virtual task run_phase(input uvm_phase phase);

      `uvm_info("DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);

      forever begin

      seq_item_port.get_next_item(req);

      `uvm_info("RESET DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);
      `uvm_info("RESET DRIVER", "driving to active reset state",  UVM_HIGH);

      vi.wb_rst_i <= req.reset_; 
      vi.reset_xgmii_rx_n <= req.reset_; 
      vi.reset_xgmii_tx_n <= req.reset_; 
      vi.reset_156m25_n <= req.reset_; 
      // vi.reset_156m25_n <= req.reset_;
      `uvm_info("XAC RESET DRIVER right before wait", req.sprint(), UVM_HIGH);

      repeat(req.cycles) 
          @(posedge vi.clk_156m25);
      `uvm_info("RESET DRIVER", "driving to de-active reset state",  UVM_HIGH);
      // vi.reset_156m25_n <= req.reset_;
      vi.wb_rst_i <= ~req.reset_; // 1'b1;
      vi.reset_xgmii_rx_n <= ~req.reset_; 
      vi.reset_xgmii_tx_n <= ~req.reset_; 
      vi.reset_156m25_n <= ~req.reset_; 
      `uvm_info("XAC RESET DRIVER right after wait", req.sprint(), UVM_HIGH);


      seq_item_port.item_done();
      end // forever
   endtask

endclass

`endif // _DRIVER_RESET_

