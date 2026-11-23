
module imem #(parameter WORD_W = 8, OP_W = 3)
    (input logic [WORD_W-OP_W-1:0] Iaddress,
     output logic [WORD_W-1:0] Idata);

`include "opcodes.svh"

always_comb
begin
    Idata = 0;

    case (Iaddress)

        0: Idata = {`STORE, 5'd30};
        1: Idata = {`LOAD, 5'd30};
        2: Idata = {`ADD, 5'd31};
        3: Idata = {`STORE, 5'd30};
        4: Idata = {`BNE, 5'd1};

        default: Idata = 0;

    endcase
end

endmodule
