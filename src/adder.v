module adder(
  input [63:0] A, B,
  output [63:0] C);
  assign C = A + B;
endmodule