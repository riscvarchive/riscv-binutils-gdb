# Widening Vector Arithmetic Instructions (V[X|F])

	vwcvt.x.x.v v0, v2		# OK
	vwcvt.x.x.v v1, v2		# vd should be multiple of 2
	vwcvt.x.x.v v2, v2		# vd overlap vs2
	vwcvt.x.x.v v2, v3		# vd overlap vs2
	vwcvt.x.x.v v0, v2, v0.t	# vd overlap vm

	vwcvtu.x.x.v v0, v2		# OK
	vwcvtu.x.x.v v1, v2		# vd should be multiple of 2
	vwcvtu.x.x.v v2, v2		# vd overlap vs2
	vwcvtu.x.x.v v2, v3		# vd overlap vs2
	vwcvtu.x.x.v v0, v2, v0.t	# vd overlap vm

	vwaddu.vx v0, v2, a1		# OK
	vwaddu.vx v1, v2, a1		# vd should be multiple of 2
	vwaddu.vx v2, v2, a1		# vd overlap vs2
	vwaddu.vx v2, v3, a1		# vd overlap vs2
	vwaddu.vx v0, v2, a1, v0.t	# vd overlap vm

	vwsubu.vx v0, v2, a1		# OK
	vwsubu.vx v1, v2, a1		# vd should be multiple of 2
	vwsubu.vx v2, v2, a1		# vd overlap vs2
	vwsubu.vx v2, v3, a1		# vd overlap vs2
	vwsubu.vx v0, v2, a1, v0.t	# vd overlap vm

	vwadd.vx v0, v2, a1		# OK
	vwadd.vx v1, v2, a1		# vd should be multiple of 2
	vwadd.vx v2, v2, a1		# vd overlap vs2
	vwadd.vx v2, v3, a1		# vd overlap vs2
	vwadd.vx v0, v2, a1, v0.t	# vd overlap vm

	vwsub.vx v0, v2, a1		# OK
	vwsub.vx v1, v2, a1		# vd should be multiple of 2
	vwsub.vx v2, v2, a1		# vd overlap vs2
	vwsub.vx v2, v3, a1		# vd overlap vs2
	vwsub.vx v0, v2, a1, v0.t	# vd overlap vm

	vwmul.vx v0, v2, a1		# OK
	vwmul.vx v1, v2, a1		# vd should be multiple of 2
	vwmul.vx v2, v2, a1		# vd overlap vs2
	vwmul.vx v2, v3, a1		# vd overlap vs2
	vwmul.vx v0, v2, a1, v0.t	# vd overlap vm

	vwmulu.vx v0, v2, a1		# OK
	vwmulu.vx v1, v2, a1		# vd should be multiple of 2
	vwmulu.vx v2, v2, a1		# vd overlap vs2
	vwmulu.vx v2, v3, a1		# vd overlap vs2
	vwmulu.vx v0, v2, a1, v0.t	# vd overlap vm

	vwmulsu.vx v0, v2, a1		# OK
	vwmulsu.vx v1, v2, a1		# vd should be multiple of 2
	vwmulsu.vx v2, v2, a1		# vd overlap vs2
	vwmulsu.vx v2, v3, a1		# vd overlap vs2
	vwmulsu.vx v0, v2, a1, v0.t	# vd overlap vm

	vwmaccu.vx v0, a1, v4		# OK
	vwmaccu.vx v1, a1, v4		# vd should be multiple of 2
	vwmaccu.vx v4, a1, v4		# vd overlap vs2
	vwmaccu.vx v4, a1, v5		# vd overlap vs2
	vwmaccu.vx v0, a1, v4, v0.t	# vd overlap vm

	vwmacc.vx v0, a1, v4		# OK
	vwmacc.vx v1, a1, v4		# vd should be multiple of 2
	vwmacc.vx v4, a1, v4		# vd overlap vs2
	vwmacc.vx v4, a1, v5		# vd overlap vs2
	vwmacc.vx v0, a1, v4, v0.t	# vd overlap vm

	vwmaccsu.vx v0, a1, v4		# OK
	vwmaccsu.vx v1, a1, v4		# vd should be multiple of 2
	vwmaccsu.vx v4, a1, v4		# vd overlap vs2
	vwmaccsu.vx v4, a1, v5		# vd overlap vs2
	vwmaccsu.vx v0, a1, v4, v0.t	# vd overlap vm

	vwmaccus.vx v0, a1, v4		# OK
	vwmaccus.vx v1, a1, v4		# vd should be multiple of 2
	vwmaccus.vx v4, a1, v4		# vd overlap vs2
	vwmaccus.vx v4, a1, v5		# vd overlap vs2
	vwmaccus.vx v0, a1, v4, v0.t	# vd overlap vm

	vqmaccu.vx v0, a1, v4		# OK
	vqmaccu.vx v2, a1, v4		# vd should be multiple of 4
	vqmaccu.vx v4, a1, v4		# vd overlap vs2
	vqmaccu.vx v4, a1, v6		# vd overlap vs2
	vqmaccu.vx v0, a1, v4, v0.t	# vd overlap vm

	vqmacc.vx v0, a1, v4		# OK
	vqmacc.vx v2, a1, v4		# vd should be multiple of 4
	vqmacc.vx v4, a1, v4		# vd overlap vs2
	vqmacc.vx v4, a1, v6		# vd overlap vs2
	vqmacc.vx v0, a1, v4, v0.t	# vd overlap vm

	vqmaccsu.vx v0, a1, v4		# OK
	vqmaccsu.vx v2, a1, v4		# vd should be multiple of 4
	vqmaccsu.vx v4, a1, v4		# vd overlap vs2
	vqmaccsu.vx v4, a1, v6		# vd overlap vs2
	vqmaccsu.vx v0, a1, v4, v0.t	# vd overlap vm

	vqmaccus.vx v0, a1, v4		# OK
	vqmaccus.vx v2, a1, v4		# vd should be multiple of 4
	vqmaccus.vx v4, a1, v4		# vd overlap vs2
	vqmaccus.vx v4, a1, v6		# vd overlap vs2
	vqmaccus.vx v0, a1, v4, v0.t	# vd overlap vm

	vfwadd.vf v0, v2, fa1		# OK
	vfwadd.vf v1, v2, fa1		# vd should be multiple of 2
	vfwadd.vf v2, v2, fa1		# vd overlap vs2
	vfwadd.vf v2, v3, fa1		# vd overlap vs2
	vfwadd.vf v0, v2, fa1, v0.t	# vd overlap vm

	vfwsub.vf v0, v2, fa1		# OK
	vfwsub.vf v1, v2, fa1		# vd should be multiple of 2
	vfwsub.vf v2, v2, fa1		# vd overlap vs2
	vfwsub.vf v2, v3, fa1		# vd overlap vs2
	vfwsub.vf v0, v2, fa1, v0.t	# vd overlap vm

	vfwmul.vf v0, v2, fa1		# OK
	vfwmul.vf v1, v2, fa1		# vd should be multiple of 2
	vfwmul.vf v2, v2, fa1		# vd overlap vs2
	vfwmul.vf v2, v3, fa1		# vd overlap vs2
	vfwmul.vf v0, v2, fa1, v0.t	# vd overlap vm

	vfwmacc.vf v0, fa1, v4		# OK
	vfwmacc.vf v1, fa1, v4		# vd should be multiple of 2
	vfwmacc.vf v4, fa1, v4		# vd overlap vs2
	vfwmacc.vf v4, fa1, v5		# vd overlap vs2
	vfwmacc.vf v0, fa1, v4, v0.t	# vd overlap vm

	vfwnmacc.vf v0, fa1, v4		# OK
	vfwnmacc.vf v1, fa1, v4		# vd should be multiple of 2
	vfwnmacc.vf v4, fa1, v4		# vd overlap vs2
	vfwnmacc.vf v4, fa1, v5		# vd overlap vs2
	vfwnmacc.vf v0, fa1, v4, v0.t	# vd overlap vm

	vfwmsac.vf v0, fa1, v4		# OK
	vfwmsac.vf v1, fa1, v4		# vd should be multiple of 2
	vfwmsac.vf v4, fa1, v4		# vd overlap vs2
	vfwmsac.vf v4, fa1, v5		# vd overlap vs2
	vfwmsac.vf v0, fa1, v4, v0.t	# vd overlap vm

	vfwnmsac.vf v0, fa1, v4		# OK
	vfwnmsac.vf v1, fa1, v4		# vd should be multiple of 2
	vfwnmsac.vf v4, fa1, v4		# vd overlap vs2
	vfwnmsac.vf v4, fa1, v5		# vd overlap vs2
	vfwnmsac.vf v0, fa1, v4, v0.t	# vd overlap vm

	vfwcvt.xu.f.v v0, v2		# OK
	vfwcvt.xu.f.v v1, v2		# vd should be multiple of 2
	vfwcvt.xu.f.v v2, v2		# vd overlap vs2
	vfwcvt.xu.f.v v2, v3		# vd overlap vs2
	vfwcvt.xu.f.v v0, v2, v0.t	# vd overlap vm

	vfwcvt.x.f.v v0, v2		# OK
	vfwcvt.x.f.v v1, v2		# vd should be multiple of 2
	vfwcvt.x.f.v v2, v2		# vd overlap vs2
	vfwcvt.x.f.v v2, v3		# vd overlap vs2
	vfwcvt.x.f.v v0, v2, v0.t	# vd overlap vm

	vfwcvt.rtz.xu.f.v v0, v2	# OK
	vfwcvt.rtz.xu.f.v v1, v2	# vd should be multiple of 2
	vfwcvt.rtz.xu.f.v v2, v2	# vd overlap vs2
	vfwcvt.rtz.xu.f.v v2, v3	# vd overlap vs2
	vfwcvt.rtz.xu.f.v v0, v2, v0.t	# vd overlap vm

	vfwcvt.rtz.x.f.v v0, v2		# OK
	vfwcvt.rtz.x.f.v v1, v2		# vd should be multiple of 2
	vfwcvt.rtz.x.f.v v2, v2		# vd overlap vs2
	vfwcvt.rtz.x.f.v v2, v3		# vd overlap vs2
	vfwcvt.rtz.x.f.v v0, v2, v0.t	# vd overlap vm

	vfwcvt.f.xu.v v0, v2		# OK
	vfwcvt.f.xu.v v1, v2		# vd should be multiple of 2
	vfwcvt.f.xu.v v2, v2		# vd overlap vs2
	vfwcvt.f.xu.v v2, v3		# vd overlap vs2
	vfwcvt.f.xu.v v0, v2, v0.t	# vd overlap vm

	vfwcvt.f.x.v v0, v2		# OK
	vfwcvt.f.x.v v1, v2		# vd should be multiple of 2
	vfwcvt.f.x.v v2, v2		# vd overlap vs2
	vfwcvt.f.x.v v2, v3		# vd overlap vs2
	vfwcvt.f.x.v v0, v2, v0.t	# vd overlap vm

	vfwcvt.f.f.v v0, v2		# OK
	vfwcvt.f.f.v v1, v2		# vd should be multiple of 2
	vfwcvt.f.f.v v2, v2		# vd overlap vs2
	vfwcvt.f.f.v v2, v3		# vd overlap vs2
	vfwcvt.f.f.v v0, v2, v0.t	# vd overlap vm
