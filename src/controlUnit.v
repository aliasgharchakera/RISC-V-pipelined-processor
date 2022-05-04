module controlUnit(
  input [6:0] opcode,
  output reg [1:0] ALUop,
  output reg branch, memRead, memtoReg, memWrite, ALUsrc, regWrite);
  always @ (*)
    begin
      if (opcode[6:4] == 3'b011)
        begin
          ALUsrc = 0;
          memtoReg = 0;
          regWrite = 1;
          memRead = 0;
          memWrite = 0;
          branch = 0;
          ALUop = 2'b10;
        end
      else if (opcode[6:4] == 3'b0)
        begin
          ALUsrc = 1;
          memtoReg = 1;
          regWrite = 1;
          memRead = 1;
          memWrite = 0;
          branch = 0;
          ALUop = 2'b00;
        end
      else if (opcode[6:4] == 3'b010)
        begin
          ALUsrc = 1;
//           memtoReg = 0;
          regWrite = 0;
          memRead = 0;
          memWrite = 1;
          branch = 0;
          ALUop = 2'b00;
        end
      else if (opcode[2:0] == 3'b110)
        begin
          ALUsrc = 0;
//           memtoReg = 0;
          regWrite = 0;
          memRead = 0;
          memWrite = 0;
          branch = 1;
          ALUop = 2'b01;
        end
    end
endmodule