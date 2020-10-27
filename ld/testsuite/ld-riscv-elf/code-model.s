	.text
	.global _start
_start:

.ifdef __compact__
	# Compact prolog.
.L1:
	auipc	gp, %pcrel_hi(__global_pointer__)
	addi	gp, gp, %pcrel_lo(.L1)
	ld	t0, 0(gp)
	add	gp, gp, t0
.ifdef __undefweak__
	# Refer to undefined weak symbol by GPREL.
	lui	t0, %gprel_hi(symbolW)
	add	t0, t0, gp, %gprel(symbolW)
	addi	t0, t0, %gprel_lo(symbolW)
	# Refer to undefined weak symbol by GOT_GPREL.
	lui	t0, %got_gprel_hi(symbolW)
	add	t0, t0, gp, %got_gprel(symbolW)
	ld	t0, %got_gprel_lo(symbolW)(t0)
.else
	# Refer to local data symbol by GPREL.
	lui	t0, %gprel_hi(symbolL)
	add	t0, t0, gp, %gprel(symbolL)
	addi	t0, t0, %gprel_lo(symbolL)
	# Refer to global data symbol by GPREL.
	lui	t0, %gprel_hi(symbolG)
	add	t0, t0, gp, %gprel(symbolG)
	addi	t0, t0, %gprel_lo(symbolG)
	# Refer to local data symbol by GOT_GPREL.
	lui	t0, %got_gprel_hi(symbolL)
	add	t0, t0, gp, %got_gprel(symbolL)
	ld	t0, %got_gprel_lo(symbolL)(t0)
	# Refer to global data symbol by GOT_GPREL.
	lui	t0, %got_gprel_hi(symbolG)
	add	t0, t0, gp, %got_gprel(symbolG)
	ld	t0, %got_gprel_lo(symbolG)(t0)
.endif
.endif

.ifdef __medany__
	.option pic
.ifdef __undefweak__
	# Refer to undefined weak symbol by GOT_PCREL.
	la	t0, symbolW
	.option nopic
.else
	# Refer to global data symbol by GOT_PCREL.
	la	t0, symbolG
	.option nopic
	# Refer to local data symbol by PCREL.
	lla	t0, symbolL
	# Refer to non-pic data global symbol by PCREL.
	la	t0, symbolG
.endif
.endif

.ifdef __medlow__
.ifdef __undefweak__
	# Refer to undefined weak symbol by absolutely access.
	lui	t0, %hi(symbolW)
	addi	t0, t0, %lo(symbolW)
.else
	# Refer to local data symbol by absolutely access.
	lui	t0, %hi(symbolL)
	addi	t0, t0, %lo(symbolL)
	# Refer to global data symbol by absolutely access.
	lui	t0, %hi(symbolG)
	addi	t0, t0, %lo(symbolG)
.endif
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
	.global symbolG
symbolL:
	.dword	0x1111222233334444
symbolG:
	.dword	0x5555666677778888

.ifdef __undefweak__
	.weak	symbolW
.endif
