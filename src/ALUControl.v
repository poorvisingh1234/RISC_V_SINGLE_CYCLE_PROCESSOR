module ALUControl(
    input [1:0] ALUOp_in,
    input [6:0] func7,
    input [2:0] func3,
    output reg [3:0] ALUControl_out
);

always @(*) begin
    case ({ALUOp_in, func7, func3})
        12'b00_xxxxxxx_xxx: ALUControl_out = 4'b0010;
        12'b01_xxxxxxx_xxx: ALUControl_out = 4'b0110;
        12'b10_0000000_000: ALUControl_out = 4'b0010;
        12'b10_0100000_000: ALUControl_out = 4'b0110;
        12'b10_0000000_111: ALUControl_out = 4'b0000;
        12'b10_0000000_110: ALUControl_out = 4'b0001;
        12'b10_0000000_101: ALUControl_out = 4'b0101;
        12'b10_0000000_010: ALUControl_out = 4'b0111;
        default: ALUControl_out = 4'b0000;
    endcase
end

endmodule