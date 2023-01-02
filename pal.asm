.386
.model flat, stdcall
option casemap:none
include \masm32\include\masm32rt.inc

txt2dw MACRO sz$
 invoke atodw, reparg(sz$) 
 EXITM <eax>
 ENDM
 .data
 lpBuffer dword 12 dup(?)
 tx123 db "12", 0
 num db 50 dup(?)
 p db "prime",0
 ten dword 10d
 
.code
start:

push 50
push offset num
call StdIn

mov ebx,txt2dw(offset num)
mov eax,ebx

_loop1:
xor edx,edx
div ten
push edx
cmp eax,0
jg _loop1

mov eax,ebx

_test:
xor edx,edx
div ten
pop lpBuffer
cmp edx,lpBuffer
jne _not
cmp eax, 0
jg _test


_pal:
printf("%u palindrom" ,ebx)
jmp _exit
_not:
printf("%u not palindrom" ,ebx)

_exit:
end start 
