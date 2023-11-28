.data
prompt: .asciiz "Enter an integer N (N >= 25): "
error_msg: .asciiz "Illegal Number!\n"
.text
main:
    # Display prompt
    li $v0, 4
    la $a0, prompt