module ALU_Control(input [1:0] Alu_op, input [3:0] funct, output reg [3:0] operation);
  
  always @(*)
    begin
      case(Alu_op)
        2'b00:
           operation = 4'b0010;
        2'b01:
		   operation = 4'b0110; 
        2'b10:
          begin
            case(funct)
              4'b0000 :
                operation = 4'b0010;
              4'b1000:
                operation = 4'b0110;
              4'b0111:
                operation = 4'b0000;
              4'b0110:
                operation = 4'b0001;
            endcase
          end
      endcase
      
    end
endmodule