module instruction_memory (
    input logic clk,
    input logic [31:0] address,
    output logic [31:0] instruction
);
    logic [31:0] mem [1024:0]; // se declara la memoria 
    assign data_out = mem[address];

endmodule