/*
 * void cswitch(struct kctx *from, struct kctx *to);
 */
	.globl cswitch
cswitch:
	movl	4(%esp), %eax	/* %eax <- from */
	movl	8(%esp), %edx	/* %edx <- to */

	/* TODO: save the old kernel context */

	movl %esp, 0x0(%eax)
	movl %edi, 0x4(%eax)
	movl %esi, 0x8(%eax)
	movl %ebx, 0xc(%eax)
	movl %ebp, 0x10(%eax)
	movl 0x0(%esp), %ecx
	movl %ecx, 0x14(%eax)

	/* TODO: load the new kernel context */

	movl 0x0(%edx), %esp
	movl 0x4(%edx), %edi
	movl 0x8(%edx), %esi
	movl 0xc(%edx), %ebx
	movl 0x10(%edx), %ebp
	movl 0x14(%edx), %ecx
	movl %ecx, 0x0(%esp)

	xor	%eax, %eax
	ret
 