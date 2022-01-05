	.file	"ques1A.c"
	.text
	.section	.rodata
.LC0:
	.string	"student_record.csv"
.LC1:
	.string	",\n"
.LC2:
	.string	"Average in section %s:\n"
.LC3:
	.string	"No students in section %s\n"
.LC4:
	.string	"Assignment %d: %.2f \n"
.LC5:
	.string	"Error opening file"
	.text
	.globl	calculateAverage
	.type	calculateAverage, @function
calculateAverage:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movq	%rdi, -280(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, -244(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	call	stat@PLT
	movl	$0, -192(%rbp)
	movl	$0, -188(%rbp)
	movl	$0, -184(%rbp)
	movl	$0, -180(%rbp)
	movl	$0, -176(%rbp)
	movl	$0, -172(%rbp)
	movq	-112(%rbp), %rax
	movl	%eax, -240(%rbp)
	cmpl	$-1, -244(%rbp)
	je	.L2
	movl	-240(%rbp), %eax
	cltq
	movl	$1, %esi
	movq	%rax, %rdi
	call	calloc@PLT
	movq	%rax, -200(%rbp)
	movl	-240(%rbp), %eax
	movslq	%eax, %rdx
	movq	-200(%rbp), %rcx
	movl	-244(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	-240(%rbp), %eax
	movslq	%eax, %rdx
	movq	-200(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-200(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -208(%rbp)
	movl	$0, -264(%rbp)
	movl	$0, -260(%rbp)
	movl	$0, -256(%rbp)
	movl	$0, -252(%rbp)
	jmp	.L3
.L11:
	cmpl	$1, -260(%rbp)
	jne	.L4
	movq	-280(%rbp), %rdx
	movq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movl	$1, -256(%rbp)
	addl	$1, -252(%rbp)
.L4:
	cmpl	$2, -260(%rbp)
	jne	.L5
	cmpl	$0, -256(%rbp)
	je	.L5
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -232(%rbp)
	movl	-192(%rbp), %edx
	movl	-232(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -192(%rbp)
.L5:
	cmpl	$3, -260(%rbp)
	jne	.L6
	cmpl	$0, -256(%rbp)
	je	.L6
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -228(%rbp)
	movl	-188(%rbp), %edx
	movl	-228(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -188(%rbp)
.L6:
	cmpl	$4, -260(%rbp)
	jne	.L7
	cmpl	$0, -256(%rbp)
	je	.L7
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -224(%rbp)
	movl	-184(%rbp), %edx
	movl	-224(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -184(%rbp)
.L7:
	cmpl	$5, -260(%rbp)
	jne	.L8
	cmpl	$0, -256(%rbp)
	je	.L8
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -220(%rbp)
	movl	-180(%rbp), %edx
	movl	-220(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -180(%rbp)
.L8:
	cmpl	$6, -260(%rbp)
	jne	.L9
	cmpl	$0, -256(%rbp)
	je	.L9
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -216(%rbp)
	movl	-176(%rbp), %edx
	movl	-216(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -176(%rbp)
.L9:
	cmpl	$7, -260(%rbp)
	jne	.L10
	cmpl	$0, -256(%rbp)
	je	.L10
	movq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -212(%rbp)
	movl	-172(%rbp), %edx
	movl	-212(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -172(%rbp)
.L10:
	leaq	.LC1(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -208(%rbp)
	addl	$1, -260(%rbp)
	movl	-260(%rbp), %eax
	andl	$7, %eax
	testl	%eax, %eax
	jne	.L3
	movl	$0, -260(%rbp)
	movl	$0, -256(%rbp)
	addl	$1, -264(%rbp)
.L3:
	cmpq	$0, -208(%rbp)
	jne	.L11
	movq	-280(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$0, -252(%rbp)
	jne	.L12
	movq	-280(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L1
.L12:
	movl	$0, -248(%rbp)
	jmp	.L14
.L15:
	movl	-248(%rbp), %eax
	cltq
	movl	-192(%rbp,%rax,4), %eax
	cvtsi2ssl	%eax, %xmm0
	cvtsi2ssl	-252(%rbp), %xmm1
	divss	%xmm1, %xmm0
	movss	%xmm0, -236(%rbp)
	cvtss2sd	-236(%rbp), %xmm0
	movl	-248(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -248(%rbp)
.L14:
	cmpl	$5, -248(%rbp)
	jle	.L15
	jmp	.L16
.L2:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
.L16:
	movl	-244(%rbp), %eax
	movl	%eax, %edi
	call	close@PLT
.L1:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	calculateAverage, .-calculateAverage
	.section	.rodata
.LC6:
	.string	"Error Creating process"
	.align 8
.LC7:
	.string	"Child Process started with process id (%d) \n"
.LC8:
	.string	"A"
	.align 8
.LC9:
	.string	"Parent Process waited for child process with ID (%d) \n"
	.align 8
.LC10:
	.string	"\nParent Process started with process id (%d) \n"
.LC11:
	.string	"B"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	fork@PLT
	movl	%eax, -8(%rbp)
	cmpl	$-1, -8(%rbp)
	jne	.L19
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L20
.L19:
	cmpl	$0, -8(%rbp)
	jne	.L21
	call	getpid@PLT
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC8(%rip), %rdi
	call	calculateAverage
	movl	$0, %edi
	call	exit@PLT
.L21:
	movl	-8(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	waitpid@PLT
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	call	getpid@PLT
	movl	%eax, %esi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC11(%rip), %rdi
	call	calculateAverage
	movl	$0, %eax
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
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
