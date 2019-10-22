# int f(int n){
#	if(n <= 1) return n;
#	
#	return f(n-1) + f(n-2);
#
# }

f:
addi $sp, $sp, -8
sw $ra, 4($sp)
sw $a0, 0($sp)

slt $t0, $a0, $s0
beq $t0, $zero, rec ###


#continuar




rec:
addi $a0, $a0, -1
jal f

lw $a0, 0($sp) ## sera
lw $ra, 4($sp)

addi $sp, $sp, 8
add $v1, $zero, $a0










main:
addi $a0, $zero, 0
addi $s0, $zero, 2

jal f
