module Program_Counter(clk, reset, PC_In, PC_Out);
  input clk, reset;
  input [63:0] PC_In;
  output reg [63:0] PC_Out;
  
  always @ (posedge clk)
    begin 
      PC_Out = PC_In;
    end
  
  always @ (*)
    begin 
      if (reset)
        PC_Out = 0;
    end 
endmodule 