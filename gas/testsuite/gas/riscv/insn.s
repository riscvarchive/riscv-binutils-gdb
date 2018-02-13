target:
	.insn r  0x33,  0,  0, a0, a1, a2
	.insn i  0x13,  0, a0, a1, 13
	.insn i  0x67,  0, a0, 10(a1)
	.insn s   0x3,  0, a0, 4(a1)
	.insn sb 0x63,  0, a0, a1, target
	.insn sb 0x23,  0, a0, 4(a1)
	.insn u  0x37, a0, 0xfff
	.insn uj 0x6f, a0, target

	.insn ci 0x1, 0x0, a0, 4
	.insn cr 0x2, 0x8, a0, a1
	.insn ciw 0x1, 0x2, a1, 10
	.insn cb 0x1, 0x6, a1, target
	.insn cj 0x1, 0x5, target
