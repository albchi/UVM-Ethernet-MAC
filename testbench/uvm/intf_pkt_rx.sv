interface intf_pkt_rx( input bit clk); // clk_156m25);

   // input
   logic [63:0] pkt_rx_data; 
   logic        pkt_rx_eop;  
   logic [2:0]  pkt_rx_mod; 
   logic        pkt_rx_sop;
   logic        pkt_rx_val;             
   logic        reset_156m25_n;

   // output 
   logic pkt_rx_full;

 
   clocking cb_driver @(posedge clk);
   // clocking cb_mon @(posedge clk);
      input pkt_rx_data;            
      input pkt_rx_eop;            
      input pkt_rx_mod;           
      input pkt_rx_sop;          
      input pkt_rx_val;         
      output pkt_rx_full;
   endclocking 

endinterface
