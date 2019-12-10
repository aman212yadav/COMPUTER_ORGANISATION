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
  move $t1,$v0
  move $t2,$t0

  bgt $t2,$t1,exit
  move $t2,$t1 
  j exit
 
exit:

  li $v0,4
  la $a0,greater
  syscall
 
  li $v0,1
  move $a0,$t2
  syscall
  
  li $v0,10
  syscall   
    

.data
msg: .asciiz "\nEnter two numbers \n"
greater: .asciiz "\n The greater of two number is : "
