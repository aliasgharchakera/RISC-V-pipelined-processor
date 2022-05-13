`include "Register_File.sv"
`include "MUX.sv"
`include "Data_Extractor.sv"
`include "Instruction_Parser.sv"
`include "Instruction_Memory.sv"
`include "Data_Memory.sv"
`include "Program_Counter.sv"
`include "Adder.sv"
`include "ALU_Control.sv"
`include "Control_Unit.sv"
`include "ALU.sv"

module top(clk, reset);
  input clk, reset;
  wire [63:0] PC_Out; 
  wire [63:0] adder1out;

  wire [31:0]Instruction; 
  wire [6:0]opcode;
  wire [4:0]rd;
  wire [2:0]func3;
  wire [4:0]rs1;
  wire [4:0]rs2;
  wire [6:0]func7;
  wire [1:0] ALUop;
  wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  wire [63:0] write_data; 
  wire [63:0]ReadData1;
  wire [63:0]ReadData2;
  wire [63:0] imm_data;
  wire [63:0] ALUinputb;
  wire [3:0]  Operation;
  wire [63:0] Result;
  wire Zero;
  wire [63:0] adder2out;
  wire [63:0] muxp12;
  wire [63:0] readdata;
  
  Program_Counter p1(clk, reset, muxp12, PC_Out);
  Adder p2(PC_Out, 64'd4, adder1out);
  InstructionMemoryMod p3(PC_Out, Instruction);
  InstructionParser p4(Instruction, opcode, rd, func3, rs1, rs2, func7);
  Control_Unit p5(opcode,Branch, MemRead, MemtoReg, ALUop,MemWrite,ALUsrc, RegWrite);
  registerFile p6(clk, reset, write_data, rs1, rs2, rd, RegWrite, ReadData1, ReadData2);
  DataExtractor p7(Instruction, imm_data);
  MUX p8(ReadData2,imm_data,ALUsrc, ALUinputb);
  ALU_Control p9(ALUop, {Instruction[30],Instruction[14:12]}, Operation);
  ALU p10(ReadData1, ALUinputb, Operation, Result, Zero);
  Adder p11(PC_Out, imm_data << 1, adder2out);
  MUX p12(adder1out, adder2out, Branch & Zero, muxp12);
  Data_Memory p13(clk, Result, ReadData2, MemWrite, MemRead, readdata);
  MUX p14(Result, readdata, MemtoReg, write_data);
  

endmodule
  