module InstructionMemory(Inst_Address,Instruction);
  input [63:0] Inst_Address;
  output reg [31:0]Instruction;
  reg [7:0] InstMemory [95:0]; 
  integer i;
  
  initial  
    begin 
      //blt x22, x8,8
      InstMemory[0] = 8'b01100011;
      InstMemory[1] = 8'b01000100;
      InstMemory[2] = 8'b10001011;
      InstMemory[3] = 8'b0;
      
      //beq x0,x0,92
	  InstMemory[4] = 8'b01100011;
      InstMemory[5] = 8'b00001110;
      InstMemory[6] = 8'b00000000;
      InstMemory[7] = 8'b00000100;
      
      //addi x23,x22,0
      InstMemory[8] = 8'b10010011;
      InstMemory[9] = 8'b00001011;
      InstMemory[10] = 8'b00001011;
      InstMemory[11] = 8'b0;
     
      //addi x29,x28,0
      InstMemory[12] = 8'b10010011;
      InstMemory[13] = 8'b00001110;
      InstMemory[14] = 8'b00001110;
      InstMemory[15] = 8'b0;
      
      //blt x23,x8,Loop3
      InstMemory[16]= 8'b01100011;
      InstMemory[17] = 8'b11000100;
      InstMemory[18] = 8'b10001011;
      InstMemory[19] = 8'b0;
      
      //beq x0,x0, Loop1
      InstMemory[20] = 8'b11100011;
      InstMemory[21] = 8'b00000110;
      InstMemory[22] = 8'b00000000;
      InstMemory[23] = 8'b11111110;
     
      //ld x12, 0(x28) - x12 = a[i]
      InstMemory[24] = 8'b00000011;
      InstMemory[25] = 8'b00110110;
      InstMemory[26] = 8'b00001110;
      InstMemory[27] = 8'b00000000;
      
     
      //ld x13, 0(x29) - x13 = a[j]
      InstMemory[28]=8'b10000011;
      InstMemory[29]=8'b10110110;
      InstMemory[30]=8'b00001110;
      InstMemory[31]=8'b00000000;
      
      //blt x12,x13,if
      InstMemory[32]=8'b01100011;
      InstMemory[33]=8'b01001110;
      InstMemory[34]=8'b11010110;
      InstMemory[35]=8'b00000000;
      
      //addi x23,x23,1 - j++
      InstMemory[36]=8'b10010011;
      InstMemory[37]=8'b10001011;
      InstMemory[38]=8'b00011011;
      InstMemory[39]=8'b00000000;
      
      //addi x29,x29,8 - locj+= 8
      InstMemory[40]=8'b10010011;
      InstMemory[41]=8'b10001110;
      InstMemory[42]=8'b10001110;
      InstMemory[43]=8'b00000000;

      //blt x23,x8,Loop3
      InstMemory[44]=8'b11100011;
      InstMemory[45]=8'b11000110;
      InstMemory[46]=8'b10001011;
      InstMemory[47]=8'b11111110;
      
      //addi x22,x22,1 #i++
      InstMemory[48]=8'b00010011;
      InstMemory[49]=8'b00001011;
      InstMemory[50]=8'b00011011;
      InstMemory[51]=8'b00000000;

      //addi x28, x28,8 - loci+=8 
      InstMemory[52]=8'b00010011;
      InstMemory[53]=8'b00001110;
      InstMemory[54]=8'b10001110;
      InstMemory[55]=8'b0;

      //beq x0,x0,Loop1
      InstMemory[56]=8'b11100011;
      InstMemory[57]=8'b00000100;
      InstMemory[58]=8'b00000000;
      InstMemory[59]=8'b11111100;
      
	  //add x5,x12,x0 # temp = a[i] 
      InstMemory[60]=8'b10110011;
      InstMemory[61]=8'b00000010;
      InstMemory[62]=8'b00000110;
      InstMemory[63]=8'b0;
      
	  //sd x13, 0(x28) #a[i] = a[j] 
      InstMemory[64]=8'b00100011;
      InstMemory[65]=8'b00110000;
      InstMemory[66]=8'b11011110;
      InstMemory[67]=8'b0;
      
      //sd x5, 0(x29) -a[j] = temp  
      InstMemory[68]=8'b00100011;
      InstMemory[69]=8'b10110000;
      InstMemory[70]=8'b01011110;
      InstMemory[71]=8'b0;
      
	  //addi x23,x23,1 - j++      
      InstMemory[72]=8'b10010011;
      InstMemory[73]=8'b10001011;
      InstMemory[74]=8'b00011011;
      InstMemory[75]=8'b0;
      
	  //addi x29,x29,8 - locj+= 8
      InstMemory[76]=8'b10010011;
      InstMemory[77]=8'b10001110;
      InstMemory[78]=8'b10001110;
      InstMemory[79]=8'b00000000;
      
	  //blt x23,x8,Loop3:          
      InstMemory[80]=8'b11100011;
      InstMemory[81]=8'b11000100;
      InstMemory[82]=8'b10001011;
      InstMemory[83]=8'b11111100;
      
	  //addi x22,x22,1  - i++
      InstMemory[84]=8'b00010011;
      InstMemory[85]=8'b00001011;
      InstMemory[86]=8'b00011011;
      InstMemory[87]=8'b0;
      
	  //addi x28, x28,8 - loci+=8 
      InstMemory[88]=8'b00010011;
      InstMemory[89]=8'b00001110;
      InstMemory[90]=8'b10001110;
      InstMemory[91]=8'b0;
      
	  //beq x0,x0,Loop1 
      InstMemory[92]=8'b11100011;
      InstMemory[93]=8'b00000010;
      InstMemory[94]=8'b00000000;
      InstMemory[95]=8'b11111010;

    end 
  always @(Inst_Address) 
    begin
      Instruction = {InstMemory[Inst_Address + 3], InstMemory[Inst_Address + 2],InstMemory[Inst_Address + 1], InstMemory[Inst_Address]} ;
    end
  
endmodule