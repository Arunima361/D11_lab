
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

        0: Idata = {`STORE, 5'd29}; // Initialise temporary memory
        1: Idata = {`LOAD,  5'd31}; // Read first switch value
        2: Idata = {`STORE, 5'd29}; // Save first number
        3: Idata = {`LOAD,  5'd31}; // Read second switch value
        4: Idata = {`ADD,   5'd29}; // Add first number
        5: Idata = {`STORE, 5'd30}; // Display the sum
        6: Idata = {`BNE,   5'd6};  // Loop here if sum is non-zero

        default: Idata = 0;

    endcase
end

endmodule
