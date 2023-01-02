.386
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
invoke atodw , reparg(sz$)
EXITM <eax>
ENDM

.data
num db 50 dup(?)

.code
start:


push 50
push offset num
call StdIn




mov eax,txt2dw(offset num)
mov ebx,eax
mov ecx,2d
 

_loop:
mov eax , ebx
xor edx, edx
div ecx
inc ecx
cmp edx , 0d
je _NOTPRIME 
cmp ecx , ebx
jl _loop

printf("Is Prime")
jmp _exit

_NOTPRIME:
printf("Not Prime")
_exit:
end start