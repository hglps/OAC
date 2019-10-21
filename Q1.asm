addi $s0, $zero, 2                    # s0 = a = 0 + 2
addi $s1, $zero, 1                    # s1 = b = 0 + 1
add $s2, $zero, $s0                   # s2 = m = 0 + a

slt $t0, $s1, $s2                     # if b < m , t0 = 1; else t0 = 0  
beq $t0, $zero, ELSE                  # if t0 == 0 (ou seja, b >= m), vai para label ELSE; senao, vai para proxima linha
add $s2,$s1,$zero                     # m = b
j END                                 # vai para label END/ finaliza programa

ELSE: add $s2, $zero, $zero           # m = 0
END: syscall                          # finaliza programa
