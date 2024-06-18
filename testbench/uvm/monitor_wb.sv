`ifndef _MONITOR_WB_
`define _MONITOR_WB_


class monitor_wb extends uvm_monitor;

  virtual intf_wb vi;
  int pkt_captured;
  uvm_analysis_port #(data_pkt)   ap; // send info out, prob to wb

  `uvm_component_utils( monitor_wb )

  function new(input string name="monitor_wb", input uvm_component parent);
    super.new(name, parent);
  endfunction : new


  virtual function void build_phase(input uvm_phase phase);

    super.build_phase(phase);
    pkt_captured = 0;
    ap = new ( "ap", this );
    uvm_config_db#(virtual intf_wb)::get(this, "", "vi", vi);
    if ( vi==null )
      `uvm_fatal(get_name(), "Virtual Interface for WB MON not set!");
  endfunction : build_phase


  virtual task run_phase(input uvm_phase phase);
    data_wb data_wb_0; // data_pkt      tmp_rcv_pkt;
    bit [7:0]   rx_data_q[$];
    int         idx;
    bit         packet_captured = 0;
    bit         pkt_in_flight = 0;

    `uvm_info( get_name(), $sformatf("HIERARCHY: %m"), UVM_HIGH);

    forever begin
      `uvm_info("MON_WB", "looking for valid transfer", UVM_HIGH);
       if (vi.cyc == 1'b1 && vi.stb == 1'b1) begin
          $display(" wb_adr = %0h, wb_we = %h, wb_dat_i = %h, wb_dat_o = %h", vi.adr, vi.we, vi.dat_i, vi.dat_o);
       end
       @(posedge vi.clk);  
      `uvm_info("MON_WB", "looping back", UVM_HIGH);
    end // forever begin
  endtask : run_phase


  function void report_phase( uvm_phase phase );
    `uvm_info( get_name( ), $sformatf( "REPORT: PKT RX Captured %0d packets", pkt_captured ), UVM_LOW )
  endfunction : report_phase

endclass : monitor_wb

`endif  //_MONITOR_WB_

