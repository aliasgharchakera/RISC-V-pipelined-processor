module Program_Counter(clk,reset,PC_In, PC_Out);
input clk;
input reset;
input [63:0] PC_In;
output reg [63:0] PC_Out;

  
  always @(posedge clk or posedge reset)
    begin
    if (reset == 1'b1)
      begin
    	PC_Out = 64'b0;
      end
      if (reset == 1'b0)
      begin
    	PC_Out = PC_In;
      end
    end
  
  
endmodule