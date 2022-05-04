module mux2to1(A, B, S, Y);
  input [63:0] A;
  input [63:0] B;
  input S;
  output [63:0] Y;
  assign Y = S ? B : A;
endmodule 