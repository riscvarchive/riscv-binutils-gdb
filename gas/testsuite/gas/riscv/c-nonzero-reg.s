	.option rvc
	c.addiw x0, 10
	c.jr x0
	c.jalr x0
	c.lwsp x0, 0(sp)
	c.ldsp x0, 0(sp)
	c.mv x1, x0
	c.add x1, x0
