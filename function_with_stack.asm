.text

main:
  li $v0,4
  la $a0,msg
  syscall

  li $v0,5
  syscall
  move $t0,$v0
  move $a0,$t0
  li $a1,3
  jal multiply
  move $t0,$v0
  move $a0,$v0
  li $a1,5
  jal addition
  move $t0,$v0
  li $v0,4
  la $a0,output
  syscall

  li $v0,1
  move $a0,$t0
  syscall


  li $v0,10
  syscall

multiply:
  mul $v0,$a0,$a1
  jr $ra
addition:
  add $v0,$a0,$a1
  jr $ra

.data
msg: .asciiz "Enter x : "
output: .asciiz " value of f(x) is : "

