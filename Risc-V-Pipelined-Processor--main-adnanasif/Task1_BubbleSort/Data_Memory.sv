module Data_Memory(clk, Mem_Address, Write_Data,Read_Data, MemWrite, MemRead, element1, element2,element3,element4,element5);
  input clk,MemWrite, MemRead;
  input [63:0] Mem_Address;
  input [63:0] Write_Data;
  output reg [63:0] Read_Data;
  output [63:0] element1;
  output [63:0] element2;
  output [63:0] element3;
  output [63:0] element4;
  output [63:0] element5;
 
  
  reg [7:0] DataMemory [63:0]; 
  integer i;
  integer x;
  
   initial  
    begin 
      for (i = 0; i < 64; i = i + 1)
      begin 
        DataMemory[i] = 0;
      end
      DataMemory[0]  = 8'd2;
      DataMemory[8]  = 8'd1;
      DataMemory[16] = 8'd3;
      DataMemory[24] = 8'd0;
      DataMemory[32] = 8'd4;
     
 
      
    end 
  assign element1 ={DataMemory[7],DataMemory[6],  DataMemory[5] , DataMemory[4] , DataMemory[3] , DataMemory[2] , DataMemory[1] , DataMemory[0]}; 
  assign element2 = {DataMemory[15], DataMemory[14], DataMemory[13] , DataMemory[12] , DataMemory[11], DataMemory[10] , DataMemory[9] , DataMemory[8]}; 
assign element3 = {DataMemory[23],DataMemory[22],DataMemory[21],DataMemory[20],DataMemory[19],DataMemory[18],DataMemory[17],DataMemory[16]} ; 
 assign element4= {DataMemory[31] ,DataMemory[30], DataMemory [29], DataMemory[28], DataMemory[27] , DataMemory[26] ,DataMemory[25] ,DataMemory[24]};
  assign element5= {DataMemory[39] ,DataMemory[38],DataMemory[37] ,DataMemory[36],DataMemory[35],DataMemory[34],DataMemory[33],DataMemory[32]} ;
   

  
  
  always @( posedge clk)
    begin
    if (MemWrite == 1'b1)
    begin
      DataMemory[Mem_Address] = Write_Data[7:0];
      DataMemory[Mem_Address + 1] = Write_Data[15:8];
      DataMemory[Mem_Address + 2] = Write_Data[23:16];
      DataMemory[Mem_Address + 3] = Write_Data[31:24];
      DataMemory[Mem_Address + 4] = Write_Data[39:32];
      DataMemory[Mem_Address + 5] = Write_Data[47:40];
      DataMemory[Mem_Address + 6] = Write_Data[55:48];
      DataMemory[Mem_Address + 7] = Write_Data[63:56];
    end
    end
  always @(*)
    begin
      if (MemRead == 1'b1)
        begin
      Read_Data = {DataMemory[Mem_Address + 7], DataMemory[Mem_Address + 6],DataMemory[Mem_Address + 5], DataMemory[Mem_Address + 4], DataMemory[Mem_Address + 3], DataMemory[Mem_Address + 2],DataMemory[Mem_Address + 1], DataMemory[Mem_Address]};
        end
      
    end
endmodule
  
