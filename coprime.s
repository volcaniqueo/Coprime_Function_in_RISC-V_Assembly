.globl _start

.equ M, 7

.data
D: .word 5,7,0, 8,24,0, 11,44,0, 11,18,0, 36,2,0, 63,27,0, 19,24,0

.text
gcd:

# Insert gcd function below.
	# (a0, a1) is the function argument
	# t3, t4 will be used for comparison registers
	# s10 temp register for change_order 
	mv t3, a0
	mv t4, a1

	# A-B comparison
	ble t3, t4, change_order
	j gcd_loop

	change_order:
		mv s10, t3
		mv t3, t4
		mv t4, s10

	# Loop finishes when k==0, k is the remainder of A/B, 
	gcd_loop:
		remu t5, t3, t4		# valueOf(t5) = A//B
		beqz t5, gcd_exit
		mv t3, t4 			# A <- B
		mv t4, t5			# B <- k
		j gcd_loop

	gcd_exit:
		# Check value of B to decide whether A-B are comprime or not. 
		# If 1 : Coprime (a0=1), write 1
		# Else : Not coprime (a0!=1), write 2

		beq t4, s4, return_coprime
		mv a0, x0	# A-B are not coprime, return 0
        j gcd_return

		return_coprime:
			mv a0, s4	# A-B are coprime, return 1 
        gcd_return:


# Insert gcd function above.

	ret

coprime:

# Insert coprime function below.
	mv t1, a0	# address of D[0] is stored at t1 
	mv t2, a1	# value of M is stored at t2
	li s0, 0	# var i = 0   
	li s4, 1	# static register for value 1
	li s5, 2	# static register for value 2
	mv s11,	ra	# store return addres register at s11

	loop:
	
		# Call gcd with two arguments: gcd(A,B) 
		# A stored in a0
		# B stored in a1

		lw a0, (t1)
		addi t1, t1, 4
		lw a1, (t1)
		jal gcd				# Return value of gcd(a0,a1) is stored at a0
		addi t1, t1, 4
		bne a0, s4, not_coprime								
		sw s4, (t1)		# write 1 in the array
        j loop_end
		not_coprime:
			sw s5, (t1)	# write 2 in the array
		loop_end:
		    addi s0, s0, 1
            addi t1, t1, 4
		    bne t2, s0, loop
	
	mv ra, s11

# Insert coprime function above.

	ret

_start:

# Insert _start function below.
	
	mv t0, ra					# Store default register value at t0.
	
	la a0, D					# Parameters of coprime(D,M)
	li a1, M
	jal coprime

	mv ra, t0
    la s3, D                    # To see the start adress of data array when using whisper to peek.

# Insert _start function above.

	ret

.end