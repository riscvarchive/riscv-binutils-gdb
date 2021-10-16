dsp64:
	# Table 25. (RV64 Only) SIMD 32-bit Add/Subtract Instructions (30)
	add32     a1, a2, a3
	radd32    a1, a2, a3
	uradd32   a1, a2, a3
	kadd32    a1, a2, a3
	ukadd32   a1, a2, a3
	sub32     a1, a2, a3
	rsub32    a1, a2, a3
	ursub32   a1, a2, a3
	ksub32    a1, a2, a3
	uksub32   a1, a2, a3
	cras32    a1, a2, a3
	rcras32   a1, a2, a3
	urcras32  a1, a2, a3
	kcras32   a1, a2, a3
	ukcras32  a1, a2, a3
	crsa32    a1, a2, a3
	rcrsa32   a1, a2, a3
	urcrsa32  a1, a2, a3
	kcrsa32   a1, a2, a3
	ukcrsa32  a1, a2, a3
	stas32    a1, a2, a3
	rstas32   a1, a2, a3
	urstas32  a1, a2, a3
	kstas32   a1, a2, a3
	ukstas32  a1, a2, a3
	stsa32    a1, a2, a3
	rstsa32   a1, a2, a3
	urstsa32  a1, a2, a3
	kstsa32   a1, a2, a3
	ukstsa32  a1, a2, a3

	# Table 26. (RV64 Only) SIMD 32-bit Shift Instructions (14)
	sra32     a1, a2, a3
	srai32    a1, a2, 5
	sra32.u   a1, a2, a3
	srai32.u  a1, a2, 5
	srl32     a1, a2, a3
	srli32    a1, a2, 5
	srl32.u   a1, a2, a3
	srli32.u  a1, a2, 5
	sll32     a1, a2, a3
	slli32    a1, a2, 5
	ksll32    a1, a2, a3
	kslli32   a1, a2, 5
	kslra32   a1, a2, a3
	kslra32.u a1, a2, a3

	# Table 27. (RV64 Only) SIMD 32-bit Miscellaneous Instructions (5)
	smin32    a1, a2, a3
	umin32    a1, a2, a3
	smax32    a1, a2, a3
	umax32    a1, a2, a3
	kabs32    a1, a2

	# Table 28. (RV64 Only) SIMD Q15 saturating Multiply Instructions (9)
	khmbb16   a1, a2, a3
	khmbt16   a1, a2, a3
	khmtt16   a1, a2, a3
	kdmbb16   a1, a2, a3
	kdmbt16   a1, a2, a3
	kdmtt16   a1, a2, a3
	kdmabb16  a1, a2, a3
	kdmabt16  a1, a2, a3
	kdmatt16  a1, a2, a3

	# Table 29. (RV64 Only) 32-bit Multiply Instructions (3)
	smbb32    a1, a2, a3
	smbt32    a1, a2, a3
	smtt32    a1, a2, a3

	# Table 30. (RV64 Only) 32-bit Multiply & Add Instructions (3)
	kmabb32   a1, a2, a3
	kmabt32   a1, a2, a3
	kmatt32   a1, a2, a3

	# Table 31. (RV64 Only) 32-bit Parallel Multiply & Add Instructions (12)
	kmda32    a1, a2, a3
	kmxda32   a1, a2, a3
	kmar64   a1, a2, a3
	kmaxda32  a1, a2, a3
	kmads32   a1, a2, a3
	kmadrs32  a1, a2, a3
	kmaxds32  a1, a2, a3
	kmsda32   a1, a2, a3
	kmsxda32  a1, a2, a3
	smds32    a1, a2, a3
	smdrs32   a1, a2, a3
	smxds32   a1, a2, a3

	# Table 32. (RV64 Only) Non-SIMD 32-bit Shift Instructions (1)
	sraiw.u   a1, a2, 5

	# Table 33. 32-bit Packing Instructions (4)
	pkbb32    a1, a2, a3
	pkbt32    a1, a2, a3
	pktt32    a1, a2, a3
	pktb32    a1, a2, a3
