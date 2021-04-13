target:
	clz	a0, a0
	ctz	a0, a0
	cpop	a0, a0
	min	a0, a1, a2
	minu	a0, a1, a2
	max	a0, a1, a2
	maxu	a0, a1, a2
	sext.b	a0, a0
	sext.h	a0, a0
	zext.h	a0, a0
	andn	a0, a1, a2
	orn	a0, a1, a2
	xnor	a0, a1, a2
	rol	a0, a1, a2
	ror	a0, a1, a2
	ror	a0, a1, 2
	rori	a0, a1, 2
	rev8	a0, a0
	orc.b	a0, a0
	sh1add	a0, a1, a2
	sh2add	a0, a1, a2
	sh3add	a0, a1, a2
	clmul	a0, a1, a2
	clmulh	a0, a1, a2
	clmulr	a0, a1, a2
	clzw	a0, a0
	ctzw	a0, a0
	cpopw	a0, a0
	rolw	a0, a1, a2
	rorw	a0, a1, a2
	rorw	a0, a1, 2
	roriw	a0, a1, 2
	sh1add.uw	a0, a1, a2
	sh2add.uw	a0, a1, a2
	sh3add.uw	a0, a1, a2
	add.uw	a0, a1, a2
	zext.w	a0, a1
	slli.uw	a0, a1, 2
	pack    a0, a1, a2
	packu   a0, a1, a2
	packh   a0, a1, a2
	packw   a0, a1, 2
	packuw  a0, a1, 2
	grev    a0, a1, a2
	grevi   a0, a1, 2
	grevw   a0, a1, 2
	greviw  a0, a1, 2
	gorc    a0, a1, a2
	gorci   a0, a1, 2
	gorcw   a0, a1, 2
	gorciw  a0, a1, 2
	shfl    a0, a1, a2
	shfli   a0, a1, 2
	shflw   a0, a1, 2
	unshfl  a0, a1, a2
	unshfli a0, a1, 2
	unshflw a0, a1, 2
	xperm.n a0, a1, a2
	xperm.b a0, a1, a2
	xperm.h a0, a1, a2
	xperm.w a0, a1, 2
	bset    a0, a1, a2
	bclr    a0, a1, a2
	binv    a0, a1, a2
	bext    a0, a1, a2
	bdep    a0, a1, a2
	bseti   a0, a1, 2
	bclri   a0, a1, 2
	binvi   a0, a1, 2
	bexti   a0, a1, 2
	bdepi   a0, a1, 2
	bsetw   a0, a1, 2
	bclrw   a0, a1, 2
	binvw   a0, a1, 2
	bextw   a0, a1, 2
	bdepw   a0, a1, 2
	bsetiw  a0, a1, 2
	bclriw  a0, a1, 2
	binviw  a0, a1, 2
	slo     a0, a1, a2
	sro     a0, a1, a2
	sloi    a0, a1, 2
	sroi    a0, a1, 2
	slow    a0, a1, 2
	srow    a0, a1, 2
	sloiw   a0, a1, 2
	sroiw   a0, a1, 2
	bfp     a0, a1, a2
	bfpw    a0, a1, a2
	bmator  a0, a1, a2
	bmatxor a0, a1, a2
	bmatflip    a0, a0
	crc32.b a0, a1, a2
	crc32.h a0, a1, a2
	crc32.w a0, a1, a2
	crc32c.b        a0, a1, a2
	crc32c.h        a0, a1, a2
	crc32c.w        a0, a1, a2
	crc32.d a0, a1, 2
	crc32c.d        a0, a1, 2
	cmix    a0, a1, a2, a3
	cmov    a0, a1, a2, a3
	fsl     a0, a1, a2, a3
	fsr     a0, a1, a2, a3
	fsri    a0, a1,  2, a3
	fslw    a0, a1,  2, a3
	fsrw    a0, a1,  2, a3
	fsriw   a0, a1,  2, a3