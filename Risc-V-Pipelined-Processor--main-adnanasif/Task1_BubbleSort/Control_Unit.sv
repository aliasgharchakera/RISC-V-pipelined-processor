module control_Unit(OpCode, ALUOp, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite) ;
  	input [6:0] OpCode;
    output  reg Branch; 
    output reg MemRead;
    output reg MemtoReg;
    output reg MemWrite;
    output reg ALUSrc;
    output reg RegWrite;
  	output reg [1:0] ALUOp;
  
  always @(OpCode)
    begin
      case(OpCode)  
      7'b0110011:   //R-type
        begin
          ALUSrc   = 1'b0;
          MemtoReg = 1'b0;
          RegWrite = 1'b1;
          MemRead  = 1'b0;
          MemWrite = 1'b0;
          Branch   = 1'b0;
          ALUOp    = 2'b10;
        end
     7'b0000011:   //I-type (ld)
       	begin       
          ALUSrc   = 1'b1;
          MemtoReg = 1'b1;
          RegWrite = 1'b1;
          MemRead  = 1'b1;
          MemWrite = 1'b0;
          Branch   = 1'b0;
          ALUOp    = 2'b00;
       	end
      7'b0100011: //I-type (sd)
        begin
          ALUSrc   = 1'b1;
          MemtoReg = 1'bx;
          RegWrite = 1'b0;
          MemRead  = 1'b0;
          MemWrite = 1'b1;
          Branch   = 1'b0;
          ALUOp    = 2'b00;
      	end
       7'b0010011: //addi   
        begin
          ALUSrc   = 1'b1;
          MemtoReg = 1'b0;
          RegWrite = 1'b1;
          MemRead  = 1'b0;
          MemWrite = 1'b0;
          Branch   = 1'b0;
          ALUOp    = 2'b00;
      	end
       7'b1100011: // SB- type (beq/blt)   
         begin
          ALUSrc   = 1'b0;
          MemtoReg = 1'bx;
          RegWrite = 1'b0;
          MemRead  = 1'b0;  
          MemWrite = 1'b0;
          Branch   = 1'b1;
          ALUOp    = 2'b01;
      	 end

      default:
       begin
        ALUSrc   = 1'b0;
        MemtoReg = 1'b0;
        RegWrite = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        Branch   = 1'b0;
        ALUOp    = 2'b00;     
        end
  endcase
    end
  
  endmodule