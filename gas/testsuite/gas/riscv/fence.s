target:
	# fence w, w with fm[31:28] = 0x1000
	fence.tso

	# fence w, 0
	pause

	# fence iorw, iorw
	fence
	fence	iorw, iorw
