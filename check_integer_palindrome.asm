.text

main:
  
  li $v0,4
  la $a0,msg
  syscall
  
  li $v0,5
  syscall
  
  move $t0,$v0
  move $t1,$v0
  li $t2,0
loop:
    rem $t3,$t1,10
    mul $t2,$t2,10
    add $t2,$t2,$t3
    div $t1,$t1,10
    bgt $t1,$zero,loop
    
    beq $t0,$t2,print_palindrome
    j print_not_palindrome


print_palindrome:
    li $v0,4
    la $a0,palindrome
    syscall
    j exit
     
print_not_palindrome:
    li $v0,4
    la $a0,not_palindrome
    syscall
    j exit

exit:
   li $v0,10
   syscall
.data
msg: .asciiz "Enter number : "
palindrome: .asciiz "\nentered number is Palindrome"
not_palindrome: .asciiz "\nentered number is not Palindrome"

