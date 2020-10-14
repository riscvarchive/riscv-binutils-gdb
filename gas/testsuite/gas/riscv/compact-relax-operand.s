foo:
# GPREL LOAD
lb	a0, 0(a1), %gprel(foo)
lh	a0, 0(a1), %gprel(foo)
lw	a0, 0(a1), %gprel(foo)
ld	a0, 0(a1), %gprel(foo)
lbu	a0, 0(a1), %gprel(foo)
lhu	a0, 0(a1), %gprel(foo)
lwu	a0, 0(a1), %gprel(foo)
flw	fa0, 0(a1), %gprel(foo)
fld	fa0, 0(a1), %gprel(foo)
flq	fa0, 0(a1), %gprel(foo)
# GPREL STORE
sb	a0, 0(a1), %gprel(foo)
sh	a0, 0(a1), %gprel(foo)
sw	a0, 0(a1), %gprel(foo)
sd	a0, 0(a1), %gprel(foo)
fsw	fa0, 0(a1), %gprel(foo)
fsd	fa0, 0(a1), %gprel(foo)
fsq	fa0, 0(a1), %gprel(foo)
# GOT GPREL LOAD
lb	a0, 0(a1), %got_gprel(foo)
lh	a0, 0(a1), %got_gprel(foo)
lw	a0, 0(a1), %got_gprel(foo)
ld	a0, 0(a1), %got_gprel(foo)
lbu	a0, 0(a1), %got_gprel(foo)
lhu	a0, 0(a1), %got_gprel(foo)
lwu	a0, 0(a1), %got_gprel(foo)
flw	fa0, 0(a1), %got_gprel(foo)
fld	fa0, 0(a1), %got_gprel(foo)
flq	fa0, 0(a1), %got_gprel(foo)
# GOT GPREL STORE
sb	a0, 0(a1), %got_gprel(foo)
sh	a0, 0(a1), %got_gprel(foo)
sw	a0, 0(a1), %got_gprel(foo)
sd	a0, 0(a1), %got_gprel(foo)
fsw	fa0, 0(a1), %got_gprel(foo)
fsd	fa0, 0(a1), %got_gprel(foo)
fsq	fa0, 0(a1), %got_gprel(foo)

bar:
# Check if the imm encodeing is correct or not.
# GPREL LOAD
lw	a0, 0(a1), %gprel(bar)
lw	a0, 0(a1), %gprel(bar+8)
lw	a0, 4(a1), %gprel(bar)
lw	a0, 4(a1), %gprel(bar+8)
# GPREL STORE
sw	a0, 0(a1), %gprel(bar)
sw	a0, 0(a1), %gprel(bar+8)
sw	a0, 4(a1), %gprel(bar)
sw	a0, 4(a1), %gprel(bar+8)
# GOT GPREL LOAD
lw	a0, 0(a1), %got_gprel(bar)
lw	a0, 0(a1), %got_gprel(bar+8)
lw	a0, 4(a1), %got_gprel(bar)
lw	a0, 4(a1), %got_gprel(bar+8)
# GOT GPREL STORE
sw	a0, 0(a1), %got_gprel(bar)
sw	a0, 0(a1), %got_gprel(bar+8)
sw	a0, 4(a1), %got_gprel(bar)
sw	a0, 4(a1), %got_gprel(bar+8)
