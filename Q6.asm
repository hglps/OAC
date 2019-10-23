main:

	addi $a0, $zero, 0          # x=0
	addi $a1, $a0, 1            # y=x+1
	add $a2, $zero, $zero       # sum
	add $s0, $zero, 6           # n - entrada de caso teste
	jal f
	j EXIT

###############################

save:
	add $a2, $a0, $a1     # sum = x+y  |
	add $a0, $zero, $a1   # x = y      | houve a passagem dos valores 
	add $a1, $zero, $a2   # b = sum    | assim, x semṕre tera a ultima referencia do resultado, visto que sum tera o valor atualizado sempre no final
	addi $s0, $s0, -1     # n = n-1
	jal f

	lw $a2,   12($sp)
	lw $a1,   8($sp)
	lw $a0,   4($sp)
	lw $ra,   0($sp)

	addi $sp, $sp, 16     # realoca-se o espaco da stack das chamadas recursivas dentro de save ( nas voltas de jr de 'save')
	add $v1, $zero, $a0  # valor final 

	jr $ra
	j EXIT

###############################

f:
	addi $sp, $sp, -16          # aloca-se espaço para os parametros variantes da stack (x, y, soma e endereco de retorno)
	sw $a0,  8($sp)
	sw $a1,  4($sp)
	sw $a2,  0($sp)
	sw $ra, 12($sp)

	slti $t0, $s0, 1            # verifica-se se n < 1 
	beq $t0, $zero, save        # se nao, executa a recursao

	addi $sp, $sp, 16           # se for, realoca o espaco da stack e volta os resultados das chamadas passadas pelo jr
	jr $ra
###############################

EXIT:
syscall
