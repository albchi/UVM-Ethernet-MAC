`ifndef _MONITOR_PACKET_TX_MONITOR_
`define _MONITOR_PACKET_TX_MONITOR_


class monitor_pkt_tx extends uvm_monitor;

  virtual intf_pkt_tx     vi;
  int unsigned                  m_num_captured;
  uvm_analysis_port #(data_pkt_tx)   ap_tx_mon;

  `uvm_component_utils( monitor_pkt_tx )

  function new(input string name="monitor_pkt_tx", input uvm_component parent);
    super.new(name, parent);
  endfunction : new


  virtual function void build_phase(input uvm_phase phase);
    super.build_phase(phase);
    m_num_captured = 0;
    ap_tx_mon = new ( "ap_tx_mon", this );
    uvm_config_db#(virtual intf_pkt_tx)::get(this, "", "vi", vi);
    if ( vi==null )
      `uvm_fatal(get_name(), "Virtual Interface for monitor not set!");
  endfunction : build_phase


  virtual task run_phase(input uvm_phase phase);
    data_pkt_tx      rcv_pkt;
    bit         pkt_in_progress = 0;
    bit [7:0]   rx_data_q[$];
    int         idx;
    bit         packet_captured = 0;

    `uvm_info( get_name(), $sformatf("HIERARCHY: %m"), UVM_HIGH);

    forever begin


      @(vi.clk) // @(vi.mon_cb)
      if ( vi.pkt_tx_val ) begin 
        // if ( vi.pkt_tx_sop && !vi.pkt_tx_eop && pkt_in_progress==0 ) begin
        if ( vi.pkt_tx_sop && !vi.pkt_tx_eop  ) begin
           $display("XAC PKT_TX_MON sop : %b", vi.pkt_tx_sop);
           $display("XAC PKT_TX_MON sop : %b", vi.pkt_tx_sop);
           $display("XAC PKT_TX_MON data : %h", vi.pkt_tx_data);
           // `uvm_info("XAC Hey from PKT_TX MON ","SEE THIS", UVM_HIGH);
           // `uvm_info("XAC PKT TX MON run_phase received this packet ", req.sprint(), UVM_HIGH);

        end
      end
    end
  endtask : run_phase


  function void report_phase( uvm_phase phase );
    `uvm_info( get_name( ), $sformatf( "REPORT: Captured %0d packets", m_num_captured ), UVM_LOW )
  endfunction : report_phase

endclass : monitor_pkt_tx

`endif  //_MONITOR_PACKET_TX_

