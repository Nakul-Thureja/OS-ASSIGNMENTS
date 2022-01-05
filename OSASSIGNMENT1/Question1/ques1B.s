	.file	"ques1B.c"
	.text
	.globl	sum1
	.bss
	.align 16
	.type	sum1, @object
	.size	sum1, 24
sum1:
	.zero	24
	.globl	n1
	.align 4
	.type	n1, @object
	.size	n1, 4
n1:
	.zero	4
	.globl	sum2
	.align 16
	.type	sum2, @object
	.size	sum2, 24
sum2:
	.zero	24
	.globl	n2
	.align 4
	.type	n2, @object
	.size	n2, 4
n2:
	.zero	4
	.section	.rodata
.LC0:
	.string	"student_record.csv"
.LC1:
	.string	"A"
.LC2:
	.string	",\n"
.LC4:
	.string	"Error opening file"
	.text
	.globl	SectionA
	.type	SectionA, @function
SectionA:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%rdi, -248(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -216(%rbp)
	movl	$0, -228(%rbp)
	movl	$0, -224(%rbp)
	movl	$0, -220(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -176(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	stat@PLT
	movq	-112(%rbp), %rax
	movl	%eax, -212(%rbp)
	cmpl	$-1, -216(%rbp)
	je	.L2
	movl	-212(%rbp), %eax
	cltq
	movl	$1, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, -168(%rbp)
	movl	-212(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rcx
	movl	-216(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	-212(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-168(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -184(%rbp)
	jmp	.L3
.L11:
	cmpl	$1, -224(%rbp)
	jne	.L4
	movq	-176(%rbp), %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movl	$1, -220(%rbp)
	movss	n1(%rip), %xmm1
	movss	.LC3(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, n1(%rip)
.L4:
	cmpl	$2, -224(%rbp)
	jne	.L5
	cmpl	$0, -220(%rbp)
	je	.L5
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -208(%rbp)
	movl	sum1(%rip), %edx
	movl	-208(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, sum1(%rip)
.L5:
	cmpl	$3, -224(%rbp)
	jne	.L6
	cmpl	$0, -220(%rbp)
	je	.L6
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -204(%rbp)
	movl	4+sum1(%rip), %edx
	movl	-204(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 4+sum1(%rip)
.L6:
	cmpl	$4, -224(%rbp)
	jne	.L7
	cmpl	$0, -220(%rbp)
	je	.L7
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -200(%rbp)
	movl	8+sum1(%rip), %edx
	movl	-200(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 8+sum1(%rip)
.L7:
	cmpl	$5, -224(%rbp)
	jne	.L8
	cmpl	$0, -220(%rbp)
	je	.L8
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -196(%rbp)
	movl	12+sum1(%rip), %edx
	movl	-196(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 12+sum1(%rip)
.L8:
	cmpl	$6, -224(%rbp)
	jne	.L9
	cmpl	$0, -220(%rbp)
	je	.L9
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -192(%rbp)
	movl	16+sum1(%rip), %edx
	movl	-192(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 16+sum1(%rip)
.L9:
	cmpl	$7, -224(%rbp)
	jne	.L10
	cmpl	$0, -220(%rbp)
	je	.L10
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -188(%rbp)
	movl	20+sum1(%rip), %edx
	movl	-188(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 20+sum1(%rip)
.L10:
	leaq	.LC2(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -184(%rbp)
	addl	$1, -224(%rbp)
	movl	-224(%rbp), %eax
	andl	$7, %eax
	testl	%eax, %eax
	jne	.L3
	movl	$0, -224(%rbp)
	movl	$0, -220(%rbp)
	addl	$1, -228(%rbp)
.L3:
	cmpq	$0, -184(%rbp)
	jne	.L11
	jmp	.L12
.L2:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
.L12:
	movl	-216(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	SectionA, .-SectionA
	.section	.rodata
.LC5:
	.string	"B"
	.text
	.globl	SectionB
	.type	SectionB, @function
SectionB:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movq	%rdi, -248(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -216(%rbp)
	movl	$0, -228(%rbp)
	movl	$0, -224(%rbp)
	movl	$0, -220(%rbp)
	leaq	.LC5(%rip), %rax
	movq	%rax, -176(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	stat@PLT
	movq	-112(%rbp), %rax
	movl	%eax, -212(%rbp)
	cmpl	$-1, -216(%rbp)
	je	.L15
	movl	-212(%rbp), %eax
	cltq
	movl	$1, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, -168(%rbp)
	movl	-212(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rcx
	movl	-216(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	-212(%rbp), %eax
	movslq	%eax, %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-168(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -184(%rbp)
	jmp	.L16
.L24:
	cmpl	$1, -224(%rbp)
	jne	.L17
	movq	-176(%rbp), %rdx
	movq	-184(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L17
	movl	$1, -220(%rbp)
	movss	n2(%rip), %xmm1
	movss	.LC3(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, n2(%rip)
.L17:
	cmpl	$2, -224(%rbp)
	jne	.L18
	cmpl	$0, -220(%rbp)
	je	.L18
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -208(%rbp)
	movl	sum2(%rip), %edx
	movl	-208(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, sum2(%rip)
.L18:
	cmpl	$3, -224(%rbp)
	jne	.L19
	cmpl	$0, -220(%rbp)
	je	.L19
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -204(%rbp)
	movl	4+sum2(%rip), %edx
	movl	-204(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 4+sum2(%rip)
.L19:
	cmpl	$4, -224(%rbp)
	jne	.L20
	cmpl	$0, -220(%rbp)
	je	.L20
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -200(%rbp)
	movl	8+sum2(%rip), %edx
	movl	-200(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 8+sum2(%rip)
.L20:
	cmpl	$5, -224(%rbp)
	jne	.L21
	cmpl	$0, -220(%rbp)
	je	.L21
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -196(%rbp)
	movl	12+sum2(%rip), %edx
	movl	-196(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 12+sum2(%rip)
.L21:
	cmpl	$6, -224(%rbp)
	jne	.L22
	cmpl	$0, -220(%rbp)
	je	.L22
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -192(%rbp)
	movl	16+sum2(%rip), %edx
	movl	-192(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 16+sum2(%rip)
.L22:
	cmpl	$7, -224(%rbp)
	jne	.L23
	cmpl	$0, -220(%rbp)
	je	.L23
	movq	-184(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -188(%rbp)
	movl	20+sum2(%rip), %edx
	movl	-188(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, 20+sum2(%rip)
.L23:
	leaq	.LC2(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -184(%rbp)
	addl	$1, -224(%rbp)
	movl	-224(%rbp), %eax
	andl	$7, %eax
	testl	%eax, %eax
	jne	.L16
	movl	$0, -224(%rbp)
	movl	$0, -220(%rbp)
	addl	$1, -228(%rbp)
.L16:
	cmpq	$0, -184(%rbp)
	jne	.L24
	jmp	.L25
.L15:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
.L25:
	movl	-216(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
	nop
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	SectionB, .-SectionB
	.section	.rodata
	.align 8
.LC6:
	.string	"Thread 1 to Calculate Average in Section A"
.LC7:
	.string	"Error Creating Thread"
.LC8:
	.string	"Error Joining Thread"
.LC9:
	.string	"After Thread 1"
	.align 8
.LC10:
	.string	"Thread 2 to Calculate Average in Section B"
.LC11:
	.string	"After Thread 2\n"
.LC12:
	.string	"Average in section A:"
.LC14:
	.string	"No students in section A"
.LC15:
	.string	"Assignment %d: %.2f \n"
.LC16:
	.string	"\nAverage in section B:"
.LC17:
	.string	"No students in section B"
.LC18:
	.string	"\nAverage in section A and B:"
	.align 8
.LC19:
	.string	"No students in section A and B"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	leaq	-24(%rbp), %rax
	movl	$0, %ecx
	leaq	SectionA(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L28
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L48
.L28:
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L30
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L48
.L30:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	leaq	-16(%rbp), %rax
	movl	$0, %ecx
	leaq	SectionB(%rip), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create@PLT
	testl	%eax, %eax
	je	.L31
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L48
.L31:
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join@PLT
	testl	%eax, %eax
	je	.L32
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$2, %eax
	jmp	.L48
.L32:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	movss	n1(%rip), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L33
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jne	.L33
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	jmp	.L35
.L33:
	movl	$0, -48(%rbp)
	jmp	.L36
.L37:
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sum1(%rip), %rax
	movl	(%rdx,%rax), %eax
	cvtsi2ssl	%eax, %xmm0
	movss	n1(%rip), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -36(%rbp)
	cvtss2sd	-36(%rbp), %xmm0
	movl	-48(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -48(%rbp)
.L36:
	cmpl	$5, -48(%rbp)
	jle	.L37
.L35:
	leaq	.LC16(%rip), %rdi
	call	puts@PLT
	movss	n2(%rip), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L38
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jne	.L38
	leaq	.LC17(%rip), %rdi
	call	puts@PLT
	jmp	.L40
.L38:
	movl	$0, -44(%rbp)
	jmp	.L41
.L42:
	movl	-44(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sum2(%rip), %rax
	movl	(%rdx,%rax), %eax
	cvtsi2ssl	%eax, %xmm0
	movss	n2(%rip), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -32(%rbp)
	cvtss2sd	-32(%rbp), %xmm0
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -44(%rbp)
.L41:
	cmpl	$5, -44(%rbp)
	jle	.L42
.L40:
	leaq	.LC18(%rip), %rdi
	call	puts@PLT
	movss	n1(%rip), %xmm1
	movss	n2(%rip), %xmm0
	addss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L43
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jne	.L43
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	jmp	.L45
.L43:
	movl	$0, -40(%rbp)
	jmp	.L46
.L47:
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sum1(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	sum2(%rip), %rax
	movl	(%rcx,%rax), %eax
	addl	%edx, %eax
	cvtsi2ssl	%eax, %xmm0
	movss	n1(%rip), %xmm2
	movss	n2(%rip), %xmm1
	addss	%xmm2, %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -28(%rbp)
	cvtss2sd	-28(%rbp), %xmm0
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -40(%rbp)
.L46:
	cmpl	$5, -40(%rbp)
	jle	.L47
.L45:
	movl	$0, %edi
	call	exit@PLT
.L48:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L49
	call	__stack_chk_fail@PLT
.L49:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC3:
	.long	1065353216
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
