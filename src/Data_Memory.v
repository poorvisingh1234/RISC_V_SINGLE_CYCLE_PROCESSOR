module Data_Memory(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] Address,
    input [31:0] write_data,
    output [31:0] Read_Data
);

    reg [31:0] Dmemory [0:63];
    integer k;

    assign Read_Data = (MemRead) ? Dmemory[Address[7:2]] : 32'h0;

    always @(posedge clk) begin
        if (reset) begin
            for (k = 0; k < 64; k = k + 1) begin
                Dmemory[k] <= 32'h0;
            end
        end
        else if (MemWrite) begin
            Dmemory[Address[7:2]] <= write_data;
        end
    end

endmodule