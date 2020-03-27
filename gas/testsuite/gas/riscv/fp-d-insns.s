target:
	fld		fa0, 0(a1)
	fsd		fa0, 0(a1)
	fld		fa0, target, a1
	fsd		fa0, target, a1

	fmv.d		fa0, fa1
	fneg.d		fa0, fa1
	fabs.d		fa0, fa1
	fsgnj.d		fa0, fa1, fa2
	fsgnjn.d	fa0, fa1, fa2
	fsgnjx.d	fa0, fa1, fa2

	fadd.d		fa0, fa1, fa2
	fadd.d		fa0, fa1, fa2, rne
	fsub.d		fa0, fa1, fa2
	fsub.d		fa0, fa1, fa2, rne
	fmul.d		fa0, fa1, fa2
	fmul.d		fa0, fa1, fa2, rne
	fdiv.d		fa0, fa1, fa2
	fdiv.d		fa0, fa1, fa2, rne
	fsqrt.d		fa0, fa1
	fsqrt.d		fa0, fa1, rne
	fmin.d		fa0, fa1, fa2
	fmax.d		fa0, fa1, fa2

	fmadd.d		fa0, fa1, fa2, fa3
	fmadd.d		fa0, fa1, fa2, fa3, rne
	fnmadd.d	fa0, fa1, fa2, fa3
	fnmadd.d	fa0, fa1, fa2, fa3, rne
	fmsub.d		fa0, fa1, fa2, fa3
	fmsub.d		fa0, fa1, fa2, fa3, rne
	fnmsub.d	fa0, fa1, fa2, fa3
	fnmsub.d	fa0, fa1, fa2, fa3, rne

	fcvt.w.d	a0, fa1
	fcvt.w.d	a0, fa1, rne
	fcvt.wu.d	a0, fa1
	fcvt.wu.d	a0, fa1, rne
	fcvt.d.w	fa0, a1
	fcvt.d.wu	fa0, a1
	fcvt.l.d	a0, fa1
	fcvt.l.d	a0, fa1, rne
	fcvt.lu.d	a0, fa1
	fcvt.lu.d	a0, fa1, rne
	fcvt.d.l	fa0, a1
	fcvt.d.l	fa0, a1, rne
	fcvt.d.lu	fa0, a1
	fcvt.d.lu	fa0, a1, rne

	fmv.x.d		a0, fa1
	fmv.d.x		fa0, a1

	fcvt.s.d	fa0, fa1
	fcvt.s.d	fa0, fa1, rne
	fcvt.d.s	fa0, fa1
	fclass.d	a0, fa1

	feq.d		a0, fa1, fa2
	flt.d		a0, fa1, fa2
	fle.d		a0, fa1, fa2
	fgt.d		a0, fa2, fa1
	fge.d		a0, fa2, fa1
