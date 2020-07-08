# Narrowing Vector Arithmetic Instructions

	vnsrl.wv v0, v2, v4		# OK
	vnsrl.wv v2, v2, v4		# vd overlap vs2
	vnsrl.wv v2, v3, v4		# vs2 should be multiple of 2
	vnsrl.wv v3, v2, v4		# vd overlap vs2
	vnsrl.wv v4, v2, v4		# OK
	vnsrl.wv v0, v2, v4, v0.t	# We can't know the LMUL, so skip the vm checking

	vnsrl.wx v0, v2, a1		# OK
	vnsrl.wx v2, v2, a1		# vd overlap vs2
	vnsrl.wx v2, v3, a1		# vs2 should be multiple of 2
	vnsrl.wx v3, v2, a1		# vd overlap vs2
	vnsrl.wx v0, v2, a1, v0.t	# We can't know the LMUL, so skip the vm checking

	vnsrl.wi v0, v2, 1		# OK
	vnsrl.wi v2, v2, 1		# vd overlap vs2
	vnsrl.wi v2, v3, 1		# vs2 should be multiple of 2
	vnsrl.wi v3, v2, 1		# vd overlap vs2
	vnsrl.wi v0, v2, 1, v0.t	# We can't know the LMUL, so skip the vm checking

	vnsra.wv v0, v2, v4		# OK
	vnsra.wv v2, v2, v4		# vd overlap vs2
	vnsra.wv v2, v3, v4		# vs2 should be multiple of 2
	vnsra.wv v3, v2, v4		# vd overlap vs2
	vnsra.wv v4, v2, v4		# OK
	vnsra.wv v0, v2, v4, v0.t	# We can't know the LMUL, so skip the vm checking

	vnsra.wx v0, v2, a1		# OK
	vnsra.wx v2, v2, a1		# vd overlap vs2
	vnsra.wx v2, v3, a1		# vs2 should be multiple of 2
	vnsra.wx v3, v2, a1		# vd overlap vs2
	vnsra.wx v0, v2, a1, v0.t	# We can't know the LMUL, so skip the vm checking

	vnsra.wi v0, v2, 1		# OK
	vnsra.wi v2, v2, 1		# vd overlap vs2
	vnsra.wi v2, v3, 1		# vs2 should be multiple of 2
	vnsra.wi v3, v2, 1		# vd overlap vs2
	vnsra.wi v0, v2, 1, v0.t	# We can't know the LMUL, so skip the vm checking

	vnclipu.wv v0, v2, v4		# OK
	vnclipu.wv v2, v2, v4		# vd overlap vs2
	vnclipu.wv v2, v3, v4		# vs2 should be multiple of 2
	vnclipu.wv v3, v2, v4		# vd overlap vs2
	vnclipu.wv v4, v2, v4		# OK
	vnclipu.wv v0, v2, v4, v0.t	# We can't know the LMUL, so skip the vm checking

	vnclipu.wx v0, v2, a1		# OK
	vnclipu.wx v2, v2, a1		# vd overlap vs2
	vnclipu.wx v2, v3, a1		# vs2 should be multiple of 2
	vnclipu.wx v3, v2, a1		# vd overlap vs2
	vnclipu.wx v0, v2, a1, v0.t	# We can't know the LMUL, so skip the vm checking

	vnclipu.wi v0, v2, 1		# OK
	vnclipu.wi v2, v2, 1		# vd overlap vs2
	vnclipu.wi v2, v3, 1		# vs2 should be multiple of 2
	vnclipu.wi v3, v2, 1		# vd overlap vs2
	vnclipu.wi v0, v2, 1, v0.t	# We can't know the LMUL, so skip the vm checking

	vnclip.wv v0, v2, v4		# OK
	vnclip.wv v2, v2, v4		# vd overlap vs2
	vnclip.wv v2, v3, v4		# vs2 should be multiple of 2
	vnclip.wv v3, v2, v4		# vd overlap vs2
	vnclip.wv v4, v2, v4		# OK
	vnclip.wv v0, v2, v4, v0.t	# We can't know the LMUL, so skip the vm checking

	vnclip.wx v0, v2, a1		# OK
	vnclip.wx v2, v2, a1		# vd overlap vs2
	vnclip.wx v2, v3, a1		# vs2 should be multiple of 2
	vnclip.wx v3, v2, a1		# vd overlap vs2
	vnclip.wx v0, v2, a1, v0.t	# We can't know the LMUL, so skip the vm checking

	vnclip.wi v0, v2, 1		# OK
	vnclip.wi v2, v2, 1		# vd overlap vs2
	vnclip.wi v2, v3, 1		# vs2 should be multiple of 2
	vnclip.wi v3, v2, 1		# vd overlap vs2
	vnclip.wi v0, v2, 1, v0.t	# We can't know the LMUL, so skip the vm checking

	vfncvt.xu.f.w v0, v2		# OK
	vfncvt.xu.f.w v2, v2		# vd overlap vs2
	vfncvt.xu.f.w v2, v3		# vs2 should be multiple of 2
	vfncvt.xu.f.w v3, v2		# vd overlap vs2
	vfncvt.xu.f.w v4, v2		# OK
	vfncvt.xu.f.w v0, v2, v0.t	# We can't know the LMUL, so skip the vm checking

	vfncvt.x.f.w v0, v2		# OK
	vfncvt.x.f.w v2, v2		# vd overlap vs2
	vfncvt.x.f.w v2, v3		# vs2 should be multiple of 2
	vfncvt.x.f.w v3, v2		# vd overlap vs2
	vfncvt.x.f.w v4, v2		# OK
	vfncvt.x.f.w v0, v2, v0.t	# We can't know the LMUL, so skip the vm checking

	vfncvt.rtz.xu.f.w v0, v2	# OK
	vfncvt.rtz.xu.f.w v2, v2	# vd overlap vs2
	vfncvt.rtz.xu.f.w v2, v3	# vs2 should be multiple of 2
	vfncvt.rtz.xu.f.w v3, v2	# vd overlap vs2
	vfncvt.rtz.xu.f.w v4, v2	# OK
	vfncvt.rtz.xu.f.w v0, v2, v0.t	# We can't know the LMUL, so skip the vm checking

	vfncvt.rtz.x.f.w v0, v2		# OK
	vfncvt.rtz.x.f.w v2, v2		# vd overlap vs2
	vfncvt.rtz.x.f.w v2, v3		# vs2 should be multiple of 2
	vfncvt.rtz.x.f.w v3, v2		# vd overlap vs2
	vfncvt.rtz.x.f.w v4, v2		# OK
	vfncvt.rtz.x.f.w v0, v2, v0.t	# We can't know the LMUL, so skip the vm checking

	vfncvt.f.xu.w v0, v2		# OK
	vfncvt.f.xu.w v2, v2		# vd overlap vs2
	vfncvt.f.xu.w v2, v3		# vs2 should be multiple of 2
	vfncvt.f.xu.w v3, v2		# vd overlap vs2
	vfncvt.f.xu.w v4, v2		# OK
	vfncvt.f.xu.w v0, v2, v0.t	# We can't know the LMUL, so skip the vm checking

	vfncvt.f.x.w v0, v2		# OK
	vfncvt.f.x.w v2, v2		# vd overlap vs2
	vfncvt.f.x.w v2, v3		# vs2 should be multiple of 2
	vfncvt.f.x.w v3, v2		# vd overlap vs2
	vfncvt.f.x.w v4, v2		# OK
	vfncvt.f.x.w v0, v2, v0.t	# We can't know the LMUL, so skip the vm checking

	vfncvt.f.f.w v0, v2		# OK
	vfncvt.f.f.w v2, v2		# vd overlap vs2
	vfncvt.f.f.w v2, v3		# vs2 should be multiple of 2
	vfncvt.f.f.w v3, v2		# vd overlap vs2
	vfncvt.f.f.w v4, v2		# OK
	vfncvt.f.f.w v0, v2, v0.t	# We can't know the LMUL, so skip the vm checking

	vfncvt.rod.f.f.w v0, v2		# OK
	vfncvt.rod.f.f.w v2, v2		# vd overlap vs2
	vfncvt.rod.f.f.w v2, v3		# vs2 should be multiple of 2
	vfncvt.rod.f.f.w v3, v2		# vd overlap vs2
	vfncvt.rod.f.f.w v4, v2		# OK
	vfncvt.rod.f.f.w v0, v2, v0.t	# We can't know the LMUL, so skip the vm checking
