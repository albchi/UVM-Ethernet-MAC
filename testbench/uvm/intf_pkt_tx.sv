interface intf_pkt_tx( input bit clk); // clk_156m25);

   // input
   logic [63:0] pkt_tx_data; 
   logic        pkt_tx_eop;  
   logic [2:0]  pkt_tx_mod; 
   logic        pkt_tx_sop;
   logic        pkt_tx_val;             
   logic        reset_156m25_n;
   logic        pkt_tx_ren;

   // output 
   logic pkt_tx_full;

    clocking cb_driver @(posedge clk);
      output pkt_tx_data;            
      output pkt_tx_eop;            
      output pkt_tx_mod;           
      output pkt_tx_sop;          
      output pkt_tx_val;         
      input pkt_tx_full;
      input pkt_tx_ren;
   endclocking 


   clocking cb_monitor @(posedge clk);

      input pkt_tx_data;            
      input pkt_tx_eop;            
      input pkt_tx_mod;           
      input pkt_tx_sop;          
      input pkt_tx_val;         

      output pkt_tx_full;
      output pkt_tx_ren;
   endclocking 

endinterface
