addi t0, zero, 342
xori t1, t0, -1
addi t2, zero, 231
xori t3, t2, -1
or t4, t3, t1


# TALKING ABOUT DATAPATHS 

# In the first cycle, the input to the write destination which is the input adddress 3 is 5 which represents the register t0 while the first address input is 0 which represents the zero register. The second address is 22 which is not used in this case. The immediate is 342 which is sign extended to 32 bits from the immediate extender. SrcB contains that output. SrcA contains the output from the register file which is zero because we read zero from it. This is then sent to the ALU where it is added and stored at the register pointed at by address 3. 

# In the second cycle, the first address input is 5, the second address input is 31 and the third address input which is also the write destination address is 6. This corresponds to t0 in a1 and t1 in a3. In a2, the value is 31 which is useless since the sign extended immediate '-1' is used at SrcB with the output from the register file at SrcA which contains the contents of t0. This is xor'd with -1 coming from the immediate extender and stored at the destination address which is the t1 register. The result can be seen in the Result[31:0] section. 

# In the third cycle, a1 contains zero while a2 and a3 point to 7. The second address is again useless to us since we will use the sign extended immediate value from the extend unit which in this case is 231. We add 231 with the output from the register file which is the contents of the zero register in this case. The sum which ends up being the same immediate, evident by the Result[31:0] section, is stored at a3 which was 7, pointing to t2.

# In the fourth cycle, a1 contains 7 which points to t2, a2 contains 31 and a3 contains 28 which points to t3. Similar to the previous instruction, the second address is not used since we sign extend the immediate, which is -1 in this case, and xor it with the output from rd1 leading to SrcA which is the contents of t2. After the ALU operation, this is stored at t3. 

# In the fifth cycle, a1 points to t3, a2 points to t1 and a3 points to t4. The jump between t2 and t3 is due to the structure of the register file where the registers are separated by other registers. The or instruction is executed in this case which is performed between the contents of t3 and t1. The result in Result[31:0] is stored in a3 which is the t4 register. 