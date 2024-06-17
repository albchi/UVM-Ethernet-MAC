`include "timescale.v"
`include "defines.v"

module tb_top_xge_mac;



reg [7:0]     tx_buffer[0:10000];
integer       tx_length;

reg           clk_156m25;
reg           clk_312m50;
reg           clk_xgmii_rx;
reg           clk_xgmii_tx;
reg           clk_wb; //xac+


reg           reset_156m25_n;
reg           reset_xgmii_rx_n;
reg           reset_xgmii_tx_n;

// xac- reg           pkt_rx_ren;

// xac- reg  [63:0]   pkt_tx_data;
// xac- reg           pkt_tx_val;
// xac- reg           pkt_tx_sop;
// xac- reg           pkt_tx_eop;
// xac- reg  [2:0]    pkt_tx_mod;

integer       tx_count;
integer       rx_count;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire                    pkt_rx_avail;           // From dut of xge_mac.v
wire [63:0]             pkt_rx_data;            // From dut of xge_mac.v
wire                    pkt_rx_eop;             // From dut of xge_mac.v
wire                    pkt_rx_err;             // From dut of xge_mac.v
wire [2:0]              pkt_rx_mod;             // From dut of xge_mac.v
wire                    pkt_rx_sop;             // From dut of xge_mac.v
wire                    pkt_rx_val;             // From dut of xge_mac.v
wire                    pkt_tx_full;            // From dut of xge_mac.v
wire                    wb_ack_o;               // From dut of xge_mac.v
wire [31:0]             wb_dat_o;               // From dut of xge_mac.v
wire                    wb_int_o;               // From dut of xge_mac.v
wire [7:0]              xgmii_txc;              // From dut of xge_mac.v
wire [63:0]             xgmii_txd;              // From dut of xge_mac.v
// End of automatics

wire  [7:0]   wb_adr_i;
wire  [31:0]  wb_dat_i;

wire [7:0]              xgmii_rxc;
wire [63:0]             xgmii_rxd;

wire [3:0]              tx_dataout;

wire                    xaui_tx_l0_n;
wire                    xaui_tx_l0_p;
wire                    xaui_tx_l1_n;
wire                    xaui_tx_l1_p;
wire                    xaui_tx_l2_n;
wire                    xaui_tx_l2_p;
wire                    xaui_tx_l3_n;
wire                    xaui_tx_l3_p;

   
intf_pkt_rx intf_pkt_rx_0(clk_156m25);
intf_pkt_tx intf_pkt_tx_0(clk_156m25);
intf_rst intf_rst_0(clk_156m25);
intf_wb intf_wb_0(clk_wb);
// assign clk_156m25 = intf.clk_156m25;
// assign clk_156m25 = intf.clk_156m25 = clk_156m25;
/*
intf_rst intf_rst_0 (
   .wb_clk_i(wb_clk_i), 
   .clk_156m25(clk_156m25), 
   .clk_xgmii_rx(clk_xgmii_rx), 
   .clk_xgmii_tx(clk_xgmii_tx)
);
*/
   
xge_mac dut(/*AUTOINST*/
            // Outputs
            .pkt_rx_avail               (pkt_rx_avail),
            .pkt_rx_data                (intf_pkt_rx_0.pkt_rx_data), // (pkt_rx_data[63:0]),
            .pkt_rx_eop                 (intf_pkt_rx_0.pkt_rx_eop),
            .pkt_rx_err                 (pkt_rx_err),
            .pkt_rx_mod                 (pkt_rx_mod[2:0]),
            .pkt_rx_sop                 (intf_pkt_rx_0.pkt_rx_sop),
            .pkt_rx_val                 (intf_pkt_rx_0.pkt_rx_val),
            .pkt_tx_full                (intf_pkt_tx_0.pkt_tx_full), // (pkt_tx_full),
            .wb_ack_o                   (wb_ack_o),
            .wb_dat_o                   (wb_dat_o[31:0]),
            .wb_int_o                   (wb_int_o),
            .xgmii_txc                  (xgmii_txc[7:0]),
            .xgmii_txd                  (xgmii_txd[63:0]),
            // Inputs
`ifdef ORIG_RESET
            .clk_156m25                 (clk_156m25),
`else
            .clk_156m25                 (intf_rst_0.clk_156m25),
`endif
            .clk_xgmii_rx               (clk_xgmii_rx),
            .clk_xgmii_tx               (clk_xgmii_tx),
            // .pkt_rx_ren                 (pkt_rx_ren),
            .pkt_rx_ren                 (intf_pkt_rx_0.pkt_rx_ren),
            .pkt_tx_data                (intf_pkt_tx_0.pkt_tx_data), // (pkt_tx_data[63:0]),
            .pkt_tx_eop                 (intf_pkt_tx_0.pkt_tx_eop), // (pkt_tx_eop),
            .pkt_tx_mod                 (intf_pkt_tx_0.pkt_tx_mod), // (pkt_tx_mod[2:0]),
            .pkt_tx_sop                 (intf_pkt_tx_0.pkt_tx_sop), // (pkt_tx_sop),
            .pkt_tx_val                 (intf_pkt_tx_0.pkt_tx_val), // (pkt_tx_val),
`ifdef ORIG_RESET
            .reset_156m25_n             (reset_156m25_n),
            .reset_xgmii_rx_n           (reset_xgmii_rx_n),
            .reset_xgmii_tx_n           (reset_xgmii_tx_n),
`else
            .reset_156m25_n             (intf_rst_0.reset_156m25_n),
            .reset_xgmii_rx_n           (intf_rst_0.reset_xgmii_rx_n),
            .reset_xgmii_tx_n           (intf_rst_0.reset_xgmii_tx_n),
`endif 
            .wb_adr_i                   (wb_adr_i[7:0]),
            .wb_clk_i                   (wb_clk_i),
            .wb_cyc_i                   (wb_cyc_i),
            .wb_dat_i                   (wb_dat_i[31:0]),
            .wb_rst_i                   (wb_rst_i),
            .wb_stb_i                   (wb_stb_i),
            .wb_we_i                    (wb_we_i),
            .xgmii_rxc                  (xgmii_rxc[7:0]),
            .xgmii_rxd                  (xgmii_rxd[63:0]));

`ifdef GXB
// Example of transceiver instance
gxb gxb(// Outputs
        .rx_ctrldetect                  ({xgmii_rxc[7],
                                          xgmii_rxc[5],
                                          xgmii_rxc[3],
                                          xgmii_rxc[1],
                                          xgmii_rxc[6],
                                          xgmii_rxc[4],
                                          xgmii_rxc[2],
                                          xgmii_rxc[0]}),
        .rx_dataout                     ({xgmii_rxd[63:56],
                                          xgmii_rxd[47:40],
                                          xgmii_rxd[31:24],
                                          xgmii_rxd[15:8],
                                          xgmii_rxd[55:48],
                                          xgmii_rxd[39:32],
                                          xgmii_rxd[23:16],
                                          xgmii_rxd[7:0]}),
        .tx_dataout                     (tx_dataout[3:0]),
        // Inputs
        .pll_inclk                      (clk_156m25),
        // .rx_analogreset                 (~intf_rst.reset_156m25_n),
        .rx_analogreset                 (~reset_156m25_n),
        .rx_cruclk                      ({clk_156m25, clk_156m25, clk_156m25, clk_156m25}),
        .rx_datain                      (tx_dataout[3:0]),
        .rx_digitalreset                (~reset_156m25_n),
        // .rx_digitalreset                (~intf_rst.reset_156m25_n),
        .tx_ctrlenable                  ({xgmii_txc[7],
                                          xgmii_txc[5],
                                          xgmii_txc[3],
                                          xgmii_txc[1],
                                          xgmii_txc[6],
                                          xgmii_txc[4],
                                          xgmii_txc[2],
                                          xgmii_txc[0]}),
        .tx_datain                      ({xgmii_txd[63:56],
                                          xgmii_txd[47:40],
                                          xgmii_txd[31:24],
                                          xgmii_txd[15:8],
                                          xgmii_txd[55:48],
                                          xgmii_txd[39:32],
                                          xgmii_txd[23:16],
                                          xgmii_txd[7:0]}),
        .tx_digitalreset                (~reset_156m25_n));
        // .tx_digitalreset                (~intf_rst.reset_156m25_n));
`endif

`ifdef XIL
// Example of transceiver instance
xaui_block xaui(// Outputs
                .txoutclk               (),
                .xgmii_rxd              (xgmii_rxd[63:0]),
                .xgmii_rxc              (xgmii_rxc[7:0]),
                .xaui_tx_l0_p           (xaui_tx_l0_p),
                .xaui_tx_l0_n           (xaui_tx_l0_n),
                .xaui_tx_l1_p           (xaui_tx_l1_p),
                .xaui_tx_l1_n           (xaui_tx_l1_n),
                .xaui_tx_l2_p           (xaui_tx_l2_p),
                .xaui_tx_l2_n           (xaui_tx_l2_n),
                .xaui_tx_l3_p           (xaui_tx_l3_p),
                .xaui_tx_l3_n           (xaui_tx_l3_n),
                .txlock                 (),
                .align_status           (),
                .sync_status            (),
                .mgt_tx_ready           (),
                .drp_o                  (),
                .drp_rdy                (),
                .status_vector          (),
                // Inputs
                .dclk                   (clk_156m25),
                .clk156                 (clk_156m25),
                .clk312                 (clk_312m50),
                .refclk                 (clk_156m25),
`ifdef ORIG_RESET
                .reset                  (~reset_156m25_n),
                .reset156               (~reset_156m25_n),
`else
                .reset156               (~intf_rst_0.reset_156m25_n),
                .reset                  (~intf_rst_0.reset_156m25_n),
`endif
                .xgmii_txd              (xgmii_txd[63:0]),
                .xgmii_txc              (xgmii_txc[7:0]),
                .xaui_rx_l0_p           (xaui_tx_l0_p),
                .xaui_rx_l0_n           (xaui_tx_l0_n),
                .xaui_rx_l1_p           (xaui_tx_l1_p),
                .xaui_rx_l1_n           (xaui_tx_l1_n),
                .xaui_rx_l2_p           (xaui_tx_l2_p),
                .xaui_rx_l2_n           (xaui_tx_l2_n),
                .xaui_rx_l3_p           (xaui_tx_l3_p),
                .xaui_rx_l3_n           (xaui_tx_l3_n),
                .signal_detect          (4'b1111),
                .drp_addr               (7'b0),
                .drp_en                 (2'b0),
                .drp_i                  (16'b0),
                .drp_we                 (2'b0),
                .configuration_vector   (7'b0));

glbl glbl();
`endif

//---
// Unused for this testbench

assign wb_adr_i = 8'b0;
assign wb_clk_i = 1'b0;
assign wb_cyc_i = 1'b0;
assign wb_dat_i = 32'b0;
assign wb_rst_i = 1'b1;
assign wb_stb_i = 1'b0;
assign wb_we_i = 1'b0;


initial begin
`ifdef ORIG_RESET
    $display("using ORIG_RESET");
`else
    $display("not using ORIG_RESET");
`endif
   $fsdbDumpvars;
end
initial begin
    tx_count = 0;
    rx_count = 0;
end

//---
// XGMII Loopback
// This test is done with loopback on XGMII or using one of the tranceiver examples

`ifndef GXB
  `ifndef XIL
    assign xgmii_rxc = xgmii_txc;
    assign xgmii_rxd = xgmii_txd;
  `endif
`endif

//---
// Clock generation

initial begin
    clk_wb = 1'b0; //xac+
    clk_156m25 = 1'b0;
    clk_xgmii_rx = 1'b0;
    clk_xgmii_tx = 1'b0;
    forever begin
        WaitPS(3200);
        clk_wb = ~clk_wb; //xac+
        clk_156m25 = ~clk_156m25;
        clk_xgmii_rx = ~clk_xgmii_rx;
        clk_xgmii_tx = ~clk_xgmii_tx;
    end
end

initial begin
    clk_312m50 = 1'b0;
    forever begin
        WaitPS(1600);
        clk_312m50 = ~clk_312m50;
    end
end

//---
// Reset Generation
initial begin
    reset_156m25_n = 1'b0;
    reset_xgmii_rx_n = 1'b0;
    reset_xgmii_tx_n = 1'b0;
    WaitNS(20);
    reset_156m25_n = 1'b1;
    reset_xgmii_rx_n = 1'b1;
    reset_xgmii_tx_n = 1'b1;
end


// `include "verilog_tasks.v"

task WaitNS;
  input [31:0] delay;
    begin
        #(1000*delay);
    end
endtask

task WaitPS;
  input [31:0] delay;
    begin
        #(delay);
    end
endtask




endmodule // tb_top_xge_mac
