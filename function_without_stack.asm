.text

main:
  li $v0,4
  la $a0,msg
  syscall

  li $v0,5
  syscall
  move $t0,$v0
  
  mul $t0,$t0,3
  add $t0,$t0,5
  
  li $v0,4
  la $a0,output
  syscall

  li $v0,1
  move $a0,$t0
  syscall

  li $v0,10
  syscall

.data
msg: .asciiz "Enter x : "
output: .asciiz " value of f(x) is : "

