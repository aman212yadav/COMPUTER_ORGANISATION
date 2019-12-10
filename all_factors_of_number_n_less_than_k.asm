.text

main:
  li $v0,4
  la $a0,msg
  syscall
  li $v0,5
  syscall
  move $t0,$v0
  
  li $v0,5
  syscall
  move $t3,$v0 
  li $t1,0

  li $v0,4
  la $a0,factors
  syscall
 
loop:
    add $t1,$t1,1
    bgt $t1,$t3,exit 
    rem $t2,$t0,$t1
    bne $t2,$zero,loop
    li $v0,1
    move $a0,$t1
    syscall
    li $v0,4
    la $a0,spc
    syscall
    j loop  
  
exit:
   li $v0,10
   syscall

.data
msg: .asciiz "\nEnter number n and k \n " 
factors: .asciiz "\n Factors are : "
spc: .asciiz " "

