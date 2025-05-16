module PC_Adder(
    input [31:0] current_pc,
    input [31:0] offset,
    input branch_taken,
    output [31:0] next_pc
);

wire [31:0] sequential_pc = current_pc + 32'd4;
wire [31:0] branch_pc = current_pc + offset;

assign next_pc = branch_taken ? branch_pc : sequential_pc;

endmodule