interface intf_rst( input bit clk_156m25);

   logic reset_156m25_n;
   logic wb_rst_i;
   logic reset_xgmii_rx_n;
   logic reset_xgmii_tx_n;
 
   clocking cb_driver @(posedge clk_156m25);
      output reset_156m25_n;
      output wb_rst_i;
      output reset_xgmii_rx_n;
      output reset_xgmii_tx_n;
   endclocking 

endinterface
