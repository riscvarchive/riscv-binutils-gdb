# Vector Iota Instruction
# Vector Slideup Instructions
# Vector Slide1up
# Vector Register Gather Instruction
# Vector Compress Instruction

	viota.m v0, v2		# OK
	viota.m v2, v2		# OK
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
	vcompress.vm v0, v2, v4, v0.t	# vd overlap vm
