module instructionFetch(
  input clk, reset,
  output [31:0] inst);
  
  wire [63:0] PCout, C;
  wire [63:0] B = 64'd4;
  
  programCounter c1(clk, reset, C, PCout);
  instructionMemory m1(PCout, inst);
  adder a1(PCout, B, C);
endmodule