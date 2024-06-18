`ifndef _MONITOR_PACKET_TX_MONITOR_
`define _MONITOR_PACKET_TX_MONITOR_


class monitor_pkt_tx extends uvm_monitor;

  virtual intf_pkt_tx     vi;
  int pkt_captured;
  uvm_analysis_port #(data_pkt)   ap; // send info out, prob to sb

  `uvm_component_utils( monitor_pkt_tx )

  function new(input string name="monitor_pkt_tx", input uvm_component parent);
    super.new(name, parent);
  endfunction : new


  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    pkt_captured = 0;
    ap = new ( "ap", this );
    uvm_config_db#(virtual intf_pkt_tx)::get(this, "", "vi", vi);
    if ( vi==null )
      `uvm_fatal(get_name(), "Virtual Interface for TX PKT MON not set!");
  endfunction : build_phase


  virtual task run_phase(input uvm_phase phase);
    data_pkt      tmp_rcv_pkt;
    bit [7:0]   tx_data_q[$];
    int         idx;
    bit         packet_captured = 0;
    bit         pkt_in_flight = 0;

    `uvm_info( get_name(), $sformatf("HIERARCHY: %m"), UVM_HIGH);

    forever begin


      `uvm_info("MON_PKT_RX ", "pkt_tx_mon drive pkt_tx_ren to 1", UVM_HIGH);
      vi.pkt_tx_ren <= 1'b1; 
      @(vi.clk) // @(vi.mon_cb)
      $display("XAC PKT_RX_MON pkt_rx_ten is : %b", vi.pkt_tx_ren);
      `uvm_info("MON_PKT_RX ", "pkt_tx_mon wait for pkt_tx_val", UVM_HIGH);
      if ( vi.pkt_tx_val ) begin 
        `uvm_info("MON_PKT_RX ", "pkt_tx_mon got pkt_tx_val", UVM_HIGH);
        // if ( vi.pkt_tx_sop && !vi.pkt_tx_eop && pkt_in_flight==0 ) begin
        tmp_rcv_pkt = data_pkt::type_id::create("tmp_rcv_pkt", this);

        // `uvm_info( get_name(), $sformatf("xac pkt_tx_mon got  pkt_tx_val), UVM_HIGH);
        `uvm_info("MON_PKT_RX ", "pkt_tx_mon wait for sop and eop ", UVM_HIGH);
        if ( vi.pkt_tx_sop && !vi.pkt_tx_eop  ) begin
           `uvm_info("MON_PKT_RX ", "pkt_tx_mon got sop and eop ", UVM_HIGH);
           $display("XAC PKT_RX_MON sop : %b", vi.pkt_tx_sop);
           tmp_rcv_pkt.data = vi.pkt_tx_data;
           $display("XAC PKT_RX_MON sop : %b", vi.pkt_tx_sop);
           $display("XAC PKT_RX_MON data : %h", vi.pkt_tx_data);
           tmp_rcv_pkt.data = vi.pkt_tx_data;
           `uvm_info("MON_PKT_RX run_phase received this packet ", tmp_rcv_pkt.sprint(), UVM_HIGH);
           `uvm_info("PKT_RX_MON writing this to ap", tmp_rcv_pkt.sprint(), UVM_HIGH);
           ap.write(tmp_rcv_pkt);

        end // vi.pkt_tx_sop && !vi.pkt_tx_eop  ) begin
      end // if vi.pkt_tx_val
      vi.pkt_tx_ren <= 1'b0; 
      $display("PKT_RX_MON pkt_tx_ren is now : %b", vi.pkt_tx_ren);
      `uvm_info("PKT_RX_MON ", "going back ",  UVM_HIGH);
    end // forever begin
  endtask : run_phase


  function void report_phase( uvm_phase phase );
    `uvm_info( get_name( ), $sformatf( "REPORT: PKT RX Captured %0d packets", pkt_captured ), UVM_LOW )
  endfunction : report_phase

endclass : monitor_pkt_tx

`endif  //_MONITOR_PACKET_TX_

