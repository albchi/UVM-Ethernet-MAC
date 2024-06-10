`ifndef _SEQUENCE_VIRTUAL_
`define _SEQUENCE_VIRTUAL_


class virtual_sequence extends uvm_sequence;

  `uvm_object_utils(virtual_sequence)
  `uvm_declare_p_sequencer(virtual_sequencer)

  sequence_reset     sequence_reset_0;
  sequence_pkt_tx    sequence_pkt_tx_0;
  // wishbone_init_sequence    seq_init_wshbn;
  // wishbone_eot_sequence     seq_eot_wshbn;
  // packet_sequence           seq_pkt;

  function new(input string name="virtual_sequence");
    super.new(name);
    `uvm_info( get_name(), $sformatf("Hierarchy: %m"), UVM_HIGH )
  endfunction : new


  virtual task body();
    `uvm_do_on(sequence_reset_0, p_sequencer.sequence_reset_0);
    // `uvm_do_on( seq_pkt, p_sequencer.seqr_tx_pkt );
    #1000000;
    // `uvm_do_on( seq_eot_wshbn, p_sequencer.seqr_wshbn );
    `uvm_do_on(sequence_pkt_tx_0, p_sequencer.sequence_pkt_tx_0);
  endtask : body


  virtual task pre_start();
    super.pre_start();
    if ( (starting_phase!=null) && (get_parent_sequence()==null) )
      starting_phase.raise_objection( this );
  endtask : pre_start


  virtual task post_start();
    super.post_start();
    if ( (starting_phase!=null) && (get_parent_sequence()==null) )
      starting_phase.drop_objection( this );
  endtask : post_start

endclass : virtual_sequence


`endif // _VIRTUAL_SEQUENCE_
