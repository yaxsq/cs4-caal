addi t0, zero, 342
xori t1, t0, -1
addi t2, zero, 231
xori t3, t2, -1
or t4, t3, t1

# TALKING ABOUT CONTROL PATH

# For the first and third instructions, the ALUControl bits are 0 which represent addition. ALUOp is 2 which goes into the ALUControlUnit's input. ImmSrc is 0 which tells the extend unit that its input is to be sign extended which is in later used as SrcB after the high ALUSrc bit lets it through the mux. ResultSrc is 0 which allows the path from the ALU to be directly taken to the RF. The control bits going into the control unit are funct3 which is 0, funct7b5 which is low, and op which is 13. All three of them together represent the addi instruction. 

# In the second and fourth instruction which is xori from the same I type family, the ALUControl is 4 which represents the 'xori' instruction. ALUOp remains the same as the first and third instructions. ALUSrc is also the same as the first and third instuctions for the same reason. ImmSrc is also the same as the first and third instructions since the immediate is sign extended.  The control unit's funct3 input is different which now represents the xori instruction. The next control bit, funct7b5, is high in this case. 

# In the fifth instruction, the ALU Control is 3 which represents the 'or' operation in the ALU. ALUOp is again the same as the previous instructions. The ALUSrc bit being low in this case allows SrcB to be the output of the register file as opposed to the previous instructions since we dont need the extend unit in this R type instruction which is also why we dont care about the ImmSrc bits. ResultSrc remains the same since we dont need the Data Memory. The last three control bits funct3, funct7b5 and op together represent the or instruction. 