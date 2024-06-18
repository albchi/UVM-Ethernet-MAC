`ifndef _DRIVER_WB_
`define _DRIVER_WB_

class driver_wb extends uvm_driver #(data_wb);

   `uvm_component_utils(driver_wb)


   virtual intf_wb vi;

   function new(input string name="Driver for reset", input uvm_component parent);
      super.new(name, parent);
   endfunction

   virtual function void  build_phase(input uvm_phase phase);
      super.build_phase(phase);
      uvm_config_db#(virtual intf_wb)::get(this, "", "vi", vi);
      if (vi == null) begin
         `uvm_fatal("Driver for reset ", "VI for DRIVER not in CONFIG_DB");
      end
   endfunction 

   virtual task run_phase(input uvm_phase phase);

      `uvm_info("WB DRIVER CLASS", "HIERARCHY: %m", UVM_HIGH);

      forever begin

         `uvm_info("WB DRIVER ", "wait for next_item", UVM_HIGH);
         seq_item_port.get_next_item(req);
         `uvm_info("WB DRIVER ", "got next_item", UVM_HIGH);

         `uvm_info("WB DRIVER run_phase received this packet ", req.sprint(), UVM_HIGH);

         // @(posedge vi.cb_driver); // compile error
         @(posedge vi.clk);
         vi.cyc <= 1'b1; // req.cyc; // 1'b1;
         vi.stb <= 1'b1; // req.stb; // 1'b1;
         vi.we <= req.we; // 1'b1;
         vi.adr <= req.adr; // 8'h12;
         vi.dat_i <= req.dat_i; // 32'h56789abc;
         @(posedge vi.clk);
         // expecting ack
         @(posedge vi.clk);
         vi.cyc <= 1'b0;
         vi.stb <= 1'b0;

      seq_item_port.item_done();

   end // forever

   endtask

endclass

`endif // _DRIVER_WB_

