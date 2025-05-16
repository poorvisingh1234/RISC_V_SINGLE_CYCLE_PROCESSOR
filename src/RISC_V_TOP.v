module RISCV_TOP(
    input clk, 
    input reset
);
    // Signal declarations
    wire [31:0] instructionTop;
    wire [31:0] instruction_outTop;
    wire [31:0] read_data1Top;
    wire [31:0] read_data2Top;
    wire [31:0] ALUresultTop;
    wire [31:0] PCNextTop;
    wire [31:0] Read_DataTop;
    wire [3:0] ALUControlTop;
    wire RegWriteTop;
    wire MemWriteTop;
    wire MemReadTop;
    wire ALUScrTop;
    wire branchTop;
    wire MemtoRegTop;
    wire [1:0] ALUOpTop;

    // Program Counter
    Program_Counter Program_Counter_inst (
        .clk(clk),
        .reset(reset),
        .PC_in(PCNextTop),
        .PC_out(instructionTop)
    );

    // Instruction Memory
    Instruction_Memory Instruction_Memory_inst (
        .reset(reset),
        .read_address(instructionTop),
        .instruction_out(instruction_outTop)
    );

    // Register File
    Register_File Register_File_inst (
        .clk(clk),
        .reset(reset),
        .Rs1(instruction_outTop[19:15]),
        .Rs2(instruction_outTop[24:20]),
        .Rd(instruction_outTop[11:7]),
        .Write_data(ALUresultTop),
        .RegWrite(RegWriteTop),
        .Read_data1(read_data1Top),
        .Read_data2(read_data2Top)
    );

    // ALU
    ALU ALU_inst (
        .A(read_data1Top),
        .B(ALUScrTop ? instruction_outTop[31:20] : read_data2Top),
        .zero(),
        .ALUControl_in(ALUControlTop),
        .ALU_result(ALUresultTop)
    );

    // Data Memory
    Data_Memory Data_Memory_inst (
        .clk(clk),
        .reset(reset),
        .MemWrite(MemWriteTop),
        .MemRead(MemReadTop),
        .Address(ALUresultTop),
        .write_data(read_data2Top),
        .Read_Data(Read_DataTop)
    );

    // ALU Control
    ALUControl ALUControl_inst (
        .ALUOp_in(ALUOpTop),
        .func7(instruction_outTop[31:25]),
        .func3(instruction_outTop[14:12]),
        .ALUControl_out(ALUControlTop)
    );

    // PC Adder
    PC_Adder PC_Adder_inst (
        .current_pc(instructionTop),
        .next_pc(PCNextTop)
    );

    // Control Unit
    Control_Unit Control_Unit_inst (
        .OPcode(instruction_outTop[6:0]),
        .branch(branchTop),
        .MemRead(MemReadTop),
        .MemtoReg(MemtoRegTop),
        .MemWrite(MemWriteTop),
        .ALUScr(ALUScrTop),
        .RegWrite(RegWriteTop),
        .ALUOp_out(ALUOpTop)
    );
endmodule