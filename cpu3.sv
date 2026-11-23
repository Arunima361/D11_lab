module cpu3 #(parameter WORD_W = 8, OP_W = 3)
                  (input logic clock, n_reset,
                   output logic [6:0] disp0, disp1);
		   
logic load_REG, ALU_REG, ALU_add, ALU_sub;
logic ALU_xor, INC_PC, WE, IMM, z_flag;

logic [OP_W-1:0] op;

logic [WORD_W-OP_W-1:0] branchaddr;
logic [WORD_W-OP_W-1:0] Iaddress;
logic [WORD_W-1:0] Idata;
logic [WORD_W-OP_W-1:0] operand;
logic [WORD_W-OP_W-1:0] Daddress;
logic [WORD_W-1:0] Wdata;
logic [WORD_W-1:0] Rdata;
logic [WORD_W-1:0] Adata;
logic [WORD_W-1:0] Mdata;
logic [WORD_W-1:0] digits;

always_comb
  begin
  branchaddr = operand;
  Daddress = operand;
  if (IMM) 
    Adata = {{OP_W{1'b0}},operand};
  else 
    Adata = Rdata;
  end

pc #(.WORD_W(WORD_W), .OP_W(OP_W)) pc0 (.*);

imem #(.WORD_W(WORD_W), .OP_W(OP_W)) imem0 (.*);

ir #(.WORD_W(WORD_W), .OP_W(OP_W)) ir0  (.*);

decoder #(.OP_W(OP_W)) decoder0  (.*);

alu #(.WORD_W(WORD_W)) alu0 (.*);

dmem #(.WORD_W(WORD_W), .OP_W(OP_W)) dmem0 (.*);

register #(.WORD_W(WORD_W), .OP_W(OP_W)) reg0 (.WE(WE && (Daddress == (2**(WORD_W-OP_W) - 2))), .*);

sevenseg d0 (.digit(digits[3:0]), .seg(disp0));
sevenseg d1 (.digit(digits[7:4]), .seg(disp1));

always_comb Rdata = Mdata;

endmodule
