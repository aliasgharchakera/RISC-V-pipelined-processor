// // Code your testbench here
// // or browse Examples
// module singleProcessor_tb;
//   reg clk;
//   reg reset;
  
//   singleProcessor a1(clk, reset);
  
//   initial
//     clk =1'b0;
  
//   always
//     #5 clk = ~clk;
  
//   initial
//     begin
      
//       reset = 1;
//       #7
//       reset = 0;
//       #10
//       reset = 0;
//       #10
//       reset = 0;
//       #10;

//       //$finish;
     
//     end
//   initial
//     begin
//       $dumpfile("dump.vcd");
//       $dumpvars();
//     end
// endmodule