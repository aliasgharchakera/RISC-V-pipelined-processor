module instruction_parser(inst, opcode,rd,func3,rs1, rs2, func7);
  output reg [6:0]opcode;
  output reg [4:0]rd;
  output reg [2:0] func3;
  output reg [4:0] rs1;
  output reg [4:0] rs2;
  output reg [6:0]func7;
  input  [31:0] inst;
  
  
  always @(*)
    begin
     opcode = inst[6:0];
      rd = inst[11:7];
       func3 = inst[14:12];
      rs1 = inst[19:15];
     rs2 = inst[24:20];
     func7 = inst[31:25];
    end
 
        
   endmodule