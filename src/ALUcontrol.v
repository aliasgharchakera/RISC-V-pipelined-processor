module ALUcontrol(
  input [1:0] ALUop,
  input [3:0] funct,
  output reg [3:0] operation);
  
  always @ (*)
    begin
      if (ALUop == 2'b00)
        operation = 4'b0010;
      else if (ALUop == 2'b01)
        operation = 4'b0110;
      else if (ALUop == 2'b10)
        begin
          if (funct == 4'b0)
            operation = 4'b0010;
          else if (funct == 4'b1000)
            operation = 4'b0110;
          else if (funct == 4'b0111)
            operation = 4'b0;
          else if (funct == 4'b0110)
            operation = 4'b1;
        end
    end
endmodule