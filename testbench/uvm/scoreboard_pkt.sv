class scoreboard_pkt extends uvm_scoreboard;

   `uvm_component_utils(scoreboard_pkt)

    typedef uvm_in_order_class_comparator#(data_pkt) packet_comparator;
    packet_comparator comparator;
   `uvm_analysis_imp_decl(ap_from_rx)

    uvm_analysis_export#(data_pkt) from_agent_out; // out from RTL
    uvm_analysis_export#(data_pkt) from_agent_in; // in to RTL

    function new(input string name = "sb", input uvm_component parent);
      super.new(name, parent);
    endfunction 


    virtual function void build_phase(input uvm_phase phase);
       super.build_phase(phase);
       comparator  = packet_comparator::type_id::create("comparator", this); 
       from_agent_out =new("from_agent_out", this);
       from_agent_in = new("from_agent_in", this);
    endfunction 
 
    virtual function void connect_phase(input uvm_phase phase);
       super.connect_phase(phase);
       this.from_agent_out.connect(comparator.after_export);
       this.from_agent_in.connect(comparator.before_export);
    endfunction 

    virtual function void report_phase(input uvm_phase phase);
       super.report_phase(phase);
       // `uvm_info("Scoreboard Report", $sformat("Matches : %0d. Mismatches : %0d", comparator.m_matches, comparator.m_mismatches), UVM_HIGH);
       $display("Scoreboard Report : Matches : %0d. Mismatches : %0d", comparator.m_matches, comparator.m_mismatches);

    endfunction 
endclass 
