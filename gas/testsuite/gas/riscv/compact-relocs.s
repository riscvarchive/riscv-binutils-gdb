# GPREL LLA
lui	a0, %gprel_hi(foo)
add	a0, a0, gp, %gprel (foo)	# Relaxation purpose
addi	a0, a0, %gprel_lo(foo)
# GOT GPREL LA
lui	a0, %got_gprel_hi(foo)
add	a0, a0, gp, %got_gprel(foo)	# Relaxation purpose
addi	a0, a0, %got_gprel_lo(foo)
# GPREL LO12_I
lb	a0, %gprel_lo(foo)(a0)
lh	a0, %gprel_lo(foo)(a0)
lw	a0, %gprel_lo(foo)(a0)
ld	a0, %gprel_lo(foo)(a0)
lbu	a0, %gprel_lo(foo)(a0)
lhu	a0, %gprel_lo(foo)(a0)
lwu	a0, %gprel_lo(foo)(a0)
flw	fa0, %gprel_lo(foo)(a1)
fld	fa0, %gprel_lo(foo)(a1)
flq	fa0, %gprel_lo(foo)(a1)
# GPREL LO12_S
sb	a0, %gprel_lo(foo)(a1)
sh	a0, %gprel_lo(foo)(a1)
sw	a0, %gprel_lo(foo)(a1)
sd	a0, %gprel_lo(foo)(a1)
fsw	fa0, %gprel_lo(foo)(a1)
fsd	fa0, %gprel_lo(foo)(a1)
fsq	fa0, %gprel_lo(foo)(a1)
# GOT GPREL LO12_I
lb	a0, %got_gprel_lo(foo)(a0)
lh	a0, %got_gprel_lo(foo)(a0)
lw	a0, %got_gprel_lo(foo)(a0)
ld	a0, %got_gprel_lo(foo)(a0)
lbu	a0, %got_gprel_lo(foo)(a0)
lhu	a0, %got_gprel_lo(foo)(a0)
lwu	a0, %got_gprel_lo(foo)(a0)
flw	fa0, %got_gprel_lo(foo)(a1)
fld	fa0, %got_gprel_lo(foo)(a1)
flq	fa0, %got_gprel_lo(foo)(a1)
