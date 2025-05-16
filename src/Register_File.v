module Register_File (
    input clk,
    input reset,
    input [4:0] Rs1,
    input [4:0] Rs2,
    input [4:0] Rd,
    input [31:0] Write_data,
    input RegWrite,
    output [31:0] Read_data1,
    output [31:0] Read_data2
);

    reg [31:0] Registers [0:31];
    
    assign Read_data1 = (Rs1 == 5'b0) ? 32'b0 : Registers[Rs1];
    assign Read_data2 = (Rs2 == 5'b0) ? 32'b0 : Registers[Rs2];

    always @(posedge clk) begin
        if (reset) begin
            for (integer k = 0; k < 32; k = k + 1) begin
                Registers[k] <= 32'b0;
            end
        end
        else if (RegWrite && (Rd != 5'b0)) begin
            Registers[Rd] <= Write_data;
        end
    end

endmodule