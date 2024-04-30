module program_counter (
    input logic [31:0] pc_in,
    input logic rst,
    input logic clk,
    output logic [31:0] pc_out
);
    logic [31:0] pc_reg;
    always_ff @( posedge clk) begin
        pc_out = 32'b0;
        if (rst) begin
            pc_reg <= 32'b0;
        end else begin
            pc_reg <= pc_in;
        end
    end
    assign pc_out = pc_reg;
endmodule