.data
array: .word 10, 9, 7, 15, 4, 8
size: .word 6
msg: .asciiz "Array after sorting : "
spc: .asciiz " "


.text
main:
lw $t0,size
lw $t1,size
sub $t1,$t1,1
loop1:
     ble $t1,$zero,done
     li $t4,0
     li $t2,0
     lw $t3,array($t2)
     jal loop2
     mul $t2,$t2,4
     mul $t3,$t1,4
     lw $t4,array($t3)
     lw $t5,array($t2)
     sw $t5,array($t3)
     sw $t4,array($t2) 
     sub $t1,$t1,1
     j loop1

loop2:
     bgt $t4,$t1,done1
     mul $t5,$t4,4
     lw $t5,array($t5)
     blt $t3,$t5,swap
     add $t4,$t4,1
     j loop2

done1:
    jr $ra 
swap:
    move $t3,$t5
    move $t2,$t4
    add $t4,$t4,1
    j loop2 
done:
    li $v0,4
    la $a0,msg
    syscall
    lw $t1,size
     li $t0,0
loop :
      beq $t0,$t1,exit
      mul $t2,$t0,4
      lw $t2,array($t2)
      li $v0,1
      move $a0,$t2
      syscall
      li $v0 ,4
      la $a0,spc
      syscall
      add $t0,$t0,1
      j loop
          
exit:
   li $v0,10
   syscall
        

    