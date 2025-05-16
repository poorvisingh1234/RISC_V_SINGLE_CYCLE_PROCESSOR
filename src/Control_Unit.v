module Control_Unit(
    input [6:0] OPcode,
    output reg branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUScr,
    output reg RegWrite,
    output reg [1:0] ALUOp_out
);

always @(*) begin
    case(OPcode)
        7'b0110011: begin  // R-type
            branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            MemWrite = 0;
            ALUScr = 0;
            RegWrite = 1;
            ALUOp_out = 2'b10;
        end
        7'b0000011: begin  // I-type (load)
            branch = 0;
            MemRead = 1;
            MemtoReg = 1;
            MemWrite = 0;
            ALUScr = 1;
            RegWrite = 1;
            ALUOp_out = 2'b00;
        end