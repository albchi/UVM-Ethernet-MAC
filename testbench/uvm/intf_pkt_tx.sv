interface intf_pkt_tx( input bit clk); // clk_156m25);

   // input
   logic [63:0] pkt_tx_data; 
   logic        pkt_tx_eop;  
   logic [2:0]  pkt_tx_mod; 
   logic        pkt_tx_sop;
   logic        pkt_tx_val;             

   // output 
   logic pkt_tx_full;

 
   clocking cb_driver @(posedge clk);
      input pkt_tx_data;            
      input pkt_tx_eop;            
      input pkt_tx_mod;           
      input pkt_tx_sop;          
      input pkt_tx_val;         
      output pkt_tx_full;
   endclocking 

endinterface
