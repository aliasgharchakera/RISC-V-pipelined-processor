module dataGenerator(
  input [31:0] instruction,
  output reg [63:0] imm_data
);
  wire op_decide = instruction[26:25];
  reg [11:0] imm;
  always @ (instruction)
    begin
      if (op_decide == 2'b00)
        imm = instruction[31:20];
      else if (op_decide == 2'b01)    
        imm = {instruction[31:25], instruction[11:7]};
      else
        imm = {instruction[31], instruction[29:25], instruction[11:8], instruction[30]};
      imm_data[63:12] = {52{imm[11]}};
      imm_data[11:0] = imm;
     end
endmodule