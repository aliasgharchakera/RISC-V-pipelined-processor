module singleProcessor(
  input clk,
  input reset
);
  wire [63:0]mux1out;
  wire [63:0]pcout1;
  wire andgate;
  wire branch;
  wire zero;
  assign andgate = branch & zero; //and gate for mux 1
  
  programCounter pc(clk, reset, mux1out, pcout1); //program counter
  
  wire [63:0] mux1a;	
  wire [63:0] mux1b; 
  mux2to1 m1(mux1a, mux1b, andgate, mux1out); //MUX 1
  
  wire [31:0] instructionout;
  instructionMemory IM(pcout1, instructionout); //Ins_MEMORY
  
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [4:0] rd;
  wire [6:0] opcodetoCU;
  wire [6:0] func7;
  wire [2:0] func3;
  instructionParser IP(instructionout, opcodetoCU, rd, func3, rs1, rs2, func7); //ins_praser
  
  wire [63:0] ReadDataout1;
  wire [63:0] ReadDataout2;
  wire RegWrite;
  wire [63:0] mux3out;

  registerFile rf0(rs1, rs2, rd, mux3out, RegWrite, clk, reset, ReadDataout1, ReadDataout2); //register file
  
  wire [63:0] immcalc;
  wire [63:0] immWire;
  assign immcalc = immWire<<1;//for shift	
  wire [63:0] mux2out;
  wire ALUSrc;
  mux2to1 m2(ReadDataout2, immWire, ALUSrc, mux2out); //MUX 2
  
  dataGenerator IDG(instructionout, immWire); //Immediate data gen
  
  //wire [63:0] a;
  //wire [63:0] b;
  adder add1(pcout1, 64'd4, mux1a); //Adder 1
  
  adder add2(pcout1, immcalc, mux1b); //adder 2
  
  //wire zero;
  wire [3:0]AlU_Operation;
  wire [63:0]aluout;
  ALU_64_bit alu(ReadDataout1, mux2out, AlU_Operation, aluout, zero); //ALU
  
  wire [3:0] functin;
  assign functin = {instructionout[30], instructionout[14:12]};
  wire [1:0] ALUOPtoCU;
  ALUcontrol alucu(ALUOPtoCU, functin, AlU_Operation); //ALU_Control
  
  wire MemRead;
  wire MemWrite;
  wire MemtoReg;
  
  controlUnit cu(opcodetoCU, ALUOPtoCU, branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite); //Control_Unit
  
  wire [63:0] Read_Data;
  dataMemory dm(aluout, ReadDataout2, clk, MemWrite, MemRead, Read_Data); //Data Memory
  


  mux2to1 m3(aluout, Read_Data, MemtoReg, mux3out); //MUX 3
  
endmodule