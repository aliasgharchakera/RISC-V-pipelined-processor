module ID_IX(clk,reset,IF_ID_Inst, IF_ID_rs1,IF_ID_rs2, IF_ID_rd,  IF_ID_PC_Out, IF_ID_ReadData1, IF_ID_ReadData2, IF_ID_imm_data,IF_ID_Branch, IF_ID_MemRead,  IF_ID_MemtoReg,IF_ID_ALUop,IF_ID_MemWrite,IF_ID_ALUsrc, IF_ID_RegWrite, ID_EX_Inst, ID_EX_rs1,ID_EX_rs2, ID_EX_rd,  ID_EX_PC_Out, ID_EX_ReadData1, ID_EX_ReadData2, ID_EX_imm_data,ID_EX_Branch,ID_EX_MemRead,ID_EX_MemtoReg,ID_EX_ALUop,ID_EX_MemWrite,ID_EX_ALUsrc,ID_EX_RegWrite);
  
  
  
  input clk, reset;
  input [3:0] IF_ID_Inst;
  input [4:0] IF_ID_rs1;
  input [4:0] IF_ID_rs2;
  input [4:0] ID_EX_rd;
  input [63:0] IF_ID_imm_data;
  input [63:0] IF_ID_ReadData2;
  input [63:0] IF_ID_ReadData1;
  input [63:0] IF_ID_PC_Out;
  input IF_ID_ALUsrc;
  input [1:0] IF_ID_ALUop;
  input IF_ID_Branch;
  input IF_ID_MemRead;
  input IF_ID_MemWrite;
  input IF_ID_RegWrite;
  input IF_ID_MemtoReg;
  
  
  
  output reg [3:0] ID_EX_Inst;
  output reg [4:0] ID_EX_rs1;
  output reg [4:0] ID_EX_rs2;
  output reg [4:0] ID_EX_rd;
  output reg [63:0] ID_EX_imm_data;
  output reg [63:0] ID_EX_ReadData2;
  output reg [63:0] ID_EX_ReadData1;
  output reg [63:0] ID_EX_PC_Out;
  output reg ID_EX_ALUsrc;
  output reg [1:0] ID_EX_ALUop;
  output reg ID_EX_Branch;
  output reg ID_EX_MemRead;
  output reg ID_EX_MemWrite;
  output reg ID_EX_RegWrite;
  output reg ID_EX_MemtoReg;

  
  always @(reset or posedge clk)
    begin
      if (reset) 
        begin
           ID_EX_Inst=0;
            ID_EX_rs1=0;
            ID_EX_rs2=0;
            ID_EX_imm_data=0;
            ID_EX_ReadData2=0;
            ID_EX_ReadData1=0;
            ID_EX_PC_Out=0;
            ID_EX_ALUsrc=0;
            ID_EX_ALUop=0;
            ID_EX_Branch=0;
            ID_EX_MemRead=0;
            ID_EX_MemWrite=0;
            ID_EX_RegWrite=0;
            ID_EX_MemtoReg=0; 
          
        end
      else if (clk)
        begin
            ID_EX_Inst=IF_ID_Inst;
            ID_EX_rs1=IF_ID_rs1;
            ID_EX_rs2=IF_ID_rs2;
            ID_EX_imm_data=IF_ID_imm_data;
            ID_EX_ReadData2=IF_ID_ReadData2;
            ID_EX_ReadData1=IF_ID_ReadData1;
            ID_EX_PC_Out=IF_ID_PC_Out;
            ID_EX_ALUsrc=IF_ID_ALUSrc;
            ID_EX_ALUop=IF_ID_ALUop;
            ID_EX_Branch=IF_ID_Branch;
            ID_EX_MemRead=IF_ID_MemRead;
            ID_EX_MemWrite=IF_ID_MemWrite;
            ID_EX_RegWrite=IF_ID_RegWrite;
            ID_EX_MemtoReg=IF_ID_MemtoReg;
        end
      
    end
endmodule
