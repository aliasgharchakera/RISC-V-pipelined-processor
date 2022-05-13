module DataExtractor(instructions, data);
  input [31: 0] instructions;
  output reg [63:0] data;
  
  always@(*)
    begin 
      case(instructions[6:5])
        2'b00:
          begin 
            data[11:0] = instructions[31:20];
          end
        2'b01:
          begin 
            data[11:5] = instructions[31:25];
            data[4:0] = instructions[11:7];
          end
        2'b11:
          begin
            data[11:0] = {instructions[31], instructions[7],instructions[30:25] , instructions [11:8]};
        end
      endcase
      data[63:12] = {52{data[11]}};
    end
endmodule

        
