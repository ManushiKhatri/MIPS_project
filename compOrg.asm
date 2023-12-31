.data
prompt: .asciiz "Enter an integer N (N >= 25): "
error_msg: .asciiz "Illegal Number!\n"
.text
main:
    # Display prompt
    li $v0, 4
    la $a0, prompt
	syscall

    # Get user input
    li $v0, 5
    syscall
    move $s0, $v0  # Store input in $s0
	
	# Check if N is legal
    bge $s0, 25, legal_input
    # If not legal, display error message and end program
    li $v0, 4
    la $a0, error_msg
    syscall
    j end_program
	
legal_input:
    # Continue with Step 2 (calculate Fibonacci sequence)
    # Initialize Fibonacci sequence
    li $t0, 0      # F(0)
    li $t1, 1      # F(1)
	
	# Print the first N numbers in the Fibonacci sequence
print_fibonacci:
    bgez $s0, loop_start  # If N >= 0, continue printing
    j end_program         # If N < 0, end program
	
loop_start:
    # Print current Fibonacci number
    li $v0, 1
    move $a0, $t0
    syscall
	
	# Print a space
    li $v0, 4
    la $a0, space
    syscall
	
	# Calculate next Fibonacci number
    addu $s1, $t0, $t1
    move $t0, $t1
    move $t1, $s1
	
	# Decrement N
    sub $s0, $s0, 1

    j print_fibonacci

end_program:
    li $v0, 10  # Exit program
    syscall
	
.data
space: .asciiz " "