module ALU(a,b,ALUop,Result,Zero);
  input [63:0]a, b;
  input [3:0] ALUop;
  output reg [63:0] Result;
  output Zero;
  
  
  
  always@(a or b or ALUop)
          begin
               case (ALUop)
                  4'b0000: Result = a & b;            // AND
                  4'b0001:  Result = a | b;           // OR
                  4'b0010:  Result = a +  b;          // Addition
                  4'b0110:  Result = a - b;           // Subtraction
                  4'b1100:  Result = ~(a | b);        // Nor
                  4'b0100:  Result = ( a < b)? 0: 1;  // Lesser than 
               endcase
          end
  assign Zero =(Result==0); //equal or < 

  
  endmodule