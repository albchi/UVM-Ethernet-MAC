module xge_mac(/*AUTOARG*/
  // Outputs
  xgmii_txd, xgmii_txc, wb_int_o, wb_dat_o, wb_ack_o, pkt_tx_full,
  pkt_rx_val, pkt_rx_sop, pkt_rx_mod, pkt_rx_err, pkt_rx_eop,
  pkt_rx_data, pkt_rx_avail,
  // Inputs
  xgmii_rxd, xgmii_rxc, wb_we_i, wb_stb_i, wb_rst_i, wb_dat_i,
  wb_cyc_i, wb_clk_i, wb_adr_i, reset_xgmii_tx_n, reset_xgmii_rx_n,
  reset_156m25_n, pkt_tx_val, pkt_tx_sop, pkt_tx_mod, pkt_tx_eop,
  pkt_tx_data, pkt_rx_ren, clk_xgmii_tx, clk_xgmii_rx, clk_156m25
  );

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input                   clk_156m25;             // To rx_dq0 of rx_dequeue.v, ...
input                   clk_xgmii_rx;           // To rx_eq0 of rx_enqueue.v, ...
input                   clk_xgmii_tx;           // To tx_dq0 of tx_dequeue.v, ...

input                   pkt_rx_ren;             // To rx_dq0 of rx_dequeue.v
input [63:0]            pkt_tx_data;            // To tx_eq0 of tx_enqueue.v
input                   pkt_tx_eop;             // To tx_eq0 of tx_enqueue.v
input [2:0]             pkt_tx_mod;             // To tx_eq0 of tx_enqueue.v
input                   pkt_tx_sop;             // To tx_eq0 of tx_enqueue.v
input                   pkt_tx_val;             // To tx_eq0 of tx_enqueue.v

input                   reset_156m25_n;         // To rx_dq0 of rx_dequeue.v, ...
input                   reset_xgmii_rx_n;       // To rx_eq0 of rx_enqueue.v, ...
input                   reset_xgmii_tx_n;       // To tx_dq0 of tx_dequeue.v, ...

input [7:0]             wb_adr_i;               // To wishbone_if0 of wishbone_if.v
input                   wb_clk_i;               // To sync_clk_wb0 of sync_clk_wb.v, ...
input                   wb_cyc_i;               // To wishbone_if0 of wishbone_if.v
input [31:0]            wb_dat_i;               // To wishbone_if0 of wishbone_if.v
input                   wb_rst_i;               // To sync_clk_wb0 of sync_clk_wb.v, ...
input                   wb_stb_i;               // To wishbone_if0 of wishbone_if.v
input                   wb_we_i;                // To wishbone_if0 of wishbone_if.v

input [7:0]             xgmii_rxc;              // To rx_eq0 of rx_enqueue.v
input [63:0]            xgmii_rxd;              // To rx_eq0 of rx_enqueue.v
// End of automatics

/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output                  pkt_rx_avail;           // From rx_dq0 of rx_dequeue.v
output [63:0]           pkt_rx_data;            // From rx_dq0 of rx_dequeue.v
output                  pkt_rx_eop;             // From rx_dq0 of rx_dequeue.v
output                  pkt_rx_err;             // From rx_dq0 of rx_dequeue.v
output [2:0]            pkt_rx_mod;             // From rx_dq0 of rx_dequeue.v
output                  pkt_rx_sop;             // From rx_dq0 of rx_dequeue.v
output                  pkt_rx_val;             // From rx_dq0 of rx_dequeue.v
output                  pkt_tx_full;            // From tx_eq0 of tx_enqueue.v

output                  wb_ack_o;               // From wishbone_if0 of wishbone_if.v
output [31:0]           wb_dat_o;               // From wishbone_if0 of wishbone_if.v
output                  wb_int_o;               // From wishbone_if0 of wishbone_if.v

output [7:0]            xgmii_txc;              // From tx_dq0 of tx_dequeue.v
output [63:0]           xgmii_txd;              // From tx_dq0 of tx_dequeue.v
// End of automatics
