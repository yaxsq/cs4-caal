.data
    pi: .word 3
    n: .word 2
    sign: .word 1
    
    one: .word 1
    two: .word 2
    four: .word 4
    minone: .word -1

.text

    initialize:
#         la s0, pi           # Setting s0 as pi's address
        li s0, 3
        fcvt.s.w fa0, s0      # fa0 = pi   // 3
#         la s0, n
        li s0, 2
        fcvt.s.w fa1, s0      # fa1 = n    // 2
#         la s0, sign
        li s0, 1
        fcvt.s.w fa2, s0      # fa2 = sign // 1
        
        li t0, 0            # t0 = 0        // Base address 
        li t1, 10000          # t1 = 500      // Loop limit
        
#         la s0, one
        li s0, 1
        fcvt.s.w ft0, s0      # ft0 = 1
#         la s0, two
        li s0, 2
        fcvt.s.w ft1, s0      # ft1 = 2
#         la s0, four
        li s0, 4
        fcvt.s.w ft2, s0      # fa3 = four // 4
#         la s0, minone
        li s0, -1
        fcvt.s.w ft5, s0      # ft5 = -1

    loop:
        bge t0, t1, done
        slli t2, t0, 2      # t2 = t0*4     // Offset
        addi t0, t0, 1      # i = i+1       // t0 += 1 // i += 1
        
        fadd.s ft3, fa1, ft0      # t3 = n+1
        fadd.s ft4, fa1, ft1      # t4 = n+2
        fmul.s fs0, ft3, ft4      # s0 = t3*t4 // s0 = n+1 * n+2
        fmul.s fs0, fs0, fa1      # s0 = s0*a1 // s0 =   n * s0
        fdiv.s fs0, ft2, fs0      # s0 = a3/s0 // s0 = 4/s0
        fmul.s fs0, fs0, fa2      # s0 = s0*a2 // s0 = s0*sign
        fadd.s fa0, fa0, fs0      # a0 = a0+s0 // pi = pi+(SUM)
        
        fmul.s fa2, fa2, ft5      # a2 = a2*t5 // sign = sign*-1
        fadd.s fa1, fa1, ft1      # n = n+2
        
        j loop        
        
    done: 
    
    