.text
main:
  li $v0,4
  la $a0,msg
  syscall
  
  #reading string 
  la $a0,buffer
  la $a1,1000
  li $v0,8
  syscall


  li $t0,0 
  li $t2,0
length:
      lb $t1,buffer($t0)
      beqz $t1,length_done
      add $t2,$t2,1
      add $t0,$t0,1      
      j length
length_done:
    sub $t2,$t2,1    # actual length
    sub $t2,$t2,1    # last index (length-1)
    li $t0,0         # start index 
    j check_palindrome 
   
check_palindrome:
         lb $t1,buffer($t0)
         lb $t3 , buffer($t2)
         bne $t1,$t3,_not_palindrome
         add $t0,$t0,1
         sub $t2,$t2,1
         blt $t0,$t2,check_palindrome
         j _palindrome 
_not_palindrome:
     li $v0,4
     la $a0,not_palindrome
     syscall
     j exit        
_palindrome:
     li $v0,4
     la $a0,palindrome
     syscall
     j exit 
exit:
   li $v0,10
   syscall


.data
  buffer: .space 1000
  msg: .asciiz "Enter string : "
  palindrome: .asciiz "String is Palindrome "
  not_palindrome: .asciiz "String is not Palindrome"








