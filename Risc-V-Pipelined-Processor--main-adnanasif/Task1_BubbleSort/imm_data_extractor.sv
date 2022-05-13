module imm_data_extractor(inst,imm_data);
  input [31:0] inst;
  output reg[63:0] imm_data;
  wire [6:0] opcode;
  assign opcode = inst[6:0];
  
  always @(*)
    begin
      case (opcode[6:5])
        2'b00:
          begin
            imm_data = {{52{inst[31]}},inst[31:20]};
          end
        2'b01:
          begin
            imm_data = {{52{inst[31]}},inst[31:25],inst[11:7]};
          end
        2'b11:
          begin
            imm_data ={{52{inst[31]}},inst[31],inst[7],inst[30:25],inst[11:8]};
          end
        
      endcase
    end
  
  
endmodule