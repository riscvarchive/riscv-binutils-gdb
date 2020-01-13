target:
	.insn r  0x30, 0, 0, a0, a1, a2		# invalid O4 field
	.insn cr 0x3, 0x8, a0, a1		# invalid O2 field

	.insn r  0x33, 0x8, 0x128, a0, a1, a2	# invalid F3 field
	.insn r  0x33, 0x0, 0x128, a0, a1, a2	# invalid F7 field, but report invalid F2 field
	.insn r  MADD, 0x0, 0x4, a0, a1, a2, a3	# invalid F2 field

	.insn ca C1, 0x64, 0x4, a0, a		# invalid CF6
	.insn ca C1, 0x23, 0x4, a0, a		# invalid CF2
	.insn cb C1, 0x8, a1, target		# invalid CF3
	.insn cr C2, 0x16, a0, a1		# invalid CF4
