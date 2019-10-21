main:
addi $s0, $zero, 1          # caso teste / s0 = a
addi $s1, $zero, 5          # caso teste / s1 = b

slt $t0, $s0, $s1           # a < b
beq $s0, $s1, aEQUALSb      # if a == b
beq $t0, $zero, aGreaterB   # if a > b, vai para o caso geral

add $a0, $zero, $s0         # na chamada da funct, i = a
jal sumfunct
j EXIT

############################

sumfunct:
addi $sp, $sp, -8           # aloca-se 2 espacos na stack para armazenar o endereco de retorno e o parametro de contagem 'i', ou seja, realiza 2 push's
sw $ra, 4($sp)
sw $a0, 0($sp)              # parametro de contagem, i
slt $t0, $a0, $s1           # i < b

beq $a0, $s1, OPsum         # if i == b, realiza a operacao da funcao recursiva
bne $t0, $zero, OPsum       # if i < b, tambem realiza a op.

addi $sp, $sp, 8            # caso i > b, restaura a posicao do stack pointer
jr $ra                      # e volta para o ra, que no caso seria no fim de OPsum

OPsum:
addi $a0, $a0, 1            # i += 1
jal sumfunct                # chama a func novamente

lw $a0, 0($sp)              # pega o valor na stack de i
lw $ra, 4($sp)              # pega o valor anterior do endereco de retorno 
addi $sp, $sp, 8            # realiza POP na stack, para pegar os valores das chamadas anteriores
add $v1, $v1, $a0           # returnValue = returnValue + i
jr $ra                      # volta para o return address anterior, resgatado no load word anterior, ate o ultimo pop da pilha


############################

aGreaterB:
addi $v1, $zero, 1          # caso a > b, o returnValue, ou v1, sera 1
j EXIT

aEQUALSb:
add $v1, $s0, $s1           # caso a == b, o resultado sera sua soma
j EXIT

EXIT:
syscall

