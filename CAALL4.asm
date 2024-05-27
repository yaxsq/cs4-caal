# C CODE

# #include <stdio.h>

# int fibonacci(int n) {
#     int num1 = 0;
#     int num2 = 1;
#     for (int i = 0; i < n; i++) {
#         printf("%d > ", num1);
#         int num3 = num2 + num1;
#         num1 = num2;
#         num2 = num3;
#         }
# }

# void main() {
#     fibonacci(20);
# }

# #######################################################

# RISC V CODE

add a1, zero, zero       # num1 = 0
addi a2, zero, 1         # num2 = 1
add a3, zero, zero       # num3/result = 0
addi a4, zero, 19    # limit = 20
addi ra, zero, 640

fibonacci: 
    addi sp, sp, -12    # stack initialized
    
    sw a1, 0(sp)        # values saved in stack
    sw a2, 4(sp)
    sw a3, 8(sp)
    
    add a5, a5, zero
    
for:
    beq a5, a4, done    # for loop until a4 == a5 // counter == 20
        add a3, a2, a1      # num3 = num1+num2
#         lw a1, 0(t4)       # num1 = num2
#         lw a2, 0(a3)        # num2 = num3
        add a1, a2, zero
        add a2, a3, zero
        
        addi a5, a5, 1      # a5 += 1
        add t4, a1, zero
        j for

done:    
    lw a1, 0(sp)        # values saved in stack
    lw a2, 4(sp)
    lw a3, 8(sp)
    
    addi sp, sp, 12
    jr ra