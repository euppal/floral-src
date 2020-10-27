	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.globl	_floralid_flush         ## -- Begin function floralid_flush
	.p2align	4, 0x90
_floralid_flush:                        ## @floralid_flush
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	__printbuffer@GOTPCREL(%rip), %rsi
	movslq	__length(%rip), %rdx
	movl	$1, %edi
	callq	_write
	movl	$0, __length(%rip)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_floralid_print_buffered_u ## -- Begin function floralid_print_buffered_u
	.p2align	4, 0x90
_floralid_print_buffered_u:             ## @floralid_print_buffered_u
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpb	$0, (%rax)
	je	LBB1_5
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movq	__printbuffer@GOTPCREL(%rip), %rax
	movq	-8(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -8(%rbp)
	movb	(%rcx), %sil
	movl	__length(%rip), %edi
	movl	%edi, %r8d
	addl	$1, %r8d
	movl	%r8d, __length(%rip)
	movslq	%edi, %rcx
	movb	%sil, (%rax,%rcx)
	cmpl	$512, __length(%rip)    ## imm = 0x200
	jl	LBB1_4
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	callq	_floralid_flush
LBB1_4:                                 ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_1
LBB1_5:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__length                ## @_length
.zerofill __DATA,__common,__length,4,2
	.comm	__printbuffer,512,4     ## @_printbuffer
.subsections_via_symbols
