# C CODE

# int num = 1; 
# 
# for (int i = 0; i < 5; i++) {
#     num += i;
# }
# 
# System.out.println(num);

# ######################################### 

# RISC V CODE

li t0, 0    # i = 0
li t1, 1    # num = 1
li t2, 5    # limit

Loop: 
beq t0, t2, done   # jump if i == limit / if loop done
add t1, t1, t0     # num += i
addi t0, t0, 1     # i++
j Loop

done:


# ######################################### 

# Instruction Addresses and their Assembly Instructions 

# 0x0000 0000   li t0, 0    # i = 0
# 0x0000 0004   li t1, 1    # num = 1
# 0x0000 0008   li t2, 5    # limit
# 0x0000 000C   beq t0, t2, done   # jump if i == limit / if loop done
# 0x0000 0010   add t1, t1, t0     # num += i
# 0x0000 0014   addi t0, t0, 1     # i++
# 0x0000 0018   j Loop


# Labels and their addresses 

# loop  0x0000 000C
# done  0x0000 001C


# Execultable File Header 

# 0x1000 0000              

# Text Size 

# 194 bytes in assembly, 
# 84 bytes in machine code, 
# 35 bytes according to text section in venus memory

# Data Size

# 0 bytes


# Address and Instruction

# 0x0000 0000   0x00000293
# 0x0000 0004   0x00100313
# 0x0000 0008   0x00500393
# 0x0000 000C   0x00728863
# 0x0000 0010   0x00530333
# 0x0000 0014   0x00128293
# 0x0000 0018   0xFF5FF06F


# PC: 0x0000 0000
# gp: 0x1000 0000
# sp: 0x7FFF FFF0