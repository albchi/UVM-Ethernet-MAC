interface intf_gxmii_tx( input bit clk);

   logic [63:0] txd;
   logic [7:0] txc;
 
   clocking cb_driver @(posedge clk);

      output [63:0] txd;
      output [7:0] txc;
   endclocking 

endinterface
