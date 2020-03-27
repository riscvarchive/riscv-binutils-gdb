target:
	flq		fa0, 0(a1)
	fsq		fa0, 0(a1)

	fmv.q		fa0, fa1
	fneg.q		fa0, fa1
	fabs.q		fa0, fa1
	fsgnj.q		fa0, fa1, fa2
	fsgnjn.q	fa0, fa1, fa2
	fsgnjx.q	fa0, fa1, fa2

	fadd.q		fa0, fa1, fa2
	fadd.q		fa0, fa1, fa2, rne
	fsub.q		fa0, fa1, fa2
	fsub.q		fa0, fa1, fa2, rne
	fmul.q		fa0, fa1, fa2
	fmul.q		fa0, fa1, fa2, rne
	fdiv.q		fa0, fa1, fa2
	fdiv.q		fa0, fa1, fa2, rne
	fsqrt.q		fa0, fa1
	fsqrt.q		fa0, fa1, rne
	fmin.q		fa0, fa1, fa2
	fmax.q		fa0, fa1, fa2

	fmadd.q		fa0, fa1, fa2, fa3
	fmadd.q		fa0, fa1, fa2, fa3, rne
	fnmadd.q	fa0, fa1, fa2, fa3
	fnmadd.q	fa0, fa1, fa2, fa3, rne
	fmsub.q		fa0, fa1, fa2, fa3
	fmsub.q		fa0, fa1, fa2, fa3, rne
	fnmsub.q	fa0, fa1, fa2, fa3
	fnmsub.q	fa0, fa1, fa2, fa3, rne

	fcvt.w.q	a0, fa1
	fcvt.w.q	a0, fa1, rne
	fcvt.wu.q	a0, fa1
	fcvt.wu.q	a0, fa1, rne
	fcvt.q.w	fa0, a1
	fcvt.q.wu	fa0, a1
	fcvt.l.q	a0, fa1
	fcvt.l.q	a0, fa1, rne
	fcvt.lu.q	a0, fa1
	fcvt.lu.q	a0, fa1, rne
	fcvt.q.l	fa0, a1
	fcvt.q.l	fa0, a1, rne
	fcvt.q.lu	fa0, a1
	fcvt.q.lu	fa0, a1, rne

	fmv.x.q		a0, fa1
	fmv.q.x		fa0, a1

	fcvt.s.q	fa0, fa1
	fcvt.s.q	fa0, fa1, rne
	fcvt.d.q	fa0, fa1
	fcvt.d.q	fa0, fa1, rne
	fcvt.q.s	fa0, fa1
	fcvt.q.d	fa0, fa1
	fclass.q	a0, fa1

	feq.q		a0, fa1, fa2
	flt.q		a0, fa1, fa2
	fle.q		a0, fa1, fa2
	fgt.q		a0, fa2, fa1
	fge.q		a0, fa2, fa1
