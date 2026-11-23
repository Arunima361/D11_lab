
/////////////////////////////////////////////////////////////////////
// Design unit: imem
// File name  : imem.sv
// Description: Program to add two numbers from switches
/////////////////////////////////////////////////////////////////////

module imem #(parameter WORD_W = 8, OP_W = 3)
    (input logic [WORD_W-OP_W-1:0] Iaddress,
     output logic [WORD_W-1:0] Idata);

`include "opcodes.svh"


always_comb
begin
    Idata = 0;

    case (Iaddress)
        0: Idata = {`ADDI, 5'd5};
        1: Idata = {`STORE, 5'd10};
        2: Idata = {`ADDI, 5'd3};
        3: Idata = {`XOR, 5'd10};
        4: Idata = {`STORE, 5'd30};
        5: Idata = {`BNE, 5'd5};

        default: Idata = 0;
    endcase
end


endmodule
