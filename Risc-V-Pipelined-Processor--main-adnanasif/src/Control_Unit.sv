module Control_Unit(input [6:0] opcode,output reg Branch,output reg MemRead, output reg MemtoReg, output reg [0:1]ALUop,output reg MemWrite, output reg ALUsrc, output reg RegWrite);
  
  always @ (opcode)
    begin 
      case (opcode)
        7'b0110011: //r-type
          begin
            ALUsrc = 0; MemtoReg = 0; RegWrite = 1; MemRead = 0; 
            MemWrite = 0; Branch = 0; ALUop = 2'b10;
          end 
        7'b0000011: //I-type ld 
          begin
            ALUsrc = 1; MemtoReg = 1; RegWrite = 1; MemRead = 1; 
            MemWrite = 0; Branch = 0; ALUop = 2'b0;
          end 
        7'b0100011: //I-type sd
          begin
            ALUsrc = 0; MemtoReg = 1'bx; RegWrite = 0; MemRead = 0; 
            MemWrite = 1; Branch = 0; ALUop = 2'b0;
          end
        7'b0010011: //I-type addi
          begin
            ALUsrc = 1; MemtoReg = 0; RegWrite = 1; MemRead = 0; 
            MemWrite = 0; Branch = 0; ALUop = 2'b0;
          end
        7'b1100011: //sb-type beq
          begin
            ALUsrc = 0; MemtoReg = 1'bx; RegWrite = 0; MemRead = 0; 
            MemWrite = 0; Branch = 1; ALUop = 2'b01;
          end
      endcase
    end
  
        
        
endmodule 