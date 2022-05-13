module registerFile(clk, reset, WriteData, RS1, RS2, RD, RegWrite, ReadData1, ReadData2);
  input clk;
  input reset;
  
  input [63:0] WriteData;
  input [4:0] RS1;
  input [4:0] RS2;
  input [4:0] RD;
  input RegWrite;
  
  output reg [63:0] ReadData1;
  output reg [63:0]ReadData2;
  
  reg [63:0] Registers [31:0];
  
  initial
    begin
      for(int i;i < 32; i++)  
        Registers [i] = i*2;
    end
  
  always @(posedge clk)
    begin
      if (RegWrite)
          Registers[RD] = WriteData;
    end
  
  always@ (*)
    begin
      if (!reset)
      begin
        ReadData1 = Registers[RS1];
        ReadData2 = Registers[RS2];
      end
  else
    begin
      ReadData1 = 0;
  	  ReadData2 = 0;
    end
  end
  
endmodule
  