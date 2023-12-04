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