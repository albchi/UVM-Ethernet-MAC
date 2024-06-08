program tb_prog;
   import uvm_pkg::*;
   // `include "testcase1.sv"
   // `include "testcase2.sv"
   initial begin
      $display("XAC hello from tb_prog");
      // run_test("testcase_reset"); // uvm_top.run_test();
      run_test(); // uvm_top.run_test();
   end
endprogram
