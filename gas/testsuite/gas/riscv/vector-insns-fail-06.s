# Vector Iota Instruction
# Vector Slideup Instructions
# Vector Slide1up
# Vector Register Gather Instruction
# Vector Compress Instruction
# Vector Load/Store Whole Register Instructions
# Whole Vector Register Move

	viota.m v0, v2		# OK
	viota.m v2, v2		# vd overlap vs2
	viota.m v0, v2, v0.t	# vd overlap vm

	vslideup.vx v0, v2, a4		# OK
	vslideup.vx v1, v2, a4		# OK
	vslideup.vx v2, v2, a4		# vd overlap vs2
	vslideup.vx v0, v2, a4, v0.t	# vd overlap vm

	vslideup.vi v0, v2, 1		# OK
	vslideup.vi v1, v2, 1		# OK
	vslideup.vi v2, v2, 1		# vd overlap vs2
	vslideup.vi v0, v2, 1, v0.t	# vd overlap vm

	vslide1up.vx v0, v2, a4		# OK
	vslide1up.vx v1, v2, a4		# OK
	vslide1up.vx v2, v2, a4		# vd overlap vs2
	vslide1up.vx v0, v2, a4, v0.t	# vd overlap vm

	vfslide1up.vf v0, v2, fa4	# OK
	vfslide1up.vf v1, v2, fa4	# OK
	vfslide1up.vf v2, v2, fa4	# vd overlap vs2
	vfslide1up.vf v0, v2, fa4, v0.t	# vd overlap vm

	vrgather.vv v0, v2, v4		# OK
	vrgather.vv v1, v2, v4		# OK
	vrgather.vv v2, v2, v4		# vd overlap vs2
	vrgather.vv v4, v2, v4		# vd overlap vs1
	vrgather.vv v0, v2, v4, v0.t	# vd overlap vm

	vrgather.vx v0, v2, a4		# OK
	vrgather.vx v1, v2, a4		# OK
	vrgather.vx v2, v2, a4		# vd overlap vs2
	vrgather.vx v0, v2, a4, v0.t	# vd overlap vm

	vrgather.vi v0, v2, 1		# OK
	vrgather.vi v1, v2, 1		# OK
	vrgather.vi v2, v2, 1		# vd overlap vs2
	vrgather.vi v0, v2, 1, v0.t	# vd overlap vm

	vcompress.vm v0, v2, v4		# OK
	vcompress.vm v1, v2, v4		# OK
	vcompress.vm v2, v2, v4		# vd overlap vs2
	vcompress.vm v4, v2, v4		# vd overlap vs1

	vmv1r.v v0, v1		# OK
	vmv1r.v v2, v3		# OK

	vmv2r.v v0, v2		# OK
	vmv2r.v v1, v2		# vd must be aligned to 2
	vmv2r.v v2, v3		# vs2 must be aligned to 2

	vmv4r.v v0, v4		# OK
	vmv4r.v v2, v4		# vd must be aligned to 4
	vmv4r.v v4, v7		# vs2 must be aligned to 4

	vmv8r.v v0, v8		# OK
	vmv8r.v v6, v8		# vd must be aligned to 8
	vmv8r.v v8, v12		# vs2 must be aligned to 8
