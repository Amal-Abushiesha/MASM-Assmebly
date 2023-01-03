.386
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
invoke atodw , reparg(sz$)
EXITM <eax>
ENDM

.data
num dword 50 dup(?)
ten dword 10

.code
start:

push 50
push offset num
call StdIn

mov eax, txt2dw( offset num)
xor ebx , ebx


;123 --> 1 2 3 << 3 2 1
;stack 3 2 1 -> pop 1 2 3
;div again 

_addstack:
xor edx , edx
div ten
push edx
cmp eax , 0d
jg _addstack

;321

mov eax, txt2dw( offset num)

_ifpal:
xor ebx , ebx
xor edx , edx
div ten
pop ebx
cmp ebx , edx
jne _notPal
cmp eax , 0d
jg _ifpal

printf("Palindrome")
jmp _exit

_notPal:
printf("Not Palindrome")


_exit:
end start
