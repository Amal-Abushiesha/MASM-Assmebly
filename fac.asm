.386
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$ 
invoke atodw, reparg(sz$)
EXITM <eax>
ENDM

.data
num dword 50 dup(?)

.code
start:

;5, 4, 3, 2, 1 , ecx --> dec if(ecx != 0)jmploop
; div 10 -> eax || mul 10 eax = eax * 10
;eax = 1
;eax = eax * ecx

push 50
push offset num
call StdIn ;standard input

mov ecx, txt2dw(offset num)

mov eax , 1

_loop:
mul ecx
dec ecx 
jnz _loop

printf("factorial \n is %u " , eax) 

end start
