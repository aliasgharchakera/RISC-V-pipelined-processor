module registerFile(
  input [4:0] rs1,
  input [4:0] rs2,
  input [4:0] rd,
  input [63:0] wd,
  input rw,
  input clk,
  input reset,
  output reg [63:0] readData1,
  output reg [63:0] readData2);
  
  reg [63:0] registers [31:0];
  initial
    begin
      registers[0] = 64'h1;
      registers[1] = 64'h2;
      registers[2] = 64'h3;
      registers[3] = 64'h4;
      registers[4] = 64'h5;
      registers[5] = 64'h4;
      registers[6] = 64'h4;
      registers[7] = 64'h4;
      registers[8] = 64'h4;
      registers[9] = 64'h4;
      registers[10] = 64'h4;
      registers[11] = 64'h4;
      registers[12] = 64'h4;
      registers[13] = 64'h4;
      registers[14] = 64'h4;
      registers[15] = 64'h4;
      registers[16] = 64'h4;
      registers[17] = 64'h4;
      registers[18] = 64'h4;
      registers[19] = 64'h4;
      registers[20] = 64'h4;
      registers[21] = 64'h1;
      registers[22] = 64'h3;
      registers[23] = 64'h4;
      registers[24] = 64'h4;
      registers[25] = 64'h4;
      registers[26] = 64'h4;
      registers[27] = 64'h4;
      registers[28] = 64'h4;
      registers[29] = 64'h4;
      registers[30] = 64'h4;
      registers[31] = 64'h4;
    end
  always @ (*)
    begin
      if (reset == 0)
        begin
          readData1 <= registers[rs1];
          readData2 <= registers[rs2];
        end
      else
        begin
          readData1 <= 0;
          readData2 <= 0;
        end
    end
  always @ (posedge clk)
    begin
      if (rw == 1)
        registers[rd] <= wd;
    end
  
endmodule
  