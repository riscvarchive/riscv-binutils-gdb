# Widening Vector Arithmetic Instructions (VV)
# Quad-Widening Vector Arithmetic Instructions (VV)

	vwaddu.vv v0, v2, v4		# OK
	vwaddu.vv v1, v2, v4		# vd should be multiple of 2
	vwaddu.vv v2, v2, v4		# vd overlap vs2
	vwaddu.vv v2, v3, v4		# vd overlap vs2
	vwaddu.vv v4, v2, v4		# vd overlap vs1
	vwaddu.vv v4, v2, v5		# vd overlap vs1
	vwaddu.vv v0, v2, v4, v0.t	# vd overlap vm

	vwsubu.vv v0, v2, v4		# OK
	vwsubu.vv v1, v2, v4		# vd should be multiple of 2
	vwsubu.vv v2, v2, v4		# vd overlap vs2
	vwsubu.vv v2, v3, v4		# vd overlap vs2
	vwsubu.vv v4, v2, v4		# vd overlap vs1
	vwsubu.vv v4, v2, v5		# vd overlap vs1
	vwsubu.vv v0, v2, v4, v0.t	# vd overlap vm

	vwadd.vv v0, v2, v4		# OK
	vwadd.vv v1, v2, v4		# vd should be multiple of 2
	vwadd.vv v2, v2, v4		# vd overlap vs2
	vwadd.vv v2, v3, v4		# vd overlap vs2
	vwadd.vv v4, v2, v4		# vd overlap vs1
	vwadd.vv v4, v2, v5		# vd overlap vs1
	vwadd.vv v0, v2, v4, v0.t	# vd overlap vm

	vwsub.vv v0, v2, v4		# OK
	vwsub.vv v1, v2, v4		# vd should be multiple of 2
	vwsub.vv v2, v2, v4		# vd overlap vs2
	vwsub.vv v2, v3, v4		# vd overlap vs2
	vwsub.vv v4, v2, v4		# vd overlap vs1
	vwsub.vv v4, v2, v5		# vd overlap vs1
	vwsub.vv v0, v2, v4, v0.t	# vd overlap vm

	vwmul.vv v0, v2, v4		# OK
	vwmul.vv v1, v2, v4		# vd should be multiple of 2
	vwmul.vv v2, v2, v4		# vd overlap vs2
	vwmul.vv v2, v3, v4		# vd overlap vs2
	vwmul.vv v4, v2, v4		# vd overlap vs1
	vwmul.vv v4, v2, v5		# vd overlap vs1
	vwmul.vv v0, v2, v4, v0.t	# vd overlap vm

	vwmulu.vv v0, v2, v4		# OK
	vwmulu.vv v1, v2, v4		# vd should be multiple of 2
	vwmulu.vv v2, v2, v4		# vd overlap vs2
	vwmulu.vv v2, v3, v4		# vd overlap vs2
	vwmulu.vv v4, v2, v4		# vd overlap vs1
	vwmulu.vv v4, v2, v5		# vd overlap vs1
	vwmulu.vv v0, v2, v4, v0.t	# vd overlap vm

	vwmulsu.vv v0, v2, v4		# OK
	vwmulsu.vv v1, v2, v4		# vd should be multiple of 2
	vwmulsu.vv v2, v2, v4		# vd overlap vs2
	vwmulsu.vv v2, v3, v4		# vd overlap vs2
	vwmulsu.vv v4, v2, v4		# vd overlap vs1
	vwmulsu.vv v4, v2, v5		# vd overlap vs1
	vwmulsu.vv v0, v2, v4, v0.t	# vd overlap vm

	vwmaccu.vv v0, v2, v4		# OK
	vwmaccu.vv v1, v2, v4		# vd should be multiple of 2
	vwmaccu.vv v2, v2, v4		# vd overlap vs1
	vwmaccu.vv v2, v3, v4		# vd overlap vs1
	vwmaccu.vv v4, v2, v4		# vd overlap vs2
	vwmaccu.vv v4, v2, v5		# vd overlap vs2
	vwmaccu.vv v0, v2, v4, v0.t	# vd overlap vm

	vwmacc.vv v0, v2, v4		# OK
	vwmacc.vv v1, v2, v4		# vd should be multiple of 2
	vwmacc.vv v2, v2, v4		# vd overlap vs1
	vwmacc.vv v2, v3, v4		# vd overlap vs1
	vwmacc.vv v4, v2, v4		# vd overlap vs2
	vwmacc.vv v4, v2, v5		# vd overlap vs2
	vwmacc.vv v0, v2, v4, v0.t	# vd overlap vm

	vwmaccsu.vv v0, v2, v4		# OK
	vwmaccsu.vv v1, v2, v4		# vd should be multiple of 2
	vwmaccsu.vv v2, v2, v4		# vd overlap vs1
	vwmaccsu.vv v2, v3, v4		# vd overlap vs1
	vwmaccsu.vv v4, v2, v4		# vd overlap vs2
	vwmaccsu.vv v4, v2, v5		# vd overlap vs2
	vwmaccsu.vv v0, v2, v4, v0.t	# vd overlap vm

	vqmaccu.vv v0, v4, v8		# OK
	vqmaccu.vv v2, v4, v8		# vd should be multiple of 4
	vqmaccu.vv v4, v4, v8		# vd overlap vs1
	vqmaccu.vv v4, v6, v8		# vd overlap vs1
	vqmaccu.vv v8, v4, v8		# vd overlap vs2
	vqmaccu.vv v8, v4, v10		# vd overlap vs2
	vqmaccu.vv v0, v4, v8, v0.t	# vd overlap vm

	vqmacc.vv v0, v4, v8		# OK
	vqmacc.vv v2, v4, v8		# vd should be multiple of 4
	vqmacc.vv v4, v4, v8		# vd overlap vs1
	vqmacc.vv v4, v6, v8		# vd overlap vs1
	vqmacc.vv v8, v4, v8		# vd overlap vs2
	vqmacc.vv v8, v4, v10		# vd overlap vs2
	vqmacc.vv v0, v4, v8, v0.t	# vd overlap vm

	vqmaccsu.vv v0, v4, v8		# OK
	vqmaccsu.vv v2, v4, v8		# vd should be multiple of 4
	vqmaccsu.vv v4, v4, v8		# vd overlap vs1
	vqmaccsu.vv v4, v6, v8		# vd overlap vs1
	vqmaccsu.vv v8, v4, v8		# vd overlap vs2
	vqmaccsu.vv v8, v4, v10		# vd overlap vs2
	vqmaccsu.vv v0, v4, v8, v0.t	# vd overlap vm

	vfwadd.vv v0, v2, v4		# OK
	vfwadd.vv v1, v2, v4		# vd should be multiple of 2
	vfwadd.vv v2, v2, v4		# vd overlap vs2
	vfwadd.vv v2, v3, v4		# vd overlap vs2
	vfwadd.vv v4, v2, v4		# vd overlap vs1
	vfwadd.vv v4, v2, v5		# vd overlap vs1
	vfwadd.vv v0, v2, v4, v0.t	# vd overlap vm

	vfwsub.vv v0, v2, v4		# OK
	vfwsub.vv v1, v2, v4		# vd should be multiple of 2
	vfwsub.vv v2, v2, v4		# vd overlap vs2
	vfwsub.vv v2, v3, v4		# vd overlap vs2
	vfwsub.vv v4, v2, v4		# vd overlap vs1
	vfwsub.vv v4, v2, v5		# vd overlap vs1
	vfwsub.vv v0, v2, v4, v0.t	# vd overlap vm

	vfwmul.vv v0, v2, v4		# OK
	vfwmul.vv v1, v2, v4		# vd should be multiple of 2
	vfwmul.vv v2, v2, v4		# vd overlap vs2
	vfwmul.vv v2, v3, v4		# vd overlap vs2
	vfwmul.vv v4, v2, v4		# vd overlap vs1
	vfwmul.vv v4, v2, v5		# vd overlap vs1
	vfwmul.vv v0, v2, v4, v0.t	# vd overlap vm

	vfwmacc.vv v0, v2, v4		# OK
	vfwmacc.vv v1, v2, v4		# vd should be multiple of 2
	vfwmacc.vv v2, v2, v4		# vd overlap vs1
	vfwmacc.vv v2, v3, v4		# vd overlap vs1
	vfwmacc.vv v4, v2, v4		# vd overlap vs2
	vfwmacc.vv v4, v2, v5		# vd overlap vs2
	vfwmacc.vv v0, v2, v4, v0.t	# vd overlap vm

	vfwnmacc.vv v0, v2, v4		# OK
	vfwnmacc.vv v1, v2, v4		# vd should be multiple of 2
	vfwnmacc.vv v2, v2, v4		# vd overlap vs1
	vfwnmacc.vv v2, v3, v4		# vd overlap vs1
	vfwnmacc.vv v4, v2, v4		# vd overlap vs2
	vfwnmacc.vv v4, v2, v5		# vd overlap vs2
	vfwnmacc.vv v0, v2, v4, v0.t	# vd overlap vm

	vfwmsac.vv v0, v2, v4		# OK
	vfwmsac.vv v1, v2, v4		# vd should be multiple of 2
	vfwmsac.vv v2, v2, v4		# vd overlap vs1
	vfwmsac.vv v2, v3, v4		# vd overlap vs1
	vfwmsac.vv v4, v2, v4		# vd overlap vs2
	vfwmsac.vv v4, v2, v5		# vd overlap vs2
	vfwmsac.vv v0, v2, v4, v0.t	# vd overlap vm

	vfwnmsac.vv v0, v2, v4		# OK
	vfwnmsac.vv v1, v2, v4		# vd should be multiple of 2
	vfwnmsac.vv v2, v2, v4		# vd overlap vs1
	vfwnmsac.vv v2, v3, v4		# vd overlap vs1
	vfwnmsac.vv v4, v2, v4		# vd overlap vs2
	vfwnmsac.vv v4, v2, v5		# vd overlap vs2
	vfwnmsac.vv v0, v2, v4, v0.t	# vd overlap vm
