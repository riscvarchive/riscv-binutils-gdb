# Widening Vector Arithmetic Instructions (W[V|X])

	vwaddu.wv v0, v2, v4		# OK
	vwaddu.wv v1, v2, v4		# vd should be multiple of 2
	vwaddu.wv v2, v2, v4		# OK
	vwaddu.wv v2, v3, v4		# vs2 should be multiple of 2
	vwaddu.wv v4, v2, v4		# vd overlap vs1
	vwaddu.wv v4, v2, v5		# vd overlap vs1
	vwaddu.wv v0, v2, v4, v0.t	# vd overlap vm

	vwsubu.wv v0, v2, v4		# OK
	vwsubu.wv v1, v2, v4		# vd should be multiple of 2
	vwsubu.wv v2, v2, v4		# OK
	vwsubu.wv v2, v3, v4		# vs2 should be multiple of 2
	vwsubu.wv v4, v2, v4		# vd overlap vs1
	vwsubu.wv v4, v2, v5		# vd overlap vs1
	vwsubu.wv v0, v2, v4, v0.t	# vd overlap vm

	vwadd.wv v0, v2, v4		# OK
	vwadd.wv v1, v2, v4		# vd should be multiple of 2
	vwadd.wv v2, v2, v4		# OK
	vwadd.wv v2, v3, v4		# vs2 should be multiple of 2
	vwadd.wv v4, v2, v4		# vd overlap vs1
	vwadd.wv v4, v2, v5		# vd overlap vs1
	vwadd.wv v0, v2, v4, v0.t	# vd overlap vm

	vwsub.wv v0, v2, v4		# OK
	vwsub.wv v1, v2, v4		# vd should be multiple of 2
	vwsub.wv v2, v2, v4		# OK
	vwsub.wv v2, v3, v4		# vs2 should be multiple of 2
	vwsub.wv v4, v2, v4		# vd overlap vs1
	vwsub.wv v4, v2, v5		# vd overlap vs1
	vwsub.wv v0, v2, v4, v0.t	# vd overlap vm

	vfwadd.wv v0, v2, v4		# OK
	vfwadd.wv v1, v2, v4		# vd should be multiple of 2
	vfwadd.wv v2, v2, v4		# OK
	vfwadd.wv v2, v3, v4		# vs2 should be multiple of 2
	vfwadd.wv v4, v2, v4		# vd overlap vs1
	vfwadd.wv v4, v2, v5		# vd overlap vs1
	vfwadd.wv v0, v2, v4, v0.t	# vd overlap vm

	vfwsub.wv v0, v2, v4		# OK
	vfwsub.wv v1, v2, v4		# vd should be multiple of 2
	vfwsub.wv v2, v2, v4		# OK
	vfwsub.wv v2, v3, v4		# vs2 should be multiple of 2
	vfwsub.wv v4, v2, v4		# vd overlap vs1
	vfwsub.wv v4, v2, v5		# vd overlap vs1
	vfwsub.wv v0, v2, v4, v0.t	# vd overlap vm

	vwaddu.wx v0, v2, a1		# OK
	vwaddu.wx v1, v2, a1		# vd should be multiple of 2
	vwaddu.wx v2, v2, a1		# OK
	vwaddu.wx v2, v3, a1		# vs2 should be multiple of 2
	vwaddu.wx v0, v2, a1, v0.t	# vd overlap vm

	vwsubu.wx v0, v2, a1		# OK
	vwsubu.wx v1, v2, a1		# vd should be multiple of 2
	vwsubu.wx v2, v2, a1		# OK
	vwsubu.wx v2, v3, a1		# vs2 should be multiple of 2
	vwsubu.wx v0, v2, a1, v0.t	# vd overlap vm

	vwadd.wx v0, v2, a1		# OK
	vwadd.wx v1, v2, a1		# vd should be multiple of 2
	vwadd.wx v2, v2, a1		# OK
	vwadd.wx v2, v3, a1		# vs2 should be multiple of 2
	vwadd.wx v0, v2, a1, v0.t	# vd overlap vm

	vwsub.wx v0, v2, a1		# OK
	vwsub.wx v1, v2, a1		# vd should be multiple of 2
	vwsub.wx v2, v2, a1		# OK
	vwsub.wx v2, v3, a1		# vs2 should be multiple of 2
	vwsub.wx v0, v2, a1, v0.t	# vd overlap vm

	vfwadd.wf v0, v2, fa1		# OK
	vfwadd.wf v1, v2, fa1		# vd should be multiple of 2
	vfwadd.wf v2, v2, fa1		# OK
	vfwadd.wf v2, v3, fa1		# vs2 should be multiple of 2
	vfwadd.wf v0, v2, fa1, v0.t	# vd overlap vm

	vfwsub.wf v0, v2, fa1		# OK
	vfwsub.wf v1, v2, fa1		# vd should be multiple of 2
	vfwsub.wf v2, v2, fa1		# OK
	vfwsub.wf v2, v3, fa1		# vs2 should be multiple of 2
	vfwsub.wf v0, v2, fa1, v0.t	# vd overlap vm
