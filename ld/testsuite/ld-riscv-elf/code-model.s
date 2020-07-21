	.text
	.global _start
_start:

.ifdef __compact__
	# Compact prolog.
.L1:
	auipc   gp, %pcrel_hi(__global_pointer__)
	addi    gp, gp, %pcrel_lo(.L1)
	ld      t0, 0(gp)
	add     gp, gp, t0

	# I assume we will use PCREL to access the function in the
	# text section, rather than use GPREL or GOT_GPREL.

.ifdef __undefweak__
	# Refer to undefined weak symbol by GPREL.
	lui	t0, %gprel_hi(symbolW)
	add     t0, t0, gp, %gprel(symbolW)
	addi    t0, t0, %gprel_lo(symbolW)
	# Refer to data symbol by GOT_GPREL.
	lui     t0, %got_gprel_hi(symbolW)
	add     t0, t0, gp, %got_gprel(symbolW)
	addi    t0, t0, %got_gprel_lo(symbolW)
.else
	# Refer to data symbol by GPREL.
	lui     t0, %gprel_hi(symbolA)
	add     t0, t0, gp, %gprel(symbolA)
	addi    t0, t0, %gprel_lo(symbolA)
	# Refer to data symbol by GOT_GPREL.
	lui     t0, %got_gprel_hi(symbolA)
	add     t0, t0, gp, %got_gprel(symbolA)
	addi    t0, t0, %got_gprel_lo(symbolA)
.endif
.endif

.ifdef __medany__
.ifdef __undefweak__
	# Refer to undefined weak symbol by PCREL.
	la	t0, symbolW
	# Refer to undefined weak symbol by GOT_PCREL.
	.option pic
	la	t0, symbolW
	.option nopic
.else
	# Refer to data symbol by PCREL.
	la	t0, symbolA
	# Refer to data symbol by GOT_PCREL.
	.option pic
	la	t0, symbolA
	.option nopic
.endif
.endif

.ifdef  __medlow__
	# Refer to data symbol by absolutely access.
	lui	t0, %hi(symbolA)
	addi	t0, t0, %lo(symbolA)
.endif
	.size   _start, .-_start

.ifdef __compact__
	.section .text.__global_pointer__, "aMG", @progbits, 8, __global_pointer__, comdat
	.align 3
	.hidden __global_pointer__
	.type   __global_pointer__, object
__global_pointer__:
	.quad   __global_pointer$ -.
.endif

	.data
symbolA:
	.dword  0x1122334455667788

.ifdef __undefweak__
	.weak	symbolW
.endif
