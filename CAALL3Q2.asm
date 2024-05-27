.data
matrix1: .word 1, 2, 1, 2
matrix2: .word 1, 2, 3, 4
result: .word 0, 0, 0, 0

.text
# WRITE THE FULL CODE BELOW:

# Loading values
la s0, matrix1
la s1, matrix2
la s2, result

# Indexes
addi s3, zero, 0
addi s4, zero, 2  # Changed to 2 for a 2x2 matrix

for: 
    bge s3, s4, done   # if s3 >= s4 go to done
    
    slli t0, s3, 2      # t0 = s3*4  calculating address 
    add s0, s0, t0
    add s1, s1, t0
    add s2, s2, t0      # Indexes updated
    
    # Saving matrix values
    lw t2, 0(s0)
    lw t3, 0(s1)
    
    # Multiplication
    mul t4, t2, t3
    
    # Storing
    sw t4, 0(s2)
    
    addi s3, s3, 1      # Increment index
    j for

done:


# /////////////////////////////// OLD CODE



.data
matrix1: .word 1, 2, 1, 2
matrix2: .word 1, 2, 3, 4
result: .word 0, 0, 0, 0

.text
# WRITE THE FULL CODE BELOW :

# Loading values
la s0, matrix1
la s1, matrix2
la s2, result

# Indexes
addi s3, zero, 0
addi s4, zero, 4

for: 
	bge s3, s4 done 		# if s3 >= s4 go to done
	
	slli t0, s3, 2			# t0 = s3*4  // Calculating address 
    add s0, s0, t0
    add s1, s1, t0
    add s2, s2, t0			# Indexes updated
    
    # Saving matrix values
    lw t2, 0(s0)
    lw t3, 0(s1)
    
    # Multiplication
    addi t4, zero, 0
    for2:
    	bge t4, t3, done2		# Jump if t4 >= t3 // index >= matrix2[i]
        	add t5, t5, t2			# t5 = t5+t2
     	    addi t4, t4, 1			# t4++
	done2:
    	
    # Storing
    sw t5, 0(s2)
    
    addi s3, s3, 1
    j for

done: 



.data
matrix1: .word 1, 2, 1, 2
matrix2: .word 1, 2, 3, 4
result: .word 0, 0, 0, 0

.text
# WRITE THE FULL CODE BELOW :

# Loading values
la s0, matrix1
la s1, matrix2
la s2, result

# Indexes
addi s3, zero, 0
addi s4, zero, 4

for: 
	bge s3, s4 done 		# if s3 >= s4 go to done
	
	slli t0, s3, 2			# t0 = s3*4  // Calculating address 
    #add s0, s0, t0
    #add s1, s1, t0
    #add s2, s2, t0			# Indexes updated
    
    # Saving matrix values
    lw t2, 0(s0)
    lw t3, 0(s1)
    
    # Multiplication			# 1 2 1 2    # 1 2 3 4   1.1+2.3 1.2+2.4
    add s5, s1, s2
    
    lw s8, 8(s1)
    lw s9, 8(s2)
    add s6, s9, s9
    add s6, s6, s9
    
    add t5, s5, s6
    
    
#    addi t4, zero, 0
#    for2:
#    	bge t4, t3, done2		# Jump if t4 >= t3 // index >= matrix2[i]
#        add t5, t5, t2			# t5 = t5+t2
#     	addi t4, t4, 1			# t4++
#	done2:
    	
    # Storing
    sw t5, 0(s2)
    
    addi s3, s3, 1
    j for
    
done: 
