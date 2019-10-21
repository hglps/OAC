#s0 = a
#s1 = b
#s2 = x
# notacao c1 / c2 = condicao 1/ condicao 2 do if ou else if 

addi $s2, $zero, 0 # x = 0

IFc1:
slt $t0, $s0, $zero # a < 0
beq $t0, $zero, IFc2 # se a nao for < 0, verifica a proxima condicao do IF
j ELSIFc1 # senao, vai para a primeira condicao do else if

ELSIFc1:
slt $t2, $s0, $zero # a < 0
bne $t2, $zero, ELSIFc2 # se a < 0, vai para a prox condicao do ELSE IF
j ELSE # senao, vai para o ELSE

ELSIFc2:
slt $t3, $s0, $s1 # a < b
beq $t3, $zero, ELSIF # se a nao for < b, vai para o ELSE IF
j ELSE # senao vai para o ELSE

ELSIF:
addi $s2, $zero, 2 # x = 2
j EXIT

IFc2:
slt $t1, $s0, $s1 # a < b
bne $t1, $zero, IF # se a < b, vai para o conteudo do IF
j ELSIFc1 # senao vai para o ELSE IF na sua primeira condicao

IF:
addi $s2, $zero, 1 # x = 1
j EXIT

ELSE:
addi $s2, $zero, 3 # x = 3

EXIT: syscall

