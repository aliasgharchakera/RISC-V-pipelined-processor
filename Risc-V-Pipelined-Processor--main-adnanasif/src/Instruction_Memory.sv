module InstructionMemoryMod(InstAddress, Instruction);
  
  input [63:0] InstAddress;
  output [31:0]Instruction;
  reg [7:0] InstructionMemory [15:0];
  
  initial
  begin
      InstructionMemory[0] = 8'b10000011;
      InstructionMemory[1] = 8'b00110100;
      InstructionMemory[2] = 8'b10000101;
      InstructionMemory[3] = 8'b00000010;
      InstructionMemory[4] = 8'b10110011;
      InstructionMemory[5] = 8'b10000100;
      InstructionMemory[6] = 8'b10011010;
      InstructionMemory[7] = 8'b0;
      InstructionMemory[8] = 8'b10010011;
      InstructionMemory[9] = 8'b10000100;
      InstructionMemory[10]= 8'b00010100;
      InstructionMemory[11] = 8'b0;
      InstructionMemory[12] = 8'b00100011;
      InstructionMemory[13] = 8'b00110100;
      InstructionMemory[14] = 8'b10010101;
      InstructionMemory[15] = 8'b00000010;
  end
  
  assign Instruction = { InstructionMemory [InstAddress+3], InstructionMemory [InstAddress+2], InstructionMemory [InstAddress+1], InstructionMemory [InstAddress+0]};  
  
endmodule


