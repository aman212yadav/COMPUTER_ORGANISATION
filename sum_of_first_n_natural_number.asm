.text

main:
  li $v0,4
  la $a0,msg
  syscall

  li $v0,5
  syscall

  move $t0,$v0
  li $t1,1
  li $t2,0

loop:
  bgt $t1,$t0,exit
  add $t2,$t2,$t1
  add $t1,$t1,1   
  j loop  

exit:
  li $v0,4
  la $a0,sum
  syscall

  li $v0,1
  move $a0,$t2
  syscall

  li $v0,10
  syscall
   


.data
msg: .asciiz "\nEnter natural Number(n): "
sum: .asciiz "\nSum of first n natural number is : "

