
/////////////////////////////////////////////////////////////////////
// Design unit: test_cpu2
// File name  : test_cpu2.sv
// Description: Testbench for adding two switch inputs
/////////////////////////////////////////////////////////////////////

module test_cpu2;

parameter int WORD_W = 8, OP_W = 3;

logic clock, n_reset;
logic [6:0] disp0, disp1;
logic [WORD_W-1:0] switches;

// CPU2 instance
cpu2 #(.WORD_W(WORD_W), .OP_W(OP_W)) c1 (.*);

// Clock generation: 20 ns period
initial
begin
    clock = 1'b0;
    forever
    begin
        #10ns clock = 1'b1;
        #10ns clock = 1'b0;
    end
end

// Reset generation
initial
begin
    n_reset = 1'b1;
    #1ns n_reset = 1'b0;
    #2ns n_reset = 1'b1;
end

// Two switch inputs
initial
begin
    switches = 8'd3;       // First number

    #20ns switches = 8'd5; // Second number
end

endmodule
