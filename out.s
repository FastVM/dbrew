.globl _start
.equ _start,f5F7374617274
.globl f6C6F6164
.section .text.f6C6F6164
f6C6F6164:
mov (%rdi),%rax
ret
.globl f73746F7265
.section .text.f73746F7265
f73746F7265:
mov %rsi,(%rdi)
ret
.globl f7065656B
.section .text.f7065656B
f7065656B:
movzb (%rdi),%eax
ret
.globl f706F6B65
.section .text.f706F6B65
f706F6B65:
movb %sil,(%rdi)
ret
.globl f616464
.section .text.f616464
f616464:
mov %rsi,%rax
add %rdi,%rax
ret
.globl f737562
.section .text.f737562
f737562:
mov %rsi,%rax
sub %rdi,%rax
ret
.globl f6D756C
.section .text.f6D756C
f6D756C:
mov %rsi,%rax
mul %rdi
ret
.globl f646976
.section .text.f646976
f646976:
xor %edx,%edx
mov %rsi,%rax
div %rdi
ret
.globl f6D6F64
.section .text.f6D6F64
f6D6F64:
xor %edx,%edx
mov %rsi,%rax
div %rdi
mov %rdx,%rax
ret
.globl f73686C
.section .text.f73686C
f73686C:
mov %rsi,%rax
mov %rdi,%rcx
shl %cl,%rax
ret
.globl f636D7061
.section .text.f636D7061
f636D7061:
cmp %rdi,%rsi
seta %al
movzbl %al,%eax
ret
.globl f636D7065
.section .text.f636D7065
f636D7065:
cmp %rsi,%rdi
sete %al
movzbl %al,%eax
ret
.globl f6E65
.section .text.f6E65
f6E65:
cmp %rsi,%rdi
setne %al
movzbl %al,%eax
ret
.globl f6E6567
.section .text.f6E6567
f6E6567:
mov %rdi,%rax
neg %rax
ret
.globl f6E6F74
.section .text.f6E6F74
f6E6F74:
test %rdi,%rdi
sete %al
movzbl %al,%eax
ret
.globl f6C696E7578
.section .text.f6C696E7578
f6C696E7578:
mov 8(%rsp),%rax
syscall
ret
.section .text.f737472756374
f737472756374:
mov $8,%rax
ret
.section .text.f636F7079
f636F7079:
push %rdi
push %rsi
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f6D656D6265722D636F7079
f6D656D6265722D636F7079:
push %rdi
push %rsi
push %rdx
push %rcx
mov 24(%rsp),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $32,%rsp
ret
.section .text.f706169722D636F7079
f706169722D636F7079:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
push %r9
mov f6D656D6265722D636F7079@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
mov 72(%rsp),%rax
mov %rax,16(%rsp)
mov 48(%rsp),%rax
mov %rax,24(%rsp)
mov 40(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
mov f6D656D6265722D636F7079@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
mov 48(%rsp),%rax
mov %rax,24(%rsp)
mov 40(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
.16185917$:
add $48,%rsp
ret
.section .text.f696E63
f696E63:
push %rdi
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65786974
f65786974:
push %rdi
mov f6C696E7578@GOTPCREL(%rip),%rax
add $-56,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
mov $0,%rax
mov %rax,24(%rsp)
mov $0,%rax
mov %rax,32(%rsp)
mov $0,%rax
mov %rax,40(%rsp)
mov $0,%rax
mov %rax,48(%rsp)
mov $60,%rax
mov %rax,56(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $8,%rsp
add $8,%rsp
ret
.section .text.f62726B
f62726B:
push %rdi
mov f6C696E7578@GOTPCREL(%rip),%rax
add $-56,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
mov $0,%rax
mov %rax,24(%rsp)
mov $0,%rax
mov %rax,32(%rsp)
mov $0,%rax
mov %rax,40(%rsp)
mov $0,%rax
mov %rax,48(%rsp)
mov $12,%rax
mov %rax,56(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $8,%rsp
add $8,%rsp
ret
.section .text.f696E697462726B
f696E697462726B:
push %rdi
mov f62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov $0,%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov 0(%rsp),%rax
.16187975$:
add $8,%rsp
add $8,%rsp
ret
.section .text.f616C6C6F63
f616C6C6F63:
push %rdi
push %rsi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 0(%rsp),%rax
.16188642$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f7374726C656E
f7374726C656E:
push %rdi
mov $0,%rax
push %rax
jmp .16188776$
.16188766$:
mov %rax,(%rsp)
.16188776$:
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16188952$
mov f696E63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
lea 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16189100$:
.16188952$:
test %rax,%rax
jne .16188766$
pop %rax
add $8,%rsp
ret
.section .text.f6D656D636D70
f6D656D636D70:
push %rdi
push %rsi
push %rdx
mov $1,%rax
push %rax
mov 8(%rsp),%rax
test %rax,%rax
je .16189451$
mov 8(%rsp),%rax
push %rax
jmp .16189507$
.16189497$:
mov %rax,(%rsp)
.16189507$:
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16189935$
mov f696E63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
lea 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f696E63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
lea 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f737562@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16190202$:
.16190083$:
jmp .16190385$
.16189935$:
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
lea 32(%rsp),%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov $0,%rax
.16190575$:
.16190385$:
test %rax,%rax
jne .16189497$
pop %rax
mov 0(%rsp),%rax
.16190650$:
.16189451$:
add $8,%rsp
add $24,%rsp
ret
.section .text.f7374726E636D70
f7374726E636D70:
push %rdi
push %rsi
push %rdx
mov $1,%rax
push %rax
mov 8(%rsp),%rax
test %rax,%rax
je .16190837$
mov 8(%rsp),%rax
push %rax
jmp .16190893$
.16190883$:
mov %rax,(%rsp)
.16190893$:
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16191321$
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16191471$
mov f696E63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
lea 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f696E63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
lea 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f737562@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16191738$:
.16191619$:
.16191471$:
jmp .16191933$
.16191321$:
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
lea 32(%rsp),%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov $0,%rax
.16192123$:
.16191933$:
test %rax,%rax
jne .16190883$
pop %rax
mov 0(%rsp),%rax
.16192198$:
.16190837$:
add $8,%rsp
add $24,%rsp
ret
.section .text.f7374726571
f7374726571:
push %rdi
push %rsi
push %rdx
push %rcx
mov f6E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
jne .16192511$
mov f6E6F74@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6D656D636D70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16192511$:
add $32,%rsp
ret
.section .text.f707574
f707574:
push %rdi
push %rsi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f706F6B65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16193237$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f7075742D6869676974
f7075742D6869676974:
push %rdi
push %rsi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
mov $10,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16193973$
mov $'0,%rax
jmp .16194015$
.16193973$:
mov $'7,%rax
.16194015$:
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f7075742D62686578
f7075742D62686578:
push %rdi
push %rsi
mov f7075742D6869676974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f646976@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $16,%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6869676974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f6D6F64@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $16,%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16194622$:
add $16,%rsp
ret
.section .text.f7075742D6469676974
f7075742D6469676974:
push %rdi
push %rsi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $'0,%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f7075742D646967697473
f7075742D646967697473:
push %rdi
push %rsi
mov 0(%rsp),%rax
test %rax,%rax
je .16195467$
mov f7075742D646967697473@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f646976@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $10,%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6469676974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f6D6F64@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $10,%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16195817$:
.16195467$:
add $16,%rsp
ret
.section .text.f7075742D6E756D626572
f7075742D6E756D626572:
push %rdi
push %rsi
mov 0(%rsp),%rax
test %rax,%rax
je .16196274$
mov f7075742D646967697473@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
test %rax,%rax
je .16196426$
mov 24(%rsp),%rax
jmp .16196473$
.16196426$:
mov $'0,%rax
.16196473$:
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
jmp .16196581$
.16196274$:
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov $'0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16196581$:
add $16,%rsp
ret
.section .text.f7075742D636D
f7075742D636D:
push %rdi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $',,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7075742D7370
f7075742D7370:
push %rdi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $' ,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7075742D6473
f7075742D6473:
push %rdi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'$,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7075742D6372
f7075742D6372:
push %rdi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'\r,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7075742D6C66
f7075742D6C66:
push %rdi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'\n,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f767075742D6D656D
f767075742D6D656D:
push %rdi
push %rsi
push %rdx
push %rcx
mov 8(%rsp),%rax
push %rax
jmp .16198068$
.16198058$:
mov %rax,(%rsp)
.16198068$:
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16198290$
mov 32(%rsp),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16198573$:
.16198290$:
test %rax,%rax
jne .16198058$
pop %rax
add $32,%rsp
ret
.section .text.f767075742D737472696E67
f767075742D737472696E67:
push %rdi
push %rsi
push %rdx
mov 0(%rsp),%rax
push %rax
jmp .16198933$
.16198923$:
mov %rax,(%rsp)
.16198933$:
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov 0(%rsp),%rax
test %rax,%rax
je .16199136$
mov 32(%rsp),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16199316$:
.16199136$:
add $8,%rsp
test %rax,%rax
jne .16198923$
pop %rax
add $24,%rsp
ret
.section .text.f7075742D737472696E67
f7075742D737472696E67:
push %rdi
push %rsi
mov f767075742D737472696E67@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f707574@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f7075742D64656C696D
f7075742D64656C696D:
push %rdi
push %rsi
push %rdx
mov f7075742D737472696E67@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 16(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16200169$:
add $24,%rsp
ret
.section .text.f7075742D736571
f7075742D736571:
push %rdi
push %rsi
mov f7075742D64656C696D@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7075742D7370@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f7075742D6C697374
f7075742D6C697374:
push %rdi
push %rsi
mov f7075742D64656C696D@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7075742D636D@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f7075742D6C696E65
f7075742D6C696E65:
push %rdi
push %rsi
mov f7075742D64656C696D@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7075742D6C66@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f737464696E
f737464696E:
push %rdi
push %rsi
mov f6C696E7578@GOTPCREL(%rip),%rax
add $-56,%rsp
push %rax
mov $0,%rax
mov %rax,8(%rsp)
mov 72(%rsp),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov $0,%rax
mov %rax,32(%rsp)
mov $0,%rax
mov %rax,40(%rsp)
mov $0,%rax
mov %rax,48(%rsp)
mov $0,%rax
mov %rax,56(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $8,%rsp
add $16,%rsp
ret
.section .text.f7374646F7574
f7374646F7574:
push %rdi
push %rsi
mov f6C696E7578@GOTPCREL(%rip),%rax
add $-56,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 72(%rsp),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov $0,%rax
mov %rax,32(%rsp)
mov $0,%rax
mov %rax,40(%rsp)
mov $0,%rax
mov %rax,48(%rsp)
mov $1,%rax
mov %rax,56(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $8,%rsp
add $16,%rsp
ret
.section .text.f737464657272
f737464657272:
push %rdi
push %rsi
mov f6C696E7578@GOTPCREL(%rip),%rax
add $-56,%rsp
push %rax
mov $2,%rax
mov %rax,8(%rsp)
mov 72(%rsp),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov $0,%rax
mov %rax,32(%rsp)
mov $0,%rax
mov %rax,40(%rsp)
mov $0,%rax
mov %rax,48(%rsp)
mov $1,%rax
mov %rax,56(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $8,%rsp
add $16,%rsp
ret
.section .text.f7265747279
f7265747279:
push %rdi
push %rsi
push %rdx
mov $0,%rax
push %rax
mov 16(%rsp),%rax
push %rax
jmp .16202746$
.16202736$:
mov %rax,(%rsp)
.16202746$:
mov 32(%rsp),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f737562@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f6E6567@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16203371$
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
lea 40(%rsp),%rax
mov %rax,8(%rsp)
mov f6E6567@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16203371$:
mov 0(%rsp),%rax
test %rax,%rax
je .16203693$
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16203693$:
.16203676$:
add $8,%rsp
test %rax,%rax
jne .16202736$
pop %rax
push %rax
mov 8(%rsp),%rax
test %rax,%rax
jne .16203989$
mov 0(%rsp),%rax
.16203989$:
add $8,%rsp
add $8,%rsp
add $24,%rsp
ret
.section .text.f72756E74696D65
f72756E74696D65:
push %rdi
push %rsi
push %rdx
push %rcx
mov f696E697462726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
lea 24(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
lea 32(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f706F6B65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7265747279@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f737464696E@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
mov 112(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7265747279@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7374646F7574@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
mov 80(%rsp),%rax
add $-24,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
mov 80(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f65786974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov $0,%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16205607$:
.16205195$:
add $8,%rsp
add $8,%rsp
add $8,%rsp
add $32,%rsp
ret
.section .text.f657272
f657272:
push %rdi
push %rsi
mov f7265747279@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f737464657272@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov f7374726C656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f737464657272@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16206401
.s16206401:
.string,"\n"
.previous
mov .s16206401@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov $1,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f65786974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16206582$:
.16206339$:
add $16,%rsp
ret
.section .text.f7370616E2D2D7374617274
f7370616E2D2D7374617274:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f7370616E2D2D656E64
f7370616E2D2D656E64:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7370616E2D2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D7370616E
f7374727563742D7370616E:
mov f7370616E2D2D656E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f7370616E2D7374617274
f7370616E2D7374617274:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7370616E2D2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f7370616E2D656E64
f7370616E2D656E64:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7370616E2D2D656E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f7370616E2D636F7079
f7370616E2D636F7079:
push %rdi
push %rsi
mov f706169722D636F7079@GOTPCREL(%rip),%rax
add $-48,%rsp
push %rax
mov f636F7079@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f7370616E2D2D7374617274@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov f636F7079@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov f7370616E2D2D656E64@GOTPCREL(%rip),%rax
mov %rax,32(%rsp)
mov 64(%rsp),%rax
mov %rax,40(%rsp)
mov 56(%rsp),%rax
mov %rax,48(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $16,%rsp
ret
.section .text.f7370616E2D657175616C
f7370616E2D657175616C:
push %rdi
push %rsi
mov f7370616E2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f7370616E2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f7374726571@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f737562@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
mov f7370616E2D656E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 104(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
mov 40(%rsp),%rax
mov %rax,24(%rsp)
mov f737562@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov f7370616E2D656E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 96(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $8,%rsp
add $8,%rsp
add $16,%rsp
ret
.section .text.f7370616E2D696E6974
f7370616E2D696E6974:
push %rdi
push %rsi
push %rdx
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7370616E2D2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7370616E2D2D656E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16210241$:
add $24,%rsp
ret
.section .text.f7370616E2D737472636D70
f7370616E2D737472636D70:
push %rdi
push %rsi
mov f7370616E2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f7370616E2D656E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f737562@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f7374726E636D70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
test %rax,%rax
je .16211311$
mov f6E6F74@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16211311$:
add $8,%rsp
add $8,%rsp
add $8,%rsp
add $16,%rsp
ret
.section .text.f767075742D7370616E
f767075742D7370616E:
push %rdi
push %rsi
push %rdx
mov f767075742D6D656D@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f7370616E2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
mov f7370616E2D656E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $24,%rsp
ret
.section .text.f7075742D7370616E
f7075742D7370616E:
push %rdi
push %rsi
mov f767075742D7370616E@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f707574@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f70757368706F70
f70757368706F70:
push %rdi
push %rsi
push %rdx
push %rcx
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $32,%rsp
ret
.section .text.f66706F70
f66706F70:
push %rdi
push %rsi
push %rdx
mov f70757368706F70@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f616464@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov 40(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $24,%rsp
ret
.section .text.f6670757368
f6670757368:
push %rdi
push %rsi
push %rdx
mov f70757368706F70@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f737562@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov 40(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $24,%rsp
ret
.section .text.f706F70
f706F70:
push %rdi
push %rsi
mov f70757368706F70@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov f616464@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov $1,%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $16,%rsp
ret
.section .text.f70757368
f70757368:
push %rdi
push %rsi
mov f70757368706F70@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov f737562@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov $1,%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $16,%rsp
ret
.section .text.f7838365F36342D737472696E672D6D6F76
f7838365F36342D737472696E672D6D6F76:
.section .text..s16214699
.s16214699:
.string,"mov"
.previous
mov .s16214699@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D6C6561
f7838365F36342D737472696E672D6C6561:
.section .text..s16214888
.s16214888:
.string,"lea"
.previous
mov .s16214888@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D616464
f7838365F36342D737472696E672D616464:
.section .text..s16215077
.s16215077:
.string,"add"
.previous
mov .s16215077@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D74657374
f7838365F36342D737472696E672D74657374:
.section .text..s16215270
.s16215270:
.string,"test"
.previous
mov .s16215270@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D6A65
f7838365F36342D737472696E672D6A65:
.section .text..s16215456
.s16215456:
.string,"je"
.previous
mov .s16215456@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D6A6E65
f7838365F36342D737472696E672D6A6E65:
.section .text..s16215644
.s16215644:
.string,"jne"
.previous
mov .s16215644@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D6A6D70
f7838365F36342D737472696E672D6A6D70:
.section .text..s16215833
.s16215833:
.string,"jmp"
.previous
mov .s16215833@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D70757368
f7838365F36342D737472696E672D70757368:
.section .text..s16216026
.s16216026:
.string,"push"
.previous
mov .s16216026@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D706F70
f7838365F36342D737472696E672D706F70:
.section .text..s16216216
.s16216216:
.string,"pop"
.previous
mov .s16216216@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D63616C6C
f7838365F36342D737472696E672D63616C6C:
.section .text..s16216409
.s16216409:
.string,"call"
.previous
mov .s16216409@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D726574
f7838365F36342D737472696E672D726574:
.section .text..s16216599
.s16216599:
.string,"ret"
.previous
mov .s16216599@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D656E747279
f7838365F36342D737472696E672D656E747279:
.section .text..s16216796
.s16216796:
.string,"_start"
.previous
mov .s16216796@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D737461636B2D746F70
f7838365F36342D737472696E672D737461636B2D746F70:
.section .text..s16217012
.s16217012:
.string,"(%rsp)"
.previous
mov .s16217012@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D706372656C2D726970
f7838365F36342D737472696E672D706372656C2D726970:
.section .text..s16217228
.s16217228:
.string,"@GOTPCREL(%rip)"
.previous
mov .s16217228@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D7374722D6C6162656C2D707265666978
f7838365F36342D737472696E672D7374722D6C6162656C2D707265666978:
.section .text..s16217481
.s16217481:
.string,".s"
.previous
mov .s16217481@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D676C6F626C
f7838365F36342D737472696E672D676C6F626C:
.section .text..s16217677
.s16217677:
.string,".globl"
.previous
mov .s16217677@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D657175
f7838365F36342D737472696E672D657175:
.section .text..s16217869
.s16217869:
.string,".equ"
.previous
mov .s16217869@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D73656374696F6E2D74657874
f7838365F36342D737472696E672D73656374696F6E2D74657874:
.section .text..s16218095
.s16218095:
.string,".section .text."
.previous
mov .s16218095@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D737472696E67
f7838365F36342D737472696E672D737472696E67:
.section .text..s16218308
.s16218308:
.string,".string"
.previous
mov .s16218308@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D70726576696F7573
f7838365F36342D737472696E672D70726576696F7573:
.section .text..s16218521
.s16218521:
.string,".previous"
.previous
mov .s16218521@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D726178
f7838365F36342D737472696E672D726178:
.section .text..s16218716
.s16218716:
.string,"%rax"
.previous
mov .s16218716@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D727370
f7838365F36342D737472696E672D727370:
.section .text..s16218906
.s16218906:
.string,"%rsp"
.previous
mov .s16218906@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D726469
f7838365F36342D737472696E672D726469:
.section .text..s16219096
.s16219096:
.string,"%rdi"
.previous
mov .s16219096@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D727369
f7838365F36342D737472696E672D727369:
.section .text..s16219286
.s16219286:
.string,"%rsi"
.previous
mov .s16219286@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D726478
f7838365F36342D737472696E672D726478:
.section .text..s16219476
.s16219476:
.string,"%rdx"
.previous
mov .s16219476@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D726378
f7838365F36342D737472696E672D726378:
.section .text..s16219666
.s16219666:
.string,"%rcx"
.previous
mov .s16219666@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D7238
f7838365F36342D737472696E672D7238:
.section .text..s16219852
.s16219852:
.string,"%r8"
.previous
mov .s16219852@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D737472696E672D7239
f7838365F36342D737472696E672D7239:
.section .text..s16220037
.s16220037:
.string,"%r9"
.previous
mov .s16220037@GOTPCREL(%rip),%rax
ret
.section .text.f7838365F36342D6D616E676C65
f7838365F36342D6D616E676C65:
push %rdi
push %rsi
push %rdx
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov $'f,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 16(%rsp),%rax
add $-24,%rsp
push %rax
mov f7075742D62686578@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16220400$:
add $24,%rsp
ret
.section .text.f7838365F36342D6D616E676C652D7370616E
f7838365F36342D6D616E676C652D7370616E:
push %rdi
push %rsi
mov f7838365F36342D6D616E676C65@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f767075742D7370616E@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f7838365F36342D6D616E676C652D737472696E67
f7838365F36342D6D616E676C652D737472696E67:
push %rdi
push %rsi
mov f7838365F36342D6D616E676C65@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f767075742D737472696E67@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f7838365F36342D637A
f7838365F36342D637A:
push %rdi
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D74657374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C697374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16221991$:
.16221744$:
add $8,%rsp
ret
.section .text.f7838365F36342D6C6162656C2D6964
f7838365F36342D6C6162656C2D6964:
push %rdi
push %rsi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov $'.,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6E756D626572@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov $'$,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16222717$:
.16222538$:
add $16,%rsp
ret
.section .text.f7838365F36342D6A63
f7838365F36342D6A63:
push %rdi
push %rsi
push %rdx
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6C6162656C2D6964@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16223366$:
.16223177$:
add $24,%rsp
ret
.section .text.f7838365F36342D6A636E
f7838365F36342D6A636E:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D6A63@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $24,%rsp
ret
.section .text.f7838365F36342D637A6A63
f7838365F36342D637A6A63:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D637A@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f7838365F36342D6A636E@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16224086$:
add $24,%rsp
ret
.section .text.f7838365F36342D6A65
f7838365F36342D6A65:
push %rdi
push %rsi
mov f7838365F36342D637A6A63@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D6A65@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f7838365F36342D6A6E65
f7838365F36342D6A6E65:
push %rdi
push %rsi
mov f7838365F36342D637A6A63@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D6A6E65@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f7838365F36342D6A6D70
f7838365F36342D6A6D70:
push %rdi
push %rsi
mov f7838365F36342D6A636E@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D6A6D70@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f7838365F36342D726970
f7838365F36342D726970:
push %rdi
mov f7075742D6C697374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D706372656C2D726970@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16225845$:
add $8,%rsp
ret
.section .text.f7838365F36342D6C6F61642D72656C
f7838365F36342D6C6F61642D72656C:
push %rdi
push %rsi
push %rdx
mov f7075742D6E756D626572@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f73686C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $3,%rax
mov %rax,8(%rsp)
mov f737562@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
mov 80(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C697374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D737461636B2D746F70@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16226956$:
.16226697$:
add $24,%rsp
ret
.section .text.f7838365F36342D6966
f7838365F36342D6966:
push %rdi
push %rsi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov 16(%rsp),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 0(%rsp),%rax
.16227602$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f7838365F36342D7374722D6C6162656C
f7838365F36342D7374722D6C6162656C:
push %rdi
push %rsi
mov f7075742D737472696E67@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D7374722D6C6162656C2D707265666978@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6E756D626572@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16228041$:
add $16,%rsp
ret
.section .text.f7838365F36342D6C6162656C2D737566
f7838365F36342D6C6162656C2D737566:
push %rdi
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $':,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16228503$:
add $8,%rsp
ret
.section .text.f7838365F36342D7374722D6C6162656C2D77697468
f7838365F36342D7374722D6C6162656C2D77697468:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D7374722D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 16(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16228981$:
add $24,%rsp
ret
.section .text.f7838365F36342D6275696C74696E2D6C6162656C
f7838365F36342D6275696C74696E2D6C6162656C:
push %rdi
push %rsi
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D676C6F626C@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D737472696E67@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D73656374696F6E2D74657874@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D737472696E67@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6C6162656C2D737566@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16230282$:
.16230103$:
.16229928$:
.16229659$:
.16229484$:
add $16,%rsp
ret
.section .text.f7838365F36342D707265
f7838365F36342D707265:
push %rdi
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D676C6F626C@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D656E747279@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D657175@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C697374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D656E747279@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6D616E676C652D737472696E67@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D656E747279@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16232095
.s16232095:
.string,"f6C6F6164"
.previous
mov .s16232095@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16232355
.s16232355:
.string,"mov (%rdi),%rax"
.previous
mov .s16232355@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16232892
.s16232892:
.string,"f73746F7265"
.previous
mov .s16232892@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16233154
.s16233154:
.string,"mov %rsi,(%rdi)"
.previous
mov .s16233154@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16233691
.s16233691:
.string,"f7065656B"
.previous
mov .s16233691@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16233951
.s16233951:
.string,"movzb (%rdi),%eax"
.previous
mov .s16233951@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16234490
.s16234490:
.string,"f706F6B65"
.previous
mov .s16234490@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16234750
.s16234750:
.string,"movb %sil,(%rdi)"
.previous
mov .s16234750@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16235288
.s16235288:
.string,"f616464"
.previous
mov .s16235288@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16235546
.s16235546:
.string,"mov %rsi,%rax"
.previous
mov .s16235546@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16235810
.s16235810:
.string,"add %rdi,%rax"
.previous
mov .s16235810@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16236345
.s16236345:
.string,"f737562"
.previous
mov .s16236345@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16236603
.s16236603:
.string,"mov %rsi,%rax"
.previous
mov .s16236603@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16236867
.s16236867:
.string,"sub %rdi,%rax"
.previous
mov .s16236867@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16237402
.s16237402:
.string,"f6D756C"
.previous
mov .s16237402@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16237660
.s16237660:
.string,"mov %rsi,%rax"
.previous
mov .s16237660@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16237924
.s16237924:
.string,"mul %rdi"
.previous
mov .s16237924@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16238454
.s16238454:
.string,"f646976"
.previous
mov .s16238454@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16238712
.s16238712:
.string,"xor %edx,%edx"
.previous
mov .s16238712@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16238976
.s16238976:
.string,"mov %rsi,%rax"
.previous
mov .s16238976@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16239240
.s16239240:
.string,"div %rdi"
.previous
mov .s16239240@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16239770
.s16239770:
.string,"f6D6F64"
.previous
mov .s16239770@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16240028
.s16240028:
.string,"xor %edx,%edx"
.previous
mov .s16240028@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16240292
.s16240292:
.string,"mov %rsi,%rax"
.previous
mov .s16240292@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16240556
.s16240556:
.string,"div %rdi"
.previous
mov .s16240556@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16240815
.s16240815:
.string,"mov %rdx,%rax"
.previous
mov .s16240815@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16241350
.s16241350:
.string,"f73686C"
.previous
mov .s16241350@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16241608
.s16241608:
.string,"mov %rsi,%rax"
.previous
mov .s16241608@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16241872
.s16241872:
.string,"mov %rdi,%rcx"
.previous
mov .s16241872@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16242136
.s16242136:
.string,"shl %cl,%rax"
.previous
mov .s16242136@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16242670
.s16242670:
.string,"f636D7061"
.previous
mov .s16242670@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16242930
.s16242930:
.string,"cmp %rdi,%rsi"
.previous
mov .s16242930@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16243194
.s16243194:
.string,"seta %al"
.previous
mov .s16243194@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16243453
.s16243453:
.string,"movzbl %al,%eax"
.previous
mov .s16243453@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16243990
.s16243990:
.string,"f636D7065"
.previous
mov .s16243990@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16244250
.s16244250:
.string,"cmp %rsi,%rdi"
.previous
mov .s16244250@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16244514
.s16244514:
.string,"sete %al"
.previous
mov .s16244514@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16244773
.s16244773:
.string,"movzbl %al,%eax"
.previous
mov .s16244773@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16245310
.s16245310:
.string,"f6E65"
.previous
mov .s16245310@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16245566
.s16245566:
.string,"cmp %rsi,%rdi"
.previous
mov .s16245566@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16245830
.s16245830:
.string,"setne %al"
.previous
mov .s16245830@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16246090
.s16246090:
.string,"movzbl %al,%eax"
.previous
mov .s16246090@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16246627
.s16246627:
.string,"f6E6567"
.previous
mov .s16246627@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16246885
.s16246885:
.string,"mov %rdi,%rax"
.previous
mov .s16246885@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16247149
.s16247149:
.string,"neg %rax"
.previous
mov .s16247149@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16247679
.s16247679:
.string,"f6E6F74"
.previous
mov .s16247679@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16247937
.s16247937:
.string,"test %rdi,%rdi"
.previous
mov .s16247937@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16248202
.s16248202:
.string,"sete %al"
.previous
mov .s16248202@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16248461
.s16248461:
.string,"movzbl %al,%eax"
.previous
mov .s16248461@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6275696C74696E2D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16248998
.s16248998:
.string,"f6C696E7578"
.previous
mov .s16248998@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16249260
.s16249260:
.string,"mov 8(%rsp),%rax"
.previous
mov .s16249260@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
.section .text..s16249527
.s16249527:
.string,"syscall"
.previous
mov .s16249527@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16249684$:
.16249426$:
.16249159$:
.16248873$:
.16248626$:
.16248360$:
.16248101$:
.16247836$:
.16247554$:
.16247307$:
.16247048$:
.16246784$:
.16246502$:
.16246255$:
.16245989$:
.16245729$:
.16245465$:
.16245185$:
.16244938$:
.16244672$:
.16244413$:
.16244149$:
.16243865$:
.16243618$:
.16243352$:
.16243093$:
.16242829$:
.16242545$:
.16242298$:
.16242035$:
.16241771$:
.16241507$:
.16241225$:
.16240978$:
.16240714$:
.16240455$:
.16240191$:
.16239927$:
.16239645$:
.16239398$:
.16239139$:
.16238875$:
.16238611$:
.16238329$:
.16238082$:
.16237823$:
.16237559$:
.16237277$:
.16237030$:
.16236766$:
.16236502$:
.16236220$:
.16235973$:
.16235709$:
.16235445$:
.16235163$:
.16234916$:
.16234649$:
.16234365$:
.16234118$:
.16233850$:
.16233566$:
.16233319$:
.16233053$:
.16232767$:
.16232520$:
.16232254$:
.16231970$:
.16231845$:
.16231570$:
.16231319$:
.16231074$:
.16230823$:
add $8,%rsp
ret
.section .text.f7838365F36342D6964
f7838365F36342D6964:
push %rdi
push %rsi
push %rdx
push %rcx
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D6D6F76@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 8(%rsp),%rax
test %rax,%rax
je .16251181$
mov f7838365F36342D6C6F61642D72656C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
jmp .16251444$
.16251181$:
mov f7838365F36342D6D616E676C652D7370616E@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D726970@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16251666$:
.16251444$:
.16251164$:
add $32,%rsp
ret
.section .text.f7838365F36342D61646472
f7838365F36342D61646472:
push %rdi
push %rsi
push %rdx
push %rcx
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D6C6561@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6C6F61642D72656C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16252201$:
add $32,%rsp
ret
.section .text.f7838365F36342D6C6974
f7838365F36342D6C6974:
push %rdi
push %rsi
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D6D6F76@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6473@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f7075742D7370616E@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D636D@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16253214$:
.16253089$:
.16252914$:
.16252789$:
add $16,%rsp
ret
.section .text.f7838365F36342D737472
f7838365F36342D737472:
push %rdi
push %rsi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f7075742D737472696E67@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D73656374696F6E2D74657874@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D7374722D6C6162656C2D77697468@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7075742D6C66@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f7838365F36342D7374722D6C6162656C2D77697468@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D6C6162656C2D737566@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f7075742D6C697374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D737472696E67@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D7370616E@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D70726576696F7573@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D6D6F76@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D7374722D6C6162656C2D77697468@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D726970@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16255613$:
.16255368$:
.16255111$:
.16254986$:
.16254811$:
.16254558$:
.16254272$:
.16254006$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f7838365F36342D646F
f7838365F36342D646F:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f7838365F36342D616E64
f7838365F36342D616E64:
push %rdi
mov f7838365F36342D6966@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D6A65@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7838365F36342D6F72
f7838365F36342D6F72:
push %rdi
mov f7838365F36342D6966@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D6A6E65@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7838365F36342D656C7365
f7838365F36342D656C7365:
push %rdi
mov f7838365F36342D6966@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D6A6D70@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7838365F36342D726570
f7838365F36342D726570:
push %rdi
push %rsi
mov f7838365F36342D6A6E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f7838365F36342D6C6162656C
f7838365F36342D6C6162656C:
push %rdi
push %rsi
mov f7838365F36342D6C6162656C2D6964@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6C6162656C2D737566@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16257639$:
add $16,%rsp
ret
.section .text.f7838365F36342D6670757368706F70
f7838365F36342D6670757368706F70:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
mov 8(%rsp),%rax
test %rax,%rax
je .16257959$
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D616464@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov $'$,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 0(%rsp),%rax
test %rax,%rax
je .16258410$
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov $'-,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16258410$:
mov f7075742D6E756D626572@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f73686C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $3,%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D636D@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D727370@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 32(%rsp),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 40(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16259303$:
.16259056$:
.16258931$:
.16258611$:
.16258393$:
.16258233$:
.16257959$:
add $40,%rsp
ret
.section .text.f7838365F36342D70757368706F70
f7838365F36342D70757368706F70:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
test %rax,%rax
je .16259842$
mov f7838365F36342D737472696E672D70757368@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
jmp .16259963$
.16259842$:
mov f7838365F36342D737472696E672D706F70@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
.16259963$:
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 32(%rsp),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16260323$:
.16260148$:
add $40,%rsp
ret
.section .text.f7838365F36342D66706F70
f7838365F36342D66706F70:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D6670757368706F70@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f66706F70@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
mov 56(%rsp),%rax
mov %rax,24(%rsp)
mov 48(%rsp),%rax
mov %rax,32(%rsp)
mov $0,%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f7838365F36342D6670757368
f7838365F36342D6670757368:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D6670757368706F70@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f6670757368@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
mov 56(%rsp),%rax
mov %rax,24(%rsp)
mov 48(%rsp),%rax
mov %rax,32(%rsp)
mov $1,%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f7838365F36342D706F70
f7838365F36342D706F70:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D70757368706F70@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f706F70@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
mov 56(%rsp),%rax
mov %rax,24(%rsp)
mov 48(%rsp),%rax
mov %rax,32(%rsp)
mov $0,%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f7838365F36342D70757368
f7838365F36342D70757368:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D70757368706F70@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f70757368@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
mov 56(%rsp),%rax
mov %rax,24(%rsp)
mov 48(%rsp),%rax
mov %rax,32(%rsp)
mov $1,%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f7838365F36342D6C6574
f7838365F36342D6C6574:
push %rdi
push %rsi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f7838365F36342D70757368@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov 0(%rsp),%rax
.16262796$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f7838365F36342D666F72
f7838365F36342D666F72:
push %rdi
push %rsi
mov f7838365F36342D6C6574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f7838365F36342D656C7365@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f7838365F36342D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D6D6F76@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C697374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D737461636B2D746F70@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6C6162656C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 8(%rsp),%rax
.16264385$:
.16264202$:
.16263943$:
.16263696$:
.16263451$:
add $8,%rsp
add $8,%rsp
add $16,%rsp
ret
.section .text.f7838365F36342D756E6C6574
f7838365F36342D756E6C6574:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D66706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov $1,%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $24,%rsp
ret
.section .text.f7838365F36342D756E666F72
f7838365F36342D756E666F72:
push %rdi
push %rsi
push %rdx
mov f7838365F36342D726570@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16265115$:
add $24,%rsp
ret
.section .text.f7838365F36342D756E63616C6C
f7838365F36342D756E63616C6C:
push %rdi
push %rsi
push %rdx
push %rcx
mov f7838365F36342D706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $0,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16266009$
mov f7838365F36342D706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D726469@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16266495$
mov f7838365F36342D706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D727369@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $2,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16266981$
mov f7838365F36342D706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D726478@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $3,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16267467$
mov f7838365F36342D706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D726378@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $4,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16267953$
mov f7838365F36342D706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D7238@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $5,%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16268437$
mov f7838365F36342D706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D7239@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16268437$:
.16268276$:
.16267953$:
.16267792$:
.16267467$:
.16267306$:
.16266981$:
.16266820$:
.16266495$:
.16266334$:
.16266009$:
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D63616C6C@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f707574@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov $'*,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D66706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov f737562@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16269546$:
.16269299$:
.16269139$:
.16268892$:
.16265848$:
add $32,%rsp
ret
.section .text.f747970652D2D6E657874
f747970652D2D6E657874:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f747970652D2D617267
f747970652D2D617267:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f747970652D2D746F6B656E
f747970652D2D746F6B656E:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f747970652D2D6B696E64
f747970652D2D6B696E64:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D74797065
f7374727563742D74797065:
mov f747970652D2D6B696E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f747970652D2D616C6C6F63
f747970652D2D616C6C6F63:
push %rdi
push %rsi
mov f616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f7374727563742D74797065@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D6B696E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 0(%rsp),%rax
.16272862$:
.16272578$:
.16272302$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f747970652D6E65772D756E6974
f747970652D6E65772D756E6974:
push %rdi
mov f747970652D2D616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f747970652D6E65772D66756E6374696F6E
f747970652D6E65772D66756E6374696F6E:
push %rdi
mov f747970652D2D616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $1,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f747970652D6B696E64
f747970652D6B696E64:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D6B696E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f747970652D6172697479
f747970652D6172697479:
push %rdi
mov 0(%rsp),%rax
test %rax,%rax
je .16273911$
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov f747970652D6172697479@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16273911$:
add $8,%rsp
ret
.section .text.f747970652D2D6B696E642D657175616C
f747970652D2D6B696E642D657175616C:
push %rdi
push %rsi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D6B696E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f747970652D6B696E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f747970652D6C6973742D657175616C
f747970652D6C6973742D657175616C:
push %rdi
push %rsi
push %rdx
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
jne .16275251$
mov 8(%rsp),%rax
test %rax,%rax
je .16275298$
mov 0(%rsp),%rax
test %rax,%rax
je .16275344$
mov f747970652D6C6973742D657175616C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
test %rax,%rax
je .16276043$
mov 16(%rsp),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16276043$:
.16275344$:
.16275298$:
.16275251$:
add $24,%rsp
ret
.section .text.f747970652D657175616C
f747970652D657175616C:
push %rdi
push %rsi
mov f747970652D2D6B696E642D657175616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16276559$
mov f747970652D6C6973742D657175616C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f747970652D657175616C@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16276559$:
add $16,%rsp
ret
.section .text.f6C6F632D2D6C696E65
f6C6F632D2D6C696E65:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f6C6F632D2D636F6C
f6C6F632D2D636F6C:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F632D2D6C696E65@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D6C6F63
f7374727563742D6C6F63:
mov f6C6F632D2D636F6C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f6C6F632D6C6F61642D6C696E65
f6C6F632D6C6F61642D6C696E65:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F632D2D6C696E65@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D6C6F61642D636F6C
f6C6F632D6C6F61642D636F6C:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F632D2D636F6C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D636F7079
f6C6F632D636F7079:
push %rdi
push %rsi
mov f706169722D636F7079@GOTPCREL(%rip),%rax
add $-48,%rsp
push %rax
mov f636F7079@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f6C6F632D2D6C696E65@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov f636F7079@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov f6C6F632D2D636F6C@GOTPCREL(%rip),%rax
mov %rax,32(%rsp)
mov 64(%rsp),%rax
mov %rax,40(%rsp)
mov 56(%rsp),%rax
mov %rax,48(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $16,%rsp
ret
.section .text.f6C6F632D2D7872
f6C6F632D2D7872:
push %rdi
push %rsi
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov $1,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f6C6F632D2D7866
f6C6F632D2D7866:
push %rdi
push %rsi
mov f696E63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $16,%rsp
ret
.section .text.f6C6F632D2D6C72
f6C6F632D2D6C72:
push %rdi
mov f6C6F632D2D7872@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F632D2D6C696E65@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D2D6C66
f6C6F632D2D6C66:
push %rdi
mov f6C6F632D2D7866@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F632D2D6C696E65@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D2D6372
f6C6F632D2D6372:
push %rdi
mov f6C6F632D2D7872@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F632D2D636F6C@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D2D6366
f6C6F632D2D6366:
push %rdi
mov f6C6F632D2D7866@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F632D2D636F6C@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D2D63726C78
f6C6F632D2D63726C78:
push %rdi
push %rsi
mov f6C6F632D2D6372@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16281160$:
add $16,%rsp
ret
.section .text.f6C6F632D2D63726C66
f6C6F632D2D63726C66:
push %rdi
mov f6C6F632D2D63726C78@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F632D2D6C66@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D2D63726C72
f6C6F632D2D63726C72:
push %rdi
mov f6C6F632D2D63726C78@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F632D2D6C72@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D696E6974
f6C6F632D696E6974:
push %rdi
mov f6C6F632D2D63726C72@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f6C6F632D616476
f6C6F632D616476:
push %rdi
push %rsi
mov 8(%rsp),%rax
test %rax,%rax
je .16282149$
mov f6C6F632D2D63726C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
jmp .16282309$
.16282149$:
mov f6C6F632D2D6366@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16282309$:
add $16,%rsp
ret
.section .text.f636D70696E
f636D70696E:
push %rdi
push %rsi
push %rdx
mov f6E6F74@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
jne .16282784$
mov f636D7061@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16282784$:
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $24,%rsp
ret
.section .text.f636861722D72616E67652D7371
f636861722D72616E67652D7371:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'\',%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D6471
f636861722D72616E67652D6471:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'\",%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D6273
f636861722D72616E67652D6273:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'\\,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D686D
f636861722D72616E67652D686D:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'#,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D716D
f636861722D72616E67652D716D:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'?,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D6C70
f636861722D72616E67652D6C70:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'(,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D7270
f636861722D72616E67652D7270:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D7573
f636861722D72616E67652D7573:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'_,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D656E
f636861722D72616E67652D656E:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'-,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D7370
f636861722D72616E67652D7370:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $' ,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D7462
f636861722D72616E67652D7462:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'\t,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D6C66
f636861722D72616E67652D6C66:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'\n,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D6372
f636861722D72616E67652D6372:
push %rdi
mov f636D7065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $'\r,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D3039
f636861722D72616E67652D3039:
push %rdi
mov f636D70696E@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov $'0,%rax
mov %rax,16(%rsp)
mov $'9,%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D415A
f636861722D72616E67652D415A:
push %rdi
mov f636D70696E@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov $'A,%rax
mov %rax,16(%rsp)
mov $'Z,%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $8,%rsp
ret
.section .text.f636861722D72616E67652D617A
f636861722D72616E67652D617A:
push %rdi
mov f636D70696E@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov $'a,%rax
mov %rax,16(%rsp)
mov $'z,%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $8,%rsp
ret
.section .text.f63617265742D2D707472
f63617265742D2D707472:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f63617265742D2D6C6F63
f63617265742D2D6C6F63:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f63617265742D2D707472@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D6361726574
f7374727563742D6361726574:
mov f63617265742D2D6C6F63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6C6F63@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f63617265742D707472
f63617265742D707472:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f63617265742D2D707472@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f63617265742D6C6F63
f63617265742D6C6F63:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f63617265742D2D6C6F63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f63617265742D636F7079
f63617265742D636F7079:
push %rdi
push %rsi
mov f706169722D636F7079@GOTPCREL(%rip),%rax
add $-48,%rsp
push %rax
mov f636F7079@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f63617265742D2D707472@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov f6C6F632D636F7079@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov f63617265742D2D6C6F63@GOTPCREL(%rip),%rax
mov %rax,32(%rsp)
mov 64(%rsp),%rax
mov %rax,40(%rsp)
mov 56(%rsp),%rax
mov %rax,48(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $16,%rsp
ret
.section .text.f63617265742D696E6974
f63617265742D696E6974:
push %rdi
push %rsi
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f63617265742D2D707472@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f6C6F632D696E6974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f63617265742D2D6C6F63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16289678$:
add $16,%rsp
ret
.section .text.f63617265742D7065656B
f63617265742D7065656B:
push %rdi
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f63617265742D707472@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f63617265742D616476
f63617265742D616476:
push %rdi
mov f6C6F632D616476@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f636861722D72616E67652D6C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f63617265742D7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f63617265742D2D6C6F63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f696E63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f63617265742D2D707472@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16290861$:
add $8,%rsp
ret
.section .text.f746F6B656E2D2D7370616E
f746F6B656E2D2D7370616E:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f746F6B656E2D2D6361726574
f746F6B656E2D2D6361726574:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7374727563742D7370616E@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D746F6B656E
f7374727563742D746F6B656E:
mov f746F6B656E2D2D6361726574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6361726574@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f746F6B656E2D2D7365742D7370616E
f746F6B656E2D2D7365742D7370616E:
push %rdi
push %rsi
push %rdx
mov f7370616E2D696E6974@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $24,%rsp
ret
.section .text.f746F6B656E2D2D72656164
f746F6B656E2D2D72656164:
push %rdi
push %rsi
push %rdx
mov f746F6B656E2D2D6361726574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov 32(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f63617265742D7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16293027$
mov f63617265742D707472@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov 32(%rsp),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16293302$
mov f7370616E2D696E6974@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
mov f63617265742D707472@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
jmp .16293666$
.16293302$:
mov f657272@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
.section .text..s16293778
.s16293778:
.string,"invalid text"
.previous
mov .s16293778@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16293666$:
add $8,%rsp
jmp .16293964$
.16293027$:
mov f7370616E2D696E6974@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
mov $0,%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16293964$:
.16292894$:
add $8,%rsp
add $8,%rsp
add $24,%rsp
ret
.section .text.f746F6B656E2D636F7079
f746F6B656E2D636F7079:
push %rdi
push %rsi
mov f706169722D636F7079@GOTPCREL(%rip),%rax
add $-48,%rsp
push %rax
mov f7370616E2D636F7079@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov f63617265742D636F7079@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov f746F6B656E2D2D6361726574@GOTPCREL(%rip),%rax
mov %rax,32(%rsp)
mov 64(%rsp),%rax
mov %rax,40(%rsp)
mov 56(%rsp),%rax
mov %rax,48(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $16,%rsp
ret
.section .text.f746F6B656E2D696E6974
f746F6B656E2D696E6974:
push %rdi
push %rsi
push %rdx
mov f63617265742D696E6974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f746F6B656E2D2D6361726574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 16(%rsp),%rax
add $-16,%rsp
push %rax
mov f746F6B656E2D2D72656164@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16295222$:
add $24,%rsp
ret
.section .text.f746F6B656E2D7472792D616476
f746F6B656E2D7472792D616476:
push %rdi
push %rsi
mov f7370616E2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16295774$
mov 8(%rsp),%rax
add $-16,%rsp
push %rax
mov f746F6B656E2D2D72656164@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16295774$:
add $16,%rsp
ret
.section .text.f746F6B656E2D616476
f746F6B656E2D616476:
push %rdi
push %rsi
mov f746F6B656E2D7472792D616476@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
jne .16296273$
mov f657272@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $2,%rax
mov %rax,8(%rsp)
.section .text..s16296388
.s16296388:
.string,"missing token"
.previous
mov .s16296388@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16296273$:
add $16,%rsp
ret
.section .text.f746F6B656E2D6D61746368
f746F6B656E2D6D61746368:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov f7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7370616E2D7374617274@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $16,%rsp
ret
.section .text.f746F6B656E2D6973
f746F6B656E2D6973:
push %rdi
push %rsi
mov f7370616E2D737472636D70@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f746F6B656E2D6561742D6C6974
f746F6B656E2D6561742D6C6974:
push %rdi
push %rsi
push %rdx
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16297784$
mov 16(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16297784$:
add $24,%rsp
ret
.section .text.f746F6B656E2D657175616C
f746F6B656E2D657175616C:
push %rdi
push %rsi
mov f7370616E2D657175616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f746F6B656E2D63617265742D7065656B
f746F6B656E2D63617265742D7065656B:
push %rdi
mov f63617265742D7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f746F6B656E2D2D6361726574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D6E616D652D746F6B656E
f7374727563742D6E616D652D746F6B656E:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f7374727563742D6E616D652D6465636C
f7374727563742D6E616D652D6465636C:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6E616D652D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7374727563742D746F6B656E@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D6E616D65
f7374727563742D6E616D65:
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f7374727563742D626F6F6B2D6E657874
f7374727563742D626F6F6B2D6E657874:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f7374727563742D626F6F6B2D6E616D65
f7374727563742D626F6F6B2D6E616D65:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D626F6F6B2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D626F6F6B
f7374727563742D626F6F6B:
mov f7374727563742D626F6F6B2D6E616D65@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D65@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f707573682D626F6F6B
f707573682D626F6F6B:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
push %r9
mov f616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov f7374727563742D626F6F6B@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f636F7079@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D626F6F6B2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7374727563742D626F6F6B2D6E616D65@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f746F6B656E2D636F7079@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6E616D652D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 0(%rsp),%rax
.16302110$:
.16301941$:
.16301645$:
add $8,%rsp
.16301182$:
add $8,%rsp
add $48,%rsp
ret
.section .text.f706F702D626F6F6B
f706F702D626F6F6B:
push %rdi
mov f636F7079@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D626F6F6B2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7472792D6C6F6F6B7570
f7472792D6C6F6F6B7570:
push %rdi
push %rsi
mov $0,%rax
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
jmp .16302924$
.16302914$:
mov %rax,(%rsp)
.16302924$:
mov f746F6B656E2D657175616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f7374727563742D6E616D652D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D626F6F6B2D6E616D65@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16303416$
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D626F6F6B2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
jmp .16303693$
.16303416$:
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
lea 32(%rsp),%rax
mov %rax,8(%rsp)
mov f7374727563742D626F6F6B2D6E616D65@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov $0,%rax
.16304016$:
.16303693$:
test %rax,%rax
jne .16302914$
pop %rax
mov 0(%rsp),%rax
.16304091$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f6C6F6F6B7570
f6C6F6F6B7570:
push %rdi
push %rsi
mov f7472792D6C6F6F6B7570@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
jne .16304392$
mov f657272@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $3,%rax
mov %rax,8(%rsp)
.section .text..s16304507
.s16304507:
.string,"lookup failed"
.previous
mov .s16304507@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16304392$:
add $16,%rsp
ret
.section .text.f73656D2D2D626F6F6B
f73656D2D2D626F6F6B:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f73656D2D2D62726B
f73656D2D2D62726B:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f73656D2D2D6F7574
f73656D2D2D6F7574:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f73656D2D2D746F6B656E
f73656D2D2D746F6B656E:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f73656D2D2D74797065
f73656D2D2D74797065:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7374727563742D746F6B656E@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f73656D2D2D76616C
f73656D2D2D76616C:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f73656D2D2D697363
f73656D2D2D697363:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D76616C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f73656D2D2D696D706C
f73656D2D2D696D706C:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D697363@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D73656D
f7374727563742D73656D:
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f73656D2D7365742D74797065
f73656D2D7365742D74797065:
push %rdi
push %rsi
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f73656D2D7365742D76616C
f73656D2D7365742D76616C:
push %rdi
push %rsi
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D76616C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f73656D2D7365742D697363
f73656D2D7365742D697363:
push %rdi
push %rsi
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D697363@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f73656D2D74797065
f73656D2D74797065:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f73656D2D76616C
f73656D2D76616C:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D76616C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f73656D2D697363
f73656D2D697363:
push %rdi
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D697363@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D6465636C2D74797065
f7374727563742D6465636C2D74797065:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f7374727563742D6465636C2D696D706C
f7374727563742D6465636C2D696D706C:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6465636C2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D6465636C2D6973646566
f7374727563742D6465636C2D6973646566:
push %rdi
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6465636C2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f7374727563742D6465636C
f7374727563742D6465636C:
mov f7374727563742D6465636C2D6973646566@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f737472756374@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
ret
.section .text.f65627265772D73656D2D6C6974
f65627265772D73656D2D6C6974:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73656D2D7365742D74797065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f747970652D6E65772D756E6974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16311865$:
add $16,%rsp
ret
.section .text.f65627265772D73656D2D616464722D6964
f65627265772D73656D2D616464722D6964:
push %rdi
push %rsi
push %rdx
push %rcx
mov 24(%rsp),%rax
add $-32,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6465636C2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 112(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
mov f73656D2D7365742D74797065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16313698$:
add $32,%rsp
ret
.section .text.f65627265772D73656D2D61646472
f65627265772D73656D2D61646472:
push %rdi
push %rsi
push %rdx
mov f65627265772D73656D2D616464722D6964@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 40(%rsp),%rax
mov %rax,24(%rsp)
mov f747970652D6E65772D756E6974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73656D2D6964
f65627265772D73656D2D6964:
push %rdi
push %rsi
push %rdx
mov f65627265772D73656D2D616464722D6964@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 40(%rsp),%rax
mov %rax,24(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6465636C2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 104(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73656D2D646F
f65627265772D73656D2D646F:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D6C6162656C
f65627265772D73656D2D6C6162656C:
push %rdi
push %rsi
push %rdx
mov 16(%rsp),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73656D2D656C7365
f65627265772D73656D2D656C7365:
push %rdi
push %rsi
push %rdx
push %rcx
mov 24(%rsp),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov 24(%rsp),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 0(%rsp),%rax
.16316720$:
add $8,%rsp
add $32,%rsp
ret
.section .text.f65627265772D73656D2D7661726465636C
f65627265772D73656D2D7661726465636C:
push %rdi
push %rsi
mov f616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7374727563742D6465636C@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6465636C2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f636F7079@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6465636C2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6465636C2D6973646566@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f707573682D626F6F6B@GOTPCREL(%rip),%rax
add $-48,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov f73656D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,32(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,40(%rsp)
mov 56(%rsp),%rax
mov %rax,48(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
.16318342$:
.16318050$:
.16317643$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f65627265772D73656D2D7661722D696E
f65627265772D73656D2D7661722D696E:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f65627265772D73656D2D7661726465636C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 0(%rsp),%rax
.16320006$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f65627265772D73656D2D7661722D656E64
f65627265772D73656D2D7661722D656E64:
push %rdi
push %rsi
push %rdx
mov 16(%rsp),%rax
add $-24,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f706F702D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16320602$:
add $24,%rsp
ret
.section .text.f65627265772D73656D2D756E63616C6C
f65627265772D73656D2D756E63616C6C:
push %rdi
push %rsi
push %rdx
push %rcx
mov 24(%rsp),%rax
add $-32,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov 48(%rsp),%rax
mov %rax,24(%rsp)
mov 40(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
mov f73656D2D7365742D74797065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f747970652D6E65772D756E6974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16321462$:
add $32,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D707265
f65627265772D73656D2D696D706C2D707265:
push %rdi
mov f65627265772D73656D2D646F@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D707265@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D6C6974
f65627265772D73656D2D696D706C2D6C6974:
push %rdi
mov f65627265772D73656D2D6C6974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D6C6974@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D737472
f65627265772D73656D2D696D706C2D737472:
push %rdi
mov f65627265772D73656D2D6C6974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D737472@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D61646472
f65627265772D73656D2D696D706C2D61646472:
push %rdi
push %rsi
mov f65627265772D73656D2D61646472@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D61646472@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D6964
f65627265772D73656D2D696D706C2D6964:
push %rdi
push %rsi
mov f65627265772D73656D2D6964@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D6964@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D6C65742D696E
f65627265772D73656D2D696D706C2D6C65742D696E:
push %rdi
mov f65627265772D73656D2D7661722D696E@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D6C6574@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D6C65742D656E64
f65627265772D73656D2D696D706C2D6C65742D656E64:
push %rdi
push %rsi
mov f65627265772D73656D2D7661722D656E64@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D756E6C6574@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D666F722D696E
f65627265772D73656D2D696D706C2D666F722D696E:
push %rdi
mov f65627265772D73656D2D7661722D696E@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D666F72@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D666F722D656E64
f65627265772D73656D2D696D706C2D666F722D656E64:
push %rdi
push %rsi
mov f65627265772D73656D2D7661722D656E64@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D756E666F72@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D646F2D7468656E
f65627265772D73656D2D696D706C2D646F2D7468656E:
push %rdi
mov f65627265772D73656D2D646F@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D646F@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D646F2D656E64
f65627265772D73656D2D696D706C2D646F2D656E64:
push %rdi
push %rsi
mov f65627265772D73656D2D6C6162656C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D6C6162656C@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D616E642D7468656E
f65627265772D73656D2D696D706C2D616E642D7468656E:
push %rdi
mov f65627265772D73656D2D646F@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D616E64@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D616E642D656E64
f65627265772D73656D2D696D706C2D616E642D656E64:
push %rdi
push %rsi
mov f65627265772D73656D2D6C6162656C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D6C6162656C@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D6F722D656C7365
f65627265772D73656D2D696D706C2D6F722D656C7365:
push %rdi
mov f65627265772D73656D2D646F@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D6F72@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D6F722D656E64
f65627265772D73656D2D696D706C2D6F722D656E64:
push %rdi
push %rsi
mov f65627265772D73656D2D6C6162656C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D6C6162656C@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D69662D7468656E
f65627265772D73656D2D696D706C2D69662D7468656E:
push %rdi
mov f65627265772D73656D2D646F@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7838365F36342D616E64@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D69662D656C7365
f65627265772D73656D2D696D706C2D69662D656C7365:
push %rdi
push %rsi
mov f65627265772D73656D2D656C7365@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov f7838365F36342D656C7365@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f7838365F36342D6C6162656C@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 48(%rsp),%rax
mov %rax,24(%rsp)
mov 40(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D69662D656E64
f65627265772D73656D2D696D706C2D69662D656E64:
push %rdi
push %rsi
mov f65627265772D73656D2D6C6162656C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f7838365F36342D6C6162656C@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D63616C6C
f65627265772D73656D2D696D706C2D63616C6C:
push %rdi
push %rsi
mov f7838365F36342D6670757368@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f7838365F36342D70757368@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16329263$:
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D63616C6C2D617267
f65627265772D73656D2D696D706C2D63616C6C2D617267:
push %rdi
push %rsi
mov f7075742D736571@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D6D6F76@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C697374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D726178@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6E756D626572@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73686C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $3,%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D737461636B2D746F70@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16331091$:
.16330660$:
.16330302$:
add $16,%rsp
ret
.section .text.f65627265772D73656D2D696D706C2D63616C6C2D656E64
f65627265772D73656D2D696D706C2D63616C6C2D656E64:
push %rdi
push %rsi
push %rdx
mov f65627265772D73656D2D756E63616C6C@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov f7838365F36342D756E63616C6C@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
mov 48(%rsp),%rax
mov %rax,24(%rsp)
mov 40(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D6E7A
f65627265772D636861722D636C6173732D6E7A:
push %rdi
mov 0(%rsp),%rax
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D6C66
f65627265772D636861722D636C6173732D6C66:
push %rdi
mov f636861722D72616E67652D6C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D686D
f65627265772D636861722D636C6173732D686D:
push %rdi
mov f636861722D72616E67652D686D@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D6273
f65627265772D636861722D636C6173732D6273:
push %rdi
mov f636861722D72616E67652D6273@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D7371
f65627265772D636861722D636C6173732D7371:
push %rdi
mov f636861722D72616E67652D7371@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D6471
f65627265772D636861722D636C6173732D6471:
push %rdi
mov f636861722D72616E67652D6471@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D3039
f65627265772D636861722D636C6173732D3039:
push %rdi
mov f636861722D72616E67652D3039@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D7773
f65627265772D636861722D636C6173732D7773:
push %rdi
mov f636861722D72616E67652D7370@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16333938$
mov f636861722D72616E67652D7462@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16334107$
mov f636861722D72616E67652D6C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16334276$
mov f636861722D72616E67652D6372@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16334276$:
.16334107$:
.16333938$:
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D6964
f65627265772D636861722D636C6173732D6964:
push %rdi
mov f636861722D72616E67652D415A@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16334742$
mov f636861722D72616E67652D617A@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16334911$
mov f636861722D72616E67652D3039@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16335080$
mov f636861722D72616E67652D656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16335249$
mov f636861722D72616E67652D7573@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16335249$:
.16335080$:
.16334911$:
.16334742$:
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D696D
f65627265772D636861722D636C6173732D696D:
push %rdi
mov f636861722D72616E67652D3039@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16335727$
mov f636861722D72616E67652D7371@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16335727$:
add $8,%rsp
ret
.section .text.f65627265772D636861722D636C6173732D7074
f65627265772D636861722D636C6173732D7074:
push %rdi
mov f636861722D72616E67652D6C70@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16336169$
mov f636861722D72616E67652D7270@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16336338$
mov f636861722D72616E67652D716D@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16336338$:
.16336169$:
add $8,%rsp
ret
.section .text.f65627265772D6C65782D6E6F726D616C
f65627265772D6C65782D6E6F726D616C:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov f63617265742D7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16336870$
mov f63617265742D616476@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16336870$:
add $16,%rsp
ret
.section .text.f65627265772D6C65782D657363617065
f65627265772D6C65782D657363617065:
push %rdi
push %rsi
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D6273@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16337400$
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D6E7A@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
jmp .16337666$
.16337400$:
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16337666$:
add $16,%rsp
ret
.section .text.f65627265772D6C65782D686D
f65627265772D6C65782D686D:
push %rdi
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D686D@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6C65782D6471
f65627265772D6C65782D6471:
push %rdi
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D6471@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6C65782D7371
f65627265772D6C65782D7371:
push %rdi
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D7371@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6C65782D3039
f65627265772D6C65782D3039:
push %rdi
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D3039@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6C65782D7074
f65627265772D6C65782D7074:
push %rdi
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D7074@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6C65782D7773
f65627265772D6C65782D7773:
push %rdi
mov f65627265772D6C65782D6E6F726D616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D7773@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6C65782D6964
f65627265772D6C65782D6964:
push %rdi
mov f65627265772D6C65782D657363617065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D6964@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6C65782D7362
f65627265772D6C65782D7362:
push %rdi
mov f65627265772D6C65782D657363617065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D6E7A@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6561742D62756E6368
f65627265772D6561742D62756E6368:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16340765$
mov $1,%rax
push %rax
jmp .16340816$
.16340806$:
mov %rax,(%rsp)
.16340816$:
mov 16(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16340806$
pop %rax
.16340765$:
add $16,%rsp
ret
.section .text.f65627265772D6561742D7063686172
f65627265772D6561742D7063686172:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16341248$
mov f65627265772D6C65782D7362@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16341248$:
add $16,%rsp
ret
.section .text.f65627265772D6561742D67726F7570
f65627265772D6561742D67726F7570:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16341647$
mov $1,%rax
push %rax
jmp .16341698$
.16341688$:
mov %rax,(%rsp)
.16341698$:
mov f6E6F74@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16341959$
mov f65627265772D6C65782D7362@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16341959$:
test %rax,%rax
jne .16341688$
pop %rax
.16341647$:
add $16,%rsp
ret
.section .text.f65627265772D6561742D7074
f65627265772D6561742D7074:
push %rdi
mov f65627265772D6C65782D7074@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6561742D6964
f65627265772D6561742D6964:
push %rdi
mov f65627265772D6561742D62756E6368@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D6C65782D6964@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6561742D3039
f65627265772D6561742D3039:
push %rdi
mov f65627265772D6561742D62756E6368@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D6C65782D3039@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6561742D7773
f65627265772D6561742D7773:
push %rdi
mov f65627265772D6561742D62756E6368@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D6C65782D7773@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6561742D7371
f65627265772D6561742D7371:
push %rdi
mov f65627265772D6561742D7063686172@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D6C65782D7371@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6561742D6471
f65627265772D6561742D6471:
push %rdi
mov f65627265772D6561742D67726F7570@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D6C65782D6471@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D6561742D6E74
f65627265772D6561742D6E74:
push %rdi
mov f65627265772D6561742D67726F7570@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D6C65782D686D@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E697A652D6E6F6E74657874
f65627265772D746F6B656E697A652D6E6F6E74657874:
push %rdi
mov $1,%rax
push %rax
jmp .16344466$
.16344456$:
mov %rax,(%rsp)
.16344466$:
mov f65627265772D6561742D7773@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16344658$
mov f65627265772D6561742D6E74@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16344658$:
test %rax,%rax
jne .16344456$
pop %rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E697A652D74657874
f65627265772D746F6B656E697A652D74657874:
push %rdi
mov f65627265772D6561742D6964@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16345135$
mov f65627265772D6561742D7074@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16345302$
mov f65627265772D6561742D3039@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16345469$
mov f65627265772D6561742D7371@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16345636$
mov f65627265772D6561742D6471@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16345636$:
.16345469$:
.16345302$:
.16345135$:
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D72656164
f65627265772D746F6B656E2D72656164:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-24,%rsp
push %rax
mov f65627265772D746F6B656E697A652D6E6F6E74657874@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D746F6B656E697A652D74657874@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D746F6B656E2D696E6974
f65627265772D746F6B656E2D696E6974:
push %rdi
push %rsi
mov f746F6B656E2D696E6974@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f65627265772D746F6B656E2D72656164@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D746F6B656E2D616476
f65627265772D746F6B656E2D616476:
push %rdi
mov f746F6B656E2D616476@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D746F6B656E2D72656164@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D646F
f65627265772D746F6B656E2D636C6173732D646F:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16347165
.s16347165:
.string,"do"
.previous
mov .s16347165@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D6966
f65627265772D746F6B656E2D636C6173732D6966:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16347544
.s16347544:
.string,"if"
.previous
mov .s16347544@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D6F72
f65627265772D746F6B656E2D636C6173732D6F72:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16347923
.s16347923:
.string,"or"
.previous
mov .s16347923@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D616E64
f65627265772D746F6B656E2D636C6173732D616E64:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16348306
.s16348306:
.string,"and"
.previous
mov .s16348306@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D6C6574
f65627265772D746F6B656E2D636C6173732D6C6574:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16348690
.s16348690:
.string,"let"
.previous
mov .s16348690@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D666F72
f65627265772D746F6B656E2D636C6173732D666F72:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16349074
.s16349074:
.string,"for"
.previous
mov .s16349074@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D61646472
f65627265772D746F6B656E2D636C6173732D61646472:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16349462
.s16349462:
.string,"addr"
.previous
mov .s16349462@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D716D
f65627265772D746F6B656E2D636C6173732D716D:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16349843
.s16349843:
.string,"?"
.previous
mov .s16349843@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D6C70
f65627265772D746F6B656E2D636C6173732D6C70:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16350221
.s16350221:
.string,"("
.previous
mov .s16350221@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D7270
f65627265772D746F6B656E2D636C6173732D7270:
push %rdi
mov f746F6B656E2D6973@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
.section .text..s16350599
.s16350599:
.string,")"
.previous
mov .s16350599@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D6C6974
f65627265772D746F6B656E2D636C6173732D6C6974:
push %rdi
mov f746F6B656E2D6D61746368@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D696D@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D737472
f65627265772D746F6B656E2D636C6173732D737472:
push %rdi
mov f746F6B656E2D6D61746368@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D6471@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D746F6B656E2D636C6173732D6964
f65627265772D746F6B656E2D636C6173732D6964:
push %rdi
mov f746F6B656E2D6D61746368@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D636861722D636C6173732D6964@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73796E2D657870722D6C6974
f65627265772D73796E2D657870722D6C6974:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16352084$:
add $16,%rsp
ret
.section .text.f65627265772D73796E2D657870722D6964
f65627265772D73796E2D657870722D6964:
push %rdi
push %rsi
mov f6C6F6F6B7570@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov 16(%rsp),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov 0(%rsp),%rax
.16353297$:
.16353039$:
add $8,%rsp
add $16,%rsp
ret
.section .text.f65627265772D73796E2D657870722D766172
f65627265772D73796E2D657870722D766172:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
mov 16(%rsp),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f747970652D6E65772D756E6974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 32(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov 24(%rsp),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 32(%rsp),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16354415$:
.16354264$:
add $8,%rsp
.16353891$:
add $40,%rsp
ret
.section .text.f65627265772D73796E2D657870722D736571
f65627265772D73796E2D657870722D736571:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
mov 16(%rsp),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 32(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov 24(%rsp),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 32(%rsp),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16355189$:
add $8,%rsp
.16354923$:
add $40,%rsp
ret
.section .text.f65627265772D73796E2D657870722D6966
f65627265772D73796E2D657870722D6966:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
push %r9
mov 16(%rsp),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f747970652D6E65772D756E6974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 40(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov 24(%rsp),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 40(%rsp),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov 32(%rsp),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 40(%rsp),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16356500$:
add $8,%rsp
.16356188$:
add $8,%rsp
.16355922$:
add $48,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D6C6974
f65627265772D73796E2D73656D2D657870722D6C6974:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D6C6974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D6C6974@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D737472
f65627265772D73796E2D73656D2D657870722D737472:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D6C6974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D737472@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D61646472
f65627265772D73796E2D73656D2D657870722D61646472:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D6964@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D61646472@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D6964
f65627265772D73796E2D73656D2D657870722D6964:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D6964@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D6964@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D6C6574
f65627265772D73796E2D73656D2D657870722D6C6574:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D766172@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D6C65742D696E@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73656D2D696D706C2D6C65742D656E64@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D666F72
f65627265772D73796E2D73656D2D657870722D666F72:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D766172@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D666F722D696E@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73656D2D696D706C2D666F722D656E64@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D646F
f65627265772D73796E2D73656D2D657870722D646F:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D646F2D7468656E@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73656D2D696D706C2D646F2D656E64@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D616E64
f65627265772D73796E2D73656D2D657870722D616E64:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D616E642D7468656E@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73656D2D696D706C2D616E642D656E64@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D6F72
f65627265772D73796E2D73656D2D657870722D6F72:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D6F722D656C7365@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73656D2D696D706C2D6F722D656E64@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D73656D2D657870722D6966
f65627265772D73796E2D73656D2D657870722D6966:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D6966@GOTPCREL(%rip),%rax
add $-48,%rsp
push %rax
mov f65627265772D73656D2D696D706C2D69662D7468656E@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73656D2D696D706C2D69662D656C7365@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov f65627265772D73656D2D696D706C2D69662D656E64@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
mov 72(%rsp),%rax
mov %rax,32(%rsp)
mov 64(%rsp),%rax
mov %rax,40(%rsp)
mov 56(%rsp),%rax
mov %rax,48(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
pop %r9
call *%rax
add $24,%rsp
ret
.section .text.f65627265772D73796E2D657870722D707265646566
f65627265772D73796E2D657870722D707265646566:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
mov 32(%rsp),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16362275$
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov 24(%rsp),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16362562$:
.16362275$:
add $40,%rsp
ret
.section .text.f65627265772D73796E2D657870722D61746F6D
f65627265772D73796E2D657870722D61746F6D:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
mov 32(%rsp),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16363164$
mov 24(%rsp),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16363164$:
add $40,%rsp
ret
.section .text.f65627265772D73796E2D657870722D70756E6374
f65627265772D73796E2D657870722D70756E6374:
push %rdi
push %rsi
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16363757$
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16363757$:
add $16,%rsp
ret
.section .text.f65627265772D73796E2D657870722D7465726D
f65627265772D73796E2D657870722D7465726D:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D707265646566@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D646F@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D646F@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16364632$
mov f65627265772D73796E2D657870722D707265646566@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D6966@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D6966@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16365095$
mov f65627265772D73796E2D657870722D707265646566@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D6F72@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D6F72@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16365558$
mov f65627265772D73796E2D657870722D707265646566@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D616E64@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D616E64@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16366025$
mov f65627265772D73796E2D657870722D707265646566@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D6C6574@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D6C6574@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16366492$
mov f65627265772D73796E2D657870722D707265646566@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D666F72@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D666F72@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16366959$
mov f65627265772D73796E2D657870722D707265646566@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D61646472@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D61646472@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16367430$
mov f65627265772D73796E2D657870722D61746F6D@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D6C6974@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D6C6974@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16367893$
mov f65627265772D73796E2D657870722D61746F6D@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D737472@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D737472@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
test %rax,%rax
jne .16368356$
mov f65627265772D73796E2D657870722D61746F6D@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D6964@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f65627265772D73796E2D73656D2D657870722D6964@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
.16368356$:
.16367893$:
.16367430$:
.16366959$:
.16366492$:
.16366025$:
.16365558$:
.16365095$:
.16364632$:
add $24,%rsp
ret
.section .text.f65627265772D73796E2D657870722D61726773
f65627265772D73796E2D657870722D61726773:
push %rdi
push %rsi
push %rdx
push %rcx
mov f747970652D6172697479@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f65627265772D73656D2D696D706C2D63616C6C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov $1,%rax
push %rax
mov 16(%rsp),%rax
test %rax,%rax
je .16369456$
mov 16(%rsp),%rax
push %rax
jmp .16369513$
.16369503$:
mov %rax,(%rsp)
.16369513$:
mov 48(%rsp),%rax
add $-16,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f747970652D657175616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f73656D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
jne .16370009$
mov f657272@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $4,%rax
mov %rax,8(%rsp)
.section .text..s16370124
.s16370124:
.string,"wrong"
.previous
mov .s16370124@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16370009$:
mov f65627265772D73656D2D696D706C2D63616C6C2D617267@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f696E63@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
lea 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16370615$:
.16370496$:
.16370291$:
.16369719$:
test %rax,%rax
jne .16369503$
pop %rax
.16369456$:
add $8,%rsp
mov f65627265772D73656D2D696D706C2D63616C6C2D656E64@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
.16370847$:
.16369416$:
add $8,%rsp
add $32,%rsp
ret
.section .text.f65627265772D73796E2D657870722D63616C6C
f65627265772D73796E2D657870722D63616C6C:
push %rdi
push %rsi
push %rdx
mov f747970652D657175616C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f73656D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
jne .16371566$
mov $1,%rax
push %rax
jmp .16371618$
.16371608$:
mov %rax,(%rsp)
.16371618$:
mov f747970652D6B696E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16371915$
mov f65627265772D73796E2D657870722D61726773@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 88(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 104(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
.16371915$:
test %rax,%rax
jne .16371608$
pop %rax
.16371566$:
add $24,%rsp
ret
.section .text.f65627265772D73796E2D657870722D6C70
f65627265772D73796E2D657870722D6C70:
push %rdi
mov f65627265772D73796E2D657870722D70756E6374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D6C70@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73796E2D657870722D7270
f65627265772D73796E2D657870722D7270:
push %rdi
mov f65627265772D73796E2D657870722D70756E6374@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f65627265772D746F6B656E2D636C6173732D7270@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f65627265772D73796E2D657870722D6E657374
f65627265772D73796E2D657870722D6E657374:
push %rdi
push %rsi
push %rdx
mov f65627265772D73796E2D657870722D6C70@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16373850$
mov f65627265772D73796E2D657870722D7465726D@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f65627265772D73796E2D657870722D7270@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16374268$
mov f65627265772D73796E2D657870722D63616C6C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f65627265772D73796E2D657870722D7270@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
jne .16374687$
mov f657272@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $5,%rax
mov %rax,8(%rsp)
.section .text..s16374802
.s16374802:
.string,"missing paren"
.previous
mov .s16374802@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16374687$:
.16374540$:
.16374268$:
.16374121$:
jmp .16375013$
.16373850$:
mov f65627265772D73796E2D657870722D7465726D@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
test %rax,%rax
je .16375282$
mov f65627265772D73796E2D657870722D63616C6C@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
jmp .16375553$
.16375282$:
mov f657272@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $6,%rax
mov %rax,8(%rsp)
.section .text..s16375665
.s16375665:
.string,"missing expression"
.previous
mov .s16375665@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16375553$:
.16375013$:
add $24,%rsp
ret
.section .text.f65627265772D73796E2D65787072
f65627265772D73796E2D65787072:
push %rdi
push %rsi
mov f65627265772D73796E2D657870722D6E657374@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f65627265772D73796E2D65787072@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
add $16,%rsp
ret
.section .text.f65627265772D73796E2D706172616D
f65627265772D73796E2D706172616D:
push %rdi
push %rsi
push %rdx
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7374727563742D74797065@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7374727563742D746F6B656E@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f746F6B656E2D636F7079@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov 16(%rsp),%rax
add $-8,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f636F7079@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f747970652D2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f636F7079@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f636F7079@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f747970652D2D6B696E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f747970652D2D6B696E64@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16379565$:
.16379069$:
add $8,%rsp
.16378454$:
.16378196$:
.16377579$:
.16376866$:
add $24,%rsp
ret
.section .text.f65627265772D73796E2D74797065
f65627265772D73796E2D74797065:
push %rdi
mov f746F6B656E2D6561742D6C6974@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
.section .text..s16380552
.s16380552:
.string,"("
.previous
mov .s16380552@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
test %rax,%rax
je .16380712$
mov f747970652D6E65772D66756E6374696F6E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
jmp .16381150$
.16381140$:
mov %rax,(%rsp)
.16381150$:
mov f6E6F74@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f746F6B656E2D6561742D6C6974@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
.section .text..s16381560
.s16381560:
.string,")"
.previous
mov .s16381560@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16381766$
mov f65627265772D73796E2D706172616D@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f65627265772D73796E2D74797065@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f747970652D2D6E657874@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16382065$:
.16381766$:
test %rax,%rax
jne .16381140$
pop %rax
mov 0(%rsp),%rax
.16382364$:
add $8,%rsp
jmp .16382405$
.16380712$:
mov f747970652D6E65772D756E6974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16382405$:
add $8,%rsp
ret
.section .text.f706172616D73
f706172616D73:
push %rdi
push %rsi
push %rdx
push %rcx
mov 8(%rsp),%rax
test %rax,%rax
je .16382811$
mov 24(%rsp),%rax
add $-24,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov 32(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
jmp .16383036$
.16382811$:
mov f65627265772D73796E2D65787072@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov f747970652D6E65772D756E6974@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov $0,%rax
.16383482$:
.16383036$:
add $32,%rsp
ret
.section .text.f706172616D2D707573682D626F6F6B
f706172616D2D707573682D626F6F6B:
push %rdi
push %rsi
mov f65627265772D73656D2D7661726465636C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $16,%rsp
ret
.section .text.f706172616D732D6E657874
f706172616D732D6E657874:
push %rdi
push %rsi
push %rdx
push %rcx
mov f706172616D73@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
mov 40(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
push %rax
mov f706F702D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov 0(%rsp),%rax
.16384785$:
add $8,%rsp
add $32,%rsp
ret
.section .text.f7265676973746572
f7265676973746572:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
mov f7838365F36342D70757368@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov 40(%rsp),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f73656D2D7365742D74797065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f706172616D2D707573682D626F6F6B@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov f706172616D732D6E657874@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov 96(%rsp),%rax
mov %rax,8(%rsp)
mov 88(%rsp),%rax
mov %rax,16(%rsp)
mov 80(%rsp),%rax
mov %rax,24(%rsp)
mov 64(%rsp),%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16385766$:
.16385577$:
.16385394$:
add $40,%rsp
ret
.section .text.f737461636B
f737461636B:
push %rdi
push %rsi
push %rdx
mov f73656D2D7365742D74797065@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f706172616D2D707573682D626F6F6B@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6465636C2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
mov f706172616D732D6E657874@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov f737461636B@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 56(%rsp),%rax
mov %rax,16(%rsp)
mov 48(%rsp),%rax
mov %rax,24(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
.16387221$:
.16386484$:
add $24,%rsp
ret
.section .text.f72656769737465722D736571
f72656769737465722D736571:
push %rdi
push %rsi
push %rdx
push %rcx
push %r8
mov f7265676973746572@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
mov 64(%rsp),%rax
mov %rax,16(%rsp)
mov 56(%rsp),%rax
mov %rax,24(%rsp)
mov 72(%rsp),%rax
mov %rax,32(%rsp)
mov f616464@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $1,%rax
mov %rax,8(%rsp)
mov 72(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $40,%rsp
ret
.section .text.f726567697374657235
f726567697374657235:
push %rdi
push %rsi
push %rdx
mov f72656769737465722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f737461636B@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
.section .text..s16388489
.s16388489:
.string,"%r9"
.previous
mov .s16388489@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov $0,%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f726567697374657234
f726567697374657234:
push %rdi
push %rsi
push %rdx
mov f72656769737465722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f726567697374657235@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
.section .text..s16389008
.s16389008:
.string,"%r8"
.previous
mov .s16389008@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f726567697374657233
f726567697374657233:
push %rdi
push %rsi
push %rdx
mov f72656769737465722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f726567697374657234@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
.section .text..s16389533
.s16389533:
.string,"%rcx"
.previous
mov .s16389533@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f726567697374657232
f726567697374657232:
push %rdi
push %rsi
push %rdx
mov f72656769737465722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f726567697374657233@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
.section .text..s16390059
.s16390059:
.string,"%rdx"
.previous
mov .s16390059@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f726567697374657231
f726567697374657231:
push %rdi
push %rsi
push %rdx
mov f72656769737465722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f726567697374657232@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
.section .text..s16390585
.s16390585:
.string,"%rsi"
.previous
mov .s16390585@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f726567697374657230
f726567697374657230:
push %rdi
push %rsi
push %rdx
mov f72656769737465722D736571@GOTPCREL(%rip),%rax
add $-40,%rsp
push %rax
mov f726567697374657231@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
.section .text..s16391111
.s16391111:
.string,"%rdi"
.previous
mov .s16391111@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
mov 64(%rsp),%rax
mov %rax,24(%rsp)
mov 56(%rsp),%rax
mov %rax,32(%rsp)
mov 48(%rsp),%rax
mov %rax,40(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
pop %r8
call *%rax
add $24,%rsp
ret
.section .text.f6465636C2D6669727374
f6465636C2D6669727374:
push %rdi
mov f65627265772D73656D2D7661726465636C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f6465636C2D72657374
f6465636C2D72657374:
push %rdi
mov f7472792D6C6F6F6B7570@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
test %rax,%rax
je .16392283$
mov f657272@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $7,%rax
mov %rax,8(%rsp)
.section .text..s16392397
.s16392397:
.string,"duplicate"
.previous
mov .s16392397@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
jmp .16392556$
.16392283$:
mov f6465636C2D6669727374@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16392556$:
add $8,%rsp
ret
.section .text.f70617273652D6465636C73
f70617273652D6465636C73:
push %rdi
push %rsi
mov f746F6B656E2D63617265742D7065656B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16393088$
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov 8(%rsp),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
push %rax
mov f65627265772D73796E2D706172616D@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f65627265772D73796E2D74797065@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
mov f7374727563742D6465636C2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 80(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f7374727563742D6465636C2D6973646566@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 72(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f6E6F74@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f746F6B656E2D6561742D6C6974@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f65627265772D746F6B656E2D616476@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 96(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
.section .text..s16394943
.s16394943:
.string,"?"
.previous
mov .s16394943@GOTPCREL(%rip),%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6465636C2D6973646566@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 64(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
test %rax,%rax
je .16395685$
mov f7075742D737472696E67@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f7838365F36342D737472696E672D73656374696F6E2D74657874@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6D616E676C652D7370616E@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7075742D6C66@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f7838365F36342D6D616E676C652D7370616E@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f746F6B656E2D2D7370616E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D6C6162656C2D737566@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73686C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov $63,%rax
mov %rax,8(%rsp)
mov $1,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f7838365F36342D66706F70@GOTPCREL(%rip),%rax
add $-24,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov f73656D2D2D696D706C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 56(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov f706172616D73@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov f726567697374657230@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 80(%rsp),%rax
mov %rax,16(%rsp)
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f747970652D2D617267@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6465636C2D74797065@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f7374727563742D6E616D652D6465636C@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 168(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
mov $0,%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
mov %rax,24(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
call *%rax
mov f7075742D6C696E65@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 48(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
.section .text..s16399710
.s16399710:
.string,"ret"
.previous
mov .s16399710@GOTPCREL(%rip),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16399498$:
.16398108$:
.16397690$:
.16397434$:
.16396882$:
.16396646$:
.16396094$:
.16395685$:
mov f70617273652D6465636C73@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6465636C2D72657374@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16399959$:
.16395205$:
.16394134$:
add $8,%rsp
.16393393$:
.16393088$:
add $16,%rsp
ret
.section .text.f70617273652D6562726577
f70617273652D6562726577:
push %rdi
mov f65627265772D73656D2D696D706C2D707265@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f70617273652D6465636C73@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f6465636C2D6669727374@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov 24(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
.16400478$:
add $8,%rsp
ret
.section .text.f6D61696E
f6D61696E:
push %rdi
push %rsi
push %rdx
mov f616C6C6F63@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
lea 24(%rsp),%rax
mov %rax,8(%rsp)
mov f7374727563742D73656D@GOTPCREL(%rip),%rax
push %rax
pop %rax
call *%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
push %rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D626F6F6B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov $0,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 40(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f73746F7265@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D62726B@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 32(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f65627265772D746F6B656E2D696E6974@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov f73656D2D2D746F6B656E@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 40(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
mov 48(%rsp),%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
mov f70617273652D6562726577@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 16(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov f6C6F6164@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov f73656D2D2D6F7574@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov 32(%rsp),%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
.16402295$:
.16402160$:
.16401854$:
.16401574$:
.16401294$:
add $8,%rsp
add $24,%rsp
ret
.section .text.f706F7732
f706F7732:
push %rdi
mov f73686C@GOTPCREL(%rip),%rax
add $-16,%rsp
push %rax
mov 24(%rsp),%rax
mov %rax,8(%rsp)
mov $1,%rax
mov %rax,16(%rsp)
pop %rax
pop %rdi
pop %rsi
call *%rax
add $8,%rsp
ret
.section .text.f5F7374617274
f5F7374617274:
mov f72756E74696D65@GOTPCREL(%rip),%rax
add $-32,%rsp
push %rax
mov f6D61696E@GOTPCREL(%rip),%rax
mov %rax,8(%rsp)
mov f706F7732@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov $24,%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,16(%rsp)
mov f706F7732@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov $20,%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,24(%rsp)
mov f706F7732@GOTPCREL(%rip),%rax
add $-8,%rsp
push %rax
mov $23,%rax
mov %rax,8(%rsp)
pop %rax
pop %rdi
call *%rax
mov %rax,32(%rsp)
pop %rax
pop %rdi
pop %rsi
pop %rdx
pop %rcx
call *%rax
ret
