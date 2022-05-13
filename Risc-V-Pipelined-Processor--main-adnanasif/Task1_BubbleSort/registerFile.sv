module regFile(clk,reset,rs1,rs2,rd, write_data,RegWrite, readdata1,readdata2); 

 input clk;
  input reset; 
  input [4:0] rs1; 
  input [4:0] rs2;
  input [4:0] rd; 
  input [63:0]write_data; 
  input RegWrite; 
  output reg [63:0]readdata1; 
  output reg [63:0]readdata2; 
  integer i;
  reg [63:0] Registers [31:0]; 
  
  initial  
    begin 
      for (i = 0; i < 32; i = i + 1)
      begin 
        Registers[i] = 0;
      end 
      Registers[8] = 5;
    

    end 
  
  always @(posedge clk) 
    if (RegWrite)
    Registers[rd] = write_data; 
 
  
  always@(*)
  begin 
    if (reset) 
      begin
        readdata1 = 0; 
        readdata2 = 0;
      end
    else
      begin
    readdata1 = Registers[rs1]; 
    readdata2 = Registers[rs2];
      end
  end 
endmodule  