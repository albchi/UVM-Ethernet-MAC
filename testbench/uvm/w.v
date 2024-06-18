module w;

integer pkt_len;

   initial begin
      pkt_len = 14;
      $display("go pkt_len=%d",pkt_len);
      while(pkt_len>10) begin
         $display("foo");
         pkt_len = pkt_len - 1;
      end
      $display("end");
    end
endmodule 
