module instructionMemory(
  input [63:0] instAddr,
  output reg [31:0] inst);
  
  reg [7:0] instMem [15:0];
//   reg [3:0] addr;
  initial
    begin
      instMem[0] = 8'b10000011;
      instMem[1] = 8'b00110100;
      instMem[2] = 8'b00000101;
      instMem[3] = 8'b00001111;
      instMem[4] = 8'b10110011;
      instMem[5] = 8'b10000100;
      instMem[6] = 8'b10011010;
      instMem[7] = 8'b00000000;
      instMem[8] = 8'b10010011;
      instMem[9] = 8'b10000100;
      instMem[10] = 8'b00010100;
      instMem[11] = 8'b00000000;
      instMem[12] = 8'b00100011;
      instMem[13] = 8'b00111000;
      instMem[14] = 8'b10010101;
      instMem[15] = 8'b00001110;
    end
  
  always @ (instAddr)
    begin
//       addr = instAddr[3:0];
//       addr = addr + 3;
      inst[31:24] = instMem[instAddr + 3];
      inst[23:16] = instMem[instAddr + 2];
      inst[15:8] = instMem[instAddr + 1];
      inst[7:0] = instMem[instAddr];
    end
endmodule