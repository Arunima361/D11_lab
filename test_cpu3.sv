module test_cpu3;

parameter int WORD_W = 8, OP_W = 3;

logic clock, n_reset;
logic [6:0] disp0, disp1;

// Instantiate the processor
cpu3 #(.WORD_W(WORD_W), .OP_W(OP_W)) c1 (.*);

// Generate a 20 ns clock
initial
begin
    clock = 1'b0;
    forever
    begin
        #10ns clock = ~clock;
    end
end

// Generate reset
initial
begin
    n_reset = 1'b1;
    #1ns n_reset = 1'b0;
    #2ns n_reset = 1'b1;
end

endmodule
