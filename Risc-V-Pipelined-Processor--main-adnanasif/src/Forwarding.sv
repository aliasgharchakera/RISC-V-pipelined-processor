module Forwarding(
  input [4:0] EX_MEM_rd,
  input  EX_MEM_RegWrite, //WB of EX_MEM
  input [4:0] MEM_WB_rd,
  input  MEM_WB_RegWrite, //WB of MEM_WB
  input [4:0] ID_EX_rs1,
  input [4:0] ID_EX_rs2,
  output reg [1:0] forwardA,
  output reg [1:0] forwardB,
);
  
  
  
  always @(*)
    begin
      //For ForwardA
      
      if ( (EX_MEM_RegWrite) && (EX_MEM_rd == ID_EX_rs1) && (EX_MEM_rd != 0) )
        forwardA = 2'b10;
      
      else if ( (MEM_WB_RegWrite) && (MEM_WB_rd == ID_EX_rs1) && (MEM_WB_rd != 0) && !((EX_MEM_RegWrite) && (EX_MEM_rd == ID_EX_rs1) && (EX_MEM_rd != 0)) )
      forwardA =  2'b01;
      
      else 
        forwardA = 2'b00;
      
      
      //For ForwardB
      
      if ( (EX_MEM_RegWrite) && (EX_MEM_rd == ID_EX_rs2) && (EX_MEM_rd != 0) )
        forwardB = 2'b10;
      
      else if ( (MEM_WB_RegWrite) && (MEM_WB_rd == ID_EX_rs2) && (MEM_WB_rd != 0) && !((EX_MEM_RegWrite) && (EX_MEM_rd == ID_EX_rs2) && (EX_MEM_rd != 0)) )
      forwardB =  2'b01;
      
      else 
        forwardB = 2'b00;
      
    end  
endmodule
