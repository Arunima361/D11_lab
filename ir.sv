/////////////////////////////////////////////////////////////////////
// Design unit: ir
//            :
// File name  : ir.sv
//            :
// Description: Instruction register for basic processor
//            :
// Limitations: None
//            :
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Mark Zwolinski
//            : School of Electronics and Computer Science
//            : University of Southampton
//            : Southampton SO17 1BJ, UK
//            : mz@ecs.soton.ac.uk
//
// Revision   : Version 1.0 05/08/08
//            : Version 1.1 17/12/13
//            : Version 1.2 14/01/21 Simplified some of the syntax
//            : Version 2.0 14/03/24 Rewritten to remove tristate bus
//            : Version 2.1 08/12/25 Single cycle version
/////////////////////////////////////////////////////////////////////

module ir  #(parameter WORD_W = 8, OP_W = 3)
             (input logic[WORD_W-1:0] Idata,
              output logic [WORD_W-OP_W-1:0] operand,
              output logic [OP_W-1:0] op);

//extract opcode and operand from instruction
always_comb
  {op, operand} = Idata;

endmodule
