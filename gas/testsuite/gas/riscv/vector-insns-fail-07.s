# Vector invalid immediate field

	vsetvli a0, a1, 2048	# 0...2047
	vsll.vi v4, v8, 32      # 0...31
	vadd.vi v4, v8, -17	# -16...15
	vadd.vi v4, v8, 16
	vmslt.vi v4, v8, -16	# -15...16
	vmslt.vi v4, v8, 17
