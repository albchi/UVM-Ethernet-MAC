interface intf_wb( input bit clk);

   // input to WB
   logic [7:0] adr;
   logic [31:0] dat_i;
   logic we;
   logic stb;
   logic cyc;

   // output from WB
   logic [31:0] dat_o;
   logic ack;
   logic intr;
 
   clocking cb_driver @(posedge clk);
      output adr;
      output dat_i;
      output we;
      output stb;
      output cyc;


      input dat_o;
      input ack;
      input intr;
 
   endclocking 

endinterface
