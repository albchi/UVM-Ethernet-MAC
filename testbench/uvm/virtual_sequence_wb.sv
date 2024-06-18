`ifndef _VIRTUAL_SEQUENCE_WB_
`define _VIRTUAL_SEQUENCE_WB_


class virtual_sequence_wb extends uvm_sequence;

  `uvm_object_utils(virtual_sequence_wb)
  `uvm_declare_p_sequencer(virtual_sequencer)

  sequence_wb        sequence_wb_0;
  sequence_reset     sequence_reset_0;
  sequence_pkt_tx    sequence_pkt_tx_0;

  function new(input string name="virtual_sequence_wb");
    super.new(name);
    `uvm_info( get_name(), $sformatf("Hierarchy: %m"), UVM_HIGH )
  endfunction : new


  virtual task body();
    `uvm_do_on(sequence_reset_0, p_sequencer.sequencer_reset_0);
    #10000;
    `uvm_do_on(sequence_wb_0, p_sequencer.sequencer_wb_0);
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

endclass : virtual_sequence_wb


`endif // _VIRTUAL_SEQUENCE_WB_
