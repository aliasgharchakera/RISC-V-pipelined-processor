module EX_MEM(
	input clk, reset, 
  	input [4:0] ID_EX_rd, 
	input [63:0] ID_EX_mux_ForwardB, ID_EX_mux_ALU,
	input ID_EX_ALUzero,
  	input [63:0] adder2out,
  	input ID_EX_Branch,
	input ID_EX_MemRead,
	input ID_EX_MemWrite,
	input ID_EX_RegWrite,
	input ID_EX_MemtoReg,
  	
  	output reg [4:0] EX_MEM_rd,
    output reg [63:0] EX_MEM_mux_ForwardB, EX_MEM_mux_ALU,
	output reg EX_MEM_ALUzero,
  	output reg [63:0] EX_MEM_adder2out,
	output reg EX_MEM_Branch,
	output reg EX_MEM_MemRead,
	output reg EX_MEM_MemWrite,
	output reg EX_MEM_RegWrite,
	output reg EX_MEM_MemtoReg 	
  
);
  
  always @ (posedge clk or reset)
    begin 
      if (reset)
        begin 
          EX_MEM_rd = 0;
          EX_MEM_mux_ForwardB = 0;
          EX_MEM_ALUzero = 0;
          EX_MEM_mux_ALU = 0;
          EX_MEM_adder2out =0;
          EX_MEM_Branch = 0;
          EX_MEM_MemRead =  0;
          EX_MEM_MemWrite = 0;
          EX_MEM_RegWrite = 0;
          EX_MEM_MemtoReg = 0;
        end 
      else if (clk)
        begin 
          EX_MEM_rd = ID_EX_rd;
          EX_MEM_mux_ForwardB = EX_MEM_mux_ForwardB;
          EX_MEM_mux_ALU = EX_MEM_mux_ALU;
          EX_MEM_ALUzero = ID_EX_ALUzero;
          EX_MEM_adder2out = adder2out;
          EX_MEM_Branch = ID_EX_Branch;
          EX_MEM_MemRead = ID_EX_MemRead ;
          EX_MEM_MemWrite = ID_EX_MemWrite ;
          EX_MEM_RegWrite = ID_EX_RegWrite;
          EX_MEM_MemtoReg = ID_EX_MemtoReg;
        end
    end 
endmodule 
          
          
          
          
          
          
          
          
