.globl main

.data
    X: .word 1 ,0 ,0 ,0,  0 ,1 ,0 ,0,  0 ,0 ,1 ,0,  0 ,0 ,0 ,1 
    Y: .word 1 ,2 ,2 ,2,  1 ,2 ,2 ,2,  2 ,2 ,1 ,1,  2 ,1 ,2 ,2 
    R: .word 0 ,0 ,0 ,0,  0 ,0 ,0 ,0,  0 ,0 ,0 ,0,  0 ,0 ,0 ,0

.text

    HeapAdd:
        addi sp, sp, -16
        sw a0, 0(sp)
        sw a1, 4(sp)
        sw ra, 8(sp)
        sw s9, 12(sp)

        addi a0, zero, 9
        addi a1, zero, 8

        ecall

        sw s9, 0(a0)

        lw a0, 0(sp)
        lw a1, 4(sp)
        lw ra, 8(sp)
        lw s9, 12(sp)
        addi sp, sp, 16
        jr ra

    Multiplication:
        addi sp, sp, -16    # Storing values in stack
        sw a1, 0(sp)        # X 
        sw a2, 4(sp)        # Y 
        sw a3, 8(sp)        # R 
        sw ra, 12(sp)

        addi s4, a3, 0          
        addi s10, a2, 0         
        addi s0, zero, 0        # index for first loop
        addi s1, zero, 4        # Final val

        FirstFor:
            lw t0, 0(a1)        # X     // values from first matrix
            lw t1, 4(a1)        # Y
            lw t2, 8(a1)        # W
            lw t3, 12(a1)       # Z
            addi s3, zero, 0    # index for second loop
            NestedFor:
                lw t4, 0(s10)       # A     // values from second matrix
                lw t5, 16(s10)      # B
                lw t6, 32(s10)      # C
                lw s2, 48(s10)      # D

                mul s5, t0, t4      # Multiplying
                mul s6, t1, t5
                mul s7, t2, t6
                mul s8, t3, s2

                add s9, s5, s6      # Adding 
                add s9, s9, s7
                add s9, s9, s8
                sw s9, 0(s4)        # s9 contains dot prod
                jal HeapAdd
                addi s4, s4, 4

                addi s3, s3, 1
                addi s10, s10, 4
                blt s3, s1, NestedFor       # if s3>=s1, exit loop

            addi s0, s0, 1      # updating pointers
            addi s10, a2, 0
            addi a1, a1, 16
            blt s0, s1, FirstFor


        lw a1, 0(sp)
        lw a2, 4(sp)
        lw a3, 8(sp)
        lw ra, 12(sp)

        addi sp, sp, 16
        jr ra

    main:
        la a1, X        # Loading addresses
        la a2, Y
        la a3, R
        jal Multiplication       # Calling function