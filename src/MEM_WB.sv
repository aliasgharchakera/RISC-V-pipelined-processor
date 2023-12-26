module MEM_WB(
    input clk, reset, 
 	input [4:0] EX_MEM_rd,
	input [63:0] EX_MEM_mux_ALU,
	input [63:0] EX_MEM_readData;,
	input EX_MEM_RegWrite,
	input EX_MEM_MemtoReg,
  
  	output reg [4:0] MEM_WB_rd,
    output reg [63:0] MEM_WB_mux_ALU,
	output reg [63:0] MEM_WB_readData,
	output reg MEM_WB_RegWrite,
	output reg MEM_WB_MemtoReg
  
);
  
  always @ (posedge clk or reset)
    begin 
      if (reset)
        begin 
          MEM_WB_rd = 0;
    	  MEM_WB_mux_ALU = 0;
		  MEM_WB_readData = 0;
	      MEM_WB_RegWrite = 0;
		  MEM_WB_MemtoReg = 0;  
        end
      else if (clk)
        begin 
          MEM_WB_rd = EX_MEM_rd;
    	  MEM_WB_mux_ALU = EX_MEM_mux_ALU;
		  MEM_WB_readData = EX_MEM_readData;
	      MEM_WB_RegWrite = EX_MEM_RegWrite;
		  MEM_WB_MemtoReg = EX_MEM_MemtoReg;
        end 
          
    end 
  
endmodule 
  
