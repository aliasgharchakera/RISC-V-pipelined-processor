module tb;
  reg clk,reset;
  
  top t1(clk,reset);
                  
    initial
    begin
   clk = 1'b0;
   reset = 1'b1;
      #10
   reset = 1'b0;
    end
  
  always
    begin
      #5
      clk = ~clk;
    end
  
  initial
    begin
   $dumpfile("dump.vcd");
   //$dumpvars(1,tb);
    $dumpvars();


    $monitor("Time = %d --> clk = %b,reset = %b", $time,clk,reset);
  #100 $finish;
  end
endmodule



