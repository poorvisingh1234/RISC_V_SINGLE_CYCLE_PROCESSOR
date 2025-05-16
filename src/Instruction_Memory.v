module Instruction_Memory(
    input reset,
    input [31:0] read_address,  
    output reg [31:0] instruction_out  
);

   
    reg [31:0] Memory [0:63]; 

    
    initial begin
        
        Memory[0] = 32'h00000033;  
       
    end

   
    always @(*) begin
        if (reset)
            instruction_out = 32'h00000000;  
        else
            instruction_out = Memory[read_address[7:2]];  
    end
endmodule
