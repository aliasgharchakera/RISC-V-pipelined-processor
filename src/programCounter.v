module programCounter(
  input clk, reset,
  input [63:0] PCin,
  output reg [63:0] PCout);
  
  always @ (posedge clk or posedge reset)
    begin
      if (reset)
        PCout = 0;
      else
        PCout = PCin;
    end
endmodule