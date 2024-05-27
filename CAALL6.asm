# INTEGER ARRAY

# C CODE

# #include <stdio.h>
#
# void main() {
#     int num[3] = {2, 5, 13};
# }


# #########################################

# RISC V CODE

main:
        addi    sp,sp,-32
        sw      s0,28(sp)
        addi    s0,sp,32
        li      a5,2
        sw      a5,-28(s0)
        li      a5,5
        sw      a5,-24(s0)
        li      a5,13
        sw      a5,-20(s0)
        nop
        lw      s0,28(sp)
        addi    sp,sp,32
        jr      ra


# POINTER ARRAY

# C CODE 

#include <stdio.h>

void main() {
    int *num[3] = {2, 5, 13};
}

# #########################################

# RISC V CODE

main:
        addi    sp,sp,-32
        sw      s0,28(sp)
        addi    s0,sp,32
        li      a5,2
        sw      a5,-28(s0)
        li      a5,5
        sw      a5,-24(s0)
        li      a5,13
        sw      a5,-20(s0)
        nop
        lw      s0,28(sp)
        addi    sp,sp,32
        jr      ra