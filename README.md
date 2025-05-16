![Screenshot 2025-05-16 073819](https://github.com/user-attachments/assets/657c2cde-f450-41b9-8473-d6ddce59b68d)

The RISC-V single-cycle processor is a basic CPU implementation where each instruction completes execution in exactly one clock cycle. It follows the RV32I instruction set architecture and handles fundamental operations including arithmetic calculations (ADD, SUB), memory access (LW, SW), and conditional branching (BEQ, BNE).

# RISC-V Single Cycle Processor  

This project implements a single-cycle RISC-V processor in Verilog, simulating its behavior using ModelSim. The processor supports a subset of the RISC-V ISA (RV32I), including basic arithmetic, memory access, and control flow instructions.  

## Project Description  

The single-cycle processor executes one complete instruction per clock cycle. It contains all the essential components of a simple CPU:  

- Program Counter (PC) to track instruction addresses  
- Instruction Memory storing the program  
- Register File with 32 registers  
- Arithmetic Logic Unit (ALU) for computations  
- Control Unit that generates necessary signals  
- Data Memory for load/store operations  

The processor supports these instruction types:  
- R-type: ADD, SUB, AND, OR  
- I-type: ADDI, LW  
- S-type: SW  
- B-type: BEQ, BNE  

## Implementation Details  

The design was developed in Verilog and simulated using ModelSim. Each module was first tested individually before being integrated into the complete processor. The control logic generates appropriate signals based on the instruction being executed, while the datapath handles the actual data flow and computations.  

## Simulation  

The processor was verified through simulation in ModelSim. Test programs were loaded into instruction memory to validate correct operation of different instruction types. Waveform analysis confirmed proper behavior of control signals and data flow through the pipeline.  

## Future Improvements  

While the current implementation works for basic instructions, several enhancements could be made:  
- Support for more instruction types (JAL, JALR)  
- Better immediate value handling  
- Byte/halfword memory operations  
- Exception handling  

This project demonstrates the fundamental principles of processor design and provides a foundation for more advanced implementations.  

## Usage  

To simulate the processor:  
1. Compile all Verilog files in ModelSim  
2. Load the top-level module (RISCV_TOP)  
3. Add test signals to the waveform viewer  
4. Run the simulation and analyze results  

The design can be synthesized to run on an FPGA for further testing and demonstration.

