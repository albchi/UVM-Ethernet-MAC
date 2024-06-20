class coverage_pkt_tx  extends uvm_subscriber#(data_pkt);

   `uvm_component_utils(coverage_pkt_tx )

   data_pkt data_pkt_to_cov;

   covergroup cg_pkt_tx;
      ifg : coverpoint data_pkt_to_cov.ifg {
               bins bin_low_ifg =  {[1:9]};
               bins bin_high_ifg =  {[10:999]};
            }
      len : coverpoint data_pkt_to_cov.len {
               bins bin_low_len =  {[1:99]};
               bins bin_high_ifg =  {[100:3999]};
            }
 
   endgroup

   function new(input string name = "coverage_pkt_tx ", input uvm_component parent);
      super.new(name, parent);
      cg_pkt_tx = new();
   endfunction 

   function void build_phase(input uvm_phase phase);
      data_pkt_to_cov = new();
   endfunction // build_phase(input uvm_phase phase);

   // function void write(input data_pkt pkt_from_agent_out);
   function void write(input data_pkt t);
      // this.data_pkt_to_cov = pkt_from_agent_out;
      this.data_pkt_to_cov = t;
      cg_pkt_tx.sample();
   endfunction // write(input data_pkt pkt_from_agent_out);
endclass // coverage_pkt_tx  extends uvm_subscriber#(data_pkt);
