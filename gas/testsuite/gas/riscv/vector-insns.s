	vsetvl a0, a1, a2
	vsetvli a0, a1, 0
	vsetvli a0, a1, 0x7ff
	vsetvli a0, a1, e16,m2,d4
	vsetvli a0, a1, e256, m8, d8
	vsetvli a0, a1, e512, m8, d8
	vsetvli a0, a1, e1024, m8, d8
	vsetvli a0, a1, e1024, m1, d8
	vsetvli a0, a1, e1024, mf2, d8
	vsetvli a0, a1, e512, mf4, d2
	vsetvli a0, a1, e256, mf8, d4
	vsetvli a0, a1, e256, m2, ta, d4
	vsetvli a0, a1, e256, m2, ma, d4
	vsetvli a0, a1, e256, m2, tu, d4
	vsetvli a0, a1, e256, m2, mu, d4
	vsetvli a0, a1, e256, m2, ta,ma, d4
	vsetvli a0, a1, e256, m2, tu,ma, d4
	vsetvli a0, a1, e256, m2, ta,mu, d4
	vsetvli a0, a1, e256, m2, tu,mu, d4

	vle8.v v4, (a0)
	vle8.v v4, 0(a0)
	vle8.v v4, (a0), v0.t
	vse8.v v4, (a0)
	vse8.v v4, 0(a0)
	vse8.v v4, (a0), v0.t

	vle16.v v4, (a0)
	vle16.v v4, 0(a0)
	vle16.v v4, (a0), v0.t
	vse16.v v4, (a0)
	vse16.v v4, 0(a0)
	vse16.v v4, (a0), v0.t

	vle32.v v4, (a0)
	vle32.v v4, 0(a0)
	vle32.v v4, (a0), v0.t
	vse32.v v4, (a0)
	vse32.v v4, 0(a0)
	vse32.v v4, (a0), v0.t

	vle64.v v4, (a0)
	vle64.v v4, 0(a0)
	vle64.v v4, (a0), v0.t
	vse64.v v4, (a0)
	vse64.v v4, 0(a0)
	vse64.v v4, (a0), v0.t

	vle128.v v4, (a0)
	vle128.v v4, 0(a0)
	vle128.v v4, (a0), v0.t
	vse128.v v4, (a0)
	vse128.v v4, 0(a0)
	vse128.v v4, (a0), v0.t

	vle256.v v4, (a0)
	vle256.v v4, 0(a0)
	vle256.v v4, (a0), v0.t
	vse256.v v4, (a0)
	vse256.v v4, 0(a0)
	vse256.v v4, (a0), v0.t

	vle512.v v4, (a0)
	vle512.v v4, 0(a0)
	vle512.v v4, (a0), v0.t
	vse512.v v4, (a0)
	vse512.v v4, 0(a0)
	vse512.v v4, (a0), v0.t

	vle1024.v v4, (a0)
	vle1024.v v4, 0(a0)
	vle1024.v v4, (a0), v0.t
	vse1024.v v4, (a0)
	vse1024.v v4, 0(a0)
	vse1024.v v4, (a0), v0.t

	vlse8.v v4, (a0), a1
	vlse8.v v4, 0(a0), a1
	vlse8.v v4, (a0), a1, v0.t
	vsse8.v v4, (a0), a1
	vsse8.v v4, 0(a0), a1
	vsse8.v v4, (a0), a1, v0.t

	vlse16.v v4, (a0), a1
	vlse16.v v4, 0(a0), a1
	vlse16.v v4, (a0), a1, v0.t
	vsse16.v v4, (a0), a1
	vsse16.v v4, 0(a0), a1
	vsse16.v v4, (a0), a1, v0.t

	vlse32.v v4, (a0), a1
	vlse32.v v4, 0(a0), a1
	vlse32.v v4, (a0), a1, v0.t
	vsse32.v v4, (a0), a1
	vsse32.v v4, 0(a0), a1
	vsse32.v v4, (a0), a1, v0.t

	vlse64.v v4, (a0), a1
	vlse64.v v4, 0(a0), a1
	vlse64.v v4, (a0), a1, v0.t
	vsse64.v v4, (a0), a1
	vsse64.v v4, 0(a0), a1
	vsse64.v v4, (a0), a1, v0.t

	vlse128.v v4, (a0), a1
	vlse128.v v4, 0(a0), a1
	vlse128.v v4, (a0), a1, v0.t
	vsse128.v v4, (a0), a1
	vsse128.v v4, 0(a0), a1
	vsse128.v v4, (a0), a1, v0.t

	vlse256.v v4, (a0), a1
	vlse256.v v4, 0(a0), a1
	vlse256.v v4, (a0), a1, v0.t
	vsse256.v v4, (a0), a1
	vsse256.v v4, 0(a0), a1
	vsse256.v v4, (a0), a1, v0.t

	vlse512.v v4, (a0), a1
	vlse512.v v4, 0(a0), a1
	vlse512.v v4, (a0), a1, v0.t
	vsse512.v v4, (a0), a1
	vsse512.v v4, 0(a0), a1
	vsse512.v v4, (a0), a1, v0.t

	vlse1024.v v4, (a0), a1
	vlse1024.v v4, 0(a0), a1
	vlse1024.v v4, (a0), a1, v0.t
	vsse1024.v v4, (a0), a1
	vsse1024.v v4, 0(a0), a1
	vsse1024.v v4, (a0), a1, v0.t

	vlxei8.v v4, (a0), v12
	vlxei8.v v4, 0(a0), v12
	vlxei8.v v4, (a0), v12, v0.t
	vsxei8.v v4, (a0), v12
	vsxei8.v v4, 0(a0), v12
	vsxei8.v v4, (a0), v12, v0.t
	vsuxei8.v v4, (a0), v12
	vsuxei8.v v4, 0(a0), v12
	vsuxei8.v v4, (a0), v12, v0.t

	vlxei16.v v4, (a0), v12
	vlxei16.v v4, 0(a0), v12
	vlxei16.v v4, (a0), v12, v0.t
	vsxei16.v v4, (a0), v12
	vsxei16.v v4, 0(a0), v12
	vsxei16.v v4, (a0), v12, v0.t
	vsuxei16.v v4, (a0), v12
	vsuxei16.v v4, 0(a0), v12
	vsuxei16.v v4, (a0), v12, v0.t

	vlxei32.v v4, (a0), v12
	vlxei32.v v4, 0(a0), v12
	vlxei32.v v4, (a0), v12, v0.t
	vsxei32.v v4, (a0), v12
	vsxei32.v v4, 0(a0), v12
	vsxei32.v v4, (a0), v12, v0.t
	vsuxei32.v v4, (a0), v12
	vsuxei32.v v4, 0(a0), v12
	vsuxei32.v v4, (a0), v12, v0.t

	vlxei64.v v4, (a0), v12
	vlxei64.v v4, 0(a0), v12
	vlxei64.v v4, (a0), v12, v0.t
	vsxei64.v v4, (a0), v12
	vsxei64.v v4, 0(a0), v12
	vsxei64.v v4, (a0), v12, v0.t
	vsuxei64.v v4, (a0), v12
	vsuxei64.v v4, 0(a0), v12
	vsuxei64.v v4, (a0), v12, v0.t

	vle8ff.v v4, (a0)
	vle8ff.v v4, 0(a0)
	vle8ff.v v4, (a0), v0.t

	vle16ff.v v4, (a0)
	vle16ff.v v4, 0(a0)
	vle16ff.v v4, (a0), v0.t

	vle32ff.v v4, (a0)
	vle32ff.v v4, 0(a0)
	vle32ff.v v4, (a0), v0.t

	vle64ff.v v4, (a0)
	vle64ff.v v4, 0(a0)
	vle64ff.v v4, (a0), v0.t

	vle128ff.v v4, (a0)
	vle128ff.v v4, 0(a0)
	vle128ff.v v4, (a0), v0.t

	vle256ff.v v4, (a0)
	vle256ff.v v4, 0(a0)
	vle256ff.v v4, (a0), v0.t

	vle512ff.v v4, (a0)
	vle512ff.v v4, 0(a0)
	vle512ff.v v4, (a0), v0.t

	vle1024ff.v v4, (a0)
	vle1024ff.v v4, 0(a0)
	vle1024ff.v v4, (a0), v0.t

	vlseg2e8.v v4, (a0)
	vlseg2e8.v v4, 0(a0)
	vlseg2e8.v v4, (a0), v0.t
	vsseg2e8.v v4, (a0)
	vsseg2e8.v v4, 0(a0)
	vsseg2e8.v v4, (a0), v0.t

	vlseg3e8.v v4, (a0)
	vlseg3e8.v v4, 0(a0)
	vlseg3e8.v v4, (a0), v0.t
	vsseg3e8.v v4, (a0)
	vsseg3e8.v v4, 0(a0)
	vsseg3e8.v v4, (a0), v0.t

	vlseg4e8.v v4, (a0)
	vlseg4e8.v v4, 0(a0)
	vlseg4e8.v v4, (a0), v0.t
	vsseg4e8.v v4, (a0)
	vsseg4e8.v v4, 0(a0)
	vsseg4e8.v v4, (a0), v0.t

	vlseg5e8.v v4, (a0)
	vlseg5e8.v v4, 0(a0)
	vlseg5e8.v v4, (a0), v0.t
	vsseg5e8.v v4, (a0)
	vsseg5e8.v v4, 0(a0)
	vsseg5e8.v v4, (a0), v0.t

	vlseg6e8.v v4, (a0)
	vlseg6e8.v v4, 0(a0)
	vlseg6e8.v v4, (a0), v0.t
	vsseg6e8.v v4, (a0)
	vsseg6e8.v v4, 0(a0)
	vsseg6e8.v v4, (a0), v0.t

	vlseg7e8.v v4, (a0)
	vlseg7e8.v v4, 0(a0)
	vlseg7e8.v v4, (a0), v0.t
	vsseg7e8.v v4, (a0)
	vsseg7e8.v v4, 0(a0)
	vsseg7e8.v v4, (a0), v0.t

	vlseg8e8.v v4, (a0)
	vlseg8e8.v v4, 0(a0)
	vlseg8e8.v v4, (a0), v0.t
	vsseg8e8.v v4, (a0)
	vsseg8e8.v v4, 0(a0)
	vsseg8e8.v v4, (a0), v0.t

	vlseg2e16.v v4, (a0)
	vlseg2e16.v v4, 0(a0)
	vlseg2e16.v v4, (a0), v0.t
	vsseg2e16.v v4, (a0)
	vsseg2e16.v v4, 0(a0)
	vsseg2e16.v v4, (a0), v0.t

	vlseg3e16.v v4, (a0)
	vlseg3e16.v v4, 0(a0)
	vlseg3e16.v v4, (a0), v0.t
	vsseg3e16.v v4, (a0)
	vsseg3e16.v v4, 0(a0)
	vsseg3e16.v v4, (a0), v0.t

	vlseg4e16.v v4, (a0)
	vlseg4e16.v v4, 0(a0)
	vlseg4e16.v v4, (a0), v0.t
	vsseg4e16.v v4, (a0)
	vsseg4e16.v v4, 0(a0)
	vsseg4e16.v v4, (a0), v0.t

	vlseg5e16.v v4, (a0)
	vlseg5e16.v v4, 0(a0)
	vlseg5e16.v v4, (a0), v0.t
	vsseg5e16.v v4, (a0)
	vsseg5e16.v v4, 0(a0)
	vsseg5e16.v v4, (a0), v0.t

	vlseg6e16.v v4, (a0)
	vlseg6e16.v v4, 0(a0)
	vlseg6e16.v v4, (a0), v0.t
	vsseg6e16.v v4, (a0)
	vsseg6e16.v v4, 0(a0)
	vsseg6e16.v v4, (a0), v0.t

	vlseg7e16.v v4, (a0)
	vlseg7e16.v v4, 0(a0)
	vlseg7e16.v v4, (a0), v0.t
	vsseg7e16.v v4, (a0)
	vsseg7e16.v v4, 0(a0)
	vsseg7e16.v v4, (a0), v0.t

	vlseg8e16.v v4, (a0)
	vlseg8e16.v v4, 0(a0)
	vlseg8e16.v v4, (a0), v0.t
	vsseg8e16.v v4, (a0)
	vsseg8e16.v v4, 0(a0)
	vsseg8e16.v v4, (a0), v0.t

	vlseg2e32.v v4, (a0)
	vlseg2e32.v v4, 0(a0)
	vlseg2e32.v v4, (a0), v0.t
	vsseg2e32.v v4, (a0)
	vsseg2e32.v v4, 0(a0)
	vsseg2e32.v v4, (a0), v0.t

	vlseg3e32.v v4, (a0)
	vlseg3e32.v v4, 0(a0)
	vlseg3e32.v v4, (a0), v0.t
	vsseg3e32.v v4, (a0)
	vsseg3e32.v v4, 0(a0)
	vsseg3e32.v v4, (a0), v0.t

	vlseg4e32.v v4, (a0)
	vlseg4e32.v v4, 0(a0)
	vlseg4e32.v v4, (a0), v0.t
	vsseg4e32.v v4, (a0)
	vsseg4e32.v v4, 0(a0)
	vsseg4e32.v v4, (a0), v0.t

	vlseg5e32.v v4, (a0)
	vlseg5e32.v v4, 0(a0)
	vlseg5e32.v v4, (a0), v0.t
	vsseg5e32.v v4, (a0)
	vsseg5e32.v v4, 0(a0)
	vsseg5e32.v v4, (a0), v0.t

	vlseg6e32.v v4, (a0)
	vlseg6e32.v v4, 0(a0)
	vlseg6e32.v v4, (a0), v0.t
	vsseg6e32.v v4, (a0)
	vsseg6e32.v v4, 0(a0)
	vsseg6e32.v v4, (a0), v0.t

	vlseg7e32.v v4, (a0)
	vlseg7e32.v v4, 0(a0)
	vlseg7e32.v v4, (a0), v0.t
	vsseg7e32.v v4, (a0)
	vsseg7e32.v v4, 0(a0)
	vsseg7e32.v v4, (a0), v0.t

	vlseg8e32.v v4, (a0)
	vlseg8e32.v v4, 0(a0)
	vlseg8e32.v v4, (a0), v0.t
	vsseg8e32.v v4, (a0)
	vsseg8e32.v v4, 0(a0)
	vsseg8e32.v v4, (a0), v0.t

	vlseg2e64.v v4, (a0)
	vlseg2e64.v v4, 0(a0)
	vlseg2e64.v v4, (a0), v0.t
	vsseg2e64.v v4, (a0)
	vsseg2e64.v v4, 0(a0)
	vsseg2e64.v v4, (a0), v0.t

	vlseg3e64.v v4, (a0)
	vlseg3e64.v v4, 0(a0)
	vlseg3e64.v v4, (a0), v0.t
	vsseg3e64.v v4, (a0)
	vsseg3e64.v v4, 0(a0)
	vsseg3e64.v v4, (a0), v0.t

	vlseg4e64.v v4, (a0)
	vlseg4e64.v v4, 0(a0)
	vlseg4e64.v v4, (a0), v0.t
	vsseg4e64.v v4, (a0)
	vsseg4e64.v v4, 0(a0)
	vsseg4e64.v v4, (a0), v0.t

	vlseg5e64.v v4, (a0)
	vlseg5e64.v v4, 0(a0)
	vlseg5e64.v v4, (a0), v0.t
	vsseg5e64.v v4, (a0)
	vsseg5e64.v v4, 0(a0)
	vsseg5e64.v v4, (a0), v0.t

	vlseg6e64.v v4, (a0)
	vlseg6e64.v v4, 0(a0)
	vlseg6e64.v v4, (a0), v0.t
	vsseg6e64.v v4, (a0)
	vsseg6e64.v v4, 0(a0)
	vsseg6e64.v v4, (a0), v0.t

	vlseg7e64.v v4, (a0)
	vlseg7e64.v v4, 0(a0)
	vlseg7e64.v v4, (a0), v0.t
	vsseg7e64.v v4, (a0)
	vsseg7e64.v v4, 0(a0)
	vsseg7e64.v v4, (a0), v0.t

	vlseg8e64.v v4, (a0)
	vlseg8e64.v v4, 0(a0)
	vlseg8e64.v v4, (a0), v0.t
	vsseg8e64.v v4, (a0)
	vsseg8e64.v v4, 0(a0)
	vsseg8e64.v v4, (a0), v0.t

	vlseg2e128.v v4, (a0)
	vlseg2e128.v v4, 0(a0)
	vlseg2e128.v v4, (a0), v0.t
	vsseg2e128.v v4, (a0)
	vsseg2e128.v v4, 0(a0)
	vsseg2e128.v v4, (a0), v0.t

	vlseg3e128.v v4, (a0)
	vlseg3e128.v v4, 0(a0)
	vlseg3e128.v v4, (a0), v0.t
	vsseg3e128.v v4, (a0)
	vsseg3e128.v v4, 0(a0)
	vsseg3e128.v v4, (a0), v0.t

	vlseg4e128.v v4, (a0)
	vlseg4e128.v v4, 0(a0)
	vlseg4e128.v v4, (a0), v0.t
	vsseg4e128.v v4, (a0)
	vsseg4e128.v v4, 0(a0)
	vsseg4e128.v v4, (a0), v0.t

	vlseg5e128.v v4, (a0)
	vlseg5e128.v v4, 0(a0)
	vlseg5e128.v v4, (a0), v0.t
	vsseg5e128.v v4, (a0)
	vsseg5e128.v v4, 0(a0)
	vsseg5e128.v v4, (a0), v0.t

	vlseg6e128.v v4, (a0)
	vlseg6e128.v v4, 0(a0)
	vlseg6e128.v v4, (a0), v0.t
	vsseg6e128.v v4, (a0)
	vsseg6e128.v v4, 0(a0)
	vsseg6e128.v v4, (a0), v0.t

	vlseg7e128.v v4, (a0)
	vlseg7e128.v v4, 0(a0)
	vlseg7e128.v v4, (a0), v0.t
	vsseg7e128.v v4, (a0)
	vsseg7e128.v v4, 0(a0)
	vsseg7e128.v v4, (a0), v0.t

	vlseg8e128.v v4, (a0)
	vlseg8e128.v v4, 0(a0)
	vlseg8e128.v v4, (a0), v0.t
	vsseg8e128.v v4, (a0)
	vsseg8e128.v v4, 0(a0)
	vsseg8e128.v v4, (a0), v0.t

	vlseg2e256.v v4, (a0)
	vlseg2e256.v v4, 0(a0)
	vlseg2e256.v v4, (a0), v0.t
	vsseg2e256.v v4, (a0)
	vsseg2e256.v v4, 0(a0)
	vsseg2e256.v v4, (a0), v0.t

	vlseg3e256.v v4, (a0)
	vlseg3e256.v v4, 0(a0)
	vlseg3e256.v v4, (a0), v0.t
	vsseg3e256.v v4, (a0)
	vsseg3e256.v v4, 0(a0)
	vsseg3e256.v v4, (a0), v0.t

	vlseg4e256.v v4, (a0)
	vlseg4e256.v v4, 0(a0)
	vlseg4e256.v v4, (a0), v0.t
	vsseg4e256.v v4, (a0)
	vsseg4e256.v v4, 0(a0)
	vsseg4e256.v v4, (a0), v0.t

	vlseg5e256.v v4, (a0)
	vlseg5e256.v v4, 0(a0)
	vlseg5e256.v v4, (a0), v0.t
	vsseg5e256.v v4, (a0)
	vsseg5e256.v v4, 0(a0)
	vsseg5e256.v v4, (a0), v0.t

	vlseg6e256.v v4, (a0)
	vlseg6e256.v v4, 0(a0)
	vlseg6e256.v v4, (a0), v0.t
	vsseg6e256.v v4, (a0)
	vsseg6e256.v v4, 0(a0)
	vsseg6e256.v v4, (a0), v0.t

	vlseg7e256.v v4, (a0)
	vlseg7e256.v v4, 0(a0)
	vlseg7e256.v v4, (a0), v0.t
	vsseg7e256.v v4, (a0)
	vsseg7e256.v v4, 0(a0)
	vsseg7e256.v v4, (a0), v0.t

	vlseg8e256.v v4, (a0)
	vlseg8e256.v v4, 0(a0)
	vlseg8e256.v v4, (a0), v0.t
	vsseg8e256.v v4, (a0)
	vsseg8e256.v v4, 0(a0)
	vsseg8e256.v v4, (a0), v0.t

	vlseg2e512.v v4, (a0)
	vlseg2e512.v v4, 0(a0)
	vlseg2e512.v v4, (a0), v0.t
	vsseg2e512.v v4, (a0)
	vsseg2e512.v v4, 0(a0)
	vsseg2e512.v v4, (a0), v0.t

	vlseg3e512.v v4, (a0)
	vlseg3e512.v v4, 0(a0)
	vlseg3e512.v v4, (a0), v0.t
	vsseg3e512.v v4, (a0)
	vsseg3e512.v v4, 0(a0)
	vsseg3e512.v v4, (a0), v0.t

	vlseg4e512.v v4, (a0)
	vlseg4e512.v v4, 0(a0)
	vlseg4e512.v v4, (a0), v0.t
	vsseg4e512.v v4, (a0)
	vsseg4e512.v v4, 0(a0)
	vsseg4e512.v v4, (a0), v0.t

	vlseg5e512.v v4, (a0)
	vlseg5e512.v v4, 0(a0)
	vlseg5e512.v v4, (a0), v0.t
	vsseg5e512.v v4, (a0)
	vsseg5e512.v v4, 0(a0)
	vsseg5e512.v v4, (a0), v0.t

	vlseg6e512.v v4, (a0)
	vlseg6e512.v v4, 0(a0)
	vlseg6e512.v v4, (a0), v0.t
	vsseg6e512.v v4, (a0)
	vsseg6e512.v v4, 0(a0)
	vsseg6e512.v v4, (a0), v0.t

	vlseg7e512.v v4, (a0)
	vlseg7e512.v v4, 0(a0)
	vlseg7e512.v v4, (a0), v0.t
	vsseg7e512.v v4, (a0)
	vsseg7e512.v v4, 0(a0)
	vsseg7e512.v v4, (a0), v0.t

	vlseg8e512.v v4, (a0)
	vlseg8e512.v v4, 0(a0)
	vlseg8e512.v v4, (a0), v0.t
	vsseg8e512.v v4, (a0)
	vsseg8e512.v v4, 0(a0)
	vsseg8e512.v v4, (a0), v0.t

	vlseg2e1024.v v4, (a0)
	vlseg2e1024.v v4, 0(a0)
	vlseg2e1024.v v4, (a0), v0.t
	vsseg2e1024.v v4, (a0)
	vsseg2e1024.v v4, 0(a0)
	vsseg2e1024.v v4, (a0), v0.t

	vlseg3e1024.v v4, (a0)
	vlseg3e1024.v v4, 0(a0)
	vlseg3e1024.v v4, (a0), v0.t
	vsseg3e1024.v v4, (a0)
	vsseg3e1024.v v4, 0(a0)
	vsseg3e1024.v v4, (a0), v0.t

	vlseg4e1024.v v4, (a0)
	vlseg4e1024.v v4, 0(a0)
	vlseg4e1024.v v4, (a0), v0.t
	vsseg4e1024.v v4, (a0)
	vsseg4e1024.v v4, 0(a0)
	vsseg4e1024.v v4, (a0), v0.t

	vlseg5e1024.v v4, (a0)
	vlseg5e1024.v v4, 0(a0)
	vlseg5e1024.v v4, (a0), v0.t
	vsseg5e1024.v v4, (a0)
	vsseg5e1024.v v4, 0(a0)
	vsseg5e1024.v v4, (a0), v0.t

	vlseg6e1024.v v4, (a0)
	vlseg6e1024.v v4, 0(a0)
	vlseg6e1024.v v4, (a0), v0.t
	vsseg6e1024.v v4, (a0)
	vsseg6e1024.v v4, 0(a0)
	vsseg6e1024.v v4, (a0), v0.t

	vlseg7e1024.v v4, (a0)
	vlseg7e1024.v v4, 0(a0)
	vlseg7e1024.v v4, (a0), v0.t
	vsseg7e1024.v v4, (a0)
	vsseg7e1024.v v4, 0(a0)
	vsseg7e1024.v v4, (a0), v0.t

	vlseg8e1024.v v4, (a0)
	vlseg8e1024.v v4, 0(a0)
	vlseg8e1024.v v4, (a0), v0.t
	vsseg8e1024.v v4, (a0)
	vsseg8e1024.v v4, 0(a0)
	vsseg8e1024.v v4, (a0), v0.t

	vlsseg2e8.v v4, (a0), a1
	vlsseg2e8.v v4, 0(a0), a1
	vlsseg2e8.v v4, (a0), a1, v0.t
	vssseg2e8.v v4, (a0), a1
	vssseg2e8.v v4, 0(a0), a1
	vssseg2e8.v v4, (a0), a1, v0.t

	vlsseg3e8.v v4, (a0), a1
	vlsseg3e8.v v4, 0(a0), a1
	vlsseg3e8.v v4, (a0), a1, v0.t
	vssseg3e8.v v4, (a0), a1
	vssseg3e8.v v4, 0(a0), a1
	vssseg3e8.v v4, (a0), a1, v0.t

	vlsseg4e8.v v4, (a0), a1
	vlsseg4e8.v v4, 0(a0), a1
	vlsseg4e8.v v4, (a0), a1, v0.t
	vssseg4e8.v v4, (a0), a1
	vssseg4e8.v v4, 0(a0), a1
	vssseg4e8.v v4, (a0), a1, v0.t

	vlsseg5e8.v v4, (a0), a1
	vlsseg5e8.v v4, 0(a0), a1
	vlsseg5e8.v v4, (a0), a1, v0.t
	vssseg5e8.v v4, (a0), a1
	vssseg5e8.v v4, 0(a0), a1
	vssseg5e8.v v4, (a0), a1, v0.t

	vlsseg6e8.v v4, (a0), a1
	vlsseg6e8.v v4, 0(a0), a1
	vlsseg6e8.v v4, (a0), a1, v0.t
	vssseg6e8.v v4, (a0), a1
	vssseg6e8.v v4, 0(a0), a1
	vssseg6e8.v v4, (a0), a1, v0.t

	vlsseg7e8.v v4, (a0), a1
	vlsseg7e8.v v4, 0(a0), a1
	vlsseg7e8.v v4, (a0), a1, v0.t
	vssseg7e8.v v4, (a0), a1
	vssseg7e8.v v4, 0(a0), a1
	vssseg7e8.v v4, (a0), a1, v0.t

	vlsseg8e8.v v4, (a0), a1
	vlsseg8e8.v v4, 0(a0), a1
	vlsseg8e8.v v4, (a0), a1, v0.t
	vssseg8e8.v v4, (a0), a1
	vssseg8e8.v v4, 0(a0), a1
	vssseg8e8.v v4, (a0), a1, v0.t

	vlsseg2e16.v v4, (a0), a1
	vlsseg2e16.v v4, 0(a0), a1
	vlsseg2e16.v v4, (a0), a1, v0.t
	vssseg2e16.v v4, (a0), a1
	vssseg2e16.v v4, 0(a0), a1
	vssseg2e16.v v4, (a0), a1, v0.t

	vlsseg3e16.v v4, (a0), a1
	vlsseg3e16.v v4, 0(a0), a1
	vlsseg3e16.v v4, (a0), a1, v0.t
	vssseg3e16.v v4, (a0), a1
	vssseg3e16.v v4, 0(a0), a1
	vssseg3e16.v v4, (a0), a1, v0.t

	vlsseg4e16.v v4, (a0), a1
	vlsseg4e16.v v4, 0(a0), a1
	vlsseg4e16.v v4, (a0), a1, v0.t
	vssseg4e16.v v4, (a0), a1
	vssseg4e16.v v4, 0(a0), a1
	vssseg4e16.v v4, (a0), a1, v0.t

	vlsseg5e16.v v4, (a0), a1
	vlsseg5e16.v v4, 0(a0), a1
	vlsseg5e16.v v4, (a0), a1, v0.t
	vssseg5e16.v v4, (a0), a1
	vssseg5e16.v v4, 0(a0), a1
	vssseg5e16.v v4, (a0), a1, v0.t

	vlsseg6e16.v v4, (a0), a1
	vlsseg6e16.v v4, 0(a0), a1
	vlsseg6e16.v v4, (a0), a1, v0.t
	vssseg6e16.v v4, (a0), a1
	vssseg6e16.v v4, 0(a0), a1
	vssseg6e16.v v4, (a0), a1, v0.t

	vlsseg7e16.v v4, (a0), a1
	vlsseg7e16.v v4, 0(a0), a1
	vlsseg7e16.v v4, (a0), a1, v0.t
	vssseg7e16.v v4, (a0), a1
	vssseg7e16.v v4, 0(a0), a1
	vssseg7e16.v v4, (a0), a1, v0.t

	vlsseg8e16.v v4, (a0), a1
	vlsseg8e16.v v4, 0(a0), a1
	vlsseg8e16.v v4, (a0), a1, v0.t
	vssseg8e16.v v4, (a0), a1
	vssseg8e16.v v4, 0(a0), a1
	vssseg8e16.v v4, (a0), a1, v0.t

	vlsseg2e32.v v4, (a0), a1
	vlsseg2e32.v v4, 0(a0), a1
	vlsseg2e32.v v4, (a0), a1, v0.t
	vssseg2e32.v v4, (a0), a1
	vssseg2e32.v v4, 0(a0), a1
	vssseg2e32.v v4, (a0), a1, v0.t

	vlsseg3e32.v v4, (a0), a1
	vlsseg3e32.v v4, 0(a0), a1
	vlsseg3e32.v v4, (a0), a1, v0.t
	vssseg3e32.v v4, (a0), a1
	vssseg3e32.v v4, 0(a0), a1
	vssseg3e32.v v4, (a0), a1, v0.t

	vlsseg4e32.v v4, (a0), a1
	vlsseg4e32.v v4, 0(a0), a1
	vlsseg4e32.v v4, (a0), a1, v0.t
	vssseg4e32.v v4, (a0), a1
	vssseg4e32.v v4, 0(a0), a1
	vssseg4e32.v v4, (a0), a1, v0.t

	vlsseg5e32.v v4, (a0), a1
	vlsseg5e32.v v4, 0(a0), a1
	vlsseg5e32.v v4, (a0), a1, v0.t
	vssseg5e32.v v4, (a0), a1
	vssseg5e32.v v4, 0(a0), a1
	vssseg5e32.v v4, (a0), a1, v0.t

	vlsseg6e32.v v4, (a0), a1
	vlsseg6e32.v v4, 0(a0), a1
	vlsseg6e32.v v4, (a0), a1, v0.t
	vssseg6e32.v v4, (a0), a1
	vssseg6e32.v v4, 0(a0), a1
	vssseg6e32.v v4, (a0), a1, v0.t

	vlsseg7e32.v v4, (a0), a1
	vlsseg7e32.v v4, 0(a0), a1
	vlsseg7e32.v v4, (a0), a1, v0.t
	vssseg7e32.v v4, (a0), a1
	vssseg7e32.v v4, 0(a0), a1
	vssseg7e32.v v4, (a0), a1, v0.t

	vlsseg8e32.v v4, (a0), a1
	vlsseg8e32.v v4, 0(a0), a1
	vlsseg8e32.v v4, (a0), a1, v0.t
	vssseg8e32.v v4, (a0), a1
	vssseg8e32.v v4, 0(a0), a1
	vssseg8e32.v v4, (a0), a1, v0.t

	vlsseg2e64.v v4, (a0), a1
	vlsseg2e64.v v4, 0(a0), a1
	vlsseg2e64.v v4, (a0), a1, v0.t
	vssseg2e64.v v4, (a0), a1
	vssseg2e64.v v4, 0(a0), a1
	vssseg2e64.v v4, (a0), a1, v0.t

	vlsseg3e64.v v4, (a0), a1
	vlsseg3e64.v v4, 0(a0), a1
	vlsseg3e64.v v4, (a0), a1, v0.t
	vssseg3e64.v v4, (a0), a1
	vssseg3e64.v v4, 0(a0), a1
	vssseg3e64.v v4, (a0), a1, v0.t

	vlsseg4e64.v v4, (a0), a1
	vlsseg4e64.v v4, 0(a0), a1
	vlsseg4e64.v v4, (a0), a1, v0.t
	vssseg4e64.v v4, (a0), a1
	vssseg4e64.v v4, 0(a0), a1
	vssseg4e64.v v4, (a0), a1, v0.t

	vlsseg5e64.v v4, (a0), a1
	vlsseg5e64.v v4, 0(a0), a1
	vlsseg5e64.v v4, (a0), a1, v0.t
	vssseg5e64.v v4, (a0), a1
	vssseg5e64.v v4, 0(a0), a1
	vssseg5e64.v v4, (a0), a1, v0.t

	vlsseg6e64.v v4, (a0), a1
	vlsseg6e64.v v4, 0(a0), a1
	vlsseg6e64.v v4, (a0), a1, v0.t
	vssseg6e64.v v4, (a0), a1
	vssseg6e64.v v4, 0(a0), a1
	vssseg6e64.v v4, (a0), a1, v0.t

	vlsseg7e64.v v4, (a0), a1
	vlsseg7e64.v v4, 0(a0), a1
	vlsseg7e64.v v4, (a0), a1, v0.t
	vssseg7e64.v v4, (a0), a1
	vssseg7e64.v v4, 0(a0), a1
	vssseg7e64.v v4, (a0), a1, v0.t

	vlsseg8e64.v v4, (a0), a1
	vlsseg8e64.v v4, 0(a0), a1
	vlsseg8e64.v v4, (a0), a1, v0.t
	vssseg8e64.v v4, (a0), a1
	vssseg8e64.v v4, 0(a0), a1
	vssseg8e64.v v4, (a0), a1, v0.t

	vlsseg2e128.v v4, (a0), a1
	vlsseg2e128.v v4, 0(a0), a1
	vlsseg2e128.v v4, (a0), a1, v0.t
	vssseg2e128.v v4, (a0), a1
	vssseg2e128.v v4, 0(a0), a1
	vssseg2e128.v v4, (a0), a1, v0.t

	vlsseg3e128.v v4, (a0), a1
	vlsseg3e128.v v4, 0(a0), a1
	vlsseg3e128.v v4, (a0), a1, v0.t
	vssseg3e128.v v4, (a0), a1
	vssseg3e128.v v4, 0(a0), a1
	vssseg3e128.v v4, (a0), a1, v0.t

	vlsseg4e128.v v4, (a0), a1
	vlsseg4e128.v v4, 0(a0), a1
	vlsseg4e128.v v4, (a0), a1, v0.t
	vssseg4e128.v v4, (a0), a1
	vssseg4e128.v v4, 0(a0), a1
	vssseg4e128.v v4, (a0), a1, v0.t

	vlsseg5e128.v v4, (a0), a1
	vlsseg5e128.v v4, 0(a0), a1
	vlsseg5e128.v v4, (a0), a1, v0.t
	vssseg5e128.v v4, (a0), a1
	vssseg5e128.v v4, 0(a0), a1
	vssseg5e128.v v4, (a0), a1, v0.t

	vlsseg6e128.v v4, (a0), a1
	vlsseg6e128.v v4, 0(a0), a1
	vlsseg6e128.v v4, (a0), a1, v0.t
	vssseg6e128.v v4, (a0), a1
	vssseg6e128.v v4, 0(a0), a1
	vssseg6e128.v v4, (a0), a1, v0.t

	vlsseg7e128.v v4, (a0), a1
	vlsseg7e128.v v4, 0(a0), a1
	vlsseg7e128.v v4, (a0), a1, v0.t
	vssseg7e128.v v4, (a0), a1
	vssseg7e128.v v4, 0(a0), a1
	vssseg7e128.v v4, (a0), a1, v0.t

	vlsseg8e128.v v4, (a0), a1
	vlsseg8e128.v v4, 0(a0), a1
	vlsseg8e128.v v4, (a0), a1, v0.t
	vssseg8e128.v v4, (a0), a1
	vssseg8e128.v v4, 0(a0), a1
	vssseg8e128.v v4, (a0), a1, v0.t

	vlsseg2e256.v v4, (a0), a1
	vlsseg2e256.v v4, 0(a0), a1
	vlsseg2e256.v v4, (a0), a1, v0.t
	vssseg2e256.v v4, (a0), a1
	vssseg2e256.v v4, 0(a0), a1
	vssseg2e256.v v4, (a0), a1, v0.t

	vlsseg3e256.v v4, (a0), a1
	vlsseg3e256.v v4, 0(a0), a1
	vlsseg3e256.v v4, (a0), a1, v0.t
	vssseg3e256.v v4, (a0), a1
	vssseg3e256.v v4, 0(a0), a1
	vssseg3e256.v v4, (a0), a1, v0.t

	vlsseg4e256.v v4, (a0), a1
	vlsseg4e256.v v4, 0(a0), a1
	vlsseg4e256.v v4, (a0), a1, v0.t
	vssseg4e256.v v4, (a0), a1
	vssseg4e256.v v4, 0(a0), a1
	vssseg4e256.v v4, (a0), a1, v0.t

	vlsseg5e256.v v4, (a0), a1
	vlsseg5e256.v v4, 0(a0), a1
	vlsseg5e256.v v4, (a0), a1, v0.t
	vssseg5e256.v v4, (a0), a1
	vssseg5e256.v v4, 0(a0), a1
	vssseg5e256.v v4, (a0), a1, v0.t

	vlsseg6e256.v v4, (a0), a1
	vlsseg6e256.v v4, 0(a0), a1
	vlsseg6e256.v v4, (a0), a1, v0.t
	vssseg6e256.v v4, (a0), a1
	vssseg6e256.v v4, 0(a0), a1
	vssseg6e256.v v4, (a0), a1, v0.t

	vlsseg7e256.v v4, (a0), a1
	vlsseg7e256.v v4, 0(a0), a1
	vlsseg7e256.v v4, (a0), a1, v0.t
	vssseg7e256.v v4, (a0), a1
	vssseg7e256.v v4, 0(a0), a1
	vssseg7e256.v v4, (a0), a1, v0.t

	vlsseg8e256.v v4, (a0), a1
	vlsseg8e256.v v4, 0(a0), a1
	vlsseg8e256.v v4, (a0), a1, v0.t
	vssseg8e256.v v4, (a0), a1
	vssseg8e256.v v4, 0(a0), a1
	vssseg8e256.v v4, (a0), a1, v0.t

	vlsseg2e512.v v4, (a0), a1
	vlsseg2e512.v v4, 0(a0), a1
	vlsseg2e512.v v4, (a0), a1, v0.t
	vssseg2e512.v v4, (a0), a1
	vssseg2e512.v v4, 0(a0), a1
	vssseg2e512.v v4, (a0), a1, v0.t

	vlsseg3e512.v v4, (a0), a1
	vlsseg3e512.v v4, 0(a0), a1
	vlsseg3e512.v v4, (a0), a1, v0.t
	vssseg3e512.v v4, (a0), a1
	vssseg3e512.v v4, 0(a0), a1
	vssseg3e512.v v4, (a0), a1, v0.t

	vlsseg4e512.v v4, (a0), a1
	vlsseg4e512.v v4, 0(a0), a1
	vlsseg4e512.v v4, (a0), a1, v0.t
	vssseg4e512.v v4, (a0), a1
	vssseg4e512.v v4, 0(a0), a1
	vssseg4e512.v v4, (a0), a1, v0.t

	vlsseg5e512.v v4, (a0), a1
	vlsseg5e512.v v4, 0(a0), a1
	vlsseg5e512.v v4, (a0), a1, v0.t
	vssseg5e512.v v4, (a0), a1
	vssseg5e512.v v4, 0(a0), a1
	vssseg5e512.v v4, (a0), a1, v0.t

	vlsseg6e512.v v4, (a0), a1
	vlsseg6e512.v v4, 0(a0), a1
	vlsseg6e512.v v4, (a0), a1, v0.t
	vssseg6e512.v v4, (a0), a1
	vssseg6e512.v v4, 0(a0), a1
	vssseg6e512.v v4, (a0), a1, v0.t

	vlsseg7e512.v v4, (a0), a1
	vlsseg7e512.v v4, 0(a0), a1
	vlsseg7e512.v v4, (a0), a1, v0.t
	vssseg7e512.v v4, (a0), a1
	vssseg7e512.v v4, 0(a0), a1
	vssseg7e512.v v4, (a0), a1, v0.t

	vlsseg8e512.v v4, (a0), a1
	vlsseg8e512.v v4, 0(a0), a1
	vlsseg8e512.v v4, (a0), a1, v0.t
	vssseg8e512.v v4, (a0), a1
	vssseg8e512.v v4, 0(a0), a1
	vssseg8e512.v v4, (a0), a1, v0.t

	vlsseg2e1024.v v4, (a0), a1
	vlsseg2e1024.v v4, 0(a0), a1
	vlsseg2e1024.v v4, (a0), a1, v0.t
	vssseg2e1024.v v4, (a0), a1
	vssseg2e1024.v v4, 0(a0), a1
	vssseg2e1024.v v4, (a0), a1, v0.t

	vlsseg3e1024.v v4, (a0), a1
	vlsseg3e1024.v v4, 0(a0), a1
	vlsseg3e1024.v v4, (a0), a1, v0.t
	vssseg3e1024.v v4, (a0), a1
	vssseg3e1024.v v4, 0(a0), a1
	vssseg3e1024.v v4, (a0), a1, v0.t

	vlsseg4e1024.v v4, (a0), a1
	vlsseg4e1024.v v4, 0(a0), a1
	vlsseg4e1024.v v4, (a0), a1, v0.t
	vssseg4e1024.v v4, (a0), a1
	vssseg4e1024.v v4, 0(a0), a1
	vssseg4e1024.v v4, (a0), a1, v0.t

	vlsseg5e1024.v v4, (a0), a1
	vlsseg5e1024.v v4, 0(a0), a1
	vlsseg5e1024.v v4, (a0), a1, v0.t
	vssseg5e1024.v v4, (a0), a1
	vssseg5e1024.v v4, 0(a0), a1
	vssseg5e1024.v v4, (a0), a1, v0.t

	vlsseg6e1024.v v4, (a0), a1
	vlsseg6e1024.v v4, 0(a0), a1
	vlsseg6e1024.v v4, (a0), a1, v0.t
	vssseg6e1024.v v4, (a0), a1
	vssseg6e1024.v v4, 0(a0), a1
	vssseg6e1024.v v4, (a0), a1, v0.t

	vlsseg7e1024.v v4, (a0), a1
	vlsseg7e1024.v v4, 0(a0), a1
	vlsseg7e1024.v v4, (a0), a1, v0.t
	vssseg7e1024.v v4, (a0), a1
	vssseg7e1024.v v4, 0(a0), a1
	vssseg7e1024.v v4, (a0), a1, v0.t

	vlsseg8e1024.v v4, (a0), a1
	vlsseg8e1024.v v4, 0(a0), a1
	vlsseg8e1024.v v4, (a0), a1, v0.t
	vssseg8e1024.v v4, (a0), a1
	vssseg8e1024.v v4, 0(a0), a1
	vssseg8e1024.v v4, (a0), a1, v0.t

	vlxseg2ei8.v v4, (a0), v12
	vlxseg2ei8.v v4, 0(a0), v12
	vlxseg2ei8.v v4, (a0), v12, v0.t
	vsxseg2ei8.v v4, (a0), v12
	vsxseg2ei8.v v4, 0(a0), v12
	vsxseg2ei8.v v4, (a0), v12, v0.t

	vlxseg3ei8.v v4, (a0), v12
	vlxseg3ei8.v v4, 0(a0), v12
	vlxseg3ei8.v v4, (a0), v12, v0.t
	vsxseg3ei8.v v4, (a0), v12
	vsxseg3ei8.v v4, 0(a0), v12
	vsxseg3ei8.v v4, (a0), v12, v0.t

	vlxseg4ei8.v v4, (a0), v12
	vlxseg4ei8.v v4, 0(a0), v12
	vlxseg4ei8.v v4, (a0), v12, v0.t
	vsxseg4ei8.v v4, (a0), v12
	vsxseg4ei8.v v4, 0(a0), v12
	vsxseg4ei8.v v4, (a0), v12, v0.t

	vlxseg5ei8.v v4, (a0), v12
	vlxseg5ei8.v v4, 0(a0), v12
	vlxseg5ei8.v v4, (a0), v12, v0.t
	vsxseg5ei8.v v4, (a0), v12
	vsxseg5ei8.v v4, 0(a0), v12
	vsxseg5ei8.v v4, (a0), v12, v0.t

	vlxseg6ei8.v v4, (a0), v12
	vlxseg6ei8.v v4, 0(a0), v12
	vlxseg6ei8.v v4, (a0), v12, v0.t
	vsxseg6ei8.v v4, (a0), v12
	vsxseg6ei8.v v4, 0(a0), v12
	vsxseg6ei8.v v4, (a0), v12, v0.t

	vlxseg7ei8.v v4, (a0), v12
	vlxseg7ei8.v v4, 0(a0), v12
	vlxseg7ei8.v v4, (a0), v12, v0.t
	vsxseg7ei8.v v4, (a0), v12
	vsxseg7ei8.v v4, 0(a0), v12
	vsxseg7ei8.v v4, (a0), v12, v0.t

	vlxseg8ei8.v v4, (a0), v12
	vlxseg8ei8.v v4, 0(a0), v12
	vlxseg8ei8.v v4, (a0), v12, v0.t
	vsxseg8ei8.v v4, (a0), v12
	vsxseg8ei8.v v4, 0(a0), v12
	vsxseg8ei8.v v4, (a0), v12, v0.t

	vlxseg2ei16.v v4, (a0), v12
	vlxseg2ei16.v v4, 0(a0), v12
	vlxseg2ei16.v v4, (a0), v12, v0.t
	vsxseg2ei16.v v4, (a0), v12
	vsxseg2ei16.v v4, 0(a0), v12
	vsxseg2ei16.v v4, (a0), v12, v0.t

	vlxseg3ei16.v v4, (a0), v12
	vlxseg3ei16.v v4, 0(a0), v12
	vlxseg3ei16.v v4, (a0), v12, v0.t
	vsxseg3ei16.v v4, (a0), v12
	vsxseg3ei16.v v4, 0(a0), v12
	vsxseg3ei16.v v4, (a0), v12, v0.t

	vlxseg4ei16.v v4, (a0), v12
	vlxseg4ei16.v v4, 0(a0), v12
	vlxseg4ei16.v v4, (a0), v12, v0.t
	vsxseg4ei16.v v4, (a0), v12
	vsxseg4ei16.v v4, 0(a0), v12
	vsxseg4ei16.v v4, (a0), v12, v0.t

	vlxseg5ei16.v v4, (a0), v12
	vlxseg5ei16.v v4, 0(a0), v12
	vlxseg5ei16.v v4, (a0), v12, v0.t
	vsxseg5ei16.v v4, (a0), v12
	vsxseg5ei16.v v4, 0(a0), v12
	vsxseg5ei16.v v4, (a0), v12, v0.t

	vlxseg6ei16.v v4, (a0), v12
	vlxseg6ei16.v v4, 0(a0), v12
	vlxseg6ei16.v v4, (a0), v12, v0.t
	vsxseg6ei16.v v4, (a0), v12
	vsxseg6ei16.v v4, 0(a0), v12
	vsxseg6ei16.v v4, (a0), v12, v0.t

	vlxseg7ei16.v v4, (a0), v12
	vlxseg7ei16.v v4, 0(a0), v12
	vlxseg7ei16.v v4, (a0), v12, v0.t
	vsxseg7ei16.v v4, (a0), v12
	vsxseg7ei16.v v4, 0(a0), v12
	vsxseg7ei16.v v4, (a0), v12, v0.t

	vlxseg8ei16.v v4, (a0), v12
	vlxseg8ei16.v v4, 0(a0), v12
	vlxseg8ei16.v v4, (a0), v12, v0.t
	vsxseg8ei16.v v4, (a0), v12
	vsxseg8ei16.v v4, 0(a0), v12
	vsxseg8ei16.v v4, (a0), v12, v0.t

	vlxseg2ei32.v v4, (a0), v12
	vlxseg2ei32.v v4, 0(a0), v12
	vlxseg2ei32.v v4, (a0), v12, v0.t
	vsxseg2ei32.v v4, (a0), v12
	vsxseg2ei32.v v4, 0(a0), v12
	vsxseg2ei32.v v4, (a0), v12, v0.t

	vlxseg3ei32.v v4, (a0), v12
	vlxseg3ei32.v v4, 0(a0), v12
	vlxseg3ei32.v v4, (a0), v12, v0.t
	vsxseg3ei32.v v4, (a0), v12
	vsxseg3ei32.v v4, 0(a0), v12
	vsxseg3ei32.v v4, (a0), v12, v0.t

	vlxseg4ei32.v v4, (a0), v12
	vlxseg4ei32.v v4, 0(a0), v12
	vlxseg4ei32.v v4, (a0), v12, v0.t
	vsxseg4ei32.v v4, (a0), v12
	vsxseg4ei32.v v4, 0(a0), v12
	vsxseg4ei32.v v4, (a0), v12, v0.t

	vlxseg5ei32.v v4, (a0), v12
	vlxseg5ei32.v v4, 0(a0), v12
	vlxseg5ei32.v v4, (a0), v12, v0.t
	vsxseg5ei32.v v4, (a0), v12
	vsxseg5ei32.v v4, 0(a0), v12
	vsxseg5ei32.v v4, (a0), v12, v0.t

	vlxseg6ei32.v v4, (a0), v12
	vlxseg6ei32.v v4, 0(a0), v12
	vlxseg6ei32.v v4, (a0), v12, v0.t
	vsxseg6ei32.v v4, (a0), v12
	vsxseg6ei32.v v4, 0(a0), v12
	vsxseg6ei32.v v4, (a0), v12, v0.t

	vlxseg7ei32.v v4, (a0), v12
	vlxseg7ei32.v v4, 0(a0), v12
	vlxseg7ei32.v v4, (a0), v12, v0.t
	vsxseg7ei32.v v4, (a0), v12
	vsxseg7ei32.v v4, 0(a0), v12
	vsxseg7ei32.v v4, (a0), v12, v0.t

	vlxseg8ei32.v v4, (a0), v12
	vlxseg8ei32.v v4, 0(a0), v12
	vlxseg8ei32.v v4, (a0), v12, v0.t
	vsxseg8ei32.v v4, (a0), v12
	vsxseg8ei32.v v4, 0(a0), v12
	vsxseg8ei32.v v4, (a0), v12, v0.t

	vlxseg2ei64.v v4, (a0), v12
	vlxseg2ei64.v v4, 0(a0), v12
	vlxseg2ei64.v v4, (a0), v12, v0.t
	vsxseg2ei64.v v4, (a0), v12
	vsxseg2ei64.v v4, 0(a0), v12
	vsxseg2ei64.v v4, (a0), v12, v0.t

	vlxseg3ei64.v v4, (a0), v12
	vlxseg3ei64.v v4, 0(a0), v12
	vlxseg3ei64.v v4, (a0), v12, v0.t
	vsxseg3ei64.v v4, (a0), v12
	vsxseg3ei64.v v4, 0(a0), v12
	vsxseg3ei64.v v4, (a0), v12, v0.t

	vlxseg4ei64.v v4, (a0), v12
	vlxseg4ei64.v v4, 0(a0), v12
	vlxseg4ei64.v v4, (a0), v12, v0.t
	vsxseg4ei64.v v4, (a0), v12
	vsxseg4ei64.v v4, 0(a0), v12
	vsxseg4ei64.v v4, (a0), v12, v0.t

	vlxseg5ei64.v v4, (a0), v12
	vlxseg5ei64.v v4, 0(a0), v12
	vlxseg5ei64.v v4, (a0), v12, v0.t
	vsxseg5ei64.v v4, (a0), v12
	vsxseg5ei64.v v4, 0(a0), v12
	vsxseg5ei64.v v4, (a0), v12, v0.t

	vlxseg6ei64.v v4, (a0), v12
	vlxseg6ei64.v v4, 0(a0), v12
	vlxseg6ei64.v v4, (a0), v12, v0.t
	vsxseg6ei64.v v4, (a0), v12
	vsxseg6ei64.v v4, 0(a0), v12
	vsxseg6ei64.v v4, (a0), v12, v0.t

	vlxseg7ei64.v v4, (a0), v12
	vlxseg7ei64.v v4, 0(a0), v12
	vlxseg7ei64.v v4, (a0), v12, v0.t
	vsxseg7ei64.v v4, (a0), v12
	vsxseg7ei64.v v4, 0(a0), v12
	vsxseg7ei64.v v4, (a0), v12, v0.t

	vlxseg8ei64.v v4, (a0), v12
	vlxseg8ei64.v v4, 0(a0), v12
	vlxseg8ei64.v v4, (a0), v12, v0.t
	vsxseg8ei64.v v4, (a0), v12
	vsxseg8ei64.v v4, 0(a0), v12
	vsxseg8ei64.v v4, (a0), v12, v0.t

	vlxseg2ei128.v v4, (a0), v12
	vlxseg2ei128.v v4, 0(a0), v12
	vlxseg2ei128.v v4, (a0), v12, v0.t
	vsxseg2ei128.v v4, (a0), v12
	vsxseg2ei128.v v4, 0(a0), v12
	vsxseg2ei128.v v4, (a0), v12, v0.t

	vlxseg3ei128.v v4, (a0), v12
	vlxseg3ei128.v v4, 0(a0), v12
	vlxseg3ei128.v v4, (a0), v12, v0.t
	vsxseg3ei128.v v4, (a0), v12
	vsxseg3ei128.v v4, 0(a0), v12
	vsxseg3ei128.v v4, (a0), v12, v0.t

	vlxseg4ei128.v v4, (a0), v12
	vlxseg4ei128.v v4, 0(a0), v12
	vlxseg4ei128.v v4, (a0), v12, v0.t
	vsxseg4ei128.v v4, (a0), v12
	vsxseg4ei128.v v4, 0(a0), v12
	vsxseg4ei128.v v4, (a0), v12, v0.t

	vlxseg5ei128.v v4, (a0), v12
	vlxseg5ei128.v v4, 0(a0), v12
	vlxseg5ei128.v v4, (a0), v12, v0.t
	vsxseg5ei128.v v4, (a0), v12
	vsxseg5ei128.v v4, 0(a0), v12
	vsxseg5ei128.v v4, (a0), v12, v0.t

	vlxseg6ei128.v v4, (a0), v12
	vlxseg6ei128.v v4, 0(a0), v12
	vlxseg6ei128.v v4, (a0), v12, v0.t
	vsxseg6ei128.v v4, (a0), v12
	vsxseg6ei128.v v4, 0(a0), v12
	vsxseg6ei128.v v4, (a0), v12, v0.t

	vlxseg7ei128.v v4, (a0), v12
	vlxseg7ei128.v v4, 0(a0), v12
	vlxseg7ei128.v v4, (a0), v12, v0.t
	vsxseg7ei128.v v4, (a0), v12
	vsxseg7ei128.v v4, 0(a0), v12
	vsxseg7ei128.v v4, (a0), v12, v0.t

	vlxseg8ei128.v v4, (a0), v12
	vlxseg8ei128.v v4, 0(a0), v12
	vlxseg8ei128.v v4, (a0), v12, v0.t
	vsxseg8ei128.v v4, (a0), v12
	vsxseg8ei128.v v4, 0(a0), v12
	vsxseg8ei128.v v4, (a0), v12, v0.t

	vlxseg2ei256.v v4, (a0), v12
	vlxseg2ei256.v v4, 0(a0), v12
	vlxseg2ei256.v v4, (a0), v12, v0.t
	vsxseg2ei256.v v4, (a0), v12
	vsxseg2ei256.v v4, 0(a0), v12
	vsxseg2ei256.v v4, (a0), v12, v0.t

	vlxseg3ei256.v v4, (a0), v12
	vlxseg3ei256.v v4, 0(a0), v12
	vlxseg3ei256.v v4, (a0), v12, v0.t
	vsxseg3ei256.v v4, (a0), v12
	vsxseg3ei256.v v4, 0(a0), v12
	vsxseg3ei256.v v4, (a0), v12, v0.t

	vlxseg4ei256.v v4, (a0), v12
	vlxseg4ei256.v v4, 0(a0), v12
	vlxseg4ei256.v v4, (a0), v12, v0.t
	vsxseg4ei256.v v4, (a0), v12
	vsxseg4ei256.v v4, 0(a0), v12
	vsxseg4ei256.v v4, (a0), v12, v0.t

	vlxseg5ei256.v v4, (a0), v12
	vlxseg5ei256.v v4, 0(a0), v12
	vlxseg5ei256.v v4, (a0), v12, v0.t
	vsxseg5ei256.v v4, (a0), v12
	vsxseg5ei256.v v4, 0(a0), v12
	vsxseg5ei256.v v4, (a0), v12, v0.t

	vlxseg6ei256.v v4, (a0), v12
	vlxseg6ei256.v v4, 0(a0), v12
	vlxseg6ei256.v v4, (a0), v12, v0.t
	vsxseg6ei256.v v4, (a0), v12
	vsxseg6ei256.v v4, 0(a0), v12
	vsxseg6ei256.v v4, (a0), v12, v0.t

	vlxseg7ei256.v v4, (a0), v12
	vlxseg7ei256.v v4, 0(a0), v12
	vlxseg7ei256.v v4, (a0), v12, v0.t
	vsxseg7ei256.v v4, (a0), v12
	vsxseg7ei256.v v4, 0(a0), v12
	vsxseg7ei256.v v4, (a0), v12, v0.t

	vlxseg8ei256.v v4, (a0), v12
	vlxseg8ei256.v v4, 0(a0), v12
	vlxseg8ei256.v v4, (a0), v12, v0.t
	vsxseg8ei256.v v4, (a0), v12
	vsxseg8ei256.v v4, 0(a0), v12
	vsxseg8ei256.v v4, (a0), v12, v0.t

	vlxseg2ei512.v v4, (a0), v12
	vlxseg2ei512.v v4, 0(a0), v12
	vlxseg2ei512.v v4, (a0), v12, v0.t
	vsxseg2ei512.v v4, (a0), v12
	vsxseg2ei512.v v4, 0(a0), v12
	vsxseg2ei512.v v4, (a0), v12, v0.t

	vlxseg3ei512.v v4, (a0), v12
	vlxseg3ei512.v v4, 0(a0), v12
	vlxseg3ei512.v v4, (a0), v12, v0.t
	vsxseg3ei512.v v4, (a0), v12
	vsxseg3ei512.v v4, 0(a0), v12
	vsxseg3ei512.v v4, (a0), v12, v0.t

	vlxseg4ei512.v v4, (a0), v12
	vlxseg4ei512.v v4, 0(a0), v12
	vlxseg4ei512.v v4, (a0), v12, v0.t
	vsxseg4ei512.v v4, (a0), v12
	vsxseg4ei512.v v4, 0(a0), v12
	vsxseg4ei512.v v4, (a0), v12, v0.t

	vlxseg5ei512.v v4, (a0), v12
	vlxseg5ei512.v v4, 0(a0), v12
	vlxseg5ei512.v v4, (a0), v12, v0.t
	vsxseg5ei512.v v4, (a0), v12
	vsxseg5ei512.v v4, 0(a0), v12
	vsxseg5ei512.v v4, (a0), v12, v0.t

	vlxseg6ei512.v v4, (a0), v12
	vlxseg6ei512.v v4, 0(a0), v12
	vlxseg6ei512.v v4, (a0), v12, v0.t
	vsxseg6ei512.v v4, (a0), v12
	vsxseg6ei512.v v4, 0(a0), v12
	vsxseg6ei512.v v4, (a0), v12, v0.t

	vlxseg7ei512.v v4, (a0), v12
	vlxseg7ei512.v v4, 0(a0), v12
	vlxseg7ei512.v v4, (a0), v12, v0.t
	vsxseg7ei512.v v4, (a0), v12
	vsxseg7ei512.v v4, 0(a0), v12
	vsxseg7ei512.v v4, (a0), v12, v0.t

	vlxseg8ei512.v v4, (a0), v12
	vlxseg8ei512.v v4, 0(a0), v12
	vlxseg8ei512.v v4, (a0), v12, v0.t
	vsxseg8ei512.v v4, (a0), v12
	vsxseg8ei512.v v4, 0(a0), v12
	vsxseg8ei512.v v4, (a0), v12, v0.t

	vlxseg2ei1024.v v4, (a0), v12
	vlxseg2ei1024.v v4, 0(a0), v12
	vlxseg2ei1024.v v4, (a0), v12, v0.t
	vsxseg2ei1024.v v4, (a0), v12
	vsxseg2ei1024.v v4, 0(a0), v12
	vsxseg2ei1024.v v4, (a0), v12, v0.t

	vlxseg3ei1024.v v4, (a0), v12
	vlxseg3ei1024.v v4, 0(a0), v12
	vlxseg3ei1024.v v4, (a0), v12, v0.t
	vsxseg3ei1024.v v4, (a0), v12
	vsxseg3ei1024.v v4, 0(a0), v12
	vsxseg3ei1024.v v4, (a0), v12, v0.t

	vlxseg4ei1024.v v4, (a0), v12
	vlxseg4ei1024.v v4, 0(a0), v12
	vlxseg4ei1024.v v4, (a0), v12, v0.t
	vsxseg4ei1024.v v4, (a0), v12
	vsxseg4ei1024.v v4, 0(a0), v12
	vsxseg4ei1024.v v4, (a0), v12, v0.t

	vlxseg5ei1024.v v4, (a0), v12
	vlxseg5ei1024.v v4, 0(a0), v12
	vlxseg5ei1024.v v4, (a0), v12, v0.t
	vsxseg5ei1024.v v4, (a0), v12
	vsxseg5ei1024.v v4, 0(a0), v12
	vsxseg5ei1024.v v4, (a0), v12, v0.t

	vlxseg6ei1024.v v4, (a0), v12
	vlxseg6ei1024.v v4, 0(a0), v12
	vlxseg6ei1024.v v4, (a0), v12, v0.t
	vsxseg6ei1024.v v4, (a0), v12
	vsxseg6ei1024.v v4, 0(a0), v12
	vsxseg6ei1024.v v4, (a0), v12, v0.t

	vlxseg7ei1024.v v4, (a0), v12
	vlxseg7ei1024.v v4, 0(a0), v12
	vlxseg7ei1024.v v4, (a0), v12, v0.t
	vsxseg7ei1024.v v4, (a0), v12
	vsxseg7ei1024.v v4, 0(a0), v12
	vsxseg7ei1024.v v4, (a0), v12, v0.t

	vlxseg8ei1024.v v4, (a0), v12
	vlxseg8ei1024.v v4, 0(a0), v12
	vlxseg8ei1024.v v4, (a0), v12, v0.t
	vsxseg8ei1024.v v4, (a0), v12
	vsxseg8ei1024.v v4, 0(a0), v12
	vsxseg8ei1024.v v4, (a0), v12, v0.t

	vlseg2e8ff.v v4, (a0)
	vlseg2e8ff.v v4, 0(a0)
	vlseg2e8ff.v v4, (a0), v0.t

	vlseg3e8ff.v v4, (a0)
	vlseg3e8ff.v v4, 0(a0)
	vlseg3e8ff.v v4, (a0), v0.t

	vlseg4e8ff.v v4, (a0)
	vlseg4e8ff.v v4, 0(a0)
	vlseg4e8ff.v v4, (a0), v0.t

	vlseg5e8ff.v v4, (a0)
	vlseg5e8ff.v v4, 0(a0)
	vlseg5e8ff.v v4, (a0), v0.t

	vlseg6e8ff.v v4, (a0)
	vlseg6e8ff.v v4, 0(a0)
	vlseg6e8ff.v v4, (a0), v0.t

	vlseg7e8ff.v v4, (a0)
	vlseg7e8ff.v v4, 0(a0)
	vlseg7e8ff.v v4, (a0), v0.t

	vlseg8e8ff.v v4, (a0)
	vlseg8e8ff.v v4, 0(a0)
	vlseg8e8ff.v v4, (a0), v0.t

	vlseg2e16ff.v v4, (a0)
	vlseg2e16ff.v v4, 0(a0)
	vlseg2e16ff.v v4, (a0), v0.t

	vlseg3e16ff.v v4, (a0)
	vlseg3e16ff.v v4, 0(a0)
	vlseg3e16ff.v v4, (a0), v0.t

	vlseg4e16ff.v v4, (a0)
	vlseg4e16ff.v v4, 0(a0)
	vlseg4e16ff.v v4, (a0), v0.t

	vlseg5e16ff.v v4, (a0)
	vlseg5e16ff.v v4, 0(a0)
	vlseg5e16ff.v v4, (a0), v0.t

	vlseg6e16ff.v v4, (a0)
	vlseg6e16ff.v v4, 0(a0)
	vlseg6e16ff.v v4, (a0), v0.t

	vlseg7e16ff.v v4, (a0)
	vlseg7e16ff.v v4, 0(a0)
	vlseg7e16ff.v v4, (a0), v0.t

	vlseg8e16ff.v v4, (a0)
	vlseg8e16ff.v v4, 0(a0)
	vlseg8e16ff.v v4, (a0), v0.t

	vlseg2e32ff.v v4, (a0)
	vlseg2e32ff.v v4, 0(a0)
	vlseg2e32ff.v v4, (a0), v0.t

	vlseg3e32ff.v v4, (a0)
	vlseg3e32ff.v v4, 0(a0)
	vlseg3e32ff.v v4, (a0), v0.t

	vlseg4e32ff.v v4, (a0)
	vlseg4e32ff.v v4, 0(a0)
	vlseg4e32ff.v v4, (a0), v0.t

	vlseg5e32ff.v v4, (a0)
	vlseg5e32ff.v v4, 0(a0)
	vlseg5e32ff.v v4, (a0), v0.t

	vlseg6e32ff.v v4, (a0)
	vlseg6e32ff.v v4, 0(a0)
	vlseg6e32ff.v v4, (a0), v0.t

	vlseg7e32ff.v v4, (a0)
	vlseg7e32ff.v v4, 0(a0)
	vlseg7e32ff.v v4, (a0), v0.t

	vlseg8e32ff.v v4, (a0)
	vlseg8e32ff.v v4, 0(a0)
	vlseg8e32ff.v v4, (a0), v0.t

	vlseg2e64ff.v v4, (a0)
	vlseg2e64ff.v v4, 0(a0)
	vlseg2e64ff.v v4, (a0), v0.t

	vlseg3e64ff.v v4, (a0)
	vlseg3e64ff.v v4, 0(a0)
	vlseg3e64ff.v v4, (a0), v0.t

	vlseg4e64ff.v v4, (a0)
	vlseg4e64ff.v v4, 0(a0)
	vlseg4e64ff.v v4, (a0), v0.t

	vlseg5e64ff.v v4, (a0)
	vlseg5e64ff.v v4, 0(a0)
	vlseg5e64ff.v v4, (a0), v0.t

	vlseg6e64ff.v v4, (a0)
	vlseg6e64ff.v v4, 0(a0)
	vlseg6e64ff.v v4, (a0), v0.t

	vlseg7e64ff.v v4, (a0)
	vlseg7e64ff.v v4, 0(a0)
	vlseg7e64ff.v v4, (a0), v0.t

	vlseg8e64ff.v v4, (a0)
	vlseg8e64ff.v v4, 0(a0)
	vlseg8e64ff.v v4, (a0), v0.t

	vlseg2e128ff.v v4, (a0)
	vlseg2e128ff.v v4, 0(a0)
	vlseg2e128ff.v v4, (a0), v0.t

	vlseg3e128ff.v v4, (a0)
	vlseg3e128ff.v v4, 0(a0)
	vlseg3e128ff.v v4, (a0), v0.t

	vlseg4e128ff.v v4, (a0)
	vlseg4e128ff.v v4, 0(a0)
	vlseg4e128ff.v v4, (a0), v0.t

	vlseg5e128ff.v v4, (a0)
	vlseg5e128ff.v v4, 0(a0)
	vlseg5e128ff.v v4, (a0), v0.t

	vlseg6e128ff.v v4, (a0)
	vlseg6e128ff.v v4, 0(a0)
	vlseg6e128ff.v v4, (a0), v0.t

	vlseg7e128ff.v v4, (a0)
	vlseg7e128ff.v v4, 0(a0)
	vlseg7e128ff.v v4, (a0), v0.t

	vlseg8e128ff.v v4, (a0)
	vlseg8e128ff.v v4, 0(a0)
	vlseg8e128ff.v v4, (a0), v0.t

	vlseg2e256ff.v v4, (a0)
	vlseg2e256ff.v v4, 0(a0)
	vlseg2e256ff.v v4, (a0), v0.t

	vlseg3e256ff.v v4, (a0)
	vlseg3e256ff.v v4, 0(a0)
	vlseg3e256ff.v v4, (a0), v0.t

	vlseg4e256ff.v v4, (a0)
	vlseg4e256ff.v v4, 0(a0)
	vlseg4e256ff.v v4, (a0), v0.t

	vlseg5e256ff.v v4, (a0)
	vlseg5e256ff.v v4, 0(a0)
	vlseg5e256ff.v v4, (a0), v0.t

	vlseg6e256ff.v v4, (a0)
	vlseg6e256ff.v v4, 0(a0)
	vlseg6e256ff.v v4, (a0), v0.t

	vlseg7e256ff.v v4, (a0)
	vlseg7e256ff.v v4, 0(a0)
	vlseg7e256ff.v v4, (a0), v0.t

	vlseg8e256ff.v v4, (a0)
	vlseg8e256ff.v v4, 0(a0)
	vlseg8e256ff.v v4, (a0), v0.t

	vlseg2e512ff.v v4, (a0)
	vlseg2e512ff.v v4, 0(a0)
	vlseg2e512ff.v v4, (a0), v0.t

	vlseg3e512ff.v v4, (a0)
	vlseg3e512ff.v v4, 0(a0)
	vlseg3e512ff.v v4, (a0), v0.t

	vlseg4e512ff.v v4, (a0)
	vlseg4e512ff.v v4, 0(a0)
	vlseg4e512ff.v v4, (a0), v0.t

	vlseg5e512ff.v v4, (a0)
	vlseg5e512ff.v v4, 0(a0)
	vlseg5e512ff.v v4, (a0), v0.t

	vlseg6e512ff.v v4, (a0)
	vlseg6e512ff.v v4, 0(a0)
	vlseg6e512ff.v v4, (a0), v0.t

	vlseg7e512ff.v v4, (a0)
	vlseg7e512ff.v v4, 0(a0)
	vlseg7e512ff.v v4, (a0), v0.t

	vlseg8e512ff.v v4, (a0)
	vlseg8e512ff.v v4, 0(a0)
	vlseg8e512ff.v v4, (a0), v0.t

	vlseg2e1024ff.v v4, (a0)
	vlseg2e1024ff.v v4, 0(a0)
	vlseg2e1024ff.v v4, (a0), v0.t

	vlseg3e1024ff.v v4, (a0)
	vlseg3e1024ff.v v4, 0(a0)
	vlseg3e1024ff.v v4, (a0), v0.t

	vlseg4e1024ff.v v4, (a0)
	vlseg4e1024ff.v v4, 0(a0)
	vlseg4e1024ff.v v4, (a0), v0.t

	vlseg5e1024ff.v v4, (a0)
	vlseg5e1024ff.v v4, 0(a0)
	vlseg5e1024ff.v v4, (a0), v0.t

	vlseg6e1024ff.v v4, (a0)
	vlseg6e1024ff.v v4, 0(a0)
	vlseg6e1024ff.v v4, (a0), v0.t

	vlseg7e1024ff.v v4, (a0)
	vlseg7e1024ff.v v4, 0(a0)
	vlseg7e1024ff.v v4, (a0), v0.t

	vlseg8e1024ff.v v4, (a0)
	vlseg8e1024ff.v v4, 0(a0)
	vlseg8e1024ff.v v4, (a0), v0.t

	vl1r.v v3, (a0)
	vl1r.v v3, 0(a0)
	vl2r.v v2, (a0)
	vl2r.v v2, 0(a0)
	vl4r.v v4, (a0)
	vl4r.v v4, 0(a0)
	vl8r.v v8, (a0)
	vl8r.v v8, 0(a0)

	vs1r.v v3, (a1)
	vs1r.v v3, 0(a1)
	vs2r.v v2, (a1)
	vs2r.v v2, 0(a1)
	vs4r.v v4, (a1)
	vs4r.v v4, 0(a1)
	vs8r.v v8, (a1)
	vs8r.v v8, 0(a1)

	vamoaddei8.v v4, (a1), v8, v4
	vamoaddei8.v x0, (a1), v8, v4
	vamoaddei8.v v4, (a1), v8, v4, v0.t
	vamoaddei8.v x0, (a1), v8, v4, v0.t
	vamoswapei8.v v4, (a1), v8, v4
	vamoswapei8.v x0, (a1), v8, v4
	vamoswapei8.v v4, (a1), v8, v4, v0.t
	vamoswapei8.v x0, (a1), v8, v4, v0.t

	vamoxorei8.v v4, (a1), v8, v4
	vamoxorei8.v x0, (a1), v8, v4
	vamoxorei8.v v4, (a1), v8, v4, v0.t
	vamoxorei8.v x0, (a1), v8, v4, v0.t
	vamoandei8.v v4, (a1), v8, v4
	vamoandei8.v x0, (a1), v8, v4
	vamoandei8.v v4, (a1), v8, v4, v0.t
	vamoandei8.v x0, (a1), v8, v4, v0.t
	vamoorei8.v v4, (a1), v8, v4
	vamoorei8.v x0, (a1), v8, v4
	vamoorei8.v v4, (a1), v8, v4, v0.t
	vamoorei8.v x0, (a1), v8, v4, v0.t

	vamominei8.v v4, (a1), v8, v4
	vamominei8.v x0, (a1), v8, v4
	vamominei8.v v4, (a1), v8, v4, v0.t
	vamominei8.v x0, (a1), v8, v4, v0.t
	vamomaxei8.v v4, (a1), v8, v4
	vamomaxei8.v x0, (a1), v8, v4
	vamomaxei8.v v4, (a1), v8, v4, v0.t
	vamomaxei8.v x0, (a1), v8, v4, v0.t
	vamominuei8.v v4, (a1), v8, v4
	vamominuei8.v x0, (a1), v8, v4
	vamominuei8.v v4, (a1), v8, v4, v0.t
	vamominuei8.v x0, (a1), v8, v4, v0.t
	vamomaxuei8.v v4, (a1), v8, v4
	vamomaxuei8.v x0, (a1), v8, v4
	vamomaxuei8.v v4, (a1), v8, v4, v0.t
	vamomaxuei8.v x0, (a1), v8, v4, v0.t

	vamoaddei8.v v4, 0(a1), v8, v4
	vamoaddei8.v x0, 0(a1), v8, v4
	vamoaddei8.v v4, 0(a1), v8, v4, v0.t
	vamoaddei8.v x0, 0(a1), v8, v4, v0.t
	vamoswapei8.v v4, 0(a1), v8, v4
	vamoswapei8.v x0, 0(a1), v8, v4
	vamoswapei8.v v4, 0(a1), v8, v4, v0.t
	vamoswapei8.v x0, 0(a1), v8, v4, v0.t

	vamoxorei8.v v4, 0(a1), v8, v4
	vamoxorei8.v x0, 0(a1), v8, v4
	vamoxorei8.v v4, 0(a1), v8, v4, v0.t
	vamoxorei8.v x0, 0(a1), v8, v4, v0.t
	vamoandei8.v v4, 0(a1), v8, v4
	vamoandei8.v x0, 0(a1), v8, v4
	vamoandei8.v v4, 0(a1), v8, v4, v0.t
	vamoandei8.v x0, 0(a1), v8, v4, v0.t
	vamoorei8.v v4, 0(a1), v8, v4
	vamoorei8.v x0, 0(a1), v8, v4
	vamoorei8.v v4, 0(a1), v8, v4, v0.t
	vamoorei8.v x0, 0(a1), v8, v4, v0.t

	vamominei8.v v4, 0(a1), v8, v4
	vamominei8.v x0, 0(a1), v8, v4
	vamominei8.v v4, 0(a1), v8, v4, v0.t
	vamominei8.v x0, 0(a1), v8, v4, v0.t
	vamomaxei8.v v4, 0(a1), v8, v4
	vamomaxei8.v x0, 0(a1), v8, v4
	vamomaxei8.v v4, 0(a1), v8, v4, v0.t
	vamomaxei8.v x0, 0(a1), v8, v4, v0.t
	vamominuei8.v v4, 0(a1), v8, v4
	vamominuei8.v x0, 0(a1), v8, v4
	vamominuei8.v v4, 0(a1), v8, v4, v0.t
	vamominuei8.v x0, 0(a1), v8, v4, v0.t
	vamomaxuei8.v v4, 0(a1), v8, v4
	vamomaxuei8.v x0, 0(a1), v8, v4
	vamomaxuei8.v v4, 0(a1), v8, v4, v0.t
	vamomaxuei8.v x0, 0(a1), v8, v4, v0.t

	vamoaddei16.v v4, (a1), v8, v4
	vamoaddei16.v x0, (a1), v8, v4
	vamoaddei16.v v4, (a1), v8, v4, v0.t
	vamoaddei16.v x0, (a1), v8, v4, v0.t
	vamoswapei16.v v4, (a1), v8, v4
	vamoswapei16.v x0, (a1), v8, v4
	vamoswapei16.v v4, (a1), v8, v4, v0.t
	vamoswapei16.v x0, (a1), v8, v4, v0.t

	vamoxorei16.v v4, (a1), v8, v4
	vamoxorei16.v x0, (a1), v8, v4
	vamoxorei16.v v4, (a1), v8, v4, v0.t
	vamoxorei16.v x0, (a1), v8, v4, v0.t
	vamoandei16.v v4, (a1), v8, v4
	vamoandei16.v x0, (a1), v8, v4
	vamoandei16.v v4, (a1), v8, v4, v0.t
	vamoandei16.v x0, (a1), v8, v4, v0.t
	vamoorei16.v v4, (a1), v8, v4
	vamoorei16.v x0, (a1), v8, v4
	vamoorei16.v v4, (a1), v8, v4, v0.t
	vamoorei16.v x0, (a1), v8, v4, v0.t

	vamominei16.v v4, (a1), v8, v4
	vamominei16.v x0, (a1), v8, v4
	vamominei16.v v4, (a1), v8, v4, v0.t
	vamominei16.v x0, (a1), v8, v4, v0.t
	vamomaxei16.v v4, (a1), v8, v4
	vamomaxei16.v x0, (a1), v8, v4
	vamomaxei16.v v4, (a1), v8, v4, v0.t
	vamomaxei16.v x0, (a1), v8, v4, v0.t
	vamominuei16.v v4, (a1), v8, v4
	vamominuei16.v x0, (a1), v8, v4
	vamominuei16.v v4, (a1), v8, v4, v0.t
	vamominuei16.v x0, (a1), v8, v4, v0.t
	vamomaxuei16.v v4, (a1), v8, v4
	vamomaxuei16.v x0, (a1), v8, v4
	vamomaxuei16.v v4, (a1), v8, v4, v0.t
	vamomaxuei16.v x0, (a1), v8, v4, v0.t

	vamoaddei16.v v4, 0(a1), v8, v4
	vamoaddei16.v x0, 0(a1), v8, v4
	vamoaddei16.v v4, 0(a1), v8, v4, v0.t
	vamoaddei16.v x0, 0(a1), v8, v4, v0.t
	vamoswapei16.v v4, 0(a1), v8, v4
	vamoswapei16.v x0, 0(a1), v8, v4
	vamoswapei16.v v4, 0(a1), v8, v4, v0.t
	vamoswapei16.v x0, 0(a1), v8, v4, v0.t

	vamoxorei16.v v4, 0(a1), v8, v4
	vamoxorei16.v x0, 0(a1), v8, v4
	vamoxorei16.v v4, 0(a1), v8, v4, v0.t
	vamoxorei16.v x0, 0(a1), v8, v4, v0.t
	vamoandei16.v v4, 0(a1), v8, v4
	vamoandei16.v x0, 0(a1), v8, v4
	vamoandei16.v v4, 0(a1), v8, v4, v0.t
	vamoandei16.v x0, 0(a1), v8, v4, v0.t
	vamoorei16.v v4, 0(a1), v8, v4
	vamoorei16.v x0, 0(a1), v8, v4
	vamoorei16.v v4, 0(a1), v8, v4, v0.t
	vamoorei16.v x0, 0(a1), v8, v4, v0.t

	vamominei16.v v4, 0(a1), v8, v4
	vamominei16.v x0, 0(a1), v8, v4
	vamominei16.v v4, 0(a1), v8, v4, v0.t
	vamominei16.v x0, 0(a1), v8, v4, v0.t
	vamomaxei16.v v4, 0(a1), v8, v4
	vamomaxei16.v x0, 0(a1), v8, v4
	vamomaxei16.v v4, 0(a1), v8, v4, v0.t
	vamomaxei16.v x0, 0(a1), v8, v4, v0.t
	vamominuei16.v v4, 0(a1), v8, v4
	vamominuei16.v x0, 0(a1), v8, v4
	vamominuei16.v v4, 0(a1), v8, v4, v0.t
	vamominuei16.v x0, 0(a1), v8, v4, v0.t
	vamomaxuei16.v v4, 0(a1), v8, v4
	vamomaxuei16.v x0, 0(a1), v8, v4
	vamomaxuei16.v v4, 0(a1), v8, v4, v0.t
	vamomaxuei16.v x0, 0(a1), v8, v4, v0.t

	vamoaddei32.v v4, (a1), v8, v4
	vamoaddei32.v x0, (a1), v8, v4
	vamoaddei32.v v4, (a1), v8, v4, v0.t
	vamoaddei32.v x0, (a1), v8, v4, v0.t
	vamoswapei32.v v4, (a1), v8, v4
	vamoswapei32.v x0, (a1), v8, v4
	vamoswapei32.v v4, (a1), v8, v4, v0.t
	vamoswapei32.v x0, (a1), v8, v4, v0.t

	vamoxorei32.v v4, (a1), v8, v4
	vamoxorei32.v x0, (a1), v8, v4
	vamoxorei32.v v4, (a1), v8, v4, v0.t
	vamoxorei32.v x0, (a1), v8, v4, v0.t
	vamoandei32.v v4, (a1), v8, v4
	vamoandei32.v x0, (a1), v8, v4
	vamoandei32.v v4, (a1), v8, v4, v0.t
	vamoandei32.v x0, (a1), v8, v4, v0.t
	vamoorei32.v v4, (a1), v8, v4
	vamoorei32.v x0, (a1), v8, v4
	vamoorei32.v v4, (a1), v8, v4, v0.t
	vamoorei32.v x0, (a1), v8, v4, v0.t

	vamominei32.v v4, (a1), v8, v4
	vamominei32.v x0, (a1), v8, v4
	vamominei32.v v4, (a1), v8, v4, v0.t
	vamominei32.v x0, (a1), v8, v4, v0.t
	vamomaxei32.v v4, (a1), v8, v4
	vamomaxei32.v x0, (a1), v8, v4
	vamomaxei32.v v4, (a1), v8, v4, v0.t
	vamomaxei32.v x0, (a1), v8, v4, v0.t
	vamominuei32.v v4, (a1), v8, v4
	vamominuei32.v x0, (a1), v8, v4
	vamominuei32.v v4, (a1), v8, v4, v0.t
	vamominuei32.v x0, (a1), v8, v4, v0.t
	vamomaxuei32.v v4, (a1), v8, v4
	vamomaxuei32.v x0, (a1), v8, v4
	vamomaxuei32.v v4, (a1), v8, v4, v0.t
	vamomaxuei32.v x0, (a1), v8, v4, v0.t

	vamoaddei32.v v4, 0(a1), v8, v4
	vamoaddei32.v x0, 0(a1), v8, v4
	vamoaddei32.v v4, 0(a1), v8, v4, v0.t
	vamoaddei32.v x0, 0(a1), v8, v4, v0.t
	vamoswapei32.v v4, 0(a1), v8, v4
	vamoswapei32.v x0, 0(a1), v8, v4
	vamoswapei32.v v4, 0(a1), v8, v4, v0.t
	vamoswapei32.v x0, 0(a1), v8, v4, v0.t

	vamoxorei32.v v4, 0(a1), v8, v4
	vamoxorei32.v x0, 0(a1), v8, v4
	vamoxorei32.v v4, 0(a1), v8, v4, v0.t
	vamoxorei32.v x0, 0(a1), v8, v4, v0.t
	vamoandei32.v v4, 0(a1), v8, v4
	vamoandei32.v x0, 0(a1), v8, v4
	vamoandei32.v v4, 0(a1), v8, v4, v0.t
	vamoandei32.v x0, 0(a1), v8, v4, v0.t
	vamoorei32.v v4, 0(a1), v8, v4
	vamoorei32.v x0, 0(a1), v8, v4
	vamoorei32.v v4, 0(a1), v8, v4, v0.t
	vamoorei32.v x0, 0(a1), v8, v4, v0.t

	vamominei32.v v4, 0(a1), v8, v4
	vamominei32.v x0, 0(a1), v8, v4
	vamominei32.v v4, 0(a1), v8, v4, v0.t
	vamominei32.v x0, 0(a1), v8, v4, v0.t
	vamomaxei32.v v4, 0(a1), v8, v4
	vamomaxei32.v x0, 0(a1), v8, v4
	vamomaxei32.v v4, 0(a1), v8, v4, v0.t
	vamomaxei32.v x0, 0(a1), v8, v4, v0.t
	vamominuei32.v v4, 0(a1), v8, v4
	vamominuei32.v x0, 0(a1), v8, v4
	vamominuei32.v v4, 0(a1), v8, v4, v0.t
	vamominuei32.v x0, 0(a1), v8, v4, v0.t
	vamomaxuei32.v v4, 0(a1), v8, v4
	vamomaxuei32.v x0, 0(a1), v8, v4
	vamomaxuei32.v v4, 0(a1), v8, v4, v0.t
	vamomaxuei32.v x0, 0(a1), v8, v4, v0.t

	vamoaddei64.v v4, (a1), v8, v4
	vamoaddei64.v x0, (a1), v8, v4
	vamoaddei64.v v4, (a1), v8, v4, v0.t
	vamoaddei64.v x0, (a1), v8, v4, v0.t
	vamoswapei64.v v4, (a1), v8, v4
	vamoswapei64.v x0, (a1), v8, v4
	vamoswapei64.v v4, (a1), v8, v4, v0.t
	vamoswapei64.v x0, (a1), v8, v4, v0.t

	vamoxorei64.v v4, (a1), v8, v4
	vamoxorei64.v x0, (a1), v8, v4
	vamoxorei64.v v4, (a1), v8, v4, v0.t
	vamoxorei64.v x0, (a1), v8, v4, v0.t
	vamoandei64.v v4, (a1), v8, v4
	vamoandei64.v x0, (a1), v8, v4
	vamoandei64.v v4, (a1), v8, v4, v0.t
	vamoandei64.v x0, (a1), v8, v4, v0.t
	vamoorei64.v v4, (a1), v8, v4
	vamoorei64.v x0, (a1), v8, v4
	vamoorei64.v v4, (a1), v8, v4, v0.t
	vamoorei64.v x0, (a1), v8, v4, v0.t

	vamominei64.v v4, (a1), v8, v4
	vamominei64.v x0, (a1), v8, v4
	vamominei64.v v4, (a1), v8, v4, v0.t
	vamominei64.v x0, (a1), v8, v4, v0.t
	vamomaxei64.v v4, (a1), v8, v4
	vamomaxei64.v x0, (a1), v8, v4
	vamomaxei64.v v4, (a1), v8, v4, v0.t
	vamomaxei64.v x0, (a1), v8, v4, v0.t
	vamominuei64.v v4, (a1), v8, v4
	vamominuei64.v x0, (a1), v8, v4
	vamominuei64.v v4, (a1), v8, v4, v0.t
	vamominuei64.v x0, (a1), v8, v4, v0.t
	vamomaxuei64.v v4, (a1), v8, v4
	vamomaxuei64.v x0, (a1), v8, v4
	vamomaxuei64.v v4, (a1), v8, v4, v0.t
	vamomaxuei64.v x0, (a1), v8, v4, v0.t

	vamoaddei64.v v4, 0(a1), v8, v4
	vamoaddei64.v x0, 0(a1), v8, v4
	vamoaddei64.v v4, 0(a1), v8, v4, v0.t
	vamoaddei64.v x0, 0(a1), v8, v4, v0.t
	vamoswapei64.v v4, 0(a1), v8, v4
	vamoswapei64.v x0, 0(a1), v8, v4
	vamoswapei64.v v4, 0(a1), v8, v4, v0.t
	vamoswapei64.v x0, 0(a1), v8, v4, v0.t

	vamoxorei64.v v4, 0(a1), v8, v4
	vamoxorei64.v x0, 0(a1), v8, v4
	vamoxorei64.v v4, 0(a1), v8, v4, v0.t
	vamoxorei64.v x0, 0(a1), v8, v4, v0.t
	vamoandei64.v v4, 0(a1), v8, v4
	vamoandei64.v x0, 0(a1), v8, v4
	vamoandei64.v v4, 0(a1), v8, v4, v0.t
	vamoandei64.v x0, 0(a1), v8, v4, v0.t
	vamoorei64.v v4, 0(a1), v8, v4
	vamoorei64.v x0, 0(a1), v8, v4
	vamoorei64.v v4, 0(a1), v8, v4, v0.t
	vamoorei64.v x0, 0(a1), v8, v4, v0.t

	vamominei64.v v4, 0(a1), v8, v4
	vamominei64.v x0, 0(a1), v8, v4
	vamominei64.v v4, 0(a1), v8, v4, v0.t
	vamominei64.v x0, 0(a1), v8, v4, v0.t
	vamomaxei64.v v4, 0(a1), v8, v4
	vamomaxei64.v x0, 0(a1), v8, v4
	vamomaxei64.v v4, 0(a1), v8, v4, v0.t
	vamomaxei64.v x0, 0(a1), v8, v4, v0.t
	vamominuei64.v v4, 0(a1), v8, v4
	vamominuei64.v x0, 0(a1), v8, v4
	vamominuei64.v v4, 0(a1), v8, v4, v0.t
	vamominuei64.v x0, 0(a1), v8, v4, v0.t
	vamomaxuei64.v v4, 0(a1), v8, v4
	vamomaxuei64.v x0, 0(a1), v8, v4
	vamomaxuei64.v v4, 0(a1), v8, v4, v0.t
	vamomaxuei64.v x0, 0(a1), v8, v4, v0.t

	vadd.vv v4, v8, v12
	vadd.vx v4, v8, a1
	vadd.vi v4, v8, 15
	vadd.vi v4, v8, -16
	vadd.vv v4, v8, v12, v0.t
	vadd.vx v4, v8, a1, v0.t
	vadd.vi v4, v8, 15, v0.t
	vadd.vi v4, v8, -16, v0.t
	vsub.vv v4, v8, v12
	vsub.vx v4, v8, a1
	vrsub.vx v4, v8, a1
	vrsub.vi v4, v8, 15
	vrsub.vi v4, v8, -16
	vsub.vv v4, v8, v12, v0.t
	vsub.vx v4, v8, a1, v0.t
	vrsub.vx v4, v8, a1, v0.t
	vrsub.vi v4, v8, 15, v0.t
	vrsub.vi v4, v8, -16, v0.t

	# Aliases
	vwcvt.x.x.v v4, v8
	vwcvtu.x.x.v v4, v8
	vwcvt.x.x.v v4, v8, v0.t
	vwcvtu.x.x.v v4, v8, v0.t

	vwaddu.vv v4, v8, v12
	vwaddu.vx v4, v8, a1
	vwaddu.vv v4, v8, v12, v0.t
	vwaddu.vx v4, v8, a1, v0.t
	vwsubu.vv v4, v8, v12
	vwsubu.vx v4, v8, a1
	vwsubu.vv v4, v8, v12, v0.t
	vwsubu.vx v4, v8, a1, v0.t
	vwadd.vv v4, v8, v12
	vwadd.vx v4, v8, a1
	vwadd.vv v4, v8, v12, v0.t
	vwadd.vx v4, v8, a1, v0.t
	vwsub.vv v4, v8, v12
	vwsub.vx v4, v8, a1
	vwsub.vv v4, v8, v12, v0.t
	vwsub.vx v4, v8, a1, v0.t
	vwaddu.wv v4, v8, v12
	vwaddu.wx v4, v8, a1
	vwaddu.wv v4, v8, v12, v0.t
	vwaddu.wx v4, v8, a1, v0.t
	vwsubu.wv v4, v8, v12
	vwsubu.wx v4, v8, a1
	vwsubu.wv v4, v8, v12, v0.t
	vwsubu.wx v4, v8, a1, v0.t
	vwadd.wv v4, v8, v12
	vwadd.wx v4, v8, a1
	vwadd.wv v4, v8, v12, v0.t
	vwadd.wx v4, v8, a1, v0.t
	vwsub.wv v4, v8, v12
	vwsub.wx v4, v8, a1
	vwsub.wv v4, v8, v12, v0.t
	vwsub.wx v4, v8, a1, v0.t

	vzext.vf2 v4, v8
	vzext.vf2 v4, v8, v0.t
	vsext.vf2 v4, v8
	vsext.vf2 v4, v8, v0.t
	vzext.vf4 v4, v8
	vzext.vf4 v4, v8, v0.t
	vsext.vf4 v4, v8
	vsext.vf4 v4, v8, v0.t
	vzext.vf8 v4, v8
	vzext.vf8 v4, v8, v0.t
	vsext.vf8 v4, v8
	vsext.vf8 v4, v8, v0.t

	vadc.vvm v4, v8, v12, v0
	vadc.vxm v4, v8, a1, v0
	vadc.vim v4, v8, 15, v0
	vadc.vim v4, v8, -16, v0
	vmadc.vvm v4, v8, v12, v0
	vmadc.vxm v4, v8, a1, v0
	vmadc.vim v4, v8, 15, v0
	vmadc.vim v4, v8, -16, v0
	vmadc.vv v4, v8, v12
	vmadc.vx v4, v8, a1
	vmadc.vi v4, v8, 15
	vmadc.vi v4, v8, -16
	vsbc.vvm v4, v8, v12, v0
	vsbc.vxm v4, v8, a1, v0
	vmsbc.vvm v4, v8, v12, v0
	vmsbc.vxm v4, v8, a1, v0
	vmsbc.vv v4, v8, v12
	vmsbc.vx v4, v8, a1

	# Aliases
	vnot.v v4, v8
	vnot.v v4, v8, v0.t

	vand.vv v4, v8, v12
	vand.vx v4, v8, a1
	vand.vi v4, v8, 15
	vand.vi v4, v8, -16
	vand.vv v4, v8, v12, v0.t
	vand.vx v4, v8, a1, v0.t
	vand.vi v4, v8, 15, v0.t
	vand.vi v4, v8, -16, v0.t
	vor.vv v4, v8, v12
	vor.vx v4, v8, a1
	vor.vi v4, v8, 15
	vor.vi v4, v8, -16
	vor.vv v4, v8, v12, v0.t
	vor.vx v4, v8, a1, v0.t
	vor.vi v4, v8, 15, v0.t
	vor.vi v4, v8, -16, v0.t
	vxor.vv v4, v8, v12
	vxor.vx v4, v8, a1
	vxor.vi v4, v8, 15
	vxor.vi v4, v8, -16
	vxor.vv v4, v8, v12, v0.t
	vxor.vx v4, v8, a1, v0.t
	vxor.vi v4, v8, 15, v0.t
	vxor.vi v4, v8, -16, v0.t

	vsll.vv v4, v8, v12
	vsll.vx v4, v8, a1
	vsll.vi v4, v8, 1
	vsll.vi v4, v8, 31
	vsll.vv v4, v8, v12, v0.t
	vsll.vx v4, v8, a1, v0.t
	vsll.vi v4, v8, 1, v0.t
	vsll.vi v4, v8, 31, v0.t
	vsrl.vv v4, v8, v12
	vsrl.vx v4, v8, a1
	vsrl.vi v4, v8, 1
	vsrl.vi v4, v8, 31
	vsrl.vv v4, v8, v12, v0.t
	vsrl.vx v4, v8, a1, v0.t
	vsrl.vi v4, v8, 1, v0.t
	vsrl.vi v4, v8, 31, v0.t
	vsra.vv v4, v8, v12
	vsra.vx v4, v8, a1
	vsra.vi v4, v8, 1
	vsra.vi v4, v8, 31
	vsra.vv v4, v8, v12, v0.t
	vsra.vx v4, v8, a1, v0.t
	vsra.vi v4, v8, 1, v0.t
	vsra.vi v4, v8, 31, v0.t

	vnsrl.wv v4, v8, v12
	vnsrl.wx v4, v8, a1
	vnsrl.wi v4, v8, 1
	vnsrl.wi v4, v8, 31
	vnsrl.wv v4, v8, v12, v0.t
	vnsrl.wx v4, v8, a1, v0.t
	vnsrl.wi v4, v8, 1, v0.t
	vnsrl.wi v4, v8, 31, v0.t
	vnsra.wv v4, v8, v12
	vnsra.wx v4, v8, a1
	vnsra.wi v4, v8, 1
	vnsra.wi v4, v8, 31
	vnsra.wv v4, v8, v12, v0.t
	vnsra.wx v4, v8, a1, v0.t
	vnsra.wi v4, v8, 1, v0.t
	vnsra.wi v4, v8, 31, v0.t

	# Aliases
	vmsgt.vv v4, v8, v12
	vmsgtu.vv v4, v8, v12
	vmsge.vv v4, v8, v12
	vmsgeu.vv v4, v8, v12
	vmsgt.vv v4, v8, v12, v0.t
	vmsgtu.vv v4, v8, v12, v0.t
	vmsge.vv v4, v8, v12, v0.t
	vmsgeu.vv v4, v8, v12, v0.t
	vmslt.vi v4, v8, 16
	vmslt.vi v4, v8, -15
	vmsltu.vi v4, v8, 16
	vmsltu.vi v4, v8, -15
	vmsge.vi v4, v8, 16
	vmsge.vi v4, v8, -15
	vmsgeu.vi v4, v8, 16
	vmsgeu.vi v4, v8, -15
	vmslt.vi v4, v8, 16, v0.t
	vmslt.vi v4, v8, -15, v0.t
	vmsltu.vi v4, v8, 16, v0.t
	vmsltu.vi v4, v8, -15, v0.t
	vmsge.vi v4, v8, 16, v0.t
	vmsge.vi v4, v8, -15, v0.t
	vmsgeu.vi v4, v8, 16, v0.t
	vmsgeu.vi v4, v8, -15, v0.t

	vmseq.vv v4, v8, v12
	vmseq.vx v4, v8, a1
	vmseq.vi v4, v8, 15
	vmseq.vi v4, v8, -16
	vmseq.vv v4, v8, v12, v0.t
	vmseq.vx v4, v8, a1, v0.t
	vmseq.vi v4, v8, 15, v0.t
	vmseq.vi v4, v8, -16, v0.t
	vmsne.vv v4, v8, v12
	vmsne.vx v4, v8, a1
	vmsne.vi v4, v8, 15
	vmsne.vi v4, v8, -16
	vmsne.vv v4, v8, v12, v0.t
	vmsne.vx v4, v8, a1, v0.t
	vmsne.vi v4, v8, 15, v0.t
	vmsne.vi v4, v8, -16, v0.t
	vmsltu.vv v4, v8, v12
	vmsltu.vx v4, v8, a1
	vmsltu.vv v4, v8, v12, v0.t
	vmsltu.vx v4, v8, a1, v0.t
	vmslt.vv v4, v8, v12
	vmslt.vx v4, v8, a1
	vmslt.vv v4, v8, v12, v0.t
	vmslt.vx v4, v8, a1, v0.t
	vmsleu.vv v4, v8, v12
	vmsleu.vx v4, v8, a1
	vmsleu.vi v4, v8, 15
	vmsleu.vi v4, v8, -16
	vmsleu.vv v4, v8, v12, v0.t
	vmsleu.vx v4, v8, a1, v0.t
	vmsleu.vi v4, v8, 15, v0.t
	vmsleu.vi v4, v8, -16, v0.t
	vmsle.vv v4, v8, v12
	vmsle.vx v4, v8, a1
	vmsle.vi v4, v8, 15
	vmsle.vi v4, v8, -16
	vmsle.vv v4, v8, v12, v0.t
	vmsle.vx v4, v8, a1, v0.t
	vmsle.vi v4, v8, 15, v0.t
	vmsle.vi v4, v8, -16, v0.t
	vmsgtu.vx v4, v8, a1
	vmsgtu.vi v4, v8, 15
	vmsgtu.vi v4, v8, -16
	vmsgtu.vx v4, v8, a1, v0.t
	vmsgtu.vi v4, v8, 15, v0.t
	vmsgtu.vi v4, v8, -16, v0.t
	vmsgt.vx v4, v8, a1
	vmsgt.vi v4, v8, 15
	vmsgt.vi v4, v8, -16
	vmsgt.vx v4, v8, a1, v0.t
	vmsgt.vi v4, v8, 15, v0.t
	vmsgt.vi v4, v8, -16, v0.t

	vminu.vv v4, v8, v12
	vminu.vx v4, v8, a1
	vminu.vv v4, v8, v12, v0.t
	vminu.vx v4, v8, a1, v0.t
	vmin.vv v4, v8, v12
	vmin.vx v4, v8, a1
	vmin.vv v4, v8, v12, v0.t
	vmin.vx v4, v8, a1, v0.t
	vmaxu.vv v4, v8, v12
	vmaxu.vx v4, v8, a1
	vmaxu.vv v4, v8, v12, v0.t
	vmaxu.vx v4, v8, a1, v0.t
	vmax.vv v4, v8, v12
	vmax.vx v4, v8, a1
	vmax.vv v4, v8, v12, v0.t
	vmax.vx v4, v8, a1, v0.t

	vmul.vv v4, v8, v12
	vmul.vx v4, v8, a1
	vmul.vv v4, v8, v12, v0.t
	vmul.vx v4, v8, a1, v0.t
	vmulh.vv v4, v8, v12
	vmulh.vx v4, v8, a1
	vmulh.vv v4, v8, v12, v0.t
	vmulh.vx v4, v8, a1, v0.t
	vmulhu.vv v4, v8, v12
	vmulhu.vx v4, v8, a1
	vmulhu.vv v4, v8, v12, v0.t
	vmulhu.vx v4, v8, a1, v0.t
	vmulhsu.vv v4, v8, v12
	vmulhsu.vx v4, v8, a1
	vmulhsu.vv v4, v8, v12, v0.t
	vmulhsu.vx v4, v8, a1, v0.t

	vwmul.vv v4, v8, v12
	vwmul.vx v4, v8, a1
	vwmul.vv v4, v8, v12, v0.t
	vwmul.vx v4, v8, a1, v0.t
	vwmulu.vv v4, v8, v12
	vwmulu.vx v4, v8, a1
	vwmulu.vv v4, v8, v12, v0.t
	vwmulu.vx v4, v8, a1, v0.t
	vwmulsu.vv v4, v8, v12
	vwmulsu.vx v4, v8, a1
	vwmulsu.vv v4, v8, v12, v0.t
	vwmulsu.vx v4, v8, a1, v0.t

	vmacc.vv v4, v12, v8
	vmacc.vx v4, a1, v8
	vmacc.vv v4, v12, v8, v0.t
	vmacc.vx v4, a1, v8, v0.t
	vnmsac.vv v4, v12, v8
	vnmsac.vx v4, a1, v8
	vnmsac.vv v4, v12, v8, v0.t
	vnmsac.vx v4, a1, v8, v0.t
	vmadd.vv v4, v12, v8
	vmadd.vx v4, a1, v8
	vmadd.vv v4, v12, v8, v0.t
	vmadd.vx v4, a1, v8, v0.t
	vnmsub.vv v4, v12, v8
	vnmsub.vx v4, a1, v8
	vnmsub.vv v4, v12, v8, v0.t
	vnmsub.vx v4, a1, v8, v0.t

	vwmaccu.vv v4, v12, v8
	vwmaccu.vx v4, a1, v8
	vwmaccu.vv v4, v12, v8, v0.t
	vwmaccu.vx v4, a1, v8, v0.t
	vwmacc.vv v4, v12, v8
	vwmacc.vx v4, a1, v8
	vwmacc.vv v4, v12, v8, v0.t
	vwmacc.vx v4, a1, v8, v0.t
	vwmaccsu.vv v4, v12, v8
	vwmaccsu.vx v4, a1, v8
	vwmaccsu.vv v4, v12, v8, v0.t
	vwmaccsu.vx v4, a1, v8, v0.t
	vwmaccus.vx v4, a1, v8
	vwmaccus.vx v4, a1, v8, v0.t

	vqmaccu.vv v4, v12, v8
	vqmaccu.vx v4, a1, v8
	vqmaccu.vv v4, v12, v8, v0.t
	vqmaccu.vx v4, a1, v8, v0.t
	vqmacc.vv v4, v12, v8
	vqmacc.vx v4, a1, v8
	vqmacc.vv v4, v12, v8, v0.t
	vqmacc.vx v4, a1, v8, v0.t
	vqmaccsu.vv v4, v12, v8
	vqmaccsu.vx v4, a1, v8
	vqmaccsu.vv v4, v12, v8, v0.t
	vqmaccsu.vx v4, a1, v8, v0.t
	vqmaccus.vx v4, a1, v8
	vqmaccus.vx v4, a1, v8, v0.t

	vdivu.vv v4, v8, v12
	vdivu.vx v4, v8, a1
	vdivu.vv v4, v8, v12, v0.t
	vdivu.vx v4, v8, a1, v0.t
	vdiv.vv v4, v8, v12
	vdiv.vx v4, v8, a1
	vdiv.vv v4, v8, v12, v0.t
	vdiv.vx v4, v8, a1, v0.t
	vremu.vv v4, v8, v12
	vremu.vx v4, v8, a1
	vremu.vv v4, v8, v12, v0.t
	vremu.vx v4, v8, a1, v0.t
	vrem.vv v4, v8, v12
	vrem.vx v4, v8, a1
	vrem.vv v4, v8, v12, v0.t
	vrem.vx v4, v8, a1, v0.t

	vmerge.vvm v4, v8, v12, v0
	vmerge.vxm v4, v8, a1, v0
	vmerge.vim v4, v8, 15, v0
	vmerge.vim v4, v8, -16, v0

	vmv.v.v v8, v12
	vmv.v.x v8, a1
	vmv.v.i v8, 15
	vmv.v.i v8, -16

	vsaddu.vv v4, v8, v12
	vsaddu.vx v4, v8, a1
	vsaddu.vi v4, v8, 15
	vsaddu.vi v4, v8, -16
	vsaddu.vv v4, v8, v12, v0.t
	vsaddu.vx v4, v8, a1, v0.t
	vsaddu.vi v4, v8, 15, v0.t
	vsaddu.vi v4, v8, -16, v0.t
	vsadd.vv v4, v8, v12
	vsadd.vx v4, v8, a1
	vsadd.vi v4, v8, 15
	vsadd.vi v4, v8, -16
	vsadd.vv v4, v8, v12, v0.t
	vsadd.vx v4, v8, a1, v0.t
	vsadd.vi v4, v8, 15, v0.t
	vsadd.vi v4, v8, -16, v0.t
	vssubu.vv v4, v8, v12
	vssubu.vx v4, v8, a1
	vssubu.vv v4, v8, v12, v0.t
	vssubu.vx v4, v8, a1, v0.t
	vssub.vv v4, v8, v12
	vssub.vx v4, v8, a1
	vssub.vv v4, v8, v12, v0.t
	vssub.vx v4, v8, a1, v0.t

	vaaddu.vv v4, v8, v12
	vaaddu.vx v4, v8, a1
	vaaddu.vv v4, v8, v12, v0.t
	vaaddu.vx v4, v8, a1, v0.t
	vaadd.vv v4, v8, v12
	vaadd.vx v4, v8, a1
	vaadd.vv v4, v8, v12, v0.t
	vaadd.vx v4, v8, a1, v0.t
	vasubu.vv v4, v8, v12
	vasubu.vx v4, v8, a1
	vasubu.vv v4, v8, v12, v0.t
	vasubu.vx v4, v8, a1, v0.t
	vasub.vv v4, v8, v12
	vasub.vx v4, v8, a1
	vasub.vv v4, v8, v12, v0.t
	vasub.vx v4, v8, a1, v0.t

	vsmul.vv v4, v8, v12
	vsmul.vx v4, v8, a1
	vsmul.vv v4, v8, v12, v0.t
	vsmul.vx v4, v8, a1, v0.t

	vssrl.vv v4, v8, v12
	vssrl.vx v4, v8, a1
	vssrl.vi v4, v8, 1
	vssrl.vi v4, v8, 31
	vssrl.vv v4, v8, v12, v0.t
	vssrl.vx v4, v8, a1, v0.t
	vssrl.vi v4, v8, 1, v0.t
	vssrl.vi v4, v8, 31, v0.t
	vssra.vv v4, v8, v12
	vssra.vx v4, v8, a1
	vssra.vi v4, v8, 1
	vssra.vi v4, v8, 31
	vssra.vv v4, v8, v12, v0.t
	vssra.vx v4, v8, a1, v0.t
	vssra.vi v4, v8, 1, v0.t
	vssra.vi v4, v8, 31, v0.t

	vnclipu.wv v4, v8, v12
	vnclipu.wx v4, v8, a1
	vnclipu.wi v4, v8, 1
	vnclipu.wi v4, v8, 31
	vnclipu.wv v4, v8, v12, v0.t
	vnclipu.wx v4, v8, a1, v0.t
	vnclipu.wi v4, v8, 1, v0.t
	vnclipu.wi v4, v8, 31, v0.t
	vnclip.wv v4, v8, v12
	vnclip.wx v4, v8, a1
	vnclip.wi v4, v8, 1
	vnclip.wi v4, v8, 31
	vnclip.wv v4, v8, v12, v0.t
	vnclip.wx v4, v8, a1, v0.t
	vnclip.wi v4, v8, 1, v0.t
	vnclip.wi v4, v8, 31, v0.t

	vfadd.vv v4, v8, v12
	vfadd.vf v4, v8, fa2
	vfadd.vv v4, v8, v12, v0.t
	vfadd.vf v4, v8, fa2, v0.t
	vfsub.vv v4, v8, v12
	vfsub.vf v4, v8, fa2
	vfsub.vv v4, v8, v12, v0.t
	vfsub.vf v4, v8, fa2, v0.t
	vfrsub.vf v4, v8, fa2
	vfrsub.vf v4, v8, fa2, v0.t

	vfwadd.vv v4, v8, v12
	vfwadd.vf v4, v8, fa2
	vfwadd.vv v4, v8, v12, v0.t
	vfwadd.vf v4, v8, fa2, v0.t
	vfwsub.vv v4, v8, v12
	vfwsub.vf v4, v8, fa2
	vfwsub.vv v4, v8, v12, v0.t
	vfwsub.vf v4, v8, fa2, v0.t
	vfwadd.wv v4, v8, v12
	vfwadd.wf v4, v8, fa2
	vfwadd.wv v4, v8, v12, v0.t
	vfwadd.wf v4, v8, fa2, v0.t
	vfwsub.wv v4, v8, v12
	vfwsub.wf v4, v8, fa2
	vfwsub.wv v4, v8, v12, v0.t
	vfwsub.wf v4, v8, fa2, v0.t

	vfmul.vv v4, v8, v12
	vfmul.vf v4, v8, fa2
	vfmul.vv v4, v8, v12, v0.t
	vfmul.vf v4, v8, fa2, v0.t
	vfdiv.vv v4, v8, v12
	vfdiv.vf v4, v8, fa2
	vfdiv.vv v4, v8, v12, v0.t
	vfdiv.vf v4, v8, fa2, v0.t
	vfrdiv.vf v4, v8, fa2
	vfrdiv.vf v4, v8, fa2, v0.t

	vfwmul.vv v4, v8, v12
	vfwmul.vf v4, v8, fa2
	vfwmul.vv v4, v8, v12, v0.t
	vfwmul.vf v4, v8, fa2, v0.t

	vfmadd.vv v4, v12, v8
	vfmadd.vf v4, fa2, v8
	vfnmadd.vv v4, v12, v8
	vfnmadd.vf v4, fa2, v8
	vfmsub.vv v4, v12, v8
	vfmsub.vf v4, fa2, v8
	vfnmsub.vv v4, v12, v8
	vfnmsub.vf v4, fa2, v8
	vfmadd.vv v4, v12, v8, v0.t
	vfmadd.vf v4, fa2, v8, v0.t
	vfnmadd.vv v4, v12, v8, v0.t
	vfnmadd.vf v4, fa2, v8, v0.t
	vfmsub.vv v4, v12, v8, v0.t
	vfmsub.vf v4, fa2, v8, v0.t
	vfnmsub.vv v4, v12, v8, v0.t
	vfnmsub.vf v4, fa2, v8, v0.t
	vfmacc.vv v4, v12, v8
	vfmacc.vf v4, fa2, v8
	vfnmacc.vv v4, v12, v8
	vfnmacc.vf v4, fa2, v8
	vfmsac.vv v4, v12, v8
	vfmsac.vf v4, fa2, v8
	vfnmsac.vv v4, v12, v8
	vfnmsac.vf v4, fa2, v8
	vfmacc.vv v4, v12, v8, v0.t
	vfmacc.vf v4, fa2, v8, v0.t
	vfnmacc.vv v4, v12, v8, v0.t
	vfnmacc.vf v4, fa2, v8, v0.t
	vfmsac.vv v4, v12, v8, v0.t
	vfmsac.vf v4, fa2, v8, v0.t
	vfnmsac.vv v4, v12, v8, v0.t
	vfnmsac.vf v4, fa2, v8, v0.t

	vfwmacc.vv v4, v12, v8
	vfwmacc.vf v4, fa2, v8
	vfwnmacc.vv v4, v12, v8
	vfwnmacc.vf v4, fa2, v8
	vfwmsac.vv v4, v12, v8
	vfwmsac.vf v4, fa2, v8
	vfwnmsac.vv v4, v12, v8
	vfwnmsac.vf v4, fa2, v8
	vfwmacc.vv v4, v12, v8, v0.t
	vfwmacc.vf v4, fa2, v8, v0.t
	vfwnmacc.vv v4, v12, v8, v0.t
	vfwnmacc.vf v4, fa2, v8, v0.t
	vfwmsac.vv v4, v12, v8, v0.t
	vfwmsac.vf v4, fa2, v8, v0.t
	vfwnmsac.vv v4, v12, v8, v0.t
	vfwnmsac.vf v4, fa2, v8, v0.t

	vfsqrt.v v4, v8
	vfsqrt.v v4, v8, v0.t

	vfmin.vv v4, v8, v12
	vfmin.vf v4, v8, fa2
	vfmax.vv v4, v8, v12
	vfmax.vf v4, v8, fa2
	vfmin.vv v4, v8, v12, v0.t
	vfmin.vf v4, v8, fa2, v0.t
	vfmax.vv v4, v8, v12, v0.t
	vfmax.vf v4, v8, fa2, v0.t

	vfsgnj.vv v4, v8, v12
	vfsgnj.vf v4, v8, fa2
	vfsgnjn.vv v4, v8, v12
	vfsgnjn.vf v4, v8, fa2
	vfsgnjx.vv v4, v8, v12
	vfsgnjx.vf v4, v8, fa2
	vfsgnj.vv v4, v8, v12, v0.t
	vfsgnj.vf v4, v8, fa2, v0.t
	vfsgnjn.vv v4, v8, v12, v0.t
	vfsgnjn.vf v4, v8, fa2, v0.t
	vfsgnjx.vv v4, v8, v12, v0.t
	vfsgnjx.vf v4, v8, fa2, v0.t

	# Aliases
	vmfgt.vv v4, v8, v12
	vmfge.vv v4, v8, v12
	vmfgt.vv v4, v8, v12, v0.t
	vmfge.vv v4, v8, v12, v0.t

	vmfeq.vv v4, v8, v12
	vmfeq.vf v4, v8, fa2
	vmfne.vv v4, v8, v12
	vmfne.vf v4, v8, fa2
	vmflt.vv v4, v8, v12
	vmflt.vf v4, v8, fa2
	vmfle.vv v4, v8, v12
	vmfle.vf v4, v8, fa2
	vmfgt.vf v4, v8, fa2
	vmfge.vf v4, v8, fa2
	vmfeq.vv v4, v8, v12, v0.t
	vmfeq.vf v4, v8, fa2, v0.t
	vmfne.vv v4, v8, v12, v0.t
	vmfne.vf v4, v8, fa2, v0.t
	vmflt.vv v4, v8, v12, v0.t
	vmflt.vf v4, v8, fa2, v0.t
	vmfle.vv v4, v8, v12, v0.t
	vmfle.vf v4, v8, fa2, v0.t
	vmfgt.vf v4, v8, fa2, v0.t
	vmfge.vf v4, v8, fa2, v0.t

	vfclass.v v4, v8
	vfclass.v v4, v8, v0.t

	vfmerge.vfm v4, v8, fa2, v0
	vfmv.v.f v4, fa1

	vfcvt.xu.f.v v4, v8
	vfcvt.x.f.v v4, v8
	vfcvt.rtz.xu.f.v v4, v8
	vfcvt.rtz.x.f.v v4, v8
	vfcvt.f.xu.v v4, v8
	vfcvt.f.x.v v4, v8
	vfcvt.xu.f.v v4, v8, v0.t
	vfcvt.x.f.v v4, v8, v0.t
	vfcvt.rtz.xu.f.v v4, v8, v0.t
	vfcvt.rtz.x.f.v v4, v8, v0.t
	vfcvt.f.xu.v v4, v8, v0.t
	vfcvt.f.x.v v4, v8, v0.t

	vfwcvt.xu.f.v v4, v8
	vfwcvt.x.f.v v4, v8
	vfwcvt.rtz.xu.f.v v4, v8
	vfwcvt.rtz.x.f.v v4, v8
	vfwcvt.f.xu.v v4, v8
	vfwcvt.f.x.v v4, v8
	vfwcvt.f.f.v v4, v8
	vfwcvt.xu.f.v v4, v8, v0.t
	vfwcvt.x.f.v v4, v8, v0.t
	vfwcvt.rtz.xu.f.v v4, v8, v0.t
	vfwcvt.rtz.x.f.v v4, v8, v0.t
	vfwcvt.f.xu.v v4, v8, v0.t
	vfwcvt.f.x.v v4, v8, v0.t
	vfwcvt.f.f.v v4, v8, v0.t

	vfncvt.xu.f.w v4, v8
	vfncvt.x.f.w v4, v8
	vfncvt.rtz.xu.f.w v4, v8
	vfncvt.rtz.x.f.w v4, v8
	vfncvt.f.xu.w v4, v8
	vfncvt.f.x.w v4, v8
	vfncvt.f.f.w v4, v8
	vfncvt.rod.f.f.w v4, v8
	vfncvt.xu.f.w v4, v8, v0.t
	vfncvt.x.f.w v4, v8, v0.t
	vfncvt.rtz.xu.f.w v4, v8, v0.t
	vfncvt.rtz.x.f.w v4, v8, v0.t
	vfncvt.f.xu.w v4, v8, v0.t
	vfncvt.f.x.w v4, v8, v0.t
	vfncvt.f.f.w v4, v8, v0.t
	vfncvt.rod.f.f.w v4, v8, v0.t

	vredsum.vs v4, v8, v12
	vredmaxu.vs v4, v8, v8
	vredmax.vs v4, v8, v8
	vredminu.vs v4, v8, v8
	vredmin.vs v4, v8, v8
	vredand.vs v4, v8, v12
	vredor.vs v4, v8, v12
	vredxor.vs v4, v8, v12
	vredsum.vs v4, v8, v12, v0.t
	vredmaxu.vs v4, v8, v8, v0.t
	vredmax.vs v4, v8, v8, v0.t
	vredminu.vs v4, v8, v8, v0.t
	vredmin.vs v4, v8, v8, v0.t
	vredand.vs v4, v8, v12, v0.t
	vredor.vs v4, v8, v12, v0.t
	vredxor.vs v4, v8, v12, v0.t

	vwredsumu.vs v4, v8, v12
	vwredsum.vs v4, v8, v12
	vwredsumu.vs v4, v8, v12, v0.t
	vwredsum.vs v4, v8, v12, v0.t

	vfredosum.vs v4, v8, v12
	vfredsum.vs v4, v8, v12
	vfredmax.vs v4, v8, v12
	vfredmin.vs v4, v8, v12
	vfredosum.vs v4, v8, v12, v0.t
	vfredsum.vs v4, v8, v12, v0.t
	vfredmax.vs v4, v8, v12, v0.t
	vfredmin.vs v4, v8, v12, v0.t

	vfwredosum.vs v4, v8, v12
	vfwredsum.vs v4, v8, v12
	vfwredosum.vs v4, v8, v12, v0.t
	vfwredsum.vs v4, v8, v12, v0.t

	# Aliases
	vmcpy.m v4, v8
	vmmv.m v4, v8
	vmclr.m v4
	vmset.m v4
	vmnot.m v4, v8

	vmand.mm v4, v8, v12
	vmnand.mm v4, v8, v12
	vmandnot.mm v4, v8, v12
	vmxor.mm v4, v8, v12
	vmor.mm v4, v8, v12
	vmnor.mm v4, v8, v12
	vmornot.mm v4, v8, v12
	vmxnor.mm v4, v8, v12

	vpopc.m a0, v12
	vfirst.m a0, v12
	vmsbf.m v4, v8
	vmsif.m v4, v8
	vmsof.m v4, v8
	viota.m v4, v8
	vid.v v4
	vpopc.m a0, v12, v0.t
	vfirst.m a0, v12, v0.t
	vmsbf.m v4, v8, v0.t
	vmsif.m v4, v8, v0.t
	vmsof.m v4, v8, v0.t
	viota.m v4, v8, v0.t
	vid.v v4, v0.t

	vmv.x.s a0, v12
	vmv.s.x v4, a0

	vfmv.f.s fa0, v8
	vfmv.s.f v4, fa1

	vslideup.vx v4, v8, a1
	vslideup.vi v4, v8, 0
	vslideup.vi v4, v8, 31
	vslidedown.vx v4, v8, a1
	vslidedown.vi v4, v8, 0
	vslidedown.vi v4, v8, 31
	vslideup.vx v4, v8, a1, v0.t
	vslideup.vi v4, v8, 0, v0.t
	vslideup.vi v4, v8, 31, v0.t
	vslidedown.vx v4, v8, a1, v0.t
	vslidedown.vi v4, v8, 0, v0.t
	vslidedown.vi v4, v8, 31, v0.t

	vslide1up.vx v4, v8, a1
	vslide1down.vx v4, v8, a1
	vslide1up.vx v4, v8, a1, v0.t
	vslide1down.vx v4, v8, a1, v0.t

	vfslide1up.vf v4, v8, fa1
	vfslide1down.vf v4, v8, fa1
	vfslide1up.vf v4, v8, fa1, v0.t
	vfslide1down.vf v4, v8, fa1, v0.t

	vrgather.vv v4, v8, v12
	vrgather.vx v4, v8, a1
	vrgather.vi v4, v8, 0
	vrgather.vi v4, v8, 31
	vrgather.vv v4, v8, v12, v0.t
	vrgather.vx v4, v8, a1, v0.t
	vrgather.vi v4, v8, 0, v0.t
	vrgather.vi v4, v8, 31, v0.t

	vcompress.vm v4, v8, v12

	vmv1r.v v1, v2
	vmv2r.v v2, v4
	vmv4r.v v4, v8
	vmv8r.v v0, v8

	vdot.vv v4, v8, v12
	vdotu.vv v4, v8, v12
	vfdot.vv v4, v8, v12
	vdot.vv v4, v8, v12, v0.t
	vdotu.vv v4, v8, v12, v0.t
	vfdot.vv v4, v8, v12, v0.t
