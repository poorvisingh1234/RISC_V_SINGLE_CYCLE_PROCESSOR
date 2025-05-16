module ALU(
    input [31:0] A,
    input [31:0] B,
    output reg zero,
    input [3:0] ALUControl_in,
    output reg [31:0] ALU_result
);

    always @(*) begin
        case (ALUControl_in)
            4'b0000: begin zero = 0; ALU_result = A & B; end
            4'b0001: begin zero = 0; ALU_result = A | B; end
            4'b0010: begin zero = 0; ALU_result = A + B; end
            4'b0110: begin zero = (A == B) ? 1 : 0; ALU_result = A - B; end
            4'b0111: begin zero = (A < B) ? 1 : 0; ALU_result = (A < B) ? 1 : 0; end
            4'b1100: begin zero = 0; ALU_result = ~(A | B); end
            default: begin zero = 0; ALU_result = A; end
        endcase
    end

endmodule