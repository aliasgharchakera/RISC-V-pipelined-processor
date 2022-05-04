module ALU_64_bit(
  input [63:0] A,
  input [63:0] B,
  input [3:0] ALUOp,
  output reg [63:0] R,
  output reg Z);
  always @ (*)
    begin
      if (ALUOp == 4'b0000)
        R = A & B;
      else if (ALUOp == 4'b0001)
        R = A | B;
      else if (ALUOp == 4'b0010)
        R = A + B;
      else if (ALUOp == 4'b0110)
        R = A - B;
      else if (ALUOp == 4'b1100)
        R = (~A)&(~B);
      if (R == 0)
        Z = 1;
      else
        Z = 0;
    end
endmodule