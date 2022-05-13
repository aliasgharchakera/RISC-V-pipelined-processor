module IF_ID(clk,reset,PC_Out, Instruction, IF_ID_Inst, IF_ID_PC_Out);
  
  input clk, reset;
  input [63:0] PC_Out;
  input [31:0] Instruction;
  output reg [31:0] IF_ID_Inst;
  output reg [63:0] IF_ID_PC_Out;
  
  always @( reset or posedge clk) 
    begin
      if (reset):
        begin
          IF_ID_Inst=Instruction=0;
          IF_ID_PC_Out=PC_Out=0;
        end
      else if (clk)
        begin
          IF_ID_Inst=Instruction;
          IF_ID_PC_Out=PC_Out;
        end
      
    
  
    end 
endmodule

  
  
