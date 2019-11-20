# Vector Indexed Segment Loads and Stores

	vlxseg2b.v v0, (a0), v2		# OK
	vlxseg2b.v v1, (a0), v2		# OK
	vlxseg2b.v v2, (a0), v2		# vd overlap vs2
	vlxseg2b.v v0, (a0), v2, v0.t	# vd overlap vm
	vlxseg2h.v v0, (a0), v2
	vlxseg2h.v v1, (a0), v2
	vlxseg2h.v v2, (a0), v2
	vlxseg2h.v v0, (a0), v2, v0.t
	vlxseg2w.v v0, (a0), v2
	vlxseg2w.v v1, (a0), v2
	vlxseg2w.v v2, (a0), v2
	vlxseg2w.v v0, (a0), v2, v0.t
	vlxseg2e.v v0, (a0), v2
	vlxseg2e.v v1, (a0), v2
	vlxseg2e.v v2, (a0), v2
	vlxseg2e.v v0, (a0), v2, v0.t
	vlxseg2bu.v v0, (a0), v2
	vlxseg2bu.v v1, (a0), v2
	vlxseg2bu.v v2, (a0), v2
	vlxseg2bu.v v0, (a0), v2, v0.t
	vlxseg2hu.v v0, (a0), v2
	vlxseg2hu.v v1, (a0), v2
	vlxseg2hu.v v2, (a0), v2
	vlxseg2hu.v v0, (a0), v2, v0.t
	vlxseg2wu.v v0, (a0), v2
	vlxseg2wu.v v1, (a0), v2
	vlxseg2wu.v v2, (a0), v2
	vlxseg2wu.v v0, (a0), v2, v0.t
	vsxseg2b.v v0, (a0), v2
	vsxseg2b.v v1, (a0), v2
	vsxseg2b.v v2, (a0), v2
	vsxseg2b.v v0, (a0), v2, v0.t
	vsxseg2h.v v0, (a0), v2
	vsxseg2h.v v1, (a0), v2
	vsxseg2h.v v2, (a0), v2
	vsxseg2h.v v0, (a0), v2, v0.t
	vsxseg2w.v v0, (a0), v2
	vsxseg2w.v v1, (a0), v2
	vsxseg2w.v v2, (a0), v2
	vsxseg2w.v v0, (a0), v2, v0.t
	vsxseg2e.v v0, (a0), v2
	vsxseg2e.v v1, (a0), v2
	vsxseg2e.v v2, (a0), v2
	vsxseg2e.v v0, (a0), v2, v0.t

	vlxseg3b.v v0, (a0), v2		# OK
	vlxseg3b.v v1, (a0), v2		# OK
	vlxseg3b.v v2, (a0), v2		# vd overlap vs2
	vlxseg3b.v v0, (a0), v2, v0.t	# vd overlap vm
	vlxseg3h.v v0, (a0), v2
	vlxseg3h.v v1, (a0), v2
	vlxseg3h.v v2, (a0), v2
	vlxseg3h.v v0, (a0), v2, v0.t
	vlxseg3w.v v0, (a0), v2
	vlxseg3w.v v1, (a0), v2
	vlxseg3w.v v2, (a0), v2
	vlxseg3w.v v0, (a0), v2, v0.t
	vlxseg3e.v v0, (a0), v2
	vlxseg3e.v v1, (a0), v2
	vlxseg3e.v v2, (a0), v2
	vlxseg3e.v v0, (a0), v2, v0.t
	vlxseg3bu.v v0, (a0), v2
	vlxseg3bu.v v1, (a0), v2
	vlxseg3bu.v v2, (a0), v2
	vlxseg3bu.v v0, (a0), v2, v0.t
	vlxseg3hu.v v0, (a0), v2
	vlxseg3hu.v v1, (a0), v2
	vlxseg3hu.v v2, (a0), v2
	vlxseg3hu.v v0, (a0), v2, v0.t
	vlxseg3wu.v v0, (a0), v2
	vlxseg3wu.v v1, (a0), v2
	vlxseg3wu.v v2, (a0), v2
	vlxseg3wu.v v0, (a0), v2, v0.t
	vsxseg3b.v v0, (a0), v2
	vsxseg3b.v v1, (a0), v2
	vsxseg3b.v v2, (a0), v2
	vsxseg3b.v v0, (a0), v2, v0.t
	vsxseg3h.v v0, (a0), v2
	vsxseg3h.v v1, (a0), v2
	vsxseg3h.v v2, (a0), v2
	vsxseg3h.v v0, (a0), v2, v0.t
	vsxseg3w.v v0, (a0), v2
	vsxseg3w.v v1, (a0), v2
	vsxseg3w.v v2, (a0), v2
	vsxseg3w.v v0, (a0), v2, v0.t
	vsxseg3e.v v0, (a0), v2
	vsxseg3e.v v1, (a0), v2
	vsxseg3e.v v2, (a0), v2
	vsxseg3e.v v0, (a0), v2, v0.t

	vlxseg4b.v v0, (a0), v2		# OK
	vlxseg4b.v v1, (a0), v2		# OK
	vlxseg4b.v v2, (a0), v2		# vd overlap vs2
	vlxseg4b.v v0, (a0), v2, v0.t	# vd overlap vm
	vlxseg4h.v v0, (a0), v2
	vlxseg4h.v v1, (a0), v2
	vlxseg4h.v v2, (a0), v2
	vlxseg4h.v v0, (a0), v2, v0.t
	vlxseg4w.v v0, (a0), v2
	vlxseg4w.v v1, (a0), v2
	vlxseg4w.v v2, (a0), v2
	vlxseg4w.v v0, (a0), v2, v0.t
	vlxseg4e.v v0, (a0), v2
	vlxseg4e.v v1, (a0), v2
	vlxseg4e.v v2, (a0), v2
	vlxseg4e.v v0, (a0), v2, v0.t
	vlxseg4bu.v v0, (a0), v2
	vlxseg4bu.v v1, (a0), v2
	vlxseg4bu.v v2, (a0), v2
	vlxseg4bu.v v0, (a0), v2, v0.t
	vlxseg4hu.v v0, (a0), v2
	vlxseg4hu.v v1, (a0), v2
	vlxseg4hu.v v2, (a0), v2
	vlxseg4hu.v v0, (a0), v2, v0.t
	vlxseg4wu.v v0, (a0), v2
	vlxseg4wu.v v1, (a0), v2
	vlxseg4wu.v v2, (a0), v2
	vlxseg4wu.v v0, (a0), v2, v0.t
	vsxseg4b.v v0, (a0), v2
	vsxseg4b.v v1, (a0), v2
	vsxseg4b.v v2, (a0), v2
	vsxseg4b.v v0, (a0), v2, v0.t
	vsxseg4h.v v0, (a0), v2
	vsxseg4h.v v1, (a0), v2
	vsxseg4h.v v2, (a0), v2
	vsxseg4h.v v0, (a0), v2, v0.t
	vsxseg4w.v v0, (a0), v2
	vsxseg4w.v v1, (a0), v2
	vsxseg4w.v v2, (a0), v2
	vsxseg4w.v v0, (a0), v2, v0.t
	vsxseg4e.v v0, (a0), v2
	vsxseg4e.v v1, (a0), v2
	vsxseg4e.v v2, (a0), v2
	vsxseg4e.v v0, (a0), v2, v0.t

	vlxseg5b.v v0, (a0), v2		# OK
	vlxseg5b.v v1, (a0), v2		# OK
	vlxseg5b.v v2, (a0), v2		# vd overlap vs2
	vlxseg5b.v v0, (a0), v2, v0.t	# vd overlap vm
	vlxseg5h.v v0, (a0), v2
	vlxseg5h.v v1, (a0), v2
	vlxseg5h.v v2, (a0), v2
	vlxseg5h.v v0, (a0), v2, v0.t
	vlxseg5w.v v0, (a0), v2
	vlxseg5w.v v1, (a0), v2
	vlxseg5w.v v2, (a0), v2
	vlxseg5w.v v0, (a0), v2, v0.t
	vlxseg5e.v v0, (a0), v2
	vlxseg5e.v v1, (a0), v2
	vlxseg5e.v v2, (a0), v2
	vlxseg5e.v v0, (a0), v2, v0.t
	vlxseg5bu.v v0, (a0), v2
	vlxseg5bu.v v1, (a0), v2
	vlxseg5bu.v v2, (a0), v2
	vlxseg5bu.v v0, (a0), v2, v0.t
	vlxseg5hu.v v0, (a0), v2
	vlxseg5hu.v v1, (a0), v2
	vlxseg5hu.v v2, (a0), v2
	vlxseg5hu.v v0, (a0), v2, v0.t
	vlxseg5wu.v v0, (a0), v2
	vlxseg5wu.v v1, (a0), v2
	vlxseg5wu.v v2, (a0), v2
	vlxseg5wu.v v0, (a0), v2, v0.t
	vsxseg5b.v v0, (a0), v2
	vsxseg5b.v v1, (a0), v2
	vsxseg5b.v v2, (a0), v2
	vsxseg5b.v v0, (a0), v2, v0.t
	vsxseg5h.v v0, (a0), v2
	vsxseg5h.v v1, (a0), v2
	vsxseg5h.v v2, (a0), v2
	vsxseg5h.v v0, (a0), v2, v0.t
	vsxseg5w.v v0, (a0), v2
	vsxseg5w.v v1, (a0), v2
	vsxseg5w.v v2, (a0), v2
	vsxseg5w.v v0, (a0), v2, v0.t
	vsxseg5e.v v0, (a0), v2
	vsxseg5e.v v1, (a0), v2
	vsxseg5e.v v2, (a0), v2
	vsxseg5e.v v0, (a0), v2, v0.t

	vlxseg6b.v v0, (a0), v2		# OK
	vlxseg6b.v v1, (a0), v2		# OK
	vlxseg6b.v v2, (a0), v2		# vd overlap vs2
	vlxseg6b.v v0, (a0), v2, v0.t	# vd overlap vm
	vlxseg6h.v v0, (a0), v2
	vlxseg6h.v v1, (a0), v2
	vlxseg6h.v v2, (a0), v2
	vlxseg6h.v v0, (a0), v2, v0.t
	vlxseg6w.v v0, (a0), v2
	vlxseg6w.v v1, (a0), v2
	vlxseg6w.v v2, (a0), v2
	vlxseg6w.v v0, (a0), v2, v0.t
	vlxseg6e.v v0, (a0), v2
	vlxseg6e.v v1, (a0), v2
	vlxseg6e.v v2, (a0), v2
	vlxseg6e.v v0, (a0), v2, v0.t
	vlxseg6bu.v v0, (a0), v2
	vlxseg6bu.v v1, (a0), v2
	vlxseg6bu.v v2, (a0), v2
	vlxseg6bu.v v0, (a0), v2, v0.t
	vlxseg6hu.v v0, (a0), v2
	vlxseg6hu.v v1, (a0), v2
	vlxseg6hu.v v2, (a0), v2
	vlxseg6hu.v v0, (a0), v2, v0.t
	vlxseg6wu.v v0, (a0), v2
	vlxseg6wu.v v1, (a0), v2
	vlxseg6wu.v v2, (a0), v2
	vlxseg6wu.v v0, (a0), v2, v0.t
	vsxseg6b.v v0, (a0), v2
	vsxseg6b.v v1, (a0), v2
	vsxseg6b.v v2, (a0), v2
	vsxseg6b.v v0, (a0), v2, v0.t
	vsxseg6h.v v0, (a0), v2
	vsxseg6h.v v1, (a0), v2
	vsxseg6h.v v2, (a0), v2
	vsxseg6h.v v0, (a0), v2, v0.t
	vsxseg6w.v v0, (a0), v2
	vsxseg6w.v v1, (a0), v2
	vsxseg6w.v v2, (a0), v2
	vsxseg6w.v v0, (a0), v2, v0.t
	vsxseg6e.v v0, (a0), v2
	vsxseg6e.v v1, (a0), v2
	vsxseg6e.v v2, (a0), v2
	vsxseg6e.v v0, (a0), v2, v0.t

	vlxseg7b.v v0, (a0), v2		# OK
	vlxseg7b.v v1, (a0), v2		# OK
	vlxseg7b.v v2, (a0), v2		# vd overlap vs2
	vlxseg7b.v v0, (a0), v2, v0.t	# vd overlap vm
	vlxseg7h.v v0, (a0), v2
	vlxseg7h.v v1, (a0), v2
	vlxseg7h.v v2, (a0), v2
	vlxseg7h.v v0, (a0), v2, v0.t
	vlxseg7w.v v0, (a0), v2
	vlxseg7w.v v1, (a0), v2
	vlxseg7w.v v2, (a0), v2
	vlxseg7w.v v0, (a0), v2, v0.t
	vlxseg7e.v v0, (a0), v2
	vlxseg7e.v v1, (a0), v2
	vlxseg7e.v v2, (a0), v2
	vlxseg7e.v v0, (a0), v2, v0.t
	vlxseg7bu.v v0, (a0), v2
	vlxseg7bu.v v1, (a0), v2
	vlxseg7bu.v v2, (a0), v2
	vlxseg7bu.v v0, (a0), v2, v0.t
	vlxseg7hu.v v0, (a0), v2
	vlxseg7hu.v v1, (a0), v2
	vlxseg7hu.v v2, (a0), v2
	vlxseg7hu.v v0, (a0), v2, v0.t
	vlxseg7wu.v v0, (a0), v2
	vlxseg7wu.v v1, (a0), v2
	vlxseg7wu.v v2, (a0), v2
	vlxseg7wu.v v0, (a0), v2, v0.t
	vsxseg7b.v v0, (a0), v2
	vsxseg7b.v v1, (a0), v2
	vsxseg7b.v v2, (a0), v2
	vsxseg7b.v v0, (a0), v2, v0.t
	vsxseg7h.v v0, (a0), v2
	vsxseg7h.v v1, (a0), v2
	vsxseg7h.v v2, (a0), v2
	vsxseg7h.v v0, (a0), v2, v0.t
	vsxseg7w.v v0, (a0), v2
	vsxseg7w.v v1, (a0), v2
	vsxseg7w.v v2, (a0), v2
	vsxseg7w.v v0, (a0), v2, v0.t
	vsxseg7e.v v0, (a0), v2
	vsxseg7e.v v1, (a0), v2
	vsxseg7e.v v2, (a0), v2
	vsxseg7e.v v0, (a0), v2, v0.t

	vlxseg8b.v v0, (a0), v2		# OK
	vlxseg8b.v v1, (a0), v2		# OK
	vlxseg8b.v v2, (a0), v2		# vd overlap vs2
	vlxseg8b.v v0, (a0), v2, v0.t	# vd overlap vm
	vlxseg8h.v v0, (a0), v2
	vlxseg8h.v v1, (a0), v2
	vlxseg8h.v v2, (a0), v2
	vlxseg8h.v v0, (a0), v2, v0.t
	vlxseg8w.v v0, (a0), v2
	vlxseg8w.v v1, (a0), v2
	vlxseg8w.v v2, (a0), v2
	vlxseg8w.v v0, (a0), v2, v0.t
	vlxseg8e.v v0, (a0), v2
	vlxseg8e.v v1, (a0), v2
	vlxseg8e.v v2, (a0), v2
	vlxseg8e.v v0, (a0), v2, v0.t
	vlxseg8bu.v v0, (a0), v2
	vlxseg8bu.v v1, (a0), v2
	vlxseg8bu.v v2, (a0), v2
	vlxseg8bu.v v0, (a0), v2, v0.t
	vlxseg8hu.v v0, (a0), v2
	vlxseg8hu.v v1, (a0), v2
	vlxseg8hu.v v2, (a0), v2
	vlxseg8hu.v v0, (a0), v2, v0.t
	vlxseg8wu.v v0, (a0), v2
	vlxseg8wu.v v1, (a0), v2
	vlxseg8wu.v v2, (a0), v2
	vlxseg8wu.v v0, (a0), v2, v0.t
	vsxseg8b.v v0, (a0), v2
	vsxseg8b.v v1, (a0), v2
	vsxseg8b.v v2, (a0), v2
	vsxseg8b.v v0, (a0), v2, v0.t
	vsxseg8h.v v0, (a0), v2
	vsxseg8h.v v1, (a0), v2
	vsxseg8h.v v2, (a0), v2
	vsxseg8h.v v0, (a0), v2, v0.t
	vsxseg8w.v v0, (a0), v2
	vsxseg8w.v v1, (a0), v2
	vsxseg8w.v v2, (a0), v2
	vsxseg8w.v v0, (a0), v2, v0.t
	vsxseg8e.v v0, (a0), v2
	vsxseg8e.v v1, (a0), v2
	vsxseg8e.v v2, (a0), v2
	vsxseg8e.v v0, (a0), v2, v0.t
