dsp:
	# Table 1. SIMD 16-bit Add/Subtract Instructions (30)
	add16     a1, a2, a3
	radd16    a1, a2, a3
	uradd16   a1, a2, a3
	kadd16    a1, a2, a3
	ukadd16   a1, a2, a3
	sub16     a1, a2, a3
	rsub16    a1, a2, a3
	ursub16   a1, a2, a3
	ksub16    a1, a2, a3
	uksub16   a1, a2, a3
	cras16    a1, a2, a3
	rcras16   a1, a2, a3
	urcras16  a1, a2, a3
	kcras16   a1, a2, a3
	ukcras16  a1, a2, a3
	crsa16    a1, a2, a3
	rcrsa16   a1, a2, a3
	urcrsa16  a1, a2, a3
	kcrsa16   a1, a2, a3
	ukcrsa16  a1, a2, a3
	stas16    a1, a2, a3
	rstas16   a1, a2, a3
	urstas16  a1, a2, a3
	kstas16   a1, a2, a3
	ukstas16  a1, a2, a3
	stsa16    a1, a2, a3
	rstsa16   a1, a2, a3
	urstsa16  a1, a2, a3
	kstsa16   a1, a2, a3
	ukstsa16  a1, a2, a3

	# Table 2. SIMD 8-bit Add/Subtract Instructions (10)
	add8      a1, a2, a3
	radd8     a1, a2, a3
	uradd8    a1, a2, a3
	kadd8     a1, a2, a3
	ukadd8    a1, a2, a3
	sub8      a1, a2, a3
	rsub8     a1, a2, a3
	ursub8    a1, a2, a3
	ksub8     a1, a2, a3
	uksub8    a1, a2, a3

	# Table 3. SIMD 16-bit Shift Instructions (14)
	sra16     a1, a2, a3
	srai16    a1, a2, 4
	sra16.u   a1, a2, a3
	srai16.u  a1, a2, 4
	srl16     a1, a2, a3
	srli16    a1, a2, 4
	srl16.u   a1, a2, a3
	srli16.u  a1, a2, 4
	sll16     a1, a2, a3
	slli16    a1, a2, 4
	ksll16    a1, a2, a3
	kslli16   a1, a2, 4
	kslra16   a1, a2, a3
	kslra16.u a1, a2, a3

	# Table 4. SIMD 8-bit Shift Instructions (14)
	sra8      a1, a2, a3
	srai8     a1, a2, 3
	sra8.u    a1, a2, a3
	srai8.u   a1, a2, 4
	srl8      a1, a2, a3
	srli8     a1, a2, 3
	srl8.u    a1, a2, a3
	srli8.u   a1, a2, 4
	sll8      a1, a2, a3
	slli8     a1, a2, 3
	ksll8     a1, a2, a3
	kslli8    a1, a2, 3
	kslra8    a1, a2, a3
	kslra8.u  a1, a2, a3

	# Table 5. SIMD 16-bit Compare Instructions (5)
	cmpeq16   a1, a2, a3
	scmplt16  a1, a2, a3
	scmple16  a1, a2, a3
	ucmplt16  a1, a2, a3
	ucmple16  a1, a2, a3

	# Table 6. SIMD 8-bit Compare Instructions (5)
	cmpeq8    a1, a2, a3
	scmplt8   a1, a2, a3
	scmple8   a1, a2, a3
	ucmplt8   a1, a2, a3
	ucmple8   a1, a2, a3

	# Table 7. SIMD 16-bit Miscellaneous Instructions (12)
	smin16    a1, a2, a3
	umin16    a1, a2, a3
	smax16    a1, a2, a3
	umax16    a1, a2, a3
	sclip16   a1, a2, 4
	uclip16   a1, a2, 4
	khm16     a1, a2, a3
	khmx16    a1, a2, a3
	kabs16    a1, a2
	clrs16    a1, a2
	clz16     a1, a2
	swap16    a1, a2

	# Table 8. SIMD 8-bit Miscellaneous Instructions (12)
	smin8     a1, a2, a3
	umin8     a1, a2, a3
	smax8     a1, a2, a3
	umax8     a1, a2, a3
	khm8      a1, a2, a3
	khmx8     a1, a2, a3
	kabs8     a1, a2
	sclip8    a1, a2, 3
	uclip8    a1, a2, 3
	clrs8     a1, a2
	clz8      a1, a2
	swap8     a1, a2

	# Table 9. 8-bit Unpacking Instructions (10)
	sunpkd810 a1, a2
	sunpkd820 a1, a2
	sunpkd830 a1, a2
	sunpkd831 a1, a2
	sunpkd832 a1, a2
	zunpkd810 a1, a2
	zunpkd820 a1, a2
	zunpkd830 a1, a2
	zunpkd831 a1, a2
	zunpkd832 a1, a2

	# Table 10. 16-bit Packing Instructions (4)
	pkbb16    a1, a2, a3
	pkbt16    a1, a2, a3
	pktb16    a1, a2, a3
	pktt16    a1, a2, a3

	# Table 11. Signed MSW 32x32 Multiply and Add Instructions (8)
	smmul     a1, a2, a3
	smmul.u   a1, a2, a3
	kmmac     a1, a2, a3
	kmmac.u   a1, a2, a3
	kmmsb     a1, a2, a3
	kmmsb.u   a1, a2, a3
	kwmmul    a1, a2, a3
	kwmmul.u  a1, a2, a3

	# Table 12. Signed MSW 32x16 Multiply and Add Instructions (16)
	smmwb     a1, a2, a3
	smmwb.u   a1, a2, a3
	smmwt     a1, a2, a3
	smmwt.u   a1, a2, a3
	kmmawb    a1, a2, a3
	kmmawb.u  a1, a2, a3
	kmmawt    a1, a2, a3
	kmmawt.u  a1, a2, a3
	kmmwb2    a1, a2, a3
	kmmwb2.u  a1, a2, a3
	kmmwt2    a1, a2, a3
	kmmwt2.u  a1, a2, a3
	kmmawb2   a1, a2, a3
	kmmawb2.u a1, a2, a3
	kmmawt2   a1, a2, a3
	kmmawt2.u a1, a2, a3

	# Table 13. Signed 16-bit Multiply 32-bit Add/Subtract Instructions (18)
	smbb16    a1, a2, a3
	smbt16    a1, a2, a3
	smtt16    a1, a2, a3
	kmda      a1, a2, a3
	kmxda     a1, a2, a3
	smds      a1, a2, a3
	smdrs     a1, a2, a3
	smxds     a1, a2, a3
	kmabb     a1, a2, a3
	kmabt     a1, a2, a3
	kmatt     a1, a2, a3
	kmada     a1, a2, a3
	kmaxda    a1, a2, a3
	kmads     a1, a2, a3
	kmadrs    a1, a2, a3
	kmaxds    a1, a2, a3
	kmsda     a1, a2, a3
	kmsxda    a1, a2, a3

	# Table 14. Signed 16-bit Multiply 64-bit Add/Subtract Instructions (1)
	smal      a2, a4, a6

	# Table 15. Partial-SIMD Miscellaneous Instructions (7)
	sclip32   a1, a2, 5
	uclip32   a1, a2, 5
	clrs32    a1, a2
	clz32     a1, a2
	pbsad     a1, a2, a3
	pbsada    a1, a2, a3

	# Table 16. 8-bit Multiply with 32-bit Add Instructions (3)
	smaqa     a1, a2, a3
	umaqa     a1, a2, a3
	smaqa.su  a1, a2, a3

	# Table 17. 64-bit Add/Subtract Instructions (10)
	add64     a2, a4, a6
	radd64    a2, a4, a6
	uradd64   a2, a4, a6
	kadd64    a2, a4, a6
	ukadd64   a2, a4, a6
	sub64     a2, a4, a6
	rsub64    a2, a4, a6
	ursub64   a2, a4, a6
	ksub64    a2, a4, a6
	uksub64   a2, a4, a6

	# Table 18. 32-bit Multiply 64-bit Add/Subtract Instructions (8)
	smar64    a2, a4, a6
	smsr64    a2, a4, a6
	umar64    a2, a4, a6
	umsr64    a2, a4, a6
	kmar64    a2, a4, a6
	kmsr64    a2, a4, a6
	ukmar64   a2, a4, a6
	ukmsr64   a2, a4, a6

	# Table 19. Signed 16-bit Multiply 64-bit Add/Subtract Instructions (10)
	smalbb    a2, a4, a6
	smalbt    a2, a4, a6
	smaltt    a2, a4, a6
	smalda    a2, a4, a6
	smalxda   a2, a4, a6
	smalds    a2, a4, a6
	smaldrs   a2, a4, a6
	smalxds   a2, a4, a6
	smslda    a2, a4, a6
	smslxda   a2, a4, a6

	# Table 20. Non-SIMD Q15 saturation ALU Instructions (7)
	kaddh     a1, a2, a3
	ksubh     a1, a2, a3
	khmbb     a1, a2, a3
	khmbt     a1, a2, a3
	khmtt     a1, a2, a3
	ukaddh    a1, a2, a3
	uksubh    a1, a2, a3

	# Table 21. Non-SIMD Q31 saturation ALU Instructions (15)
	kaddw     a1, a2, a3
	ukaddw    a1, a2, a3
	ksubw     a1, a2, a3
	uksubw    a1, a2, a3
	kdmbb     a1, a2, a3
	kdmbt     a1, a2, a3
	kdmtt     a1, a2, a3
	kslraw    a1, a2, a3
	kslraw.u  a1, a2, a3
	ksllw     a1, a2, a3
	kslliw    a1, a2, 5
	kdmabb    a1, a2, a3
	kdmabt    a1, a2, a3
	kdmatt    a1, a2, a3
	kabsw     a1, a2

	# Table 22. 32-bit Add/Sub Instructions (4)
	raddw     a1, a2, a3
	uraddw    a1, a2, a3
	rsubw     a1, a2, a3
	ursubw    a1, a2, a3

	# Table 23. OV (Overflow) flag Set/Clear Instructions (2)
	rdov     a1
	clrov

	# Table 24. Non-SIMD Miscellaneous Instructions (9)
	ave       a1, a2, a3
	sra.u     a1, a2, a3
	srai.u    a1, a2, 5
	bitrev    a1, a2, a3
	bitrevi   a1, a2, 5
	wext      a1, a2, a3
	wexti     a1, a2, 5
	insb      a1, a2, 2

	# New Instructions in ZPSF
	maddr32   a2, a4, a6
	msubr32   a2, a4, a6
	mulr64    a2, a4, a6
	mulsr64   a2, a4, a6
	smul8     a2, a4, a6
	smulx8    a2, a4, a6
	smul16    a2, a4, a6
	smulx16   a2, a4, a6
	umul8     a2, a4, a6
	umulx8    a2, a4, a6
	umul16    a2, a4, a6
	umulx16   a2, a4, a6
