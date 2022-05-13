module ALU(a, b, ALUop, result, zero);
  input [63:0] a;
  input [63:0] b;
  input [3:0] ALUop;
  output result;
  output zero;
  reg [63:0] result;
  reg zero;
  
  always @(ALUop)
    begin
      case(ALUop)
        4'b0000:
          begin
          result = a&b;
          end
        4'b0001:
          begin
          result = a|b;
          end
        4'b0010:
          begin
          result = a+b;
          end
        4'b0110:
          begin
          result = a-b;
          end
         4'b1100:
          begin
          result = ~(a|b);
          end
      endcase
      
      if (result == 0)
        zero = 1'b1;
      else
        zero = 1'b0;
    end
endmodule

  
