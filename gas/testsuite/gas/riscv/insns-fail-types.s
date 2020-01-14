target:
	# Invalid instruction, need to enbale d-ext
	fld fa0, 0(a0)
	fsd fa0, 0(a0)

	# Invalid instruction, RV64-only
	addiw x8, x8, 0
	addw x8, x8, x10

	# Unrecognized opcode
	unrecognized x0, x1, x2

	# Illegal operand
	# In other test cases

	# Internal error
	# It is hard to test this since the error is caused by the undefined
	# arguments in the opcode table (`arg`).
