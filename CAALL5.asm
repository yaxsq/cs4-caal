.data
matrix1: .word 1, 2, 1, 2
matrix2: .word 1, 2, 1, 2
result: .word 0, 0, 0, 0

.text

main:

# LOAD THE ADDRESSES OF ALL THREE MATRICES INTO REGISTERS ( USING la )
# USE s0 , s1 , & s2 registers for loading addresses of matrices.
la s0, matrix1
la s1, matrix2
la s2, result

# INITIALIZE THE STARTING & ENDING INDEX OF FOR LOOP ( using addi )
addi s3, zero, 0
addi t0, zero, 4

# INITIALIZE THE VALUE OF ra
addi ra, zero, 64

for:
    beq s3, t0, done

# Recursive Call to Recursive_Multiplication using ( jal )
    jal Recursive_Multiplication
    addi s3, s3, 1
    j for

Recursive_Multiplication: 
    # Decrement sp by -16 to make space for four words on stack
    addi sp, sp, -16

    # Store the preserved registers onto to the stack
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw ra, 12(sp)

    # Matrix Multiplication Code
        slli t3, zero, 4
        add t3, s0, t3
        
        lw s4, 0(t3)
        lw s5, 4(t3)
        
        andi t4, s3, 1
        addi s6, zero, 4
        
        mul t5, t4, s6
        add t5, t5, s1
        
        lw s6, 0(t5)
        lw s7, 8(t5)
        
        mul s8, s4, s6
        mul s9, s5, s7
        add s8, s8, s9
        
        slli s11, s3, 2
        add s10, s2, s11
        sw s8, 0(s10)
        
        # Restore values from stack onto the registers
            lw s0, 0(sp)
            lw s1, 4(sp)
            lw s2, 8(sp)
            lw ra, 12(sp)

        # Increment the sp by 16
        addi sp, sp, 16

    # return
        jr ra

done :