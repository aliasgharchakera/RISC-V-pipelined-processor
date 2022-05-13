`include "registerFile.sv"
`include "mux.sv"
`include "imm_data_extractor.sv"
`include "inst_parser.sv"
`include "Instruction_Memory.sv"
`include "Data_Memory.sv"
`include "Program_Counter.sv"
`include "Adder.sv"
`include "ALU_Control.sv"
`include "Control_Unit.sv"
`include "ALU_64bit.sv"


module top_Processor(clk, reset);
  input clk;
  input reset;
 
  //p1
  wire [63:0] PC_Out; 
  
  //p2
  wire [63:0] adder1out;
  
  //p3
  wire [31:0]Instruction; 
  
  // p4
  wire [6:0]opcode;
  wire [4:0]rd;
  wire [2:0]func3;
  wire [4:0]rs1;
  wire [4:0]rs2;
  wire [6:0]func7;
  
  // p5
  wire  [1:0] ALUop;
  wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  
  //p6
  wire [63:0] write_data; 
  wire [63:0]ReadData1;
  wire [63:0]ReadData2;
  
  //p7
  wire [63:0] imm_data;
  
   
  //p8
  wire [63:0] ALUinputb;
  
  //p9
  wire [3:0]  Operation;
  
  //p10
  wire [63:0] Result;
  wire Zero;
  
   //p11
  wire [63:0] adder2out;
  
  //p12
  wire [63:0] muxp12;
  
  //p13
  wire [63:0] readdata;
  wire [63:0] ele1;
  wire [63:0] ele2;
  wire [63:0] ele3;
  wire [63:0] ele4;
  wire [63:0] ele5;
 
  
  
  Program_Counter    p1 (.clk(clk),.reset(reset),.PC_In(muxp12), .PC_Out(PC_Out));
  Adder              p2 (.a(PC_Out),.b(64'd4),.out(adder1out));
  InstructionMemory  p3 (.Inst_Address(PC_Out),.Instruction(Instruction));
  instruction_parser p4 (.inst(Instruction),.opcode(opcode),.rd(rd),.func3(func3),.rs1(rs1), .rs2(rs2), .func7(func7));
  
  control_Unit       p5 (.OpCode(opcode), .ALUOp(ALUop), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));
  
  regFile            p6 (.clk(clk),.reset(reset),.rs1(rs1),.rs2(rs2),.rd(rd), .write_data(write_data),.RegWrite(RegWrite), .readdata1(ReadData1),.readdata2(ReadData2));
  
  imm_data_extractor p7 (.inst(Instruction),.imm_data(imm_data));
                         
  mux                p8 (.a(ReadData2),.b(imm_data), .sel(ALUSrc), .data_out(ALUinputb));
 
  ALU_Control        p9 (.ALUOp(ALUop), .Funct({Instruction[30],Instruction[14:12]}), .Operation(Operation));
                         
  ALU                p10 (.a(ReadData1), .b(ALUinputb),.ALUop(Operation),.Result(Result),.Zero(Zero));
                         
  Adder              p11 (.a(PC_Out),.b(imm_data << 1),.out(adder2out));
                
                         
  mux                p12 (.a(adder1out),.b(adder2out), .sel(Branch & Zero), .data_out(muxp12));
                         
  Data_Memory        p13(.clk(clk), .Mem_Address(Result), .Write_Data(ReadData2),.Read_Data(readdata), .MemWrite(MemWrite), .MemRead(MemRead), .element1(ele1), .element2(ele2),.element3(ele3),.element4(ele4),.element5(ele5));
                       
 mux                 p14 (.a(Result),.b(readdata), .sel(MemtoReg), .data_out(write_data));

  endmodule                    
