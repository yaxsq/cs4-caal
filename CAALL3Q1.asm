.data
matrix1: .word 1, 2, 1, 2
matrix2: .word 1, 2, 1, 2
result: .word 0, 0, 0, 0
.text

# LOAD THE ADDRESSES OF ALL THREE MATRICES INTO REGISTERS ( USING la )
la s0, matrix1
la s1, matrix2
la s2, result

# INITIALIZE THE STARTING & ENDING VALUE OF INDEX ( using addi )
addi s3, zero, 0
addi s4, zero, 4

# STARTING FOR LOOP

# register to store i
# add t0, zero, zero

for:
# loop breaking condition ( using bge )
bge s3, s4, done		# branch if t0 >= s4

# Calculate the value of offset ( using slli )
slli t0, s3, 2			# t0 = s3*4 

# Add the value of offset in the memory address of all three matrices
add s0, s0, t0
add s1, s1, t0			# s1 = s1 + t0 = matrix1 + offset
add s2, s2, t0

# load the value of matrix1 & matrix2 with the updated offset (using lw )
lw t2, 0(s0)
lw t3, 0(s1)

# Perform the addition function on matrix1 & matrix2 ( using add )
add t4, t2, t3

# Store addition result at the updated offset of result matrix (using sw )
sw t4, 0(s2)

# Increment the loop by +1
addi s3, s3, 1
j for

done: