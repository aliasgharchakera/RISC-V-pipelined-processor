module mux(a,b, sel, data_out);
  input [63:0]a;
  input [63:0]b;
  input sel;
  output reg [63:0] data_out;


  always@(a or b or sel)
  
    assign data_out = sel? b:a;
  
  
endmodule