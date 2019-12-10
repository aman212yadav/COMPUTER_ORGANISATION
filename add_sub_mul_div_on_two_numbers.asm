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

  #addition
  li $v0,4
  la $a0,addition                        
  syscall  
  add $t2,$t1,$t0
  li $v0,1
  move $a0,$t2
  syscall 

  #subtraction
  li $v0,4
  la $a0,subtraction                        
  syscall  
  sub $t2,$t0,$t1
  li $v0,1
  move $a0,$t2
  syscall 
  
  #multiplication
  li $v0,4
  la $a0,multiplication                        
  syscall  
  mul $t2,$t1,$t0
  li $v0,1
  move $a0,$t2
  syscall
  
  #division
  li $v0,4
  la $a0,division                        
  syscall  
  div $t2,$t0,$t1
  li $v0,1
  move $a0,$t2
  syscall
  

  li $v0,10
  syscall
.data
  msg: .asciiz "\n Enter two numbers \n"
  addition: .asciiz "\n Addition of entered two numbers is : "
  subtraction: .asciiz "\n Subtraction of entered two numbers is : " 
  multiplication: .asciiz "\n Multiplication of entered two numbers is : " 
  division: .asciiz "\n Division of entered two number is : " 

