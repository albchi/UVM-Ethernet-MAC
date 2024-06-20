`ifndef _MONITOR_PACKET_RX_MONITOR_
`define _MONITOR_PACKET_RX_MONITOR_


class monitor_pkt_rx extends uvm_monitor;

  virtual intf_pkt_rx     vi;
  uvm_analysis_port #(data_pkt)   ap; // send info out, prob to sb
  int         pkt_cnt;

  `uvm_component_utils( monitor_pkt_rx )

  function new(input string name="monitor_pkt_rx", input uvm_component parent);
    super.new(name, parent);
  endfunction : new


  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    ap = new ( "ap", this );
    uvm_config_db#(virtual intf_pkt_rx)::get(this, "", "vi", vi);
    if ( vi==null )
      `uvm_fatal(get_name(), "Virtual Interface for RX PKT MON not set!");
  endfunction : build_phase


  virtual task run_phase(input uvm_phase phase);
    data_pkt      tmp_rcv_pkt;
    int         idx;
    bit         packet_captured = 0;

    `uvm_info( get_name(), $sformatf("HIERARCHY: %m"), UVM_HIGH);

    pkt_cnt = 0;
    forever begin


      `uvm_info("MON_PKT_RX ", "pkt_rx_mon drive pkt_rx_ren to 1", UVM_HIGH);
      vi.pkt_rx_ren <= 1'b1; // prime the DUT to send us stuff! 
      @(vi.clk) 
      // $display("XAC PKT_RX_MON pkt_rx_ren is : %b", vi.pkt_rx_ren);
      `uvm_info("PKT_RX_MON", $psprintf(" pkt_rx_ren is : %b", vi.pkt_rx_ren), UVM_HIGH);
      `uvm_info("MON_PKT_RX ", "pkt_rx_mon wait for pkt_rx_val", UVM_HIGH);
      if ( vi.pkt_rx_val ) begin // for now, a simple way to grab data 
        `uvm_info("MON_PKT_RX ", "pkt_rx_mon got pkt_rx_val", UVM_HIGH);
        tmp_rcv_pkt = data_pkt::type_id::create("tmp_rcv_pkt", this);
        // `uvm_info( get_name(), $sformatf("xac pkt_rx_mon got  pkt_rx_val), UVM_HIGH);
        `uvm_info("MON_PKT_RX ", "pkt_rx_mon wait for sop and eop ", UVM_HIGH);
        if ( vi.pkt_rx_sop && !vi.pkt_rx_eop  ) begin
           `uvm_info("MON_PKT_RX ", "pkt_rx_mon got sop and eop ", UVM_HIGH);
           // $display("XAC PKT_RX_MON sop : %b", vi.pkt_rx_sop);
           `uvm_info("PKT_RX_MON", $psprintf(" pkt_rx_sop is : %b", vi.pkt_rx_sop), UVM_HIGH);
           tmp_rcv_pkt.data = vi.pkt_rx_data;
           // $display("XAC PKT_RX_MON sop : %b", vi.pkt_rx_sop);
           // $display("XAC PKT_RX_MON data : %h", vi.pkt_rx_data);
           tmp_rcv_pkt.data = vi.pkt_rx_data;
           `uvm_info("MON_PKT_RX run_phase received this packet ", tmp_rcv_pkt.sprint(), UVM_HIGH);
           `uvm_info("PKT_RX_MON writing this to ap", tmp_rcv_pkt.sprint(), UVM_HIGH);
           `uvm_info("PKT_RX_MON writing this to ap", tmp_rcv_pkt.sprint(), UVM_HIGH);
           `uvm_info("PKT_RX_MON writing this to ap", tmp_rcv_pkt.sprint(), UVM_HIGH);
           ap.write(tmp_rcv_pkt);
           pkt_cnt = pkt_cnt + 1;
           `uvm_info("PKT_RX_MON", $psprintf(" pkt_cnt  is : %d", pkt_cnt), UVM_HIGH);
        end // vi.pkt_rx_sop && !vi.pkt_rx_eop  ) begin
      end // if vi.pkt_rx_val
      vi.pkt_rx_ren <= 1'b0; 
      // $display("PKT_RX_MON pkt_rx_ren is now : %b", vi.pkt_rx_ren);
      `uvm_info("PKT_RX_MON", $psprintf(" pkt_rx_ren is : %b", vi.pkt_rx_ren), UVM_HIGH);
      `uvm_info("PKT_RX_MON ", "going back ",  UVM_HIGH);
    end // forever begin
  endtask : run_phase


  function void report_phase( uvm_phase phase );
    `uvm_info( get_name( ), $sformatf( "REPORT: PKT RX Captured %0d packets", pkt_cnt ), UVM_LOW )
  endfunction : report_phase

endclass : monitor_pkt_rx

`endif  //_MONITOR_PACKET_RX_

