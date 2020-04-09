# Vector Unit-Stride Segment Loads and Stores

	vlseg2e.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e.v v4, (a0), v0.t	# OK
	vsseg2e.v v0, (a0), v0.t	# OK
	vsseg2e.v v4, (a0), v0.t	# OK
	vlseg2eff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2eff.v v4, (a0), v0.t	# OK

	vlseg3e.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e.v v4, (a0), v0.t	# OK
	vsseg3e.v v0, (a0), v0.t	# OK
	vsseg3e.v v4, (a0), v0.t	# OK
	vlseg3eff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3eff.v v4, (a0), v0.t	# OK

	vlseg4e.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e.v v4, (a0), v0.t	# OK
	vsseg4e.v v0, (a0), v0.t	# OK
	vsseg4e.v v4, (a0), v0.t	# OK
	vlseg4eff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4eff.v v4, (a0), v0.t	# OK

	vlseg5e.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e.v v4, (a0), v0.t	# OK
	vsseg5e.v v0, (a0), v0.t	# OK
	vsseg5e.v v4, (a0), v0.t	# OK
	vlseg5eff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5eff.v v4, (a0), v0.t	# OK

	vlseg6e.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e.v v4, (a0), v0.t	# OK
	vsseg6e.v v0, (a0), v0.t	# OK
	vsseg6e.v v4, (a0), v0.t	# OK
	vlseg6eff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6eff.v v4, (a0), v0.t	# OK

	vlseg7e.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e.v v4, (a0), v0.t	# OK
	vsseg7e.v v0, (a0), v0.t	# OK
	vsseg7e.v v4, (a0), v0.t	# OK
	vlseg7eff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7eff.v v4, (a0), v0.t	# OK

	vlseg8e.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e.v v4, (a0), v0.t	# OK
	vsseg8e.v v0, (a0), v0.t	# OK
	vsseg8e.v v4, (a0), v0.t	# OK
	vlseg8eff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8eff.v v4, (a0), v0.t	# OK

# Vector Strided Segment Loads and Stores

	vlsseg2e.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e.v v4, (a0), a1, v0.t	# OK
	vssseg2e.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e.v v4, (a0), a1, v0.t	# OK

	vlsseg3e.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e.v v4, (a0), a1, v0.t	# OK
	vssseg3e.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e.v v4, (a0), a1, v0.t	# OK

	vlsseg4e.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e.v v4, (a0), a1, v0.t	# OK
	vssseg4e.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e.v v4, (a0), a1, v0.t	# OK

	vlsseg5e.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e.v v4, (a0), a1, v0.t	# OK
	vssseg5e.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e.v v4, (a0), a1, v0.t	# OK

	vlsseg6e.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e.v v4, (a0), a1, v0.t	# OK
	vssseg6e.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e.v v4, (a0), a1, v0.t	# OK

	vlsseg7e.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e.v v4, (a0), a1, v0.t	# OK
	vssseg7e.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e.v v4, (a0), a1, v0.t	# OK

	vlsseg8e.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e.v v4, (a0), a1, v0.t	# OK
	vssseg8e.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e.v v4, (a0), a1, v0.t	# OK

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
