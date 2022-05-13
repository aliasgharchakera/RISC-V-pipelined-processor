module Data_Memory(clk, Mem_Addr, Write_Data, MemWrite, MemRead, Read_Data);
  input clk;
  input [63:0] Mem_Addr;
  input [63:0] Write_Data;
  input MemWrite;
  input MemRead;
  output reg [63:0]Read_Data;
  reg [7:0] Data[63:0];
  
  initial
    begin
      for( int i;i < 64; i++)  
        Data[i] = i;
    end
  
  always @(posedge clk)
    begin
      if(MemWrite)
        begin
          Data[Mem_Addr] = Write_Data[7:0];
          Data[Mem_Addr+1] = Write_Data[15:8];
          Data[Mem_Addr+2] =  Write_Data[23:16];
          Data[Mem_Addr+3] =  Write_Data[31:24];
          Data[Mem_Addr+4] =  Write_Data[39:32];
          Data[Mem_Addr+5] =  Write_Data[47:40];
          Data[Mem_Addr+6] =  Write_Data[55:48];
          Data[Mem_Addr+7] =  Write_Data[63:56];
        end
    end
  
   always@ (*)
    begin
    if (MemRead)
      Read_Data = {Data[Mem_Addr+7], Data[Mem_Addr+6], Data[Mem_Addr+5],Data[Mem_Addr+4],Data[Mem_Addr+3],Data[Mem_Addr+2],Data[Mem_Addr+1],Data[Mem_Addr+0]};
  else
      Read_Data = 0;
    end 
endmodule 

  
  