.data
    radius: .word 5
    pi: .float 3.14159

.text

    main: 
    lw a0, radius           # loading radius
    fcvt.s.w fa0, a0        # convert int rad to float
    
    la t3, pi               # storing pi's address in t3
    flw fa1, 0(t3)          # loading pi in fa1
    
    jal Circumference
    jal Area
    jal Volume
    jal Done

    Circumference:      # ~31
        addi t2, zero, 2        # loading 2
        fcvt.s.w ft2, t2        # convert two int to float
        
        fmul.s ft1, fa0, ft2    # ft1 = rad * 2
        fmul.s fa2, ft1, fa1    # fa2 = (rad*2) * pi
        
        jr ra

    Area:               # ~75        
        fmul.s fa3, fa0, fa0    # fa3 = rad * rad
        fmul.s fa3, fa3, fa1     # fa3 = (rad*rad) * pi
        
        jr ra

    Volume:             # ~500
        addi t3, zero, 3
        addi t4, zero, 4
        fcvt.s.w ft3, t3
        fcvt.s.w ft4, t4
        fdiv.s ft5, ft4, ft3    # ft5 = 4/3

        fmul.s ft6, fa0, fa0    # ft6 = rad*rad
        fmul.s ft6, ft6, fa0    # ft6 = ft6*rad
        fmul.s ft7, ft5, ft6    # ft7 = (4/3) * (rad)^3
        fmul.s fa4, ft7, fa1
        
        jr ra
        
    Done: 