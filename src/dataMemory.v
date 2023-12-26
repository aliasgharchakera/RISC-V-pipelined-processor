module dataMemory(
  input [63:0] memAddr,
  input [63:0] writeData,
  input clk, memWrite, memRead,
  output reg [63:0] readData);
 
  reg [7:0] instMem [63:0];
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
      instMem[16] = 8'b10000011;
      instMem[17] = 8'b00110100;
      instMem[18] = 8'b00000101;
      instMem[19] = 8'b00001111;
      instMem[20] = 8'b10110011;
      instMem[21] = 8'b10000100;
      instMem[22] = 8'b10011010;
      instMem[23] = 8'b00000000;
      instMem[24] = 8'b10010011;
      instMem[25] = 8'b10000100;
      instMem[26] = 8'b00010100;
      instMem[27] = 8'b00000000;
      instMem[28] = 8'b00100011;
      instMem[29] = 8'b00111000;
      instMem[30] = 8'b10010101;
      instMem[31] = 8'b00001110;
      instMem[32] = 8'b10000011;
      instMem[33] = 8'b00110100;
      instMem[34] = 8'b00000101;
      instMem[35] = 8'b00001111;
      instMem[36] = 8'b10110011;
      instMem[37] = 8'b10000100;
      instMem[38] = 8'b10011010;
      instMem[39] = 8'b00000000;
      instMem[40] = 8'b10010011;
      instMem[41] = 8'b10000100;
      instMem[42] = 8'b00010100;
      instMem[43] = 8'b00000000;
      instMem[44] = 8'b00100011;
      instMem[45] = 8'b00111000;
      instMem[46] = 8'b10010101;
      instMem[47] = 8'b00001110;
      instMem[48] = 8'b10000011;
      instMem[49] = 8'b00110100;
      instMem[50] = 8'b00000101;
      instMem[51] = 8'b00001111;
      instMem[52] = 8'b10110011;
      instMem[53] = 8'b10000100;
      instMem[54] = 8'b10011010;
      instMem[55] = 8'b00000000;
      instMem[56] = 8'b10010011;
      instMem[57] = 8'b10000100;
      instMem[58] = 8'b00010100;
      instMem[59] = 8'b00000000;
      instMem[60] = 8'b00100011;
      instMem[61] = 8'b00111000;
      instMem[62] = 8'b10010101;
      instMem[63] = 8'b00001110;
    end
  always @ (posedge clk)
    begin
      if (memWrite)
        begin
          instMem[memAddr] <= writeData[7:0];
          instMem[memAddr + 1] <= writeData[15:8];
          instMem[memAddr + 2] <= writeData[23:16];
          instMem[memAddr + 3] <= writeData[31:24];
          instMem[memAddr + 4] <= writeData[39:32];
          instMem[memAddr + 5] <= writeData[47:40];
          instMem[memAddr + 6] <= writeData[55:48];
          instMem[memAddr + 7] <= writeData[63:56];
        end
    end
  always @ (*)
    begin
      if (memRead)
        begin
          readData[7:0] = instMem[memAddr];
          readData[15:8] = instMem[memAddr + 1];
          readData[23:16] = instMem[memAddr + 2];
          readData[31:24] = instMem[memAddr + 3];
          readData[39:32] = instMem[memAddr + 4];
          readData[47:40] = instMem[memAddr + 5];
          readData[55:48] = instMem[memAddr + 6];
          readData[63:56] = instMem[memAddr + 7];
        end
      else
        readData = 0;
    end
endmodule