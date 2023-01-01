.386
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
invoke atodw, reparg(sz$)
EXITM <eax>
ENDM


.data
num dword 1 dup(?)
two dword 2
.code
start:

push 1
push offset num
call StdIn

mov eax , txt2dw(offset num)

mov edx , 0d


div two ;eax = eax / ebx
cmp edx , 0d

je _even

printf("ODD")
jmp _exit

_even:
printf("Even")



_exit:
end start