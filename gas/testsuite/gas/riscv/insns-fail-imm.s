	sllw    x1, x2, 32	# imm must be 0...31
	sll	x1, x2, 64	# RV64, imm must be 0...(XLEN-1) = 63
	csrrwi	x1, 0x1, 32	# CSRRxI imm must be 0...31

	csrr	x1, 0x0		# csr must be 0x0...0xfff
	csrr	x1, 0xfff
	csrr	x1, 0x1000

	lui	x1, 0x0		# lui imm must be 0x0...0xfffff
	lui	x1, 0xfffff
	lui	x1, 0x100000
