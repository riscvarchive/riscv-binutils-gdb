# Vector Indexed Segment Loads and Stores

	vlxseg2e.v v0, (a0), v2		# OK
	vlxseg2e.v v1, (a0), v2		# OK
	vlxseg2e.v v2, (a0), v2		# vd overlap vs2
	vlxseg2e.v v0, (a0), v2, v0.t	# vd overlap vm
	vsxseg2e.v v0, (a0), v2
	vsxseg2e.v v1, (a0), v2
	vsxseg2e.v v2, (a0), v2
	vsxseg2e.v v0, (a0), v2, v0.t

	vlxseg3e.v v0, (a0), v2
	vlxseg3e.v v1, (a0), v2
	vlxseg3e.v v2, (a0), v2
	vlxseg3e.v v0, (a0), v2, v0.t
	vsxseg3e.v v0, (a0), v2
	vsxseg3e.v v1, (a0), v2
	vsxseg3e.v v2, (a0), v2
	vsxseg3e.v v0, (a0), v2, v0.t

	vlxseg4e.v v0, (a0), v2
	vlxseg4e.v v1, (a0), v2
	vlxseg4e.v v2, (a0), v2
	vlxseg4e.v v0, (a0), v2, v0.t
	vsxseg4e.v v0, (a0), v2
	vsxseg4e.v v1, (a0), v2
	vsxseg4e.v v2, (a0), v2
	vsxseg4e.v v0, (a0), v2, v0.t

	vlxseg5e.v v0, (a0), v2
	vlxseg5e.v v1, (a0), v2
	vlxseg5e.v v2, (a0), v2
	vlxseg5e.v v0, (a0), v2, v0.t
	vsxseg5e.v v0, (a0), v2
	vsxseg5e.v v1, (a0), v2
	vsxseg5e.v v2, (a0), v2
	vsxseg5e.v v0, (a0), v2, v0.t

	vlxseg6e.v v0, (a0), v2
	vlxseg6e.v v1, (a0), v2
	vlxseg6e.v v2, (a0), v2
	vlxseg6e.v v0, (a0), v2, v0.t
	vsxseg6e.v v0, (a0), v2
	vsxseg6e.v v1, (a0), v2
	vsxseg6e.v v2, (a0), v2
	vsxseg6e.v v0, (a0), v2, v0.t

	vlxseg7e.v v0, (a0), v2
	vlxseg7e.v v1, (a0), v2
	vlxseg7e.v v2, (a0), v2
	vlxseg7e.v v0, (a0), v2, v0.t
	vsxseg7e.v v0, (a0), v2
	vsxseg7e.v v1, (a0), v2
	vsxseg7e.v v2, (a0), v2
	vsxseg7e.v v0, (a0), v2, v0.t

	vlxseg8e.v v0, (a0), v2
	vlxseg8e.v v1, (a0), v2
	vlxseg8e.v v2, (a0), v2
	vlxseg8e.v v0, (a0), v2, v0.t
	vsxseg8e.v v0, (a0), v2
	vsxseg8e.v v1, (a0), v2
	vsxseg8e.v v2, (a0), v2
	vsxseg8e.v v0, (a0), v2, v0.t
