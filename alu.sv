
module alu #(parameter WORD_W = 8)
(
    input logic clock, n_reset,
    input logic load_REG, ALU_REG,
    input logic ALU_add, ALU_sub, ALU_xor,
    input logic [WORD_W-1:0] Adata,
    output logic [WORD_W-1:0] Wdata,
    output logic z_flag
);

// Zero flag
always_comb
begin
    if (Wdata == 0)
        z_flag = 1'b1;
    else
        z_flag = 1'b0;
end

// ALU register and operations
always_ff @(posedge clock, negedge n_reset)
begin
    if (!n_reset)
        Wdata <= '0;

    else if (load_REG)
    begin
        if (ALU_REG)
        begin
            if (ALU_add)
                Wdata <= Wdata + Adata;

            else if (ALU_sub)
                Wdata <= Wdata - Adata;

            else if (ALU_xor)
                Wdata <= Wdata ^ Adata;
        end
        else
            Wdata <= Adata;
    end
end

endmodule
