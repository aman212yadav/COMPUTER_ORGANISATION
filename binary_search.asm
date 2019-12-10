.data
msg: .asciiz "Enter element to be found: "
array: .word  2, 4, 5, 7, 8, 9, 12, 14, 15, 20
size:  .word  10
found: .asciiz "found"
not_found: .asciiz "not found"

.text
main:
li $v0,4
la $a0,msg
syscall
 
li $v0,5
syscall
move $t0,$v0
li $t1,0
lw $t2,size
sub $t2,$t2,1
loop:
    add $t3,$t2,$t1
    div $t3,$t3,2
    move $t4,$t3
    mul $t3,$t3,4
    lb $t5,array($t3)
    beq $t5,$t0,_found
    bgt $t5,$t0,decre
    add $t4,$t4,1
    move $t1,$t4
    ble $t1,$t2,loop
    j _not_found

decre:
   sub $t4,$t4,1
   move $t2,$t4
   ble $t1,$t2,loop
   j _not_found

_not_found:
       li $v0,4
       la $a0,not_found
       syscall
       j exit
_found:
      li $v0,4
      la $a0,found
      syscall
      j exit
exit:
   li $v0,10
   syscall
    
   
