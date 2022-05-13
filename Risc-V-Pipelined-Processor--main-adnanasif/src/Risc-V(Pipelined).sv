// Code your design here
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

module top(clk,reset);
  input clk, reset;
  wire [63:0] PC_Out;
  wire [63:0] muxp12;
  wire [63:0] adder1out;
  wire [31:0] Instruction;
  wire [63:0] IF_ID_PC_Out;
  wire [31:0] IF_ID_Inst;
  
  //outputofInstructionParser
  
  wire [6 :0] opcode;
  wire [4:0] IF_rd;
  wire [2:0] IF_funct3;
  wire [4:0] IF_rs1;
  wire [4:0] IF_rs2;
  wire [6:0] IF_funct7;
  //output of Data Extractor
  wire [63:0] IF_ID_data;
  // output of CU
  wire IF_ID_Branch, IF_ID_MemRead,  IF_ID_MemtoReg,IF_ID_ALUop,IF_ID_MemWrite,IF_ID_ALUsrc, IF_ID_RegWrite;
  //output of register file
    
  wire [63:0] IF_ID_ReadData1;
  wire [63:0] IF_ID_ReadData2;
  
  
  //ID_IX
  wire [3:0] ID_EX_Inst;
  wire [4:0] ID_EX_rs1;
  wire [4:0] ID_EX_rs2;
  wire [4:0] ID_EX_rd;
  wire [63:0] ID_EX_imm_data;
  wire [63:0] ID_EX_ReadData2;
  wire [63:0] ID_EX_ReadData1;
  wire [63:0] ID_EX_PC_Out;
  wire ID_EX_ALUsrc;
  wire [1:0] ID_EX_ALUop;
  wire ID_EX_Branch;
  wire ID_EX_MemRead;
  wire ID_EX_MemWrite;
  wire ID_EX_RegWrite;
  wire ID_EX_MemtoReg;
  
  //alu_control
  wire [3:0] ID_IX_OP;
  // muxes
  wire [63:0] ID_EX_mux_ForwardA;
  wire [63:0] ID_EX_mux_ForwardB;
  
  wire [63:0] ID_EX_mux_ALU;
  //alu
  wire ID_EX_ALUzero;
  wire [63:0] ID_EX_ALU;
  
  
  // EX_MEM
  
  wire [4:0] EX_MEM_rd;
  wire [63:0] EX_MEM_mux_ForwardB;
  wire [63:0] EX_MEM_mux_ALU;
  wire EX_MEM_ALUzero;
  wire [63:0] EX_MEM_adder2out;
  wire [63:0] EX_MEM_readData;
  wire EX_MEM_Branch, EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_RegWrite, EX_MEM_MemtoReg;
  
  // MEM_WB
  
 wire [4:0] MEM_WB_rd;
 wire [63:0] MEM_WB_mux_ALU;
 wire [63:0] MEM_WB_readData;
 wire MEM_WB_RegWrite;			
 wire MEM_WB_MemtoReg;				
 wire [63:0] MEM_WB_mux;

  
  
  
  
  
  
  //Modules
  Program_Counter p1(clk, reset, muxp12,PC_Out);
  Adder AddInc (PC_Out, 64'd4, adder1out);
  InstructionMemory I1(PC_Out, Instruction);
  
  IF_ID if_id (clk,reset,PC_Out, Instruction, IF_ID_Inst, IF_ID_PC_Out);
  
  InstructionParser ip1 (IF_ID_Inst, opcode,IF_ID_rd, IF_ID_funct3, IF_ID_rs1, IF_ID_rs2, IF_ID_funct7);
  
  DataExtractor d1(IF_ID_Inst, IF_ID_data);
  
  
  Control_Unit c1(opcode,IF_ID_Branch, IF_ID_MemRead,  IF_ID_MemtoReg,IF_ID_ALUop,IF_ID_MemWrite,IF_ID_ALUsrc, IF_ID_RegWrite);
  
  registerFile r1 (clk, reset, MEM_WB_mux, IF_ID_rs1, IF_ID_rs2, MEM_WB_rd, MEM_WB_RegWrite, IF_ID_ReadData1, IF_ID_ReadData2);
  
  
  
  ID_IX I1 (clk,reset
            ,{IF_ID_Inst[30],IF_ID_Inst[14:12]}, 
            IF_ID_rs1,
            IF_ID_rs2, 
            IF_ID_rd,  
            IF_ID_PC_Out,
            IF_ID_ReadData1,
            IF_ID_ReadData2,
            IF_ID_imm_data,
            IF_ID_Branch,
            IF_ID_MemRead,
            IF_ID_MemtoReg,
            IF_ID_ALUop,
            IF_ID_MemWrite,
            IF_ID_ALUsrc,
            IF_ID_RegWrite,
            
            ID_EX_Inst,
            ID_EX_rs1,
            ID_EX_rs2, 
            ID_EX_rd, 
            ID_EX_PC_Out, 
            ID_EX_ReadData1,
            ID_EX_ReadData2,
            ID_EX_imm_data,
            ID_EX_Branch,
            ID_EX_MemRead,
            ID_EX_MemtoReg,
            ID_EX_ALUop,
            ID_EX_MemWrite,
            ID_EX_ALUsrc,
            ID_EX_RegWrite);
  
              
  Adder branch(ID_EX_PC_Out,ID_IX_imm_data << 1, adder2out);
  ALU_Control alu1( ID_EX_ALUop,ID_EX_Inst,ID_EX_OP);
  
  
  
  MUX_4 forward_A(ID_EX_ReadData1,MEM_WB_mux,EX_MEM_Alu,64'd0,ForwardA, ID_EX_mux_ForwardA); //refer to chat for variable names
  
  
  MUX_4 forward_B
  (ID_EX_ReadData2, MEM_WB_mux, EX_MEM_Alu,64'd0,ForwardB, ID_EX_mux_ForwardB); //refer to chat for variable names
  
  MUX m1(ID_EX_mux_ForwardB,ID_EX_imm_data,ID_EX_ALUsrc,ID_EX_mux_ALU); //refer to chat for variable names
  
  
  ALU a1(ID_EX_mux_ForwardA, ID_EX_mux_ForwardB, ID_EX_OP, ID_EX_ALU, ID_EX_ALUzero);
  
  EX_MEM reg3 (clk, reset, 
              ID_EX_rd, ID_EX_mux_ForwardB, ID_EX_mux_ALU, ID_EX_ALUzero, adder2out, ID_EX_Branch, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_RegWrite, ID_EX_MemtoReg,
              EX_MEM_rd, EX_MEM_mux_ForwardB, EX_MEM_mux_ALU, EX_MEM_ALUzero, EX_MEM_adder2out, EX_MEM_Branch, EX_MEM_MemRead, EX_MEM_MemWrite, EX_MEM_RegWrite, EX_MEM_MemtoReg);
  
  Data_Memory dm1(clk, EX_MEM_mux_ALU, EX_MEM_mux_ForwardB,  EX_MEM_MemWrite, EX_MEM_MemRead, EX_MEM_readData);
  
  MEM_WB reg4 (clk, reset,
               EX_MEM_rd, EX_MEM_mux_ALU, EX_MEM_readData, EX_MEM_RegWrite, EX_MEM_MemtoReg,
              MEM_WB_rd, MEM_WB_mux_ALU, MEM_WB_readData, MEM_WB_RegWrite, MEM_WB_MemtoReg);
  
  MUX xd (MEM_WB_mux_ALU, MEM_WB_readData, MEM_WB_MemtoReg, MEM_WB_mux);
  MUX m2(adder1out,adder2out, EX_MEM_Branch & EX_MEM_ALUzero, muxp12);
  Forwarding forward(EX_MEM_rd, EX_MEM_RegWrite,MEM_WB_rd, MEM_WB_RegWrite, ID_EX_rs1, ID_EX_rs2,ForwardA, ForwardB);
   
  
endmodule

  
//Inputs to EX_MEM a/c to our variable names
// adder2out, 
// ID_EX_ALUzero
// ID_EX_ALU
// ID_EX_rd
// ID_EX_RegWrite etc (memread etccc sab)
// ID_EX_mux_ForwardB
//cross check once.
