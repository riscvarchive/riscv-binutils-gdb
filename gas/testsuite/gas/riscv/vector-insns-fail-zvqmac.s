# Quad-Widening Vector Arithmetic Instructions

	vqmaccu.vv v2, v4, v8		# vd should be multiple of 4
	vqmaccu.vv v4, v4, v8		# vd overlap vs1
	vqmaccu.vv v4, v7, v8		# vd overlap vs1
	vqmaccu.vv v8, v4, v8		# vd overlap vs2
	vqmaccu.vv v8, v4, v11		# vd overlap vs2
	vqmaccu.vv v0, v4, v8, v0.t	# vd overlap vm
	vqmaccu.vx v2, a1, v4		# vd should be multiple of 4
	vqmaccu.vx v4, a1, v4		# vd overlap vs2
	vqmaccu.vx v4, a1, v7		# vd overlap vs2
	vqmaccu.vx v0, a1, v4, v0.t	# vd overlap vm

	vqmacc.vv v2, v4, v8
	vqmacc.vv v4, v4, v8
	vqmacc.vv v4, v7, v8
	vqmacc.vv v8, v4, v8
	vqmacc.vv v8, v4, v11
	vqmacc.vv v0, v4, v8, v0.t
	vqmacc.vx v2, a1, v4
	vqmacc.vx v4, a1, v4
	vqmacc.vx v4, a1, v7
	vqmacc.vx v0, a1, v4, v0.t

	vqmaccsu.vv v2, v4, v8
	vqmaccsu.vv v4, v4, v8
	vqmaccsu.vv v4, v7, v8
	vqmaccsu.vv v8, v4, v8
	vqmaccsu.vv v8, v4, v11
	vqmaccsu.vv v0, v4, v8, v0.t
	vqmaccsu.vx v2, a1, v4
	vqmaccsu.vx v4, a1, v4
	vqmaccsu.vx v4, a1, v7
	vqmaccsu.vx v0, a1, v4, v0.t

	vqmaccus.vx v2, a1, v4		# vd should be multiple of 4
	vqmaccus.vx v4, a1, v4		# vd overlap vs2
	vqmaccus.vx v4, a1, v7		# vd overlap vs2
	vqmaccus.vx v0, a1, v4, v0.t	# vd overlap vm
