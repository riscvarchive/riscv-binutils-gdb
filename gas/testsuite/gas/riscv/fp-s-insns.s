target:
	flw		fa0, 0(a1)
	fsw		fa0, 0(a1)
	flw		fa0, target, a1
	fsw		fa0, target, a1

	fmv.s		fa0, fa1
	fneg.s		fa0, fa1
	fabs.s		fa0, fa1
	fsgnj.s		fa0, fa1, fa2
	fsgnjn.s	fa0, fa1, fa2
	fsgnjx.s	fa0, fa1, fa2

	fadd.s		fa0, fa1, fa2
	fadd.s		fa0, fa1, fa2, rne
	fsub.s		fa0, fa1, fa2
	fsub.s		fa0, fa1, fa2, rne
	fmul.s		fa0, fa1, fa2
	fmul.s		fa0, fa1, fa2, rne
	fdiv.s		fa0, fa1, fa2
	fdiv.s		fa0, fa1, fa2, rne
	fsqrt.s		fa0, fa1
	fsqrt.s		fa0, fa1, rne
	fmin.s		fa0, fa1, fa2
	fmax.s		fa0, fa1, fa2

	fmadd.s		fa0, fa1, fa2, fa3
	fmadd.s		fa0, fa1, fa2, fa3, rne
	fnmadd.s	fa0, fa1, fa2, fa3
	fnmadd.s	fa0, fa1, fa2, fa3, rne
	fmsub.s		fa0, fa1, fa2, fa3
	fmsub.s		fa0, fa1, fa2, fa3, rne
	fnmsub.s	fa0, fa1, fa2, fa3
	fnmsub.s	fa0, fa1, fa2, fa3, rne

	fcvt.w.s	a0, fa1
	fcvt.w.s	a0, fa1, rne
	fcvt.wu.s	a0, fa1
	fcvt.wu.s	a0, fa1, rne
	fcvt.s.w	fa0, a1
	fcvt.s.w	fa0, a1,rne
	fcvt.s.wu	fa0, a1
	fcvt.s.wu	fa0, a1,rne
	fcvt.l.s	a0, fa1
	fcvt.l.s	a0, fa1, rne
	fcvt.lu.s	a0, fa1
	fcvt.lu.s	a0, fa1, rne
	fcvt.s.l	fa0, a1
	fcvt.s.l	fa0, a1, rne
	fcvt.s.lu	fa0, a1
	fcvt.s.lu	fa0, a1, rne

	fmv.x.w		a0, fa1
	fmv.w.x		fa0, a1
	fmv.x.s		a0, fa1
	fmv.s.x		fa0, a1

	fclass.s	a0, fa1

	feq.s		a0, fa1, fa2
	flt.s		a0, fa1, fa2
	fle.s		a0, fa1, fa2
	fgt.s		a0, fa2, fa1
	fge.s		a0, fa2, fa1
