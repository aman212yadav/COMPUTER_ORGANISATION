.text
main:
  li $v0,4
  la $a0,msg
  syscall
  li $v0,5
  syscall
  move $t0,$v0
  lw $t3,array_length
  la $t4,array
  li $t1,0  
loop:
   lw $t5,0($t4)
   beq $t5,$t0,_found
   add $t1,$t1,1
   add $t4,$t4,4
   blt $t1,$t3,loop
   j _not_found
_found:
   li $v0,4
   la $a0,found
   syscall
   j exit    

_not_found:
   li $v0,4
   la $a0,not_found
   syscall
   j exit 

exit:
   li $v0,10
   syscall
.data
found: .asciiz "Element Present\n"
not_found: .asciiz "Element Not Found\n"
 msg: .asciiz "Enter element to search : "
 array: .word  10, 4, 5, 3, 7, 9, 8, -1, 23, 45
 array_length: .word 10