# Risc-V-Pipelined-Processor-
This is a verilog based implementation of Pipelined Risc-V processor capable of running Bubble sort, created as a final project for the course Computer Architecture.

# The Bubble Sort Code:
The Bubble sort code was initially written in risc-v Assembly, and each line was then converted to machine code (64 bits), and then stored in instruction memory, 4 blocks of intruction
memory stored a single instructions (8 bit blocks), hence a total of 96 blocks of instruction memory was required in order to save the code. 

# The Single Cycle Processor:
Initially a single cycle processor was build as the first task of the project, in the single cycle processor a single instruction is executed once which makes it pretty slow. We were
assigned to check the bubble sort code on the single cycle processor first, which gave the following results: 
