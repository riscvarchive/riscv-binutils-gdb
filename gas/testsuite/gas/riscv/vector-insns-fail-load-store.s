# Vector Unit-Stride Loads and Stores

	vle8.v v0, (a0), v0.t		# vd overlap vm
	vle8ff.v v0, (a0), v0.t		# vd overlap vm
	vle16.v v0, (a0), v0.t
	vle16ff.v v0, (a0), v0.t
	vle32.v v0, (a0), v0.t
	vle32ff.v v0, (a0), v0.t
	vle64.v v0, (a0), v0.t
	vle64ff.v v0, (a0), v0.t
	vle128.v v0, (a0), v0.t
	vle128ff.v v0, (a0), v0.t
	vle256.v v0, (a0), v0.t
	vle256ff.v v0, (a0), v0.t
	vle512.v v0, (a0), v0.t
	vle512ff.v v0, (a0), v0.t
	vle1024.v v0, (a0), v0.t
	vle1024ff.v v0, (a0), v0.t

	vse8.v v0, (a0), v0.t		# vd overlap vm
	vse16.v v0, (a0), v0.t
	vse32.v v0, (a0), v0.t
	vse64.v v0, (a0), v0.t
	vse128.v v0, (a0), v0.t
	vse256.v v0, (a0), v0.t
	vse512.v v0, (a0), v0.t
	vse1024.v v0, (a0), v0.t

# Vector Strided Loads and Stores

	vlse8.v v0, (a0), a1, v0.t	# vd overlap vm
	vlse16.v v0, (a0), a1, v0.t
	vlse32.v v0, (a0), a1, v0.t
	vlse64.v v0, (a0), a1, v0.t
	vlse128.v v0, (a0), a1, v0.t
	vlse256.v v0, (a0), a1, v0.t
	vlse512.v v0, (a0), a1, v0.t
	vlse1024.v v0, (a0), a1, v0.t

	vsse8.v v0, (a0), a1, v0.t
	vsse16.v v0, (a0), a1, v0.t
	vsse32.v v0, (a0), a1, v0.t
	vsse64.v v0, (a0), a1, v0.t
	vsse128.v v0, (a0), a1, v0.t
	vsse256.v v0, (a0), a1, v0.t
	vsse512.v v0, (a0), a1, v0.t
	vsse1024.v v0, (a0), a1, v0.t

# Vector Indexed Loads and Stores

	vlxei8.v v4, (a0), v4		# OK
	vlxei8.v v0, (a0), v4, v0.t	# vd overlap vm
	vlxei16.v v4, (a0), v4
	vlxei16.v v0, (a0), v4, v0.t
	vlxei32.v v4, (a0), v4
	vlxei32.v v0, (a0), v4, v0.t
	vlxei64.v v4, (a0), v4
	vlxei64.v v0, (a0), v4, v0.t

	vsxei8.v v4, (a0), v4
	vsxei8.v v0, (a0), v4, v0.t
	vsxei16.v v4, (a0), v4
	vsxei16.v v0, (a0), v4, v0.t
	vsxei32.v v4, (a0), v4
	vsxei32.v v0, (a0), v4, v0.t
	vsxei64.v v4, (a0), v4
	vsxei64.v v0, (a0), v4, v0.t

	vsuxei8.v v4, (a0), v4
	vsuxei8.v v0, (a0), v4, v0.t
	vsuxei16.v v4, (a0), v4
	vsuxei16.v v0, (a0), v4, v0.t
	vsuxei32.v v4, (a0), v4
	vsuxei32.v v0, (a0), v4, v0.t
	vsuxei64.v v4, (a0), v4
	vsuxei64.v v0, (a0), v4, v0.t

# Vector Unit-Stride Segment Loads and Stores

	vlseg2e8.v v0, (a0), v0.t	# vd overlap vm
	vsseg2e8.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e8ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e8.v v0, (a0), v0.t
	vsseg3e8.v v0, (a0), v0.t
	vlseg3e8ff.v v0, (a0), v0.t
	vlseg4e8.v v0, (a0), v0.t
	vsseg4e8.v v0, (a0), v0.t
	vlseg4e8ff.v v0, (a0), v0.t
	vlseg5e8.v v0, (a0), v0.t
	vsseg5e8.v v0, (a0), v0.t
	vlseg5e8ff.v v0, (a0), v0.t
	vlseg6e8.v v0, (a0), v0.t
	vsseg6e8.v v0, (a0), v0.t
	vlseg6e8ff.v v0, (a0), v0.t
	vlseg7e8.v v0, (a0), v0.t
	vsseg7e8.v v0, (a0), v0.t
	vlseg7e8ff.v v0, (a0), v0.t
	vlseg8e8.v v0, (a0), v0.t
	vsseg8e8.v v0, (a0), v0.t
	vlseg8e8ff.v v0, (a0), v0.t

	vlseg2e16.v v0, (a0), v0.t
	vsseg2e16.v v0, (a0), v0.t
	vlseg2e16ff.v v0, (a0), v0.t
	vlseg3e16.v v0, (a0), v0.t
	vsseg3e16.v v0, (a0), v0.t
	vlseg3e16ff.v v0, (a0), v0.t
	vlseg4e16.v v0, (a0), v0.t
	vsseg4e16.v v0, (a0), v0.t
	vlseg4e16ff.v v0, (a0), v0.t
	vlseg5e16.v v0, (a0), v0.t
	vsseg5e16.v v0, (a0), v0.t
	vlseg5e16ff.v v0, (a0), v0.t
	vlseg6e16.v v0, (a0), v0.t
	vsseg6e16.v v0, (a0), v0.t
	vlseg6e16ff.v v0, (a0), v0.t
	vlseg7e16.v v0, (a0), v0.t
	vsseg7e16.v v0, (a0), v0.t
	vlseg7e16ff.v v0, (a0), v0.t
	vlseg8e16.v v0, (a0), v0.t
	vsseg8e16.v v0, (a0), v0.t
	vlseg8e16ff.v v0, (a0), v0.t

	vlseg2e32.v v0, (a0), v0.t
	vsseg2e32.v v0, (a0), v0.t
	vlseg2e32ff.v v0, (a0), v0.t
	vlseg3e32.v v0, (a0), v0.t
	vsseg3e32.v v0, (a0), v0.t
	vlseg3e32ff.v v0, (a0), v0.t
	vlseg4e32.v v0, (a0), v0.t
	vsseg4e32.v v0, (a0), v0.t
	vlseg4e32ff.v v0, (a0), v0.t
	vlseg5e32.v v0, (a0), v0.t
	vsseg5e32.v v0, (a0), v0.t
	vlseg5e32ff.v v0, (a0), v0.t
	vlseg6e32.v v0, (a0), v0.t
	vsseg6e32.v v0, (a0), v0.t
	vlseg6e32ff.v v0, (a0), v0.t
	vlseg7e32.v v0, (a0), v0.t
	vsseg7e32.v v0, (a0), v0.t
	vlseg7e32ff.v v0, (a0), v0.t
	vlseg8e32.v v0, (a0), v0.t
	vsseg8e32.v v0, (a0), v0.t
	vlseg8e32ff.v v0, (a0), v0.t

	vlseg2e64.v v0, (a0), v0.t
	vsseg2e64.v v0, (a0), v0.t
	vlseg2e64ff.v v0, (a0), v0.t
	vlseg3e64.v v0, (a0), v0.t
	vsseg3e64.v v0, (a0), v0.t
	vlseg3e64ff.v v0, (a0), v0.t
	vlseg4e64.v v0, (a0), v0.t
	vsseg4e64.v v0, (a0), v0.t
	vlseg4e64ff.v v0, (a0), v0.t
	vlseg5e64.v v0, (a0), v0.t
	vsseg5e64.v v0, (a0), v0.t
	vlseg5e64ff.v v0, (a0), v0.t
	vlseg6e64.v v0, (a0), v0.t
	vsseg6e64.v v0, (a0), v0.t
	vlseg6e64ff.v v0, (a0), v0.t
	vlseg7e64.v v0, (a0), v0.t
	vsseg7e64.v v0, (a0), v0.t
	vlseg7e64ff.v v0, (a0), v0.t
	vlseg8e64.v v0, (a0), v0.t
	vsseg8e64.v v0, (a0), v0.t
	vlseg8e64ff.v v0, (a0), v0.t

	vlseg2e128.v v0, (a0), v0.t
	vsseg2e128.v v0, (a0), v0.t
	vlseg2e128ff.v v0, (a0), v0.t
	vlseg3e128.v v0, (a0), v0.t
	vsseg3e128.v v0, (a0), v0.t
	vlseg3e128ff.v v0, (a0), v0.t
	vlseg4e128.v v0, (a0), v0.t
	vsseg4e128.v v0, (a0), v0.t
	vlseg4e128ff.v v0, (a0), v0.t
	vlseg5e128.v v0, (a0), v0.t
	vsseg5e128.v v0, (a0), v0.t
	vlseg5e128ff.v v0, (a0), v0.t
	vlseg6e128.v v0, (a0), v0.t
	vsseg6e128.v v0, (a0), v0.t
	vlseg6e128ff.v v0, (a0), v0.t
	vlseg7e128.v v0, (a0), v0.t
	vsseg7e128.v v0, (a0), v0.t
	vlseg7e128ff.v v0, (a0), v0.t
	vlseg8e128.v v0, (a0), v0.t
	vsseg8e128.v v0, (a0), v0.t
	vlseg8e128ff.v v0, (a0), v0.t

	vlseg2e256.v v0, (a0), v0.t
	vsseg2e256.v v0, (a0), v0.t
	vlseg2e256ff.v v0, (a0), v0.t
	vlseg3e256.v v0, (a0), v0.t
	vsseg3e256.v v0, (a0), v0.t
	vlseg3e256ff.v v0, (a0), v0.t
	vlseg4e256.v v0, (a0), v0.t
	vsseg4e256.v v0, (a0), v0.t
	vlseg4e256ff.v v0, (a0), v0.t
	vlseg5e256.v v0, (a0), v0.t
	vsseg5e256.v v0, (a0), v0.t
	vlseg5e256ff.v v0, (a0), v0.t
	vlseg6e256.v v0, (a0), v0.t
	vsseg6e256.v v0, (a0), v0.t
	vlseg6e256ff.v v0, (a0), v0.t
	vlseg7e256.v v0, (a0), v0.t
	vsseg7e256.v v0, (a0), v0.t
	vlseg7e256ff.v v0, (a0), v0.t
	vlseg8e256.v v0, (a0), v0.t
	vsseg8e256.v v0, (a0), v0.t
	vlseg8e256ff.v v0, (a0), v0.t

	vlseg2e512.v v0, (a0), v0.t
	vsseg2e512.v v0, (a0), v0.t
	vlseg2e512ff.v v0, (a0), v0.t
	vlseg3e512.v v0, (a0), v0.t
	vsseg3e512.v v0, (a0), v0.t
	vlseg3e512ff.v v0, (a0), v0.t
	vlseg4e512.v v0, (a0), v0.t
	vsseg4e512.v v0, (a0), v0.t
	vlseg4e512ff.v v0, (a0), v0.t
	vlseg5e512.v v0, (a0), v0.t
	vsseg5e512.v v0, (a0), v0.t
	vlseg5e512ff.v v0, (a0), v0.t
	vlseg6e512.v v0, (a0), v0.t
	vsseg6e512.v v0, (a0), v0.t
	vlseg6e512ff.v v0, (a0), v0.t
	vlseg7e512.v v0, (a0), v0.t
	vsseg7e512.v v0, (a0), v0.t
	vlseg7e512ff.v v0, (a0), v0.t
	vlseg8e512.v v0, (a0), v0.t
	vsseg8e512.v v0, (a0), v0.t
	vlseg8e512ff.v v0, (a0), v0.t

	vlseg2e1024.v v0, (a0), v0.t
	vsseg2e1024.v v0, (a0), v0.t
	vlseg2e1024ff.v v0, (a0), v0.t
	vlseg3e1024.v v0, (a0), v0.t
	vsseg3e1024.v v0, (a0), v0.t
	vlseg3e1024ff.v v0, (a0), v0.t
	vlseg4e1024.v v0, (a0), v0.t
	vsseg4e1024.v v0, (a0), v0.t
	vlseg4e1024ff.v v0, (a0), v0.t
	vlseg5e1024.v v0, (a0), v0.t
	vsseg5e1024.v v0, (a0), v0.t
	vlseg5e1024ff.v v0, (a0), v0.t
	vlseg6e1024.v v0, (a0), v0.t
	vsseg6e1024.v v0, (a0), v0.t
	vlseg6e1024ff.v v0, (a0), v0.t
	vlseg7e1024.v v0, (a0), v0.t
	vsseg7e1024.v v0, (a0), v0.t
	vlseg7e1024ff.v v0, (a0), v0.t
	vlseg8e1024.v v0, (a0), v0.t
	vsseg8e1024.v v0, (a0), v0.t
	vlseg8e1024ff.v v0, (a0), v0.t

# Vector Strided Segment Loads and Stores

	vlsseg2e8.v v0, (a0), a1, v0.t		# vd overlap vm
	vssseg2e8.v v0, (a0), a1, v0.t		# vd overlap vm
	vlsseg3e8.v v0, (a0), a1, v0.t
	vssseg3e8.v v0, (a0), a1, v0.t
	vlsseg4e8.v v0, (a0), a1, v0.t
	vssseg4e8.v v0, (a0), a1, v0.t
	vlsseg5e8.v v0, (a0), a1, v0.t
	vssseg5e8.v v0, (a0), a1, v0.t
	vlsseg6e8.v v0, (a0), a1, v0.t
	vssseg6e8.v v0, (a0), a1, v0.t
	vlsseg7e8.v v0, (a0), a1, v0.t
	vssseg7e8.v v0, (a0), a1, v0.t
	vlsseg8e8.v v0, (a0), a1, v0.t
	vssseg8e8.v v0, (a0), a1, v0.t

	vlsseg2e16.v v0, (a0), a1, v0.t
	vssseg2e16.v v0, (a0), a1, v0.t
	vlsseg3e16.v v0, (a0), a1, v0.t
	vssseg3e16.v v0, (a0), a1, v0.t
	vlsseg4e16.v v0, (a0), a1, v0.t
	vssseg4e16.v v0, (a0), a1, v0.t
	vlsseg5e16.v v0, (a0), a1, v0.t
	vssseg5e16.v v0, (a0), a1, v0.t
	vlsseg6e16.v v0, (a0), a1, v0.t
	vssseg6e16.v v0, (a0), a1, v0.t
	vlsseg7e16.v v0, (a0), a1, v0.t
	vssseg7e16.v v0, (a0), a1, v0.t
	vlsseg8e16.v v0, (a0), a1, v0.t
	vssseg8e16.v v0, (a0), a1, v0.t

	vlsseg2e32.v v0, (a0), a1, v0.t
	vssseg2e32.v v0, (a0), a1, v0.t
	vlsseg3e32.v v0, (a0), a1, v0.t
	vssseg3e32.v v0, (a0), a1, v0.t
	vlsseg4e32.v v0, (a0), a1, v0.t
	vssseg4e32.v v0, (a0), a1, v0.t
	vlsseg5e32.v v0, (a0), a1, v0.t
	vssseg5e32.v v0, (a0), a1, v0.t
	vlsseg6e32.v v0, (a0), a1, v0.t
	vssseg6e32.v v0, (a0), a1, v0.t
	vlsseg7e32.v v0, (a0), a1, v0.t
	vssseg7e32.v v0, (a0), a1, v0.t
	vlsseg8e32.v v0, (a0), a1, v0.t
	vssseg8e32.v v0, (a0), a1, v0.t

	vlsseg2e64.v v0, (a0), a1, v0.t
	vssseg2e64.v v0, (a0), a1, v0.t
	vlsseg3e64.v v0, (a0), a1, v0.t
	vssseg3e64.v v0, (a0), a1, v0.t
	vlsseg4e64.v v0, (a0), a1, v0.t
	vssseg4e64.v v0, (a0), a1, v0.t
	vlsseg5e64.v v0, (a0), a1, v0.t
	vssseg5e64.v v0, (a0), a1, v0.t
	vlsseg6e64.v v0, (a0), a1, v0.t
	vssseg6e64.v v0, (a0), a1, v0.t
	vlsseg7e64.v v0, (a0), a1, v0.t
	vssseg7e64.v v0, (a0), a1, v0.t
	vlsseg8e64.v v0, (a0), a1, v0.t
	vssseg8e64.v v0, (a0), a1, v0.t

	vlsseg2e128.v v0, (a0), a1, v0.t
	vssseg2e128.v v0, (a0), a1, v0.t
	vlsseg3e128.v v0, (a0), a1, v0.t
	vssseg3e128.v v0, (a0), a1, v0.t
	vlsseg4e128.v v0, (a0), a1, v0.t
	vssseg4e128.v v0, (a0), a1, v0.t
	vlsseg5e128.v v0, (a0), a1, v0.t
	vssseg5e128.v v0, (a0), a1, v0.t
	vlsseg6e128.v v0, (a0), a1, v0.t
	vssseg6e128.v v0, (a0), a1, v0.t
	vlsseg7e128.v v0, (a0), a1, v0.t
	vssseg7e128.v v0, (a0), a1, v0.t
	vlsseg8e128.v v0, (a0), a1, v0.t
	vssseg8e128.v v0, (a0), a1, v0.t

	vlsseg2e256.v v0, (a0), a1, v0.t
	vssseg2e256.v v0, (a0), a1, v0.t
	vlsseg3e256.v v0, (a0), a1, v0.t
	vssseg3e256.v v0, (a0), a1, v0.t
	vlsseg4e256.v v0, (a0), a1, v0.t
	vssseg4e256.v v0, (a0), a1, v0.t
	vlsseg5e256.v v0, (a0), a1, v0.t
	vssseg5e256.v v0, (a0), a1, v0.t
	vlsseg6e256.v v0, (a0), a1, v0.t
	vssseg6e256.v v0, (a0), a1, v0.t
	vlsseg7e256.v v0, (a0), a1, v0.t
	vssseg7e256.v v0, (a0), a1, v0.t
	vlsseg8e256.v v0, (a0), a1, v0.t
	vssseg8e256.v v0, (a0), a1, v0.t

	vlsseg2e512.v v0, (a0), a1, v0.t
	vssseg2e512.v v0, (a0), a1, v0.t
	vlsseg3e512.v v0, (a0), a1, v0.t
	vssseg3e512.v v0, (a0), a1, v0.t
	vlsseg4e512.v v0, (a0), a1, v0.t
	vssseg4e512.v v0, (a0), a1, v0.t
	vlsseg5e512.v v0, (a0), a1, v0.t
	vssseg5e512.v v0, (a0), a1, v0.t
	vlsseg6e512.v v0, (a0), a1, v0.t
	vssseg6e512.v v0, (a0), a1, v0.t
	vlsseg7e512.v v0, (a0), a1, v0.t
	vssseg7e512.v v0, (a0), a1, v0.t
	vlsseg8e512.v v0, (a0), a1, v0.t
	vssseg8e512.v v0, (a0), a1, v0.t

	vlsseg2e1024.v v0, (a0), a1, v0.t
	vssseg2e1024.v v0, (a0), a1, v0.t
	vlsseg3e1024.v v0, (a0), a1, v0.t
	vssseg3e1024.v v0, (a0), a1, v0.t
	vlsseg4e1024.v v0, (a0), a1, v0.t
	vssseg4e1024.v v0, (a0), a1, v0.t
	vlsseg5e1024.v v0, (a0), a1, v0.t
	vssseg5e1024.v v0, (a0), a1, v0.t
	vlsseg6e1024.v v0, (a0), a1, v0.t
	vssseg6e1024.v v0, (a0), a1, v0.t
	vlsseg7e1024.v v0, (a0), a1, v0.t
	vssseg7e1024.v v0, (a0), a1, v0.t
	vlsseg8e1024.v v0, (a0), a1, v0.t
	vssseg8e1024.v v0, (a0), a1, v0.t

# Vector Indexed Segment Loads and Stores

	vlxseg2ei8.v v4, (a0), v4		# vd overlap vs2
	vlxseg2ei8.v v0, (a0), v4, v0.t		# vd overlap vm
	vsxseg2ei8.v v4, (a0), v4		# vd overlap vs2
	vsxseg2ei8.v v0, (a0), v4, v0.t		# vd overlap vm
	vlxseg3ei8.v v4, (a0), v4
	vlxseg3ei8.v v0, (a0), v4, v0.t
	vsxseg3ei8.v v4, (a0), v4
	vsxseg3ei8.v v0, (a0), v4, v0.t
	vlxseg4ei8.v v4, (a0), v4
	vlxseg4ei8.v v0, (a0), v4, v0.t
	vsxseg4ei8.v v4, (a0), v4
	vsxseg4ei8.v v0, (a0), v4, v0.t
	vlxseg5ei8.v v4, (a0), v4
	vlxseg5ei8.v v0, (a0), v4, v0.t
	vsxseg5ei8.v v4, (a0), v4
	vsxseg5ei8.v v0, (a0), v4, v0.t
	vlxseg6ei8.v v4, (a0), v4
	vlxseg6ei8.v v0, (a0), v4, v0.t
	vsxseg6ei8.v v4, (a0), v4
	vsxseg6ei8.v v0, (a0), v4, v0.t
	vlxseg7ei8.v v4, (a0), v4
	vlxseg7ei8.v v0, (a0), v4, v0.t
	vsxseg7ei8.v v4, (a0), v4
	vsxseg7ei8.v v0, (a0), v4, v0.t
	vlxseg8ei8.v v4, (a0), v4
	vlxseg8ei8.v v0, (a0), v4, v0.t
	vsxseg8ei8.v v4, (a0), v4
	vsxseg8ei8.v v0, (a0), v4, v0.t

	vlxseg2ei16.v v4, (a0), v4
	vlxseg2ei16.v v0, (a0), v4, v0.t
	vsxseg2ei16.v v4, (a0), v4
	vsxseg2ei16.v v0, (a0), v4, v0.t
	vlxseg3ei16.v v4, (a0), v4
	vlxseg3ei16.v v0, (a0), v4, v0.t
	vsxseg3ei16.v v4, (a0), v4
	vsxseg3ei16.v v0, (a0), v4, v0.t
	vlxseg4ei16.v v4, (a0), v4
	vlxseg4ei16.v v0, (a0), v4, v0.t
	vsxseg4ei16.v v4, (a0), v4
	vsxseg4ei16.v v0, (a0), v4, v0.t
	vlxseg5ei16.v v4, (a0), v4
	vlxseg5ei16.v v0, (a0), v4, v0.t
	vsxseg5ei16.v v4, (a0), v4
	vsxseg5ei16.v v0, (a0), v4, v0.t
	vlxseg6ei16.v v4, (a0), v4
	vlxseg6ei16.v v0, (a0), v4, v0.t
	vsxseg6ei16.v v4, (a0), v4
	vsxseg6ei16.v v0, (a0), v4, v0.t
	vlxseg7ei16.v v4, (a0), v4
	vlxseg7ei16.v v0, (a0), v4, v0.t
	vsxseg7ei16.v v4, (a0), v4
	vsxseg7ei16.v v0, (a0), v4, v0.t
	vlxseg8ei16.v v4, (a0), v4
	vlxseg8ei16.v v0, (a0), v4, v0.t
	vsxseg8ei16.v v4, (a0), v4
	vsxseg8ei16.v v0, (a0), v4, v0.t

	vlxseg2ei32.v v4, (a0), v4
	vlxseg2ei32.v v0, (a0), v4, v0.t
	vsxseg2ei32.v v4, (a0), v4
	vsxseg2ei32.v v0, (a0), v4, v0.t
	vlxseg3ei32.v v4, (a0), v4
	vlxseg3ei32.v v0, (a0), v4, v0.t
	vsxseg3ei32.v v4, (a0), v4
	vsxseg3ei32.v v0, (a0), v4, v0.t
	vlxseg4ei32.v v4, (a0), v4
	vlxseg4ei32.v v0, (a0), v4, v0.t
	vsxseg4ei32.v v4, (a0), v4
	vsxseg4ei32.v v0, (a0), v4, v0.t
	vlxseg5ei32.v v4, (a0), v4
	vlxseg5ei32.v v0, (a0), v4, v0.t
	vsxseg5ei32.v v4, (a0), v4
	vsxseg5ei32.v v0, (a0), v4, v0.t
	vlxseg6ei32.v v4, (a0), v4
	vlxseg6ei32.v v0, (a0), v4, v0.t
	vsxseg6ei32.v v4, (a0), v4
	vsxseg6ei32.v v0, (a0), v4, v0.t
	vlxseg7ei32.v v4, (a0), v4
	vlxseg7ei32.v v0, (a0), v4, v0.t
	vsxseg7ei32.v v4, (a0), v4
	vsxseg7ei32.v v0, (a0), v4, v0.t
	vlxseg8ei32.v v4, (a0), v4
	vlxseg8ei32.v v0, (a0), v4, v0.t
	vsxseg8ei32.v v4, (a0), v4
	vsxseg8ei32.v v0, (a0), v4, v0.t

	vlxseg2ei64.v v4, (a0), v4
	vlxseg2ei64.v v0, (a0), v4, v0.t
	vsxseg2ei64.v v4, (a0), v4
	vsxseg2ei64.v v0, (a0), v4, v0.t
	vlxseg3ei64.v v4, (a0), v4
	vlxseg3ei64.v v0, (a0), v4, v0.t
	vsxseg3ei64.v v4, (a0), v4
	vsxseg3ei64.v v0, (a0), v4, v0.t
	vlxseg4ei64.v v4, (a0), v4
	vlxseg4ei64.v v0, (a0), v4, v0.t
	vsxseg4ei64.v v4, (a0), v4
	vsxseg4ei64.v v0, (a0), v4, v0.t
	vlxseg5ei64.v v4, (a0), v4
	vlxseg5ei64.v v0, (a0), v4, v0.t
	vsxseg5ei64.v v4, (a0), v4
	vsxseg5ei64.v v0, (a0), v4, v0.t
	vlxseg6ei64.v v4, (a0), v4
	vlxseg6ei64.v v0, (a0), v4, v0.t
	vsxseg6ei64.v v4, (a0), v4
	vsxseg6ei64.v v0, (a0), v4, v0.t
	vlxseg7ei64.v v4, (a0), v4
	vlxseg7ei64.v v0, (a0), v4, v0.t
	vsxseg7ei64.v v4, (a0), v4
	vsxseg7ei64.v v0, (a0), v4, v0.t
	vlxseg8ei64.v v4, (a0), v4
	vlxseg8ei64.v v0, (a0), v4, v0.t
	vsxseg8ei64.v v4, (a0), v4
	vsxseg8ei64.v v0, (a0), v4, v0.t

	vlxseg2ei128.v v4, (a0), v4
	vlxseg2ei128.v v0, (a0), v4, v0.t
	vsxseg2ei128.v v4, (a0), v4
	vsxseg2ei128.v v0, (a0), v4, v0.t
	vlxseg3ei128.v v4, (a0), v4
	vlxseg3ei128.v v0, (a0), v4, v0.t
	vsxseg3ei128.v v4, (a0), v4
	vsxseg3ei128.v v0, (a0), v4, v0.t
	vlxseg4ei128.v v4, (a0), v4
	vlxseg4ei128.v v0, (a0), v4, v0.t
	vsxseg4ei128.v v4, (a0), v4
	vsxseg4ei128.v v0, (a0), v4, v0.t
	vlxseg5ei128.v v4, (a0), v4
	vlxseg5ei128.v v0, (a0), v4, v0.t
	vsxseg5ei128.v v4, (a0), v4
	vsxseg5ei128.v v0, (a0), v4, v0.t
	vlxseg6ei128.v v4, (a0), v4
	vlxseg6ei128.v v0, (a0), v4, v0.t
	vsxseg6ei128.v v4, (a0), v4
	vsxseg6ei128.v v0, (a0), v4, v0.t
	vlxseg7ei128.v v4, (a0), v4
	vlxseg7ei128.v v0, (a0), v4, v0.t
	vsxseg7ei128.v v4, (a0), v4
	vsxseg7ei128.v v0, (a0), v4, v0.t
	vlxseg8ei128.v v4, (a0), v4
	vlxseg8ei128.v v0, (a0), v4, v0.t
	vsxseg8ei128.v v4, (a0), v4
	vsxseg8ei128.v v0, (a0), v4, v0.t

	vlxseg2ei256.v v4, (a0), v4
	vlxseg2ei256.v v0, (a0), v4, v0.t
	vsxseg2ei256.v v4, (a0), v4
	vsxseg2ei256.v v0, (a0), v4, v0.t
	vlxseg3ei256.v v4, (a0), v4
	vlxseg3ei256.v v0, (a0), v4, v0.t
	vsxseg3ei256.v v4, (a0), v4
	vsxseg3ei256.v v0, (a0), v4, v0.t
	vlxseg4ei256.v v4, (a0), v4
	vlxseg4ei256.v v0, (a0), v4, v0.t
	vsxseg4ei256.v v4, (a0), v4
	vsxseg4ei256.v v0, (a0), v4, v0.t
	vlxseg5ei256.v v4, (a0), v4
	vlxseg5ei256.v v0, (a0), v4, v0.t
	vsxseg5ei256.v v4, (a0), v4
	vsxseg5ei256.v v0, (a0), v4, v0.t
	vlxseg6ei256.v v4, (a0), v4
	vlxseg6ei256.v v0, (a0), v4, v0.t
	vsxseg6ei256.v v4, (a0), v4
	vsxseg6ei256.v v0, (a0), v4, v0.t
	vlxseg7ei256.v v4, (a0), v4
	vlxseg7ei256.v v0, (a0), v4, v0.t
	vsxseg7ei256.v v4, (a0), v4
	vsxseg7ei256.v v0, (a0), v4, v0.t
	vlxseg8ei256.v v4, (a0), v4
	vlxseg8ei256.v v0, (a0), v4, v0.t
	vsxseg8ei256.v v4, (a0), v4
	vsxseg8ei256.v v0, (a0), v4, v0.t

	vlxseg2ei512.v v4, (a0), v4
	vlxseg2ei512.v v0, (a0), v4, v0.t
	vsxseg2ei512.v v4, (a0), v4
	vsxseg2ei512.v v0, (a0), v4, v0.t
	vlxseg3ei512.v v4, (a0), v4
	vlxseg3ei512.v v0, (a0), v4, v0.t
	vsxseg3ei512.v v4, (a0), v4
	vsxseg3ei512.v v0, (a0), v4, v0.t
	vlxseg4ei512.v v4, (a0), v4
	vlxseg4ei512.v v0, (a0), v4, v0.t
	vsxseg4ei512.v v4, (a0), v4
	vsxseg4ei512.v v0, (a0), v4, v0.t
	vlxseg5ei512.v v4, (a0), v4
	vlxseg5ei512.v v0, (a0), v4, v0.t
	vsxseg5ei512.v v4, (a0), v4
	vsxseg5ei512.v v0, (a0), v4, v0.t
	vlxseg6ei512.v v4, (a0), v4
	vlxseg6ei512.v v0, (a0), v4, v0.t
	vsxseg6ei512.v v4, (a0), v4
	vsxseg6ei512.v v0, (a0), v4, v0.t
	vlxseg7ei512.v v4, (a0), v4
	vlxseg7ei512.v v0, (a0), v4, v0.t
	vsxseg7ei512.v v4, (a0), v4
	vsxseg7ei512.v v0, (a0), v4, v0.t
	vlxseg8ei512.v v4, (a0), v4
	vlxseg8ei512.v v0, (a0), v4, v0.t
	vsxseg8ei512.v v4, (a0), v4
	vsxseg8ei512.v v0, (a0), v4, v0.t

	vlxseg2ei1024.v v4, (a0), v4
	vlxseg2ei1024.v v0, (a0), v4, v0.t
	vsxseg2ei1024.v v4, (a0), v4
	vsxseg2ei1024.v v0, (a0), v4, v0.t
	vlxseg3ei1024.v v4, (a0), v4
	vlxseg3ei1024.v v0, (a0), v4, v0.t
	vsxseg3ei1024.v v4, (a0), v4
	vsxseg3ei1024.v v0, (a0), v4, v0.t
	vlxseg4ei1024.v v4, (a0), v4
	vlxseg4ei1024.v v0, (a0), v4, v0.t
	vsxseg4ei1024.v v4, (a0), v4
	vsxseg4ei1024.v v0, (a0), v4, v0.t
	vlxseg5ei1024.v v4, (a0), v4
	vlxseg5ei1024.v v0, (a0), v4, v0.t
	vsxseg5ei1024.v v4, (a0), v4
	vsxseg5ei1024.v v0, (a0), v4, v0.t
	vlxseg6ei1024.v v4, (a0), v4
	vlxseg6ei1024.v v0, (a0), v4, v0.t
	vsxseg6ei1024.v v4, (a0), v4
	vsxseg6ei1024.v v0, (a0), v4, v0.t
	vlxseg7ei1024.v v4, (a0), v4
	vlxseg7ei1024.v v0, (a0), v4, v0.t
	vsxseg7ei1024.v v4, (a0), v4
	vsxseg7ei1024.v v0, (a0), v4, v0.t
	vlxseg8ei1024.v v4, (a0), v4
	vlxseg8ei1024.v v0, (a0), v4, v0.t
	vsxseg8ei1024.v v4, (a0), v4
	vsxseg8ei1024.v v0, (a0), v4, v0.t

# Vector Load/Store Whole Register Instructions

	vl1r.v v31, (a0)		# OK

	vl2r.v v31, (a0)		# vd must be aligned to 2
	vl2re8.v v31, (a0)
	vl2re16.v v31, (a0)
	vl2re32.v v31, (a0)
	vl2re64.v v31, (a0)
	vl2re128.v v31, (a0)
	vl2re256.v v31, (a0)
	vl2re512.v v31, (a0)
	vl2re1024.v v31, (a0)

	vl4r.v v30, (a0)		# vd must be aligned to 4
	vl4re8.v v30, (a0)
	vl4re16.v v30, (a0)
	vl4re32.v v30, (a0)
	vl4re64.v v30, (a0)
	vl4re128.v v30, (a0)
	vl4re256.v v30, (a0)
	vl4re512.v v30, (a0)
	vl4re1024.v v30, (a0)

	vl8r.v v26, (a0)		# vd must be aligned to 8
	vl8re8.v v26, (a0)
	vl8re16.v v26, (a0)
	vl8re32.v v26, (a0)
	vl8re64.v v26, (a0)
	vl8re128.v v26, (a0)
	vl8re256.v v26, (a0)
	vl8re512.v v26, (a0)
	vl8re1024.v v26, (a0)

	vs2r.v v31, (a0)		# vs3 must be aligned to 2
	vs4r.v v30, (a0)		# vs3 must be aligned to 4
	vs8r.v v26, (a0)		# vs3 must be aligned to 8
