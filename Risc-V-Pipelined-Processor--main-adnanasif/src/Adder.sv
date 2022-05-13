module Adder(a, b, out);
  input [63:0] a; input [63:0] b;
  output reg [63:0] out;
  
  assign out = a+b;
endmodule 