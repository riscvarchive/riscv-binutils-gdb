target:
	c.lwsp x1, 0(x3)	# crs1 must be sp
	c.ldsp x1, 0(x3)	# crs1 must be sp
	c.lui x2, 0x10		# rd can not be sp
	c.addi16sp x1,0		# rd must be sp
	c.addi4spn x1, x3, 0	# rd must be x8-x15
	c.addi4spn x8, x3, 0	# crs1 must be sp
	c.slli x1, 0		# rd must be x8-x15
	c.srli x1, 0x10		# rd must be x8-x15
	c.srai x1, 0x10		# rd must be x8-x15
