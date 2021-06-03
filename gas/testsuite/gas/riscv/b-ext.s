target:
	clz	 a0, a0
	ctz	 a0, a0
	cpop	 a0, a0
	min	 a0, a1, a2
	minu	 a0, a1, a2
	max	 a0, a1, a2
	maxu	 a0, a1, a2
	sext.b	 a0, a0
	sext.h	 a0, a0
	zext.h	 a0, a0
	andn	 a0, a1, a2
	orn	 a0, a1, a2
	xnor	 a0, a1, a2
	rol	 a0, a1, a2
	ror	 a0, a1, a2
	ror	 a0, a1, 2
	rori	 a0, a1, 2
	sh1add	 a0, a1, a2
	sh2add	 a0, a1, a2
	sh3add	 a0, a1, a2
	clmul	 a0, a1, a2
	clmulh	 a0, a1, a2
	clmulr	 a0, a1, a2
	pack	 a0, a1, a2
	packu	 a0, a1, a2
	packh	 a0, a1, a2
	grev	 a0, a1, a2
	grevi	 a0, a1, 2
	rev	 a0, a0
	rev.p	 a0, a0
	rev.n	 a0, a0
	rev.b	 a0, a0
	rev.h	 a0, a0
	rev2	 a0, a0
	rev2.n	 a0, a0
	rev2.b	 a0, a0
	rev2.h	 a0, a0
	rev4	 a0, a0
	rev4.b	 a0, a0
	rev4.h	 a0, a0
	rev8	 a0, a0
	rev8.h	 a0, a0
	rev16	 a0, a0
	gorc	 a0, a1, a2
	gorci	 a0, a1, 2
	orc	 a0, a0
	orc.p	 a0, a0
	orc.n	 a0, a0
	orc.b	 a0, a0
	orc.h	 a0, a0
	orc2	 a0, a0
	orc2.n	 a0, a0
	orc2.b	 a0, a0
	orc2.h	 a0, a0
	orc4	 a0, a0
	orc4.b	 a0, a0
	orc4.h	 a0, a0
	orc8	 a0, a0
	orc8.h	 a0, a0
	orc16	 a0, a0
	shfl	 a0, a1, a2
	shfli	 a0, a1, 2
	zip	 a0, a0
	zip.n	 a0, a0
	zip.b	 a0, a0
	zip.h	 a0, a0
	zip2	 a0, a0
	zip2.b	 a0, a0
	zip2.h	 a0, a0
	zip4	 a0, a0
	zip4.h	 a0, a0
	zip8	 a0, a0
	unshfl	 a0, a1, a2
	unshfli	 a0, a1, 2
	unzip	 a0, a0
	unzip.n	 a0, a0
	unzip.b	 a0, a0
	unzip.h	 a0, a0
	unzip2	 a0, a0
	unzip2.b	 a0, a0
	unzip2.h	 a0, a0
	unzip4	 a0, a0
	unzip4.h	 a0, a0
	unzip8	 a0, a0
	xperm.n	 a0, a1, a2
	xperm.b	 a0, a1, a2
	xperm.h	 a0, a1, a2
	bset	 a0, a1, a2
	bclr	 a0, a1, a2
	binv	 a0, a1, a2
	bext	 a0, a1, a2
	bdep	 a0, a1, a2
	bseti	 a0, a1, 2
	bclri	 a0, a1, 2
	binvi	 a0, a1, 2
	bexti	 a0, a1, 2
	slo	 a0, a1, a2
	sro	 a0, a1, a2
	sloi	 a0, a1, 2
	sroi	 a0, a1, 2
	bfp	 a0, a1, a2
	crc32.b	 a0, a0
	crc32.h	 a0, a0
	crc32.w	 a0, a0
	crc32c.b	 a0, a0
	crc32c.h	 a0, a0
	crc32c.w	 a0, a0
	cmix	 a0, a1, a2, a3
	cmov	 a0, a1, a2, a3
	fsl	 a0, a1, a2, a3
	fsr	 a0, a1, a2, a3
	fsri	 a0, a1, 2, a3
