interface intf_gxmii_rx( input bit clk);

   logic [63:0] rxd;
   logic [7:0] rxc;
 
   clocking cb_driver @(posedge clk);

      output [63:0] rxd;
      output [7:0] rxc;
   endclocking 

endinterface
