module MUX(a,b,sel, data_out);
  input [63:0] a;
  input [63:0] b;
  input sel;
  output [63:0] data_out;
  
  assign data_out = sel ? b: a;
  
endmodule