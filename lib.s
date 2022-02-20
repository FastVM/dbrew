.globl _start
.equ _start,f5F7374617274
.globl eb_load
.section .text.eb_load
eb_load:
mov (%rdi),%rax
ret
.globl eb_store
.section .text.eb_store
eb_store:
mov %rsi,(%rdi)
ret
.globl eb_peek
.section .text.eb_peek
eb_peek:
movzb (%rdi),%eax
ret
.globl eb_poke
.section .text.eb_poke
eb_poke:
movb %sil,(%rdi)
ret
.globl eb_add
.section .text.eb_add
eb_add:
mov %rsi,%rax
add %rdi,%rax
ret
.globl eb_sub
.section .text.eb_sub
eb_sub:
mov %rsi,%rax
sub %rdi,%rax
ret
.globl eb_mul
.section .text.eb_mul
eb_mul:
mov %rsi,%rax
mul %rdi
ret
.globl eb_div
.section .text.eb_div
eb_div:
xor %edx,%edx
mov %rsi,%rax
div %rdi
ret
.globl eb_mod
.section .text.eb_mod
eb_mod:
xor %edx,%edx
mov %rsi,%rax
div %rdi
mov %rdx,%rax
ret
.globl eb_shl
.section .text.eb_shl
eb_shl:
mov %rsi,%rax
mov %rdi,%rcx
shl %cl,%rax
ret
.globl eb_cmpa
.section .text.eb_cmpa
eb_cmpa:
cmp %rdi,%rsi
seta %al
movzbl %al,%eax
ret
.globl eb_cmpe
.section .text.eb_cmpe
eb_cmpe:
cmp %rsi,%rdi
sete %al
movzbl %al,%eax
ret
.globl eb_ne
.section .text.eb_ne
eb_ne:
cmp %rsi,%rdi
setne %al
movzbl %al,%eax
ret
.globl eb_neg
.section .text.eb_neg
eb_neg:
mov %rdi,%rax
neg %rax
ret
.globl eb_not
.section .text.eb_not
eb_not:
test %rdi,%rdi
sete %al
movzbl %al,%eax
ret
.globl eb_linux
.section .text.eb_linux
eb_linux:
mov 8(%rsp),%rax
syscall
ret
