	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.globl	_floralid_wread_i_u     ## -- Begin function floralid_wread_i_u
	.p2align	4, 0x90
_floralid_wread_i_u:                    ## @floralid_wread_i_u
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %rbx
	movq	%rdi, %r14
	leaq	L_.str(%rip), %rsi
	xorl	%edi, %edi
	callq	_fdopen
	movq	%rbx, %rdi
	movl	%r14d, %esi
	movq	%rax, %rdx
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	_fgetws                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"r"

.subsections_via_symbols
