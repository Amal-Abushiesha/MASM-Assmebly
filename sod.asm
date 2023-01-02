.386
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
invoke atodw, reparg(sz$)
EXITM <eax>
ENDM

.data
num dword 50 dup(?)
ten dword 10d

.code
start:

push 50
push offset num
call StdIn

mov eax, txt2dw(offset num)
xor ebx, ebx

;sum of digits  123 = 6 -->123 % 10 = 3 , 12 % 10 = 2 , 1 % 10 = 1 , 

_loop:
    xor edx, edx
    div ten
    add ebx, edx
    cmp eax , 0d
    jg _loop    ;jmp greater

printf("sum of digits = %u \n" ,ebx)

_exit:
end start