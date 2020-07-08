# Vector Unit-Stride Segment Loads and Stores

	vlseg2e8.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e8.v v4, (a0), v0.t	# OK
	vsseg2e8.v v0, (a0), v0.t	# OK
	vsseg2e8.v v4, (a0), v0.t	# OK
	vlseg2e8ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e8ff.v v4, (a0), v0.t	# OK
	vlseg3e8.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e8.v v4, (a0), v0.t	# OK
	vsseg3e8.v v0, (a0), v0.t	# OK
	vsseg3e8.v v4, (a0), v0.t	# OK
	vlseg3e8ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e8ff.v v4, (a0), v0.t	# OK
	vlseg4e8.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e8.v v4, (a0), v0.t	# OK
	vsseg4e8.v v0, (a0), v0.t	# OK
	vsseg4e8.v v4, (a0), v0.t	# OK
	vlseg4e8ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e8ff.v v4, (a0), v0.t	# OK
	vlseg5e8.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e8.v v4, (a0), v0.t	# OK
	vsseg5e8.v v0, (a0), v0.t	# OK
	vsseg5e8.v v4, (a0), v0.t	# OK
	vlseg5e8ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e8ff.v v4, (a0), v0.t	# OK
	vlseg6e8.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e8.v v4, (a0), v0.t	# OK
	vsseg6e8.v v0, (a0), v0.t	# OK
	vsseg6e8.v v4, (a0), v0.t	# OK
	vlseg6e8ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e8ff.v v4, (a0), v0.t	# OK
	vlseg7e8.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e8.v v4, (a0), v0.t	# OK
	vsseg7e8.v v0, (a0), v0.t	# OK
	vsseg7e8.v v4, (a0), v0.t	# OK
	vlseg7e8ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e8ff.v v4, (a0), v0.t	# OK
	vlseg8e8.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e8.v v4, (a0), v0.t	# OK
	vsseg8e8.v v0, (a0), v0.t	# OK
	vsseg8e8.v v4, (a0), v0.t	# OK
	vlseg8e8ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e8ff.v v4, (a0), v0.t	# OK

	vlseg2e16.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e16.v v4, (a0), v0.t	# OK
	vsseg2e16.v v0, (a0), v0.t	# OK
	vsseg2e16.v v4, (a0), v0.t	# OK
	vlseg2e16ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e16ff.v v4, (a0), v0.t	# OK
	vlseg3e16.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e16.v v4, (a0), v0.t	# OK
	vsseg3e16.v v0, (a0), v0.t	# OK
	vsseg3e16.v v4, (a0), v0.t	# OK
	vlseg3e16ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e16ff.v v4, (a0), v0.t	# OK
	vlseg4e16.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e16.v v4, (a0), v0.t	# OK
	vsseg4e16.v v0, (a0), v0.t	# OK
	vsseg4e16.v v4, (a0), v0.t	# OK
	vlseg4e16ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e16ff.v v4, (a0), v0.t	# OK
	vlseg5e16.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e16.v v4, (a0), v0.t	# OK
	vsseg5e16.v v0, (a0), v0.t	# OK
	vsseg5e16.v v4, (a0), v0.t	# OK
	vlseg5e16ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e16ff.v v4, (a0), v0.t	# OK
	vlseg6e16.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e16.v v4, (a0), v0.t	# OK
	vsseg6e16.v v0, (a0), v0.t	# OK
	vsseg6e16.v v4, (a0), v0.t	# OK
	vlseg6e16ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e16ff.v v4, (a0), v0.t	# OK
	vlseg7e16.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e16.v v4, (a0), v0.t	# OK
	vsseg7e16.v v0, (a0), v0.t	# OK
	vsseg7e16.v v4, (a0), v0.t	# OK
	vlseg7e16ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e16ff.v v4, (a0), v0.t	# OK
	vlseg8e16.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e16.v v4, (a0), v0.t	# OK
	vsseg8e16.v v0, (a0), v0.t	# OK
	vsseg8e16.v v4, (a0), v0.t	# OK
	vlseg8e16ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e16ff.v v4, (a0), v0.t	# OK

	vlseg2e32.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e32.v v4, (a0), v0.t	# OK
	vsseg2e32.v v0, (a0), v0.t	# OK
	vsseg2e32.v v4, (a0), v0.t	# OK
	vlseg2e32ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e32ff.v v4, (a0), v0.t	# OK
	vlseg3e32.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e32.v v4, (a0), v0.t	# OK
	vsseg3e32.v v0, (a0), v0.t	# OK
	vsseg3e32.v v4, (a0), v0.t	# OK
	vlseg3e32ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e32ff.v v4, (a0), v0.t	# OK
	vlseg4e32.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e32.v v4, (a0), v0.t	# OK
	vsseg4e32.v v0, (a0), v0.t	# OK
	vsseg4e32.v v4, (a0), v0.t	# OK
	vlseg4e32ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e32ff.v v4, (a0), v0.t	# OK
	vlseg5e32.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e32.v v4, (a0), v0.t	# OK
	vsseg5e32.v v0, (a0), v0.t	# OK
	vsseg5e32.v v4, (a0), v0.t	# OK
	vlseg5e32ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e32ff.v v4, (a0), v0.t	# OK
	vlseg6e32.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e32.v v4, (a0), v0.t	# OK
	vsseg6e32.v v0, (a0), v0.t	# OK
	vsseg6e32.v v4, (a0), v0.t	# OK
	vlseg6e32ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e32ff.v v4, (a0), v0.t	# OK
	vlseg7e32.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e32.v v4, (a0), v0.t	# OK
	vsseg7e32.v v0, (a0), v0.t	# OK
	vsseg7e32.v v4, (a0), v0.t	# OK
	vlseg7e32ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e32ff.v v4, (a0), v0.t	# OK
	vlseg8e32.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e32.v v4, (a0), v0.t	# OK
	vsseg8e32.v v0, (a0), v0.t	# OK
	vsseg8e32.v v4, (a0), v0.t	# OK
	vlseg8e32ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e32ff.v v4, (a0), v0.t	# OK

	vlseg2e64.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e64.v v4, (a0), v0.t	# OK
	vsseg2e64.v v0, (a0), v0.t	# OK
	vsseg2e64.v v4, (a0), v0.t	# OK
	vlseg2e64ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e64ff.v v4, (a0), v0.t	# OK
	vlseg3e64.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e64.v v4, (a0), v0.t	# OK
	vsseg3e64.v v0, (a0), v0.t	# OK
	vsseg3e64.v v4, (a0), v0.t	# OK
	vlseg3e64ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e64ff.v v4, (a0), v0.t	# OK
	vlseg4e64.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e64.v v4, (a0), v0.t	# OK
	vsseg4e64.v v0, (a0), v0.t	# OK
	vsseg4e64.v v4, (a0), v0.t	# OK
	vlseg4e64ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e64ff.v v4, (a0), v0.t	# OK
	vlseg5e64.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e64.v v4, (a0), v0.t	# OK
	vsseg5e64.v v0, (a0), v0.t	# OK
	vsseg5e64.v v4, (a0), v0.t	# OK
	vlseg5e64ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e64ff.v v4, (a0), v0.t	# OK
	vlseg6e64.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e64.v v4, (a0), v0.t	# OK
	vsseg6e64.v v0, (a0), v0.t	# OK
	vsseg6e64.v v4, (a0), v0.t	# OK
	vlseg6e64ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e64ff.v v4, (a0), v0.t	# OK
	vlseg7e64.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e64.v v4, (a0), v0.t	# OK
	vsseg7e64.v v0, (a0), v0.t	# OK
	vsseg7e64.v v4, (a0), v0.t	# OK
	vlseg7e64ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e64ff.v v4, (a0), v0.t	# OK
	vlseg8e64.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e64.v v4, (a0), v0.t	# OK
	vsseg8e64.v v0, (a0), v0.t	# OK
	vsseg8e64.v v4, (a0), v0.t	# OK
	vlseg8e64ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e64ff.v v4, (a0), v0.t	# OK

	vlseg2e128.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e128.v v4, (a0), v0.t	# OK
	vsseg2e128.v v0, (a0), v0.t	# OK
	vsseg2e128.v v4, (a0), v0.t	# OK
	vlseg2e128ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e128ff.v v4, (a0), v0.t	# OK
	vlseg3e128.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e128.v v4, (a0), v0.t	# OK
	vsseg3e128.v v0, (a0), v0.t	# OK
	vsseg3e128.v v4, (a0), v0.t	# OK
	vlseg3e128ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e128ff.v v4, (a0), v0.t	# OK
	vlseg4e128.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e128.v v4, (a0), v0.t	# OK
	vsseg4e128.v v0, (a0), v0.t	# OK
	vsseg4e128.v v4, (a0), v0.t	# OK
	vlseg4e128ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e128ff.v v4, (a0), v0.t	# OK
	vlseg5e128.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e128.v v4, (a0), v0.t	# OK
	vsseg5e128.v v0, (a0), v0.t	# OK
	vsseg5e128.v v4, (a0), v0.t	# OK
	vlseg5e128ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e128ff.v v4, (a0), v0.t	# OK
	vlseg6e128.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e128.v v4, (a0), v0.t	# OK
	vsseg6e128.v v0, (a0), v0.t	# OK
	vsseg6e128.v v4, (a0), v0.t	# OK
	vlseg6e128ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e128ff.v v4, (a0), v0.t	# OK
	vlseg7e128.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e128.v v4, (a0), v0.t	# OK
	vsseg7e128.v v0, (a0), v0.t	# OK
	vsseg7e128.v v4, (a0), v0.t	# OK
	vlseg7e128ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e128ff.v v4, (a0), v0.t	# OK
	vlseg8e128.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e128.v v4, (a0), v0.t	# OK
	vsseg8e128.v v0, (a0), v0.t	# OK
	vsseg8e128.v v4, (a0), v0.t	# OK
	vlseg8e128ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e128ff.v v4, (a0), v0.t	# OK

	vlseg2e256.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e256.v v4, (a0), v0.t	# OK
	vsseg2e256.v v0, (a0), v0.t	# OK
	vsseg2e256.v v4, (a0), v0.t	# OK
	vlseg2e256ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e256ff.v v4, (a0), v0.t	# OK
	vlseg3e256.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e256.v v4, (a0), v0.t	# OK
	vsseg3e256.v v0, (a0), v0.t	# OK
	vsseg3e256.v v4, (a0), v0.t	# OK
	vlseg3e256ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e256ff.v v4, (a0), v0.t	# OK
	vlseg4e256.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e256.v v4, (a0), v0.t	# OK
	vsseg4e256.v v0, (a0), v0.t	# OK
	vsseg4e256.v v4, (a0), v0.t	# OK
	vlseg4e256ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e256ff.v v4, (a0), v0.t	# OK
	vlseg5e256.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e256.v v4, (a0), v0.t	# OK
	vsseg5e256.v v0, (a0), v0.t	# OK
	vsseg5e256.v v4, (a0), v0.t	# OK
	vlseg5e256ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e256ff.v v4, (a0), v0.t	# OK
	vlseg6e256.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e256.v v4, (a0), v0.t	# OK
	vsseg6e256.v v0, (a0), v0.t	# OK
	vsseg6e256.v v4, (a0), v0.t	# OK
	vlseg6e256ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e256ff.v v4, (a0), v0.t	# OK
	vlseg7e256.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e256.v v4, (a0), v0.t	# OK
	vsseg7e256.v v0, (a0), v0.t	# OK
	vsseg7e256.v v4, (a0), v0.t	# OK
	vlseg7e256ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e256ff.v v4, (a0), v0.t	# OK
	vlseg8e256.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e256.v v4, (a0), v0.t	# OK
	vsseg8e256.v v0, (a0), v0.t	# OK
	vsseg8e256.v v4, (a0), v0.t	# OK
	vlseg8e256ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e256ff.v v4, (a0), v0.t	# OK

	vlseg2e512.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e512.v v4, (a0), v0.t	# OK
	vsseg2e512.v v0, (a0), v0.t	# OK
	vsseg2e512.v v4, (a0), v0.t	# OK
	vlseg2e512ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e512ff.v v4, (a0), v0.t	# OK
	vlseg3e512.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e512.v v4, (a0), v0.t	# OK
	vsseg3e512.v v0, (a0), v0.t	# OK
	vsseg3e512.v v4, (a0), v0.t	# OK
	vlseg3e512ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e512ff.v v4, (a0), v0.t	# OK
	vlseg4e512.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e512.v v4, (a0), v0.t	# OK
	vsseg4e512.v v0, (a0), v0.t	# OK
	vsseg4e512.v v4, (a0), v0.t	# OK
	vlseg4e512ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e512ff.v v4, (a0), v0.t	# OK
	vlseg5e512.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e512.v v4, (a0), v0.t	# OK
	vsseg5e512.v v0, (a0), v0.t	# OK
	vsseg5e512.v v4, (a0), v0.t	# OK
	vlseg5e512ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e512ff.v v4, (a0), v0.t	# OK
	vlseg6e512.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e512.v v4, (a0), v0.t	# OK
	vsseg6e512.v v0, (a0), v0.t	# OK
	vsseg6e512.v v4, (a0), v0.t	# OK
	vlseg6e512ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e512ff.v v4, (a0), v0.t	# OK
	vlseg7e512.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e512.v v4, (a0), v0.t	# OK
	vsseg7e512.v v0, (a0), v0.t	# OK
	vsseg7e512.v v4, (a0), v0.t	# OK
	vlseg7e512ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e512ff.v v4, (a0), v0.t	# OK
	vlseg8e512.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e512.v v4, (a0), v0.t	# OK
	vsseg8e512.v v0, (a0), v0.t	# OK
	vsseg8e512.v v4, (a0), v0.t	# OK
	vlseg8e512ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e512ff.v v4, (a0), v0.t	# OK

	vlseg2e1024.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e1024.v v4, (a0), v0.t	# OK
	vsseg2e1024.v v0, (a0), v0.t	# OK
	vsseg2e1024.v v4, (a0), v0.t	# OK
	vlseg2e1024ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg2e1024ff.v v4, (a0), v0.t	# OK
	vlseg3e1024.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e1024.v v4, (a0), v0.t	# OK
	vsseg3e1024.v v0, (a0), v0.t	# OK
	vsseg3e1024.v v4, (a0), v0.t	# OK
	vlseg3e1024ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg3e1024ff.v v4, (a0), v0.t	# OK
	vlseg4e1024.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e1024.v v4, (a0), v0.t	# OK
	vsseg4e1024.v v0, (a0), v0.t	# OK
	vsseg4e1024.v v4, (a0), v0.t	# OK
	vlseg4e1024ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg4e1024ff.v v4, (a0), v0.t	# OK
	vlseg5e1024.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e1024.v v4, (a0), v0.t	# OK
	vsseg5e1024.v v0, (a0), v0.t	# OK
	vsseg5e1024.v v4, (a0), v0.t	# OK
	vlseg5e1024ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg5e1024ff.v v4, (a0), v0.t	# OK
	vlseg6e1024.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e1024.v v4, (a0), v0.t	# OK
	vsseg6e1024.v v0, (a0), v0.t	# OK
	vsseg6e1024.v v4, (a0), v0.t	# OK
	vlseg6e1024ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg6e1024ff.v v4, (a0), v0.t	# OK
	vlseg7e1024.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e1024.v v4, (a0), v0.t	# OK
	vsseg7e1024.v v0, (a0), v0.t	# OK
	vsseg7e1024.v v4, (a0), v0.t	# OK
	vlseg7e1024ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg7e1024ff.v v4, (a0), v0.t	# OK
	vlseg8e1024.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e1024.v v4, (a0), v0.t	# OK
	vsseg8e1024.v v0, (a0), v0.t	# OK
	vsseg8e1024.v v4, (a0), v0.t	# OK
	vlseg8e1024ff.v v0, (a0), v0.t	# vd overlap vm
	vlseg8e1024ff.v v4, (a0), v0.t	# OK

# Vector Strided Segment Loads and Stores

	vlsseg2e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e8.v v4, (a0), a1, v0.t	# OK
	vssseg2e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e8.v v4, (a0), a1, v0.t	# OK
	vlsseg3e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e8.v v4, (a0), a1, v0.t	# OK
	vssseg3e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e8.v v4, (a0), a1, v0.t	# OK
	vlsseg4e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e8.v v4, (a0), a1, v0.t	# OK
	vssseg4e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e8.v v4, (a0), a1, v0.t	# OK
	vlsseg5e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e8.v v4, (a0), a1, v0.t	# OK
	vssseg5e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e8.v v4, (a0), a1, v0.t	# OK
	vlsseg6e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e8.v v4, (a0), a1, v0.t	# OK
	vssseg6e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e8.v v4, (a0), a1, v0.t	# OK
	vlsseg7e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e8.v v4, (a0), a1, v0.t	# OK
	vssseg7e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e8.v v4, (a0), a1, v0.t	# OK
	vlsseg8e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e8.v v4, (a0), a1, v0.t	# OK
	vssseg8e8.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e8.v v4, (a0), a1, v0.t	# OK

	vlsseg2e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e16.v v4, (a0), a1, v0.t	# OK
	vssseg2e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e16.v v4, (a0), a1, v0.t	# OK
	vlsseg3e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e16.v v4, (a0), a1, v0.t	# OK
	vssseg3e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e16.v v4, (a0), a1, v0.t	# OK
	vlsseg4e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e16.v v4, (a0), a1, v0.t	# OK
	vssseg4e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e16.v v4, (a0), a1, v0.t	# OK
	vlsseg5e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e16.v v4, (a0), a1, v0.t	# OK
	vssseg5e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e16.v v4, (a0), a1, v0.t	# OK
	vlsseg6e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e16.v v4, (a0), a1, v0.t	# OK
	vssseg6e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e16.v v4, (a0), a1, v0.t	# OK
	vlsseg7e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e16.v v4, (a0), a1, v0.t	# OK
	vssseg7e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e16.v v4, (a0), a1, v0.t	# OK
	vlsseg8e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e16.v v4, (a0), a1, v0.t	# OK
	vssseg8e16.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e16.v v4, (a0), a1, v0.t	# OK

	vlsseg2e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e32.v v4, (a0), a1, v0.t	# OK
	vssseg2e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e32.v v4, (a0), a1, v0.t	# OK
	vlsseg3e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e32.v v4, (a0), a1, v0.t	# OK
	vssseg3e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e32.v v4, (a0), a1, v0.t	# OK
	vlsseg4e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e32.v v4, (a0), a1, v0.t	# OK
	vssseg4e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e32.v v4, (a0), a1, v0.t	# OK
	vlsseg5e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e32.v v4, (a0), a1, v0.t	# OK
	vssseg5e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e32.v v4, (a0), a1, v0.t	# OK
	vlsseg6e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e32.v v4, (a0), a1, v0.t	# OK
	vssseg6e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e32.v v4, (a0), a1, v0.t	# OK
	vlsseg7e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e32.v v4, (a0), a1, v0.t	# OK
	vssseg7e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e32.v v4, (a0), a1, v0.t	# OK
	vlsseg8e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e32.v v4, (a0), a1, v0.t	# OK
	vssseg8e32.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e32.v v4, (a0), a1, v0.t	# OK

	vlsseg2e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e64.v v4, (a0), a1, v0.t	# OK
	vssseg2e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e64.v v4, (a0), a1, v0.t	# OK
	vlsseg3e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e64.v v4, (a0), a1, v0.t	# OK
	vssseg3e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e64.v v4, (a0), a1, v0.t	# OK
	vlsseg4e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e64.v v4, (a0), a1, v0.t	# OK
	vssseg4e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e64.v v4, (a0), a1, v0.t	# OK
	vlsseg5e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e64.v v4, (a0), a1, v0.t	# OK
	vssseg5e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e64.v v4, (a0), a1, v0.t	# OK
	vlsseg6e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e64.v v4, (a0), a1, v0.t	# OK
	vssseg6e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e64.v v4, (a0), a1, v0.t	# OK
	vlsseg7e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e64.v v4, (a0), a1, v0.t	# OK
	vssseg7e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e64.v v4, (a0), a1, v0.t	# OK
	vlsseg8e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e64.v v4, (a0), a1, v0.t	# OK
	vssseg8e64.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e64.v v4, (a0), a1, v0.t	# OK

	vlsseg2e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e128.v v4, (a0), a1, v0.t	# OK
	vssseg2e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e128.v v4, (a0), a1, v0.t	# OK
	vlsseg3e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e128.v v4, (a0), a1, v0.t	# OK
	vssseg3e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e128.v v4, (a0), a1, v0.t	# OK
	vlsseg4e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e128.v v4, (a0), a1, v0.t	# OK
	vssseg4e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e128.v v4, (a0), a1, v0.t	# OK
	vlsseg5e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e128.v v4, (a0), a1, v0.t	# OK
	vssseg5e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e128.v v4, (a0), a1, v0.t	# OK
	vlsseg6e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e128.v v4, (a0), a1, v0.t	# OK
	vssseg6e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e128.v v4, (a0), a1, v0.t	# OK
	vlsseg7e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e128.v v4, (a0), a1, v0.t	# OK
	vssseg7e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e128.v v4, (a0), a1, v0.t	# OK
	vlsseg8e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e128.v v4, (a0), a1, v0.t	# OK
	vssseg8e128.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e128.v v4, (a0), a1, v0.t	# OK

	vlsseg2e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e256.v v4, (a0), a1, v0.t	# OK
	vssseg2e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e256.v v4, (a0), a1, v0.t	# OK
	vlsseg3e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e256.v v4, (a0), a1, v0.t	# OK
	vssseg3e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e256.v v4, (a0), a1, v0.t	# OK
	vlsseg4e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e256.v v4, (a0), a1, v0.t	# OK
	vssseg4e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e256.v v4, (a0), a1, v0.t	# OK
	vlsseg5e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e256.v v4, (a0), a1, v0.t	# OK
	vssseg5e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e256.v v4, (a0), a1, v0.t	# OK
	vlsseg6e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e256.v v4, (a0), a1, v0.t	# OK
	vssseg6e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e256.v v4, (a0), a1, v0.t	# OK
	vlsseg7e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e256.v v4, (a0), a1, v0.t	# OK
	vssseg7e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e256.v v4, (a0), a1, v0.t	# OK
	vlsseg8e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e256.v v4, (a0), a1, v0.t	# OK
	vssseg8e256.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e256.v v4, (a0), a1, v0.t	# OK

	vlsseg2e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e512.v v4, (a0), a1, v0.t	# OK
	vssseg2e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e512.v v4, (a0), a1, v0.t	# OK
	vlsseg3e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e512.v v4, (a0), a1, v0.t	# OK
	vssseg3e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e512.v v4, (a0), a1, v0.t	# OK
	vlsseg4e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e512.v v4, (a0), a1, v0.t	# OK
	vssseg4e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e512.v v4, (a0), a1, v0.t	# OK
	vlsseg5e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e512.v v4, (a0), a1, v0.t	# OK
	vssseg5e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e512.v v4, (a0), a1, v0.t	# OK
	vlsseg6e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e512.v v4, (a0), a1, v0.t	# OK
	vssseg6e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e512.v v4, (a0), a1, v0.t	# OK
	vlsseg7e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e512.v v4, (a0), a1, v0.t	# OK
	vssseg7e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e512.v v4, (a0), a1, v0.t	# OK
	vlsseg8e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e512.v v4, (a0), a1, v0.t	# OK
	vssseg8e512.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e512.v v4, (a0), a1, v0.t	# OK

	vlsseg2e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg2e1024.v v4, (a0), a1, v0.t	# OK
	vssseg2e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg2e1024.v v4, (a0), a1, v0.t	# OK
	vlsseg3e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg3e1024.v v4, (a0), a1, v0.t	# OK
	vssseg3e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg3e1024.v v4, (a0), a1, v0.t	# OK
	vlsseg4e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg4e1024.v v4, (a0), a1, v0.t	# OK
	vssseg4e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg4e1024.v v4, (a0), a1, v0.t	# OK
	vlsseg5e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg5e1024.v v4, (a0), a1, v0.t	# OK
	vssseg5e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg5e1024.v v4, (a0), a1, v0.t	# OK
	vlsseg6e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg6e1024.v v4, (a0), a1, v0.t	# OK
	vssseg6e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg6e1024.v v4, (a0), a1, v0.t	# OK
	vlsseg7e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg7e1024.v v4, (a0), a1, v0.t	# OK
	vssseg7e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg7e1024.v v4, (a0), a1, v0.t	# OK
	vlsseg8e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vlsseg8e1024.v v4, (a0), a1, v0.t	# OK
	vssseg8e1024.v v0, (a0), a1, v0.t	# vd overlap vm
	vssseg8e1024.v v4, (a0), a1, v0.t	# OK

# Vector Indexed Segment Loads and Stores

	vlxseg2ei8.v v0, (a0), v2		# OK
	vlxseg2ei8.v v1, (a0), v2		# OK
	vlxseg2ei8.v v2, (a0), v2		# vd overlap vs2
	vlxseg2ei8.v v0, (a0), v2, v0.t		# vd overlap vm
	vsxseg2ei8.v v0, (a0), v2
	vsxseg2ei8.v v1, (a0), v2
	vsxseg2ei8.v v2, (a0), v2
	vsxseg2ei8.v v0, (a0), v2, v0.t
	vlxseg3ei8.v v0, (a0), v2
	vlxseg3ei8.v v1, (a0), v2
	vlxseg3ei8.v v2, (a0), v2
	vlxseg3ei8.v v0, (a0), v2, v0.t
	vsxseg3ei8.v v0, (a0), v2
	vsxseg3ei8.v v1, (a0), v2
	vsxseg3ei8.v v2, (a0), v2
	vsxseg3ei8.v v0, (a0), v2, v0.t
	vlxseg4ei8.v v0, (a0), v2
	vlxseg4ei8.v v1, (a0), v2
	vlxseg4ei8.v v2, (a0), v2
	vlxseg4ei8.v v0, (a0), v2, v0.t
	vsxseg4ei8.v v0, (a0), v2
	vsxseg4ei8.v v1, (a0), v2
	vsxseg4ei8.v v2, (a0), v2
	vsxseg4ei8.v v0, (a0), v2, v0.t
	vlxseg5ei8.v v0, (a0), v2
	vlxseg5ei8.v v1, (a0), v2
	vlxseg5ei8.v v2, (a0), v2
	vlxseg5ei8.v v0, (a0), v2, v0.t
	vsxseg5ei8.v v0, (a0), v2
	vsxseg5ei8.v v1, (a0), v2
	vsxseg5ei8.v v2, (a0), v2
	vsxseg5ei8.v v0, (a0), v2, v0.t
	vlxseg6ei8.v v0, (a0), v2
	vlxseg6ei8.v v1, (a0), v2
	vlxseg6ei8.v v2, (a0), v2
	vlxseg6ei8.v v0, (a0), v2, v0.t
	vsxseg6ei8.v v0, (a0), v2
	vsxseg6ei8.v v1, (a0), v2
	vsxseg6ei8.v v2, (a0), v2
	vsxseg6ei8.v v0, (a0), v2, v0.t
	vlxseg7ei8.v v0, (a0), v2
	vlxseg7ei8.v v1, (a0), v2
	vlxseg7ei8.v v2, (a0), v2
	vlxseg7ei8.v v0, (a0), v2, v0.t
	vsxseg7ei8.v v0, (a0), v2
	vsxseg7ei8.v v1, (a0), v2
	vsxseg7ei8.v v2, (a0), v2
	vsxseg7ei8.v v0, (a0), v2, v0.t
	vlxseg8ei8.v v0, (a0), v2
	vlxseg8ei8.v v1, (a0), v2
	vlxseg8ei8.v v2, (a0), v2
	vlxseg8ei8.v v0, (a0), v2, v0.t
	vsxseg8ei8.v v0, (a0), v2
	vsxseg8ei8.v v1, (a0), v2
	vsxseg8ei8.v v2, (a0), v2
	vsxseg8ei8.v v0, (a0), v2, v0.t

	vlxseg2ei16.v v0, (a0), v2		# OK
	vlxseg2ei16.v v1, (a0), v2		# OK
	vlxseg2ei16.v v2, (a0), v2		# vd overlap vs2
	vlxseg2ei16.v v0, (a0), v2, v0.t	# vd overlap vm
	vsxseg2ei16.v v0, (a0), v2
	vsxseg2ei16.v v1, (a0), v2
	vsxseg2ei16.v v2, (a0), v2
	vsxseg2ei16.v v0, (a0), v2, v0.t
	vlxseg3ei16.v v0, (a0), v2
	vlxseg3ei16.v v1, (a0), v2
	vlxseg3ei16.v v2, (a0), v2
	vlxseg3ei16.v v0, (a0), v2, v0.t
	vsxseg3ei16.v v0, (a0), v2
	vsxseg3ei16.v v1, (a0), v2
	vsxseg3ei16.v v2, (a0), v2
	vsxseg3ei16.v v0, (a0), v2, v0.t
	vlxseg4ei16.v v0, (a0), v2
	vlxseg4ei16.v v1, (a0), v2
	vlxseg4ei16.v v2, (a0), v2
	vlxseg4ei16.v v0, (a0), v2, v0.t
	vsxseg4ei16.v v0, (a0), v2
	vsxseg4ei16.v v1, (a0), v2
	vsxseg4ei16.v v2, (a0), v2
	vsxseg4ei16.v v0, (a0), v2, v0.t
	vlxseg5ei16.v v0, (a0), v2
	vlxseg5ei16.v v1, (a0), v2
	vlxseg5ei16.v v2, (a0), v2
	vlxseg5ei16.v v0, (a0), v2, v0.t
	vsxseg5ei16.v v0, (a0), v2
	vsxseg5ei16.v v1, (a0), v2
	vsxseg5ei16.v v2, (a0), v2
	vsxseg5ei16.v v0, (a0), v2, v0.t
	vlxseg6ei16.v v0, (a0), v2
	vlxseg6ei16.v v1, (a0), v2
	vlxseg6ei16.v v2, (a0), v2
	vlxseg6ei16.v v0, (a0), v2, v0.t
	vsxseg6ei16.v v0, (a0), v2
	vsxseg6ei16.v v1, (a0), v2
	vsxseg6ei16.v v2, (a0), v2
	vsxseg6ei16.v v0, (a0), v2, v0.t
	vlxseg7ei16.v v0, (a0), v2
	vlxseg7ei16.v v1, (a0), v2
	vlxseg7ei16.v v2, (a0), v2
	vlxseg7ei16.v v0, (a0), v2, v0.t
	vsxseg7ei16.v v0, (a0), v2
	vsxseg7ei16.v v1, (a0), v2
	vsxseg7ei16.v v2, (a0), v2
	vsxseg7ei16.v v0, (a0), v2, v0.t
	vlxseg8ei16.v v0, (a0), v2
	vlxseg8ei16.v v1, (a0), v2
	vlxseg8ei16.v v2, (a0), v2
	vlxseg8ei16.v v0, (a0), v2, v0.t
	vsxseg8ei16.v v0, (a0), v2
	vsxseg8ei16.v v1, (a0), v2
	vsxseg8ei16.v v2, (a0), v2
	vsxseg8ei16.v v0, (a0), v2, v0.t

	vlxseg2ei32.v v0, (a0), v2		# OK
	vlxseg2ei32.v v1, (a0), v2		# OK
	vlxseg2ei32.v v2, (a0), v2		# vd overlap vs2
	vlxseg2ei32.v v0, (a0), v2, v0.t	# vd overlap vm
	vsxseg2ei32.v v0, (a0), v2
	vsxseg2ei32.v v1, (a0), v2
	vsxseg2ei32.v v2, (a0), v2
	vsxseg2ei32.v v0, (a0), v2, v0.t
	vlxseg3ei32.v v0, (a0), v2
	vlxseg3ei32.v v1, (a0), v2
	vlxseg3ei32.v v2, (a0), v2
	vlxseg3ei32.v v0, (a0), v2, v0.t
	vsxseg3ei32.v v0, (a0), v2
	vsxseg3ei32.v v1, (a0), v2
	vsxseg3ei32.v v2, (a0), v2
	vsxseg3ei32.v v0, (a0), v2, v0.t
	vlxseg4ei32.v v0, (a0), v2
	vlxseg4ei32.v v1, (a0), v2
	vlxseg4ei32.v v2, (a0), v2
	vlxseg4ei32.v v0, (a0), v2, v0.t
	vsxseg4ei32.v v0, (a0), v2
	vsxseg4ei32.v v1, (a0), v2
	vsxseg4ei32.v v2, (a0), v2
	vsxseg4ei32.v v0, (a0), v2, v0.t
	vlxseg5ei32.v v0, (a0), v2
	vlxseg5ei32.v v1, (a0), v2
	vlxseg5ei32.v v2, (a0), v2
	vlxseg5ei32.v v0, (a0), v2, v0.t
	vsxseg5ei32.v v0, (a0), v2
	vsxseg5ei32.v v1, (a0), v2
	vsxseg5ei32.v v2, (a0), v2
	vsxseg5ei32.v v0, (a0), v2, v0.t
	vlxseg6ei32.v v0, (a0), v2
	vlxseg6ei32.v v1, (a0), v2
	vlxseg6ei32.v v2, (a0), v2
	vlxseg6ei32.v v0, (a0), v2, v0.t
	vsxseg6ei32.v v0, (a0), v2
	vsxseg6ei32.v v1, (a0), v2
	vsxseg6ei32.v v2, (a0), v2
	vsxseg6ei32.v v0, (a0), v2, v0.t
	vlxseg7ei32.v v0, (a0), v2
	vlxseg7ei32.v v1, (a0), v2
	vlxseg7ei32.v v2, (a0), v2
	vlxseg7ei32.v v0, (a0), v2, v0.t
	vsxseg7ei32.v v0, (a0), v2
	vsxseg7ei32.v v1, (a0), v2
	vsxseg7ei32.v v2, (a0), v2
	vsxseg7ei32.v v0, (a0), v2, v0.t
	vlxseg8ei32.v v0, (a0), v2
	vlxseg8ei32.v v1, (a0), v2
	vlxseg8ei32.v v2, (a0), v2
	vlxseg8ei32.v v0, (a0), v2, v0.t
	vsxseg8ei32.v v0, (a0), v2
	vsxseg8ei32.v v1, (a0), v2
	vsxseg8ei32.v v2, (a0), v2
	vsxseg8ei32.v v0, (a0), v2, v0.t

	vlxseg2ei64.v v0, (a0), v2		# OK
	vlxseg2ei64.v v1, (a0), v2		# OK
	vlxseg2ei64.v v2, (a0), v2		# vd overlap vs2
	vlxseg2ei64.v v0, (a0), v2, v0.t	# vd overlap vm
	vsxseg2ei64.v v0, (a0), v2
	vsxseg2ei64.v v1, (a0), v2
	vsxseg2ei64.v v2, (a0), v2
	vsxseg2ei64.v v0, (a0), v2, v0.t
	vlxseg3ei64.v v0, (a0), v2
	vlxseg3ei64.v v1, (a0), v2
	vlxseg3ei64.v v2, (a0), v2
	vlxseg3ei64.v v0, (a0), v2, v0.t
	vsxseg3ei64.v v0, (a0), v2
	vsxseg3ei64.v v1, (a0), v2
	vsxseg3ei64.v v2, (a0), v2
	vsxseg3ei64.v v0, (a0), v2, v0.t
	vlxseg4ei64.v v0, (a0), v2
	vlxseg4ei64.v v1, (a0), v2
	vlxseg4ei64.v v2, (a0), v2
	vlxseg4ei64.v v0, (a0), v2, v0.t
	vsxseg4ei64.v v0, (a0), v2
	vsxseg4ei64.v v1, (a0), v2
	vsxseg4ei64.v v2, (a0), v2
	vsxseg4ei64.v v0, (a0), v2, v0.t
	vlxseg5ei64.v v0, (a0), v2
	vlxseg5ei64.v v1, (a0), v2
	vlxseg5ei64.v v2, (a0), v2
	vlxseg5ei64.v v0, (a0), v2, v0.t
	vsxseg5ei64.v v0, (a0), v2
	vsxseg5ei64.v v1, (a0), v2
	vsxseg5ei64.v v2, (a0), v2
	vsxseg5ei64.v v0, (a0), v2, v0.t
	vlxseg6ei64.v v0, (a0), v2
	vlxseg6ei64.v v1, (a0), v2
	vlxseg6ei64.v v2, (a0), v2
	vlxseg6ei64.v v0, (a0), v2, v0.t
	vsxseg6ei64.v v0, (a0), v2
	vsxseg6ei64.v v1, (a0), v2
	vsxseg6ei64.v v2, (a0), v2
	vsxseg6ei64.v v0, (a0), v2, v0.t
	vlxseg7ei64.v v0, (a0), v2
	vlxseg7ei64.v v1, (a0), v2
	vlxseg7ei64.v v2, (a0), v2
	vlxseg7ei64.v v0, (a0), v2, v0.t
	vsxseg7ei64.v v0, (a0), v2
	vsxseg7ei64.v v1, (a0), v2
	vsxseg7ei64.v v2, (a0), v2
	vsxseg7ei64.v v0, (a0), v2, v0.t
	vlxseg8ei64.v v0, (a0), v2
	vlxseg8ei64.v v1, (a0), v2
	vlxseg8ei64.v v2, (a0), v2
	vlxseg8ei64.v v0, (a0), v2, v0.t
	vsxseg8ei64.v v0, (a0), v2
	vsxseg8ei64.v v1, (a0), v2
	vsxseg8ei64.v v2, (a0), v2
	vsxseg8ei64.v v0, (a0), v2, v0.t

	vlxseg2ei128.v v0, (a0), v2		# OK
	vlxseg2ei128.v v1, (a0), v2		# OK
	vlxseg2ei128.v v2, (a0), v2		# vd overlap vs2
	vlxseg2ei128.v v0, (a0), v2, v0.t	# vd overlap vm
	vsxseg2ei128.v v0, (a0), v2
	vsxseg2ei128.v v1, (a0), v2
	vsxseg2ei128.v v2, (a0), v2
	vsxseg2ei128.v v0, (a0), v2, v0.t
	vlxseg3ei128.v v0, (a0), v2
	vlxseg3ei128.v v1, (a0), v2
	vlxseg3ei128.v v2, (a0), v2
	vlxseg3ei128.v v0, (a0), v2, v0.t
	vsxseg3ei128.v v0, (a0), v2
	vsxseg3ei128.v v1, (a0), v2
	vsxseg3ei128.v v2, (a0), v2
	vsxseg3ei128.v v0, (a0), v2, v0.t
	vlxseg4ei128.v v0, (a0), v2
	vlxseg4ei128.v v1, (a0), v2
	vlxseg4ei128.v v2, (a0), v2
	vlxseg4ei128.v v0, (a0), v2, v0.t
	vsxseg4ei128.v v0, (a0), v2
	vsxseg4ei128.v v1, (a0), v2
	vsxseg4ei128.v v2, (a0), v2
	vsxseg4ei128.v v0, (a0), v2, v0.t
	vlxseg5ei128.v v0, (a0), v2
	vlxseg5ei128.v v1, (a0), v2
	vlxseg5ei128.v v2, (a0), v2
	vlxseg5ei128.v v0, (a0), v2, v0.t
	vsxseg5ei128.v v0, (a0), v2
	vsxseg5ei128.v v1, (a0), v2
	vsxseg5ei128.v v2, (a0), v2
	vsxseg5ei128.v v0, (a0), v2, v0.t
	vlxseg6ei128.v v0, (a0), v2
	vlxseg6ei128.v v1, (a0), v2
	vlxseg6ei128.v v2, (a0), v2
	vlxseg6ei128.v v0, (a0), v2, v0.t
	vsxseg6ei128.v v0, (a0), v2
	vsxseg6ei128.v v1, (a0), v2
	vsxseg6ei128.v v2, (a0), v2
	vsxseg6ei128.v v0, (a0), v2, v0.t
	vlxseg7ei128.v v0, (a0), v2
	vlxseg7ei128.v v1, (a0), v2
	vlxseg7ei128.v v2, (a0), v2
	vlxseg7ei128.v v0, (a0), v2, v0.t
	vsxseg7ei128.v v0, (a0), v2
	vsxseg7ei128.v v1, (a0), v2
	vsxseg7ei128.v v2, (a0), v2
	vsxseg7ei128.v v0, (a0), v2, v0.t
	vlxseg8ei128.v v0, (a0), v2
	vlxseg8ei128.v v1, (a0), v2
	vlxseg8ei128.v v2, (a0), v2
	vlxseg8ei128.v v0, (a0), v2, v0.t
	vsxseg8ei128.v v0, (a0), v2
	vsxseg8ei128.v v1, (a0), v2
	vsxseg8ei128.v v2, (a0), v2
	vsxseg8ei128.v v0, (a0), v2, v0.t

	vlxseg2ei256.v v0, (a0), v2		# OK
	vlxseg2ei256.v v1, (a0), v2		# OK
	vlxseg2ei256.v v2, (a0), v2		# vd overlap vs2
	vlxseg2ei256.v v0, (a0), v2, v0.t	# vd overlap vm
	vsxseg2ei256.v v0, (a0), v2
	vsxseg2ei256.v v1, (a0), v2
	vsxseg2ei256.v v2, (a0), v2
	vsxseg2ei256.v v0, (a0), v2, v0.t
	vlxseg3ei256.v v0, (a0), v2
	vlxseg3ei256.v v1, (a0), v2
	vlxseg3ei256.v v2, (a0), v2
	vlxseg3ei256.v v0, (a0), v2, v0.t
	vsxseg3ei256.v v0, (a0), v2
	vsxseg3ei256.v v1, (a0), v2
	vsxseg3ei256.v v2, (a0), v2
	vsxseg3ei256.v v0, (a0), v2, v0.t
	vlxseg4ei256.v v0, (a0), v2
	vlxseg4ei256.v v1, (a0), v2
	vlxseg4ei256.v v2, (a0), v2
	vlxseg4ei256.v v0, (a0), v2, v0.t
	vsxseg4ei256.v v0, (a0), v2
	vsxseg4ei256.v v1, (a0), v2
	vsxseg4ei256.v v2, (a0), v2
	vsxseg4ei256.v v0, (a0), v2, v0.t
	vlxseg5ei256.v v0, (a0), v2
	vlxseg5ei256.v v1, (a0), v2
	vlxseg5ei256.v v2, (a0), v2
	vlxseg5ei256.v v0, (a0), v2, v0.t
	vsxseg5ei256.v v0, (a0), v2
	vsxseg5ei256.v v1, (a0), v2
	vsxseg5ei256.v v2, (a0), v2
	vsxseg5ei256.v v0, (a0), v2, v0.t
	vlxseg6ei256.v v0, (a0), v2
	vlxseg6ei256.v v1, (a0), v2
	vlxseg6ei256.v v2, (a0), v2
	vlxseg6ei256.v v0, (a0), v2, v0.t
	vsxseg6ei256.v v0, (a0), v2
	vsxseg6ei256.v v1, (a0), v2
	vsxseg6ei256.v v2, (a0), v2
	vsxseg6ei256.v v0, (a0), v2, v0.t
	vlxseg7ei256.v v0, (a0), v2
	vlxseg7ei256.v v1, (a0), v2
	vlxseg7ei256.v v2, (a0), v2
	vlxseg7ei256.v v0, (a0), v2, v0.t
	vsxseg7ei256.v v0, (a0), v2
	vsxseg7ei256.v v1, (a0), v2
	vsxseg7ei256.v v2, (a0), v2
	vsxseg7ei256.v v0, (a0), v2, v0.t
	vlxseg8ei256.v v0, (a0), v2
	vlxseg8ei256.v v1, (a0), v2
	vlxseg8ei256.v v2, (a0), v2
	vlxseg8ei256.v v0, (a0), v2, v0.t
	vsxseg8ei256.v v0, (a0), v2
	vsxseg8ei256.v v1, (a0), v2
	vsxseg8ei256.v v2, (a0), v2
	vsxseg8ei256.v v0, (a0), v2, v0.t

	vlxseg2ei512.v v0, (a0), v2		# OK
	vlxseg2ei512.v v1, (a0), v2		# OK
	vlxseg2ei512.v v2, (a0), v2		# vd overlap vs2
	vlxseg2ei512.v v0, (a0), v2, v0.t	# vd overlap vm
	vsxseg2ei512.v v0, (a0), v2
	vsxseg2ei512.v v1, (a0), v2
	vsxseg2ei512.v v2, (a0), v2
	vsxseg2ei512.v v0, (a0), v2, v0.t
	vlxseg3ei512.v v0, (a0), v2
	vlxseg3ei512.v v1, (a0), v2
	vlxseg3ei512.v v2, (a0), v2
	vlxseg3ei512.v v0, (a0), v2, v0.t
	vsxseg3ei512.v v0, (a0), v2
	vsxseg3ei512.v v1, (a0), v2
	vsxseg3ei512.v v2, (a0), v2
	vsxseg3ei512.v v0, (a0), v2, v0.t
	vlxseg4ei512.v v0, (a0), v2
	vlxseg4ei512.v v1, (a0), v2
	vlxseg4ei512.v v2, (a0), v2
	vlxseg4ei512.v v0, (a0), v2, v0.t
	vsxseg4ei512.v v0, (a0), v2
	vsxseg4ei512.v v1, (a0), v2
	vsxseg4ei512.v v2, (a0), v2
	vsxseg4ei512.v v0, (a0), v2, v0.t
	vlxseg5ei512.v v0, (a0), v2
	vlxseg5ei512.v v1, (a0), v2
	vlxseg5ei512.v v2, (a0), v2
	vlxseg5ei512.v v0, (a0), v2, v0.t
	vsxseg5ei512.v v0, (a0), v2
	vsxseg5ei512.v v1, (a0), v2
	vsxseg5ei512.v v2, (a0), v2
	vsxseg5ei512.v v0, (a0), v2, v0.t
	vlxseg6ei512.v v0, (a0), v2
	vlxseg6ei512.v v1, (a0), v2
	vlxseg6ei512.v v2, (a0), v2
	vlxseg6ei512.v v0, (a0), v2, v0.t
	vsxseg6ei512.v v0, (a0), v2
	vsxseg6ei512.v v1, (a0), v2
	vsxseg6ei512.v v2, (a0), v2
	vsxseg6ei512.v v0, (a0), v2, v0.t
	vlxseg7ei512.v v0, (a0), v2
	vlxseg7ei512.v v1, (a0), v2
	vlxseg7ei512.v v2, (a0), v2
	vlxseg7ei512.v v0, (a0), v2, v0.t
	vsxseg7ei512.v v0, (a0), v2
	vsxseg7ei512.v v1, (a0), v2
	vsxseg7ei512.v v2, (a0), v2
	vsxseg7ei512.v v0, (a0), v2, v0.t
	vlxseg8ei512.v v0, (a0), v2
	vlxseg8ei512.v v1, (a0), v2
	vlxseg8ei512.v v2, (a0), v2
	vlxseg8ei512.v v0, (a0), v2, v0.t
	vsxseg8ei512.v v0, (a0), v2
	vsxseg8ei512.v v1, (a0), v2
	vsxseg8ei512.v v2, (a0), v2
	vsxseg8ei512.v v0, (a0), v2, v0.t

	vlxseg2ei1024.v v0, (a0), v2		# OK
	vlxseg2ei1024.v v1, (a0), v2		# OK
	vlxseg2ei1024.v v2, (a0), v2		# vd overlap vs2
	vlxseg2ei1024.v v0, (a0), v2, v0.t	# vd overlap vm
	vsxseg2ei1024.v v0, (a0), v2
	vsxseg2ei1024.v v1, (a0), v2
	vsxseg2ei1024.v v2, (a0), v2
	vsxseg2ei1024.v v0, (a0), v2, v0.t
	vlxseg3ei1024.v v0, (a0), v2
	vlxseg3ei1024.v v1, (a0), v2
	vlxseg3ei1024.v v2, (a0), v2
	vlxseg3ei1024.v v0, (a0), v2, v0.t
	vsxseg3ei1024.v v0, (a0), v2
	vsxseg3ei1024.v v1, (a0), v2
	vsxseg3ei1024.v v2, (a0), v2
	vsxseg3ei1024.v v0, (a0), v2, v0.t
	vlxseg4ei1024.v v0, (a0), v2
	vlxseg4ei1024.v v1, (a0), v2
	vlxseg4ei1024.v v2, (a0), v2
	vlxseg4ei1024.v v0, (a0), v2, v0.t
	vsxseg4ei1024.v v0, (a0), v2
	vsxseg4ei1024.v v1, (a0), v2
	vsxseg4ei1024.v v2, (a0), v2
	vsxseg4ei1024.v v0, (a0), v2, v0.t
	vlxseg5ei1024.v v0, (a0), v2
	vlxseg5ei1024.v v1, (a0), v2
	vlxseg5ei1024.v v2, (a0), v2
	vlxseg5ei1024.v v0, (a0), v2, v0.t
	vsxseg5ei1024.v v0, (a0), v2
	vsxseg5ei1024.v v1, (a0), v2
	vsxseg5ei1024.v v2, (a0), v2
	vsxseg5ei1024.v v0, (a0), v2, v0.t
	vlxseg6ei1024.v v0, (a0), v2
	vlxseg6ei1024.v v1, (a0), v2
	vlxseg6ei1024.v v2, (a0), v2
	vlxseg6ei1024.v v0, (a0), v2, v0.t
	vsxseg6ei1024.v v0, (a0), v2
	vsxseg6ei1024.v v1, (a0), v2
	vsxseg6ei1024.v v2, (a0), v2
	vsxseg6ei1024.v v0, (a0), v2, v0.t
	vlxseg7ei1024.v v0, (a0), v2
	vlxseg7ei1024.v v1, (a0), v2
	vlxseg7ei1024.v v2, (a0), v2
	vlxseg7ei1024.v v0, (a0), v2, v0.t
	vsxseg7ei1024.v v0, (a0), v2
	vsxseg7ei1024.v v1, (a0), v2
	vsxseg7ei1024.v v2, (a0), v2
	vsxseg7ei1024.v v0, (a0), v2, v0.t
	vlxseg8ei1024.v v0, (a0), v2
	vlxseg8ei1024.v v1, (a0), v2
	vlxseg8ei1024.v v2, (a0), v2
	vlxseg8ei1024.v v0, (a0), v2, v0.t
	vsxseg8ei1024.v v0, (a0), v2
	vsxseg8ei1024.v v1, (a0), v2
	vsxseg8ei1024.v v2, (a0), v2
	vsxseg8ei1024.v v0, (a0), v2, v0.t
