	vsetvl a0, a1, a2
	vsetvli a0, a1, 0
	vsetvli a0, a1, 0x7ff
	vsetvli a0, a1, e16,m2,d4
	vsetvli a0, a1, e256, m8, d8
	vsetvli a0, a1, e512, m8, d8
	vsetvli a0, a1, e1024, m8, d8

	vlb.v v4, (a0)
	vlb.v v4, 0(a0)
	vlb.v v4, (a0), v0.t
	vlh.v v4, (a0)
	vlh.v v4, 0(a0)
	vlh.v v4, (a0), v0.t
	vlw.v v4, (a0)
	vlw.v v4, 0(a0)
	vlw.v v4, (a0), v0.t
	vlbu.v v4, (a0)
	vlbu.v v4, 0(a0)
	vlbu.v v4, (a0), v0.t
	vlhu.v v4, (a0)
	vlhu.v v4, 0(a0)
	vlhu.v v4, (a0), v0.t
	vlwu.v v4, (a0)
	vlwu.v v4, 0(a0)
	vlwu.v v4, (a0), v0.t
	vle.v v4, (a0)
	vle.v v4, 0(a0)
	vle.v v4, (a0), v0.t
	vsb.v v4, (a0)
	vsb.v v4, 0(a0)
	vsb.v v4, (a0), v0.t
	vsh.v v4, (a0)
	vsh.v v4, 0(a0)
	vsh.v v4, (a0), v0.t
	vsw.v v4, (a0)
	vsw.v v4, 0(a0)
	vsw.v v4, (a0), v0.t
	vse.v v4, (a0)
	vse.v v4, 0(a0)
	vse.v v4, (a0), v0.t

	vlsb.v v4, (a0), a1
	vlsb.v v4, 0(a0), a1
	vlsb.v v4, (a0), a1, v0.t
	vlsh.v v4, (a0), a1
	vlsh.v v4, 0(a0), a1
	vlsh.v v4, (a0), a1, v0.t
	vlsw.v v4, (a0), a1
	vlsw.v v4, 0(a0), a1
	vlsw.v v4, (a0), a1, v0.t
	vlsbu.v v4, (a0), a1
	vlsbu.v v4, 0(a0), a1
	vlsbu.v v4, (a0), a1, v0.t
	vlshu.v v4, (a0), a1
	vlshu.v v4, 0(a0), a1
	vlshu.v v4, (a0), a1, v0.t
	vlswu.v v4, (a0), a1
	vlswu.v v4, 0(a0), a1
	vlswu.v v4, (a0), a1, v0.t
	vlse.v v4, (a0), a1
	vlse.v v4, 0(a0), a1
	vlse.v v4, (a0), a1, v0.t
	vssb.v v4, (a0), a1
	vssb.v v4, 0(a0), a1
	vssb.v v4, (a0), a1, v0.t
	vssh.v v4, (a0), a1
	vssh.v v4, 0(a0), a1
	vssh.v v4, (a0), a1, v0.t
	vssw.v v4, (a0), a1
	vssw.v v4, 0(a0), a1
	vssw.v v4, (a0), a1, v0.t
	vsse.v v4, (a0), a1
	vsse.v v4, 0(a0), a1
	vsse.v v4, (a0), a1, v0.t

	vlxb.v v4, (a0), v12
	vlxb.v v4, 0(a0), v12
	vlxb.v v4, (a0), v12, v0.t
	vlxh.v v4, (a0), v12
	vlxh.v v4, 0(a0), v12
	vlxh.v v4, (a0), v12, v0.t
	vlxw.v v4, (a0), v12
	vlxw.v v4, 0(a0), v12
	vlxw.v v4, (a0), v12, v0.t
	vlxbu.v v4, (a0), v12
	vlxbu.v v4, 0(a0), v12
	vlxbu.v v4, (a0), v12, v0.t
	vlxhu.v v4, (a0), v12
	vlxhu.v v4, 0(a0), v12
	vlxhu.v v4, (a0), v12, v0.t
	vlxwu.v v4, (a0), v12
	vlxwu.v v4, 0(a0), v12
	vlxwu.v v4, (a0), v12, v0.t
	vlxe.v v4, (a0), v12
	vlxe.v v4, 0(a0), v12
	vlxe.v v4, (a0), v12, v0.t
	vsxb.v v4, (a0), v12
	vsxb.v v4, 0(a0), v12
	vsxb.v v4, (a0), v12, v0.t
	vsxh.v v4, (a0), v12
	vsxh.v v4, 0(a0), v12
	vsxh.v v4, (a0), v12, v0.t
	vsxw.v v4, (a0), v12
	vsxw.v v4, 0(a0), v12
	vsxw.v v4, (a0), v12, v0.t
	vsxe.v v4, (a0), v12
	vsxe.v v4, 0(a0), v12
	vsxe.v v4, (a0), v12, v0.t
	vsuxb.v v4, (a0), v12
	vsuxb.v v4, 0(a0), v12
	vsuxb.v v4, (a0), v12, v0.t
	vsuxh.v v4, (a0), v12
	vsuxh.v v4, 0(a0), v12
	vsuxh.v v4, (a0), v12, v0.t
	vsuxw.v v4, (a0), v12
	vsuxw.v v4, 0(a0), v12
	vsuxw.v v4, (a0), v12, v0.t
	vsuxe.v v4, (a0), v12
	vsuxe.v v4, 0(a0), v12
	vsuxe.v v4, (a0), v12, v0.t

	vlbff.v v4, (a0)
	vlbff.v v4, 0(a0)
	vlbff.v v4, (a0), v0.t
	vlhff.v v4, (a0)
	vlhff.v v4, 0(a0)
	vlhff.v v4, (a0), v0.t
	vlwff.v v4, (a0)
	vlwff.v v4, 0(a0)
	vlwff.v v4, (a0), v0.t
	vlbuff.v v4, (a0)
	vlbuff.v v4, 0(a0)
	vlbuff.v v4, (a0), v0.t
	vlhuff.v v4, (a0)
	vlhuff.v v4, 0(a0)
	vlhuff.v v4, (a0), v0.t
	vlwuff.v v4, (a0)
	vlwuff.v v4, 0(a0)
	vlwuff.v v4, (a0), v0.t
	vleff.v v4, (a0)
	vleff.v v4, 0(a0)
	vleff.v v4, (a0), v0.t

	vlseg2b.v v4, (a0)
	vlseg2b.v v4, 0(a0)
	vlseg2b.v v4, (a0), v0.t
	vlseg2h.v v4, (a0)
	vlseg2h.v v4, 0(a0)
	vlseg2h.v v4, (a0), v0.t
	vlseg2w.v v4, (a0)
	vlseg2w.v v4, 0(a0)
	vlseg2w.v v4, (a0), v0.t
	vlseg2bu.v v4, (a0)
	vlseg2bu.v v4, 0(a0)
	vlseg2bu.v v4, (a0), v0.t
	vlseg2hu.v v4, (a0)
	vlseg2hu.v v4, 0(a0)
	vlseg2hu.v v4, (a0), v0.t
	vlseg2wu.v v4, (a0)
	vlseg2wu.v v4, 0(a0)
	vlseg2wu.v v4, (a0), v0.t
	vlseg2e.v v4, (a0)
	vlseg2e.v v4, 0(a0)
	vlseg2e.v v4, (a0), v0.t
	vsseg2b.v v4, (a0)
	vsseg2b.v v4, 0(a0)
	vsseg2b.v v4, (a0), v0.t
	vsseg2h.v v4, (a0)
	vsseg2h.v v4, 0(a0)
	vsseg2h.v v4, (a0), v0.t
	vsseg2w.v v4, (a0)
	vsseg2w.v v4, 0(a0)
	vsseg2w.v v4, (a0), v0.t
	vsseg2e.v v4, (a0)
	vsseg2e.v v4, 0(a0)
	vsseg2e.v v4, (a0), v0.t

	vlseg3b.v v4, (a0)
	vlseg3b.v v4, 0(a0)
	vlseg3b.v v4, (a0), v0.t
	vlseg3h.v v4, (a0)
	vlseg3h.v v4, 0(a0)
	vlseg3h.v v4, (a0), v0.t
	vlseg3w.v v4, (a0)
	vlseg3w.v v4, 0(a0)
	vlseg3w.v v4, (a0), v0.t
	vlseg3bu.v v4, (a0)
	vlseg3bu.v v4, 0(a0)
	vlseg3bu.v v4, (a0), v0.t
	vlseg3hu.v v4, (a0)
	vlseg3hu.v v4, 0(a0)
	vlseg3hu.v v4, (a0), v0.t
	vlseg3wu.v v4, (a0)
	vlseg3wu.v v4, 0(a0)
	vlseg3wu.v v4, (a0), v0.t
	vlseg3e.v v4, (a0)
	vlseg3e.v v4, 0(a0)
	vlseg3e.v v4, (a0), v0.t
	vsseg3b.v v4, (a0)
	vsseg3b.v v4, 0(a0)
	vsseg3b.v v4, (a0), v0.t
	vsseg3h.v v4, (a0)
	vsseg3h.v v4, 0(a0)
	vsseg3h.v v4, (a0), v0.t
	vsseg3w.v v4, (a0)
	vsseg3w.v v4, 0(a0)
	vsseg3w.v v4, (a0), v0.t
	vsseg3e.v v4, (a0)
	vsseg3e.v v4, 0(a0)
	vsseg3e.v v4, (a0), v0.t

	vlseg4b.v v4, (a0)
	vlseg4b.v v4, 0(a0)
	vlseg4b.v v4, (a0), v0.t
	vlseg4h.v v4, (a0)
	vlseg4h.v v4, 0(a0)
	vlseg4h.v v4, (a0), v0.t
	vlseg4w.v v4, (a0)
	vlseg4w.v v4, 0(a0)
	vlseg4w.v v4, (a0), v0.t
	vlseg4bu.v v4, (a0)
	vlseg4bu.v v4, 0(a0)
	vlseg4bu.v v4, (a0), v0.t
	vlseg4hu.v v4, (a0)
	vlseg4hu.v v4, 0(a0)
	vlseg4hu.v v4, (a0), v0.t
	vlseg4wu.v v4, (a0)
	vlseg4wu.v v4, 0(a0)
	vlseg4wu.v v4, (a0), v0.t
	vlseg4e.v v4, (a0)
	vlseg4e.v v4, 0(a0)
	vlseg4e.v v4, (a0), v0.t
	vsseg4b.v v4, (a0)
	vsseg4b.v v4, 0(a0)
	vsseg4b.v v4, (a0), v0.t
	vsseg4h.v v4, (a0)
	vsseg4h.v v4, 0(a0)
	vsseg4h.v v4, (a0), v0.t
	vsseg4w.v v4, (a0)
	vsseg4w.v v4, 0(a0)
	vsseg4w.v v4, (a0), v0.t
	vsseg4e.v v4, (a0)
	vsseg4e.v v4, 0(a0)
	vsseg4e.v v4, (a0), v0.t

	vlseg5b.v v4, (a0)
	vlseg5b.v v4, 0(a0)
	vlseg5b.v v4, (a0), v0.t
	vlseg5h.v v4, (a0)
	vlseg5h.v v4, 0(a0)
	vlseg5h.v v4, (a0), v0.t
	vlseg5w.v v4, (a0)
	vlseg5w.v v4, 0(a0)
	vlseg5w.v v4, (a0), v0.t
	vlseg5bu.v v4, (a0)
	vlseg5bu.v v4, 0(a0)
	vlseg5bu.v v4, (a0), v0.t
	vlseg5hu.v v4, (a0)
	vlseg5hu.v v4, 0(a0)
	vlseg5hu.v v4, (a0), v0.t
	vlseg5wu.v v4, (a0)
	vlseg5wu.v v4, 0(a0)
	vlseg5wu.v v4, (a0), v0.t
	vlseg5e.v v4, (a0)
	vlseg5e.v v4, 0(a0)
	vlseg5e.v v4, (a0), v0.t
	vsseg5b.v v4, (a0)
	vsseg5b.v v4, 0(a0)
	vsseg5b.v v4, (a0), v0.t
	vsseg5h.v v4, (a0)
	vsseg5h.v v4, 0(a0)
	vsseg5h.v v4, (a0), v0.t
	vsseg5w.v v4, (a0)
	vsseg5w.v v4, 0(a0)
	vsseg5w.v v4, (a0), v0.t
	vsseg5e.v v4, (a0)
	vsseg5e.v v4, 0(a0)
	vsseg5e.v v4, (a0), v0.t

	vlseg6b.v v4, (a0)
	vlseg6b.v v4, 0(a0)
	vlseg6b.v v4, (a0), v0.t
	vlseg6h.v v4, (a0)
	vlseg6h.v v4, 0(a0)
	vlseg6h.v v4, (a0), v0.t
	vlseg6w.v v4, (a0)
	vlseg6w.v v4, 0(a0)
	vlseg6w.v v4, (a0), v0.t
	vlseg6bu.v v4, (a0)
	vlseg6bu.v v4, 0(a0)
	vlseg6bu.v v4, (a0), v0.t
	vlseg6hu.v v4, (a0)
	vlseg6hu.v v4, 0(a0)
	vlseg6hu.v v4, (a0), v0.t
	vlseg6wu.v v4, (a0)
	vlseg6wu.v v4, 0(a0)
	vlseg6wu.v v4, (a0), v0.t
	vlseg6e.v v4, (a0)
	vlseg6e.v v4, 0(a0)
	vlseg6e.v v4, (a0), v0.t
	vsseg6b.v v4, (a0)
	vsseg6b.v v4, 0(a0)
	vsseg6b.v v4, (a0), v0.t
	vsseg6h.v v4, (a0)
	vsseg6h.v v4, 0(a0)
	vsseg6h.v v4, (a0), v0.t
	vsseg6w.v v4, (a0)
	vsseg6w.v v4, 0(a0)
	vsseg6w.v v4, (a0), v0.t
	vsseg6e.v v4, (a0)
	vsseg6e.v v4, 0(a0)
	vsseg6e.v v4, (a0), v0.t

	vlseg7b.v v4, (a0)
	vlseg7b.v v4, 0(a0)
	vlseg7b.v v4, (a0), v0.t
	vlseg7h.v v4, (a0)
	vlseg7h.v v4, 0(a0)
	vlseg7h.v v4, (a0), v0.t
	vlseg7w.v v4, (a0)
	vlseg7w.v v4, 0(a0)
	vlseg7w.v v4, (a0), v0.t
	vlseg7bu.v v4, (a0)
	vlseg7bu.v v4, 0(a0)
	vlseg7bu.v v4, (a0), v0.t
	vlseg7hu.v v4, (a0)
	vlseg7hu.v v4, 0(a0)
	vlseg7hu.v v4, (a0), v0.t
	vlseg7wu.v v4, (a0)
	vlseg7wu.v v4, 0(a0)
	vlseg7wu.v v4, (a0), v0.t
	vlseg7e.v v4, (a0)
	vlseg7e.v v4, 0(a0)
	vlseg7e.v v4, (a0), v0.t
	vsseg7b.v v4, (a0)
	vsseg7b.v v4, 0(a0)
	vsseg7b.v v4, (a0), v0.t
	vsseg7h.v v4, (a0)
	vsseg7h.v v4, 0(a0)
	vsseg7h.v v4, (a0), v0.t
	vsseg7w.v v4, (a0)
	vsseg7w.v v4, 0(a0)
	vsseg7w.v v4, (a0), v0.t
	vsseg7e.v v4, (a0)
	vsseg7e.v v4, 0(a0)
	vsseg7e.v v4, (a0), v0.t

	vlseg8b.v v4, (a0)
	vlseg8b.v v4, 0(a0)
	vlseg8b.v v4, (a0), v0.t
	vlseg8h.v v4, (a0)
	vlseg8h.v v4, 0(a0)
	vlseg8h.v v4, (a0), v0.t
	vlseg8w.v v4, (a0)
	vlseg8w.v v4, 0(a0)
	vlseg8w.v v4, (a0), v0.t
	vlseg8bu.v v4, (a0)
	vlseg8bu.v v4, 0(a0)
	vlseg8bu.v v4, (a0), v0.t
	vlseg8hu.v v4, (a0)
	vlseg8hu.v v4, 0(a0)
	vlseg8hu.v v4, (a0), v0.t
	vlseg8wu.v v4, (a0)
	vlseg8wu.v v4, 0(a0)
	vlseg8wu.v v4, (a0), v0.t
	vlseg8e.v v4, (a0)
	vlseg8e.v v4, 0(a0)
	vlseg8e.v v4, (a0), v0.t
	vsseg8b.v v4, (a0)
	vsseg8b.v v4, 0(a0)
	vsseg8b.v v4, (a0), v0.t
	vsseg8h.v v4, (a0)
	vsseg8h.v v4, 0(a0)
	vsseg8h.v v4, (a0), v0.t
	vsseg8w.v v4, (a0)
	vsseg8w.v v4, 0(a0)
	vsseg8w.v v4, (a0), v0.t
	vsseg8e.v v4, (a0)
	vsseg8e.v v4, 0(a0)
	vsseg8e.v v4, (a0), v0.t

	vlsseg2b.v v4, (a0), a1
	vlsseg2b.v v4, 0(a0), a1
	vlsseg2b.v v4, (a0), a1, v0.t
	vlsseg2h.v v4, (a0), a1
	vlsseg2h.v v4, 0(a0), a1
	vlsseg2h.v v4, (a0), a1, v0.t
	vlsseg2w.v v4, (a0), a1
	vlsseg2w.v v4, 0(a0), a1
	vlsseg2w.v v4, (a0), a1, v0.t
	vlsseg2bu.v v4, (a0), a1
	vlsseg2bu.v v4, 0(a0), a1
	vlsseg2bu.v v4, (a0), a1, v0.t
	vlsseg2hu.v v4, (a0), a1
	vlsseg2hu.v v4, 0(a0), a1
	vlsseg2hu.v v4, (a0), a1, v0.t
	vlsseg2wu.v v4, (a0), a1
	vlsseg2wu.v v4, 0(a0), a1
	vlsseg2wu.v v4, (a0), a1, v0.t
	vlsseg2e.v v4, (a0), a1
	vlsseg2e.v v4, 0(a0), a1
	vlsseg2e.v v4, (a0), a1, v0.t
	vssseg2b.v v4, (a0), a1
	vssseg2b.v v4, 0(a0), a1
	vssseg2b.v v4, (a0), a1, v0.t
	vssseg2h.v v4, (a0), a1
	vssseg2h.v v4, 0(a0), a1
	vssseg2h.v v4, (a0), a1, v0.t
	vssseg2w.v v4, (a0), a1
	vssseg2w.v v4, 0(a0), a1
	vssseg2w.v v4, (a0), a1, v0.t
	vssseg2e.v v4, (a0), a1
	vssseg2e.v v4, 0(a0), a1
	vssseg2e.v v4, (a0), a1, v0.t

	vlsseg3b.v v4, (a0), a1
	vlsseg3b.v v4, 0(a0), a1
	vlsseg3b.v v4, (a0), a1, v0.t
	vlsseg3h.v v4, (a0), a1
	vlsseg3h.v v4, 0(a0), a1
	vlsseg3h.v v4, (a0), a1, v0.t
	vlsseg3w.v v4, (a0), a1
	vlsseg3w.v v4, 0(a0), a1
	vlsseg3w.v v4, (a0), a1, v0.t
	vlsseg3bu.v v4, (a0), a1
	vlsseg3bu.v v4, 0(a0), a1
	vlsseg3bu.v v4, (a0), a1, v0.t
	vlsseg3hu.v v4, (a0), a1
	vlsseg3hu.v v4, 0(a0), a1
	vlsseg3hu.v v4, (a0), a1, v0.t
	vlsseg3wu.v v4, (a0), a1
	vlsseg3wu.v v4, 0(a0), a1
	vlsseg3wu.v v4, (a0), a1, v0.t
	vlsseg3e.v v4, (a0), a1
	vlsseg3e.v v4, 0(a0), a1
	vlsseg3e.v v4, (a0), a1, v0.t
	vssseg3b.v v4, (a0), a1
	vssseg3b.v v4, 0(a0), a1
	vssseg3b.v v4, (a0), a1, v0.t
	vssseg3h.v v4, (a0), a1
	vssseg3h.v v4, 0(a0), a1
	vssseg3h.v v4, (a0), a1, v0.t
	vssseg3w.v v4, (a0), a1
	vssseg3w.v v4, 0(a0), a1
	vssseg3w.v v4, (a0), a1, v0.t
	vssseg3e.v v4, (a0), a1
	vssseg3e.v v4, 0(a0), a1
	vssseg3e.v v4, (a0), a1, v0.t

	vlsseg4b.v v4, (a0), a1
	vlsseg4b.v v4, 0(a0), a1
	vlsseg4b.v v4, (a0), a1, v0.t
	vlsseg4h.v v4, (a0), a1
	vlsseg4h.v v4, 0(a0), a1
	vlsseg4h.v v4, (a0), a1, v0.t
	vlsseg4w.v v4, (a0), a1
	vlsseg4w.v v4, 0(a0), a1
	vlsseg4w.v v4, (a0), a1, v0.t
	vlsseg4bu.v v4, (a0), a1
	vlsseg4bu.v v4, 0(a0), a1
	vlsseg4bu.v v4, (a0), a1, v0.t
	vlsseg4hu.v v4, (a0), a1
	vlsseg4hu.v v4, 0(a0), a1
	vlsseg4hu.v v4, (a0), a1, v0.t
	vlsseg4wu.v v4, (a0), a1
	vlsseg4wu.v v4, 0(a0), a1
	vlsseg4wu.v v4, (a0), a1, v0.t
	vlsseg4e.v v4, (a0), a1
	vlsseg4e.v v4, 0(a0), a1
	vlsseg4e.v v4, (a0), a1, v0.t
	vssseg4b.v v4, (a0), a1
	vssseg4b.v v4, 0(a0), a1
	vssseg4b.v v4, (a0), a1, v0.t
	vssseg4h.v v4, (a0), a1
	vssseg4h.v v4, 0(a0), a1
	vssseg4h.v v4, (a0), a1, v0.t
	vssseg4w.v v4, (a0), a1
	vssseg4w.v v4, 0(a0), a1
	vssseg4w.v v4, (a0), a1, v0.t
	vssseg4e.v v4, (a0), a1
	vssseg4e.v v4, 0(a0), a1
	vssseg4e.v v4, (a0), a1, v0.t

	vlsseg5b.v v4, (a0), a1
	vlsseg5b.v v4, 0(a0), a1
	vlsseg5b.v v4, (a0), a1, v0.t
	vlsseg5h.v v4, (a0), a1
	vlsseg5h.v v4, 0(a0), a1
	vlsseg5h.v v4, (a0), a1, v0.t
	vlsseg5w.v v4, (a0), a1
	vlsseg5w.v v4, 0(a0), a1
	vlsseg5w.v v4, (a0), a1, v0.t
	vlsseg5bu.v v4, (a0), a1
	vlsseg5bu.v v4, 0(a0), a1
	vlsseg5bu.v v4, (a0), a1, v0.t
	vlsseg5hu.v v4, (a0), a1
	vlsseg5hu.v v4, 0(a0), a1
	vlsseg5hu.v v4, (a0), a1, v0.t
	vlsseg5wu.v v4, (a0), a1
	vlsseg5wu.v v4, 0(a0), a1
	vlsseg5wu.v v4, (a0), a1, v0.t
	vlsseg5e.v v4, (a0), a1
	vlsseg5e.v v4, 0(a0), a1
	vlsseg5e.v v4, (a0), a1, v0.t
	vssseg5b.v v4, (a0), a1
	vssseg5b.v v4, 0(a0), a1
	vssseg5b.v v4, (a0), a1, v0.t
	vssseg5h.v v4, (a0), a1
	vssseg5h.v v4, 0(a0), a1
	vssseg5h.v v4, (a0), a1, v0.t
	vssseg5w.v v4, (a0), a1
	vssseg5w.v v4, 0(a0), a1
	vssseg5w.v v4, (a0), a1, v0.t
	vssseg5e.v v4, (a0), a1
	vssseg5e.v v4, 0(a0), a1
	vssseg5e.v v4, (a0), a1, v0.t

	vlsseg6b.v v4, (a0), a1
	vlsseg6b.v v4, 0(a0), a1
	vlsseg6b.v v4, (a0), a1, v0.t
	vlsseg6h.v v4, (a0), a1
	vlsseg6h.v v4, 0(a0), a1
	vlsseg6h.v v4, (a0), a1, v0.t
	vlsseg6w.v v4, (a0), a1
	vlsseg6w.v v4, 0(a0), a1
	vlsseg6w.v v4, (a0), a1, v0.t
	vlsseg6bu.v v4, (a0), a1
	vlsseg6bu.v v4, 0(a0), a1
	vlsseg6bu.v v4, (a0), a1, v0.t
	vlsseg6hu.v v4, (a0), a1
	vlsseg6hu.v v4, 0(a0), a1
	vlsseg6hu.v v4, (a0), a1, v0.t
	vlsseg6wu.v v4, (a0), a1
	vlsseg6wu.v v4, 0(a0), a1
	vlsseg6wu.v v4, (a0), a1, v0.t
	vlsseg6e.v v4, (a0), a1
	vlsseg6e.v v4, 0(a0), a1
	vlsseg6e.v v4, (a0), a1, v0.t
	vssseg6b.v v4, (a0), a1
	vssseg6b.v v4, 0(a0), a1
	vssseg6b.v v4, (a0), a1, v0.t
	vssseg6h.v v4, (a0), a1
	vssseg6h.v v4, 0(a0), a1
	vssseg6h.v v4, (a0), a1, v0.t
	vssseg6w.v v4, (a0), a1
	vssseg6w.v v4, 0(a0), a1
	vssseg6w.v v4, (a0), a1, v0.t
	vssseg6e.v v4, (a0), a1
	vssseg6e.v v4, 0(a0), a1
	vssseg6e.v v4, (a0), a1, v0.t

	vlsseg7b.v v4, (a0), a1
	vlsseg7b.v v4, 0(a0), a1
	vlsseg7b.v v4, (a0), a1, v0.t
	vlsseg7h.v v4, (a0), a1
	vlsseg7h.v v4, 0(a0), a1
	vlsseg7h.v v4, (a0), a1, v0.t
	vlsseg7w.v v4, (a0), a1
	vlsseg7w.v v4, 0(a0), a1
	vlsseg7w.v v4, (a0), a1, v0.t
	vlsseg7bu.v v4, (a0), a1
	vlsseg7bu.v v4, 0(a0), a1
	vlsseg7bu.v v4, (a0), a1, v0.t
	vlsseg7hu.v v4, (a0), a1
	vlsseg7hu.v v4, 0(a0), a1
	vlsseg7hu.v v4, (a0), a1, v0.t
	vlsseg7wu.v v4, (a0), a1
	vlsseg7wu.v v4, 0(a0), a1
	vlsseg7wu.v v4, (a0), a1, v0.t
	vlsseg7e.v v4, (a0), a1
	vlsseg7e.v v4, 0(a0), a1
	vlsseg7e.v v4, (a0), a1, v0.t
	vssseg7b.v v4, (a0), a1
	vssseg7b.v v4, 0(a0), a1
	vssseg7b.v v4, (a0), a1, v0.t
	vssseg7h.v v4, (a0), a1
	vssseg7h.v v4, 0(a0), a1
	vssseg7h.v v4, (a0), a1, v0.t
	vssseg7w.v v4, (a0), a1
	vssseg7w.v v4, 0(a0), a1
	vssseg7w.v v4, (a0), a1, v0.t
	vssseg7e.v v4, (a0), a1
	vssseg7e.v v4, 0(a0), a1
	vssseg7e.v v4, (a0), a1, v0.t

	vlsseg8b.v v4, (a0), a1
	vlsseg8b.v v4, 0(a0), a1
	vlsseg8b.v v4, (a0), a1, v0.t
	vlsseg8h.v v4, (a0), a1
	vlsseg8h.v v4, 0(a0), a1
	vlsseg8h.v v4, (a0), a1, v0.t
	vlsseg8w.v v4, (a0), a1
	vlsseg8w.v v4, 0(a0), a1
	vlsseg8w.v v4, (a0), a1, v0.t
	vlsseg8bu.v v4, (a0), a1
	vlsseg8bu.v v4, 0(a0), a1
	vlsseg8bu.v v4, (a0), a1, v0.t
	vlsseg8hu.v v4, (a0), a1
	vlsseg8hu.v v4, 0(a0), a1
	vlsseg8hu.v v4, (a0), a1, v0.t
	vlsseg8wu.v v4, (a0), a1
	vlsseg8wu.v v4, 0(a0), a1
	vlsseg8wu.v v4, (a0), a1, v0.t
	vlsseg8e.v v4, (a0), a1
	vlsseg8e.v v4, 0(a0), a1
	vlsseg8e.v v4, (a0), a1, v0.t
	vssseg8b.v v4, (a0), a1
	vssseg8b.v v4, 0(a0), a1
	vssseg8b.v v4, (a0), a1, v0.t
	vssseg8h.v v4, (a0), a1
	vssseg8h.v v4, 0(a0), a1
	vssseg8h.v v4, (a0), a1, v0.t
	vssseg8w.v v4, (a0), a1
	vssseg8w.v v4, 0(a0), a1
	vssseg8w.v v4, (a0), a1, v0.t
	vssseg8e.v v4, (a0), a1
	vssseg8e.v v4, 0(a0), a1
	vssseg8e.v v4, (a0), a1, v0.t

	vlxseg2b.v v4, (a0), v12
	vlxseg2b.v v4, 0(a0), v12
	vlxseg2b.v v4, (a0), v12, v0.t
	vlxseg2h.v v4, (a0), v12
	vlxseg2h.v v4, 0(a0), v12
	vlxseg2h.v v4, (a0), v12, v0.t
	vlxseg2w.v v4, (a0), v12
	vlxseg2w.v v4, 0(a0), v12
	vlxseg2w.v v4, (a0), v12, v0.t
	vlxseg2bu.v v4, (a0), v12
	vlxseg2bu.v v4, 0(a0), v12
	vlxseg2bu.v v4, (a0), v12, v0.t
	vlxseg2hu.v v4, (a0), v12
	vlxseg2hu.v v4, 0(a0), v12
	vlxseg2hu.v v4, (a0), v12, v0.t
	vlxseg2wu.v v4, (a0), v12
	vlxseg2wu.v v4, 0(a0), v12
	vlxseg2wu.v v4, (a0), v12, v0.t
	vlxseg2e.v v4, (a0), v12
	vlxseg2e.v v4, 0(a0), v12
	vlxseg2e.v v4, (a0), v12, v0.t
	vsxseg2b.v v4, (a0), v12
	vsxseg2b.v v4, 0(a0), v12
	vsxseg2b.v v4, (a0), v12, v0.t
	vsxseg2h.v v4, (a0), v12
	vsxseg2h.v v4, 0(a0), v12
	vsxseg2h.v v4, (a0), v12, v0.t
	vsxseg2w.v v4, (a0), v12
	vsxseg2w.v v4, 0(a0), v12
	vsxseg2w.v v4, (a0), v12, v0.t
	vsxseg2e.v v4, (a0), v12
	vsxseg2e.v v4, 0(a0), v12
	vsxseg2e.v v4, (a0), v12, v0.t

	vlxseg3b.v v4, (a0), v12
	vlxseg3b.v v4, 0(a0), v12
	vlxseg3b.v v4, (a0), v12, v0.t
	vlxseg3h.v v4, (a0), v12
	vlxseg3h.v v4, 0(a0), v12
	vlxseg3h.v v4, (a0), v12, v0.t
	vlxseg3w.v v4, (a0), v12
	vlxseg3w.v v4, 0(a0), v12
	vlxseg3w.v v4, (a0), v12, v0.t
	vlxseg3bu.v v4, (a0), v12
	vlxseg3bu.v v4, 0(a0), v12
	vlxseg3bu.v v4, (a0), v12, v0.t
	vlxseg3hu.v v4, (a0), v12
	vlxseg3hu.v v4, 0(a0), v12
	vlxseg3hu.v v4, (a0), v12, v0.t
	vlxseg3wu.v v4, (a0), v12
	vlxseg3wu.v v4, 0(a0), v12
	vlxseg3wu.v v4, (a0), v12, v0.t
	vlxseg3e.v v4, (a0), v12
	vlxseg3e.v v4, 0(a0), v12
	vlxseg3e.v v4, (a0), v12, v0.t
	vsxseg3b.v v4, (a0), v12
	vsxseg3b.v v4, 0(a0), v12
	vsxseg3b.v v4, (a0), v12, v0.t
	vsxseg3h.v v4, (a0), v12
	vsxseg3h.v v4, 0(a0), v12
	vsxseg3h.v v4, (a0), v12, v0.t
	vsxseg3w.v v4, (a0), v12
	vsxseg3w.v v4, 0(a0), v12
	vsxseg3w.v v4, (a0), v12, v0.t
	vsxseg3e.v v4, (a0), v12
	vsxseg3e.v v4, 0(a0), v12
	vsxseg3e.v v4, (a0), v12, v0.t

	vlxseg4b.v v4, (a0), v12
	vlxseg4b.v v4, 0(a0), v12
	vlxseg4b.v v4, (a0), v12, v0.t
	vlxseg4h.v v4, (a0), v12
	vlxseg4h.v v4, 0(a0), v12
	vlxseg4h.v v4, (a0), v12, v0.t
	vlxseg4w.v v4, (a0), v12
	vlxseg4w.v v4, 0(a0), v12
	vlxseg4w.v v4, (a0), v12, v0.t
	vlxseg4bu.v v4, (a0), v12
	vlxseg4bu.v v4, 0(a0), v12
	vlxseg4bu.v v4, (a0), v12, v0.t
	vlxseg4hu.v v4, (a0), v12
	vlxseg4hu.v v4, 0(a0), v12
	vlxseg4hu.v v4, (a0), v12, v0.t
	vlxseg4wu.v v4, (a0), v12
	vlxseg4wu.v v4, 0(a0), v12
	vlxseg4wu.v v4, (a0), v12, v0.t
	vlxseg4e.v v4, (a0), v12
	vlxseg4e.v v4, 0(a0), v12
	vlxseg4e.v v4, (a0), v12, v0.t
	vsxseg4b.v v4, (a0), v12
	vsxseg4b.v v4, 0(a0), v12
	vsxseg4b.v v4, (a0), v12, v0.t
	vsxseg4h.v v4, (a0), v12
	vsxseg4h.v v4, 0(a0), v12
	vsxseg4h.v v4, (a0), v12, v0.t
	vsxseg4w.v v4, (a0), v12
	vsxseg4w.v v4, 0(a0), v12
	vsxseg4w.v v4, (a0), v12, v0.t
	vsxseg4e.v v4, (a0), v12
	vsxseg4e.v v4, 0(a0), v12
	vsxseg4e.v v4, (a0), v12, v0.t

	vlxseg5b.v v4, (a0), v12
	vlxseg5b.v v4, 0(a0), v12
	vlxseg5b.v v4, (a0), v12, v0.t
	vlxseg5h.v v4, (a0), v12
	vlxseg5h.v v4, 0(a0), v12
	vlxseg5h.v v4, (a0), v12, v0.t
	vlxseg5w.v v4, (a0), v12
	vlxseg5w.v v4, 0(a0), v12
	vlxseg5w.v v4, (a0), v12, v0.t
	vlxseg5bu.v v4, (a0), v12
	vlxseg5bu.v v4, 0(a0), v12
	vlxseg5bu.v v4, (a0), v12, v0.t
	vlxseg5hu.v v4, (a0), v12
	vlxseg5hu.v v4, 0(a0), v12
	vlxseg5hu.v v4, (a0), v12, v0.t
	vlxseg5wu.v v4, (a0), v12
	vlxseg5wu.v v4, 0(a0), v12
	vlxseg5wu.v v4, (a0), v12, v0.t
	vlxseg5e.v v4, (a0), v12
	vlxseg5e.v v4, 0(a0), v12
	vlxseg5e.v v4, (a0), v12, v0.t
	vsxseg5b.v v4, (a0), v12
	vsxseg5b.v v4, 0(a0), v12
	vsxseg5b.v v4, (a0), v12, v0.t
	vsxseg5h.v v4, (a0), v12
	vsxseg5h.v v4, 0(a0), v12
	vsxseg5h.v v4, (a0), v12, v0.t
	vsxseg5w.v v4, (a0), v12
	vsxseg5w.v v4, 0(a0), v12
	vsxseg5w.v v4, (a0), v12, v0.t
	vsxseg5e.v v4, (a0), v12
	vsxseg5e.v v4, 0(a0), v12
	vsxseg5e.v v4, (a0), v12, v0.t

	vlxseg6b.v v4, (a0), v12
	vlxseg6b.v v4, 0(a0), v12
	vlxseg6b.v v4, (a0), v12, v0.t
	vlxseg6h.v v4, (a0), v12
	vlxseg6h.v v4, 0(a0), v12
	vlxseg6h.v v4, (a0), v12, v0.t
	vlxseg6w.v v4, (a0), v12
	vlxseg6w.v v4, 0(a0), v12
	vlxseg6w.v v4, (a0), v12, v0.t
	vlxseg6bu.v v4, (a0), v12
	vlxseg6bu.v v4, 0(a0), v12
	vlxseg6bu.v v4, (a0), v12, v0.t
	vlxseg6hu.v v4, (a0), v12
	vlxseg6hu.v v4, 0(a0), v12
	vlxseg6hu.v v4, (a0), v12, v0.t
	vlxseg6wu.v v4, (a0), v12
	vlxseg6wu.v v4, 0(a0), v12
	vlxseg6wu.v v4, (a0), v12, v0.t
	vlxseg6e.v v4, (a0), v12
	vlxseg6e.v v4, 0(a0), v12
	vlxseg6e.v v4, (a0), v12, v0.t
	vsxseg6b.v v4, (a0), v12
	vsxseg6b.v v4, 0(a0), v12
	vsxseg6b.v v4, (a0), v12, v0.t
	vsxseg6h.v v4, (a0), v12
	vsxseg6h.v v4, 0(a0), v12
	vsxseg6h.v v4, (a0), v12, v0.t
	vsxseg6w.v v4, (a0), v12
	vsxseg6w.v v4, 0(a0), v12
	vsxseg6w.v v4, (a0), v12, v0.t
	vsxseg6e.v v4, (a0), v12
	vsxseg6e.v v4, 0(a0), v12
	vsxseg6e.v v4, (a0), v12, v0.t

	vlxseg7b.v v4, (a0), v12
	vlxseg7b.v v4, 0(a0), v12
	vlxseg7b.v v4, (a0), v12, v0.t
	vlxseg7h.v v4, (a0), v12
	vlxseg7h.v v4, 0(a0), v12
	vlxseg7h.v v4, (a0), v12, v0.t
	vlxseg7w.v v4, (a0), v12
	vlxseg7w.v v4, 0(a0), v12
	vlxseg7w.v v4, (a0), v12, v0.t
	vlxseg7bu.v v4, (a0), v12
	vlxseg7bu.v v4, 0(a0), v12
	vlxseg7bu.v v4, (a0), v12, v0.t
	vlxseg7hu.v v4, (a0), v12
	vlxseg7hu.v v4, 0(a0), v12
	vlxseg7hu.v v4, (a0), v12, v0.t
	vlxseg7wu.v v4, (a0), v12
	vlxseg7wu.v v4, 0(a0), v12
	vlxseg7wu.v v4, (a0), v12, v0.t
	vlxseg7e.v v4, (a0), v12
	vlxseg7e.v v4, 0(a0), v12
	vlxseg7e.v v4, (a0), v12, v0.t
	vsxseg7b.v v4, (a0), v12
	vsxseg7b.v v4, 0(a0), v12
	vsxseg7b.v v4, (a0), v12, v0.t
	vsxseg7h.v v4, (a0), v12
	vsxseg7h.v v4, 0(a0), v12
	vsxseg7h.v v4, (a0), v12, v0.t
	vsxseg7w.v v4, (a0), v12
	vsxseg7w.v v4, 0(a0), v12
	vsxseg7w.v v4, (a0), v12, v0.t
	vsxseg7e.v v4, (a0), v12
	vsxseg7e.v v4, 0(a0), v12
	vsxseg7e.v v4, (a0), v12, v0.t

	vlxseg8b.v v4, (a0), v12
	vlxseg8b.v v4, 0(a0), v12
	vlxseg8b.v v4, (a0), v12, v0.t
	vlxseg8h.v v4, (a0), v12
	vlxseg8h.v v4, 0(a0), v12
	vlxseg8h.v v4, (a0), v12, v0.t
	vlxseg8w.v v4, (a0), v12
	vlxseg8w.v v4, 0(a0), v12
	vlxseg8w.v v4, (a0), v12, v0.t
	vlxseg8bu.v v4, (a0), v12
	vlxseg8bu.v v4, 0(a0), v12
	vlxseg8bu.v v4, (a0), v12, v0.t
	vlxseg8hu.v v4, (a0), v12
	vlxseg8hu.v v4, 0(a0), v12
	vlxseg8hu.v v4, (a0), v12, v0.t
	vlxseg8wu.v v4, (a0), v12
	vlxseg8wu.v v4, 0(a0), v12
	vlxseg8wu.v v4, (a0), v12, v0.t
	vlxseg8e.v v4, (a0), v12
	vlxseg8e.v v4, 0(a0), v12
	vlxseg8e.v v4, (a0), v12, v0.t
	vsxseg8b.v v4, (a0), v12
	vsxseg8b.v v4, 0(a0), v12
	vsxseg8b.v v4, (a0), v12, v0.t
	vsxseg8h.v v4, (a0), v12
	vsxseg8h.v v4, 0(a0), v12
	vsxseg8h.v v4, (a0), v12, v0.t
	vsxseg8w.v v4, (a0), v12
	vsxseg8w.v v4, 0(a0), v12
	vsxseg8w.v v4, (a0), v12, v0.t
	vsxseg8e.v v4, (a0), v12
	vsxseg8e.v v4, 0(a0), v12
	vsxseg8e.v v4, (a0), v12, v0.t

	vlseg2bff.v v4, (a0)
	vlseg2bff.v v4, 0(a0)
	vlseg2bff.v v4, (a0), v0.t
	vlseg2hff.v v4, (a0)
	vlseg2hff.v v4, 0(a0)
	vlseg2hff.v v4, (a0), v0.t
	vlseg2wff.v v4, (a0)
	vlseg2wff.v v4, 0(a0)
	vlseg2wff.v v4, (a0), v0.t
	vlseg2buff.v v4, (a0)
	vlseg2buff.v v4, 0(a0)
	vlseg2buff.v v4, (a0), v0.t
	vlseg2huff.v v4, (a0)
	vlseg2huff.v v4, 0(a0)
	vlseg2huff.v v4, (a0), v0.t
	vlseg2wuff.v v4, (a0)
	vlseg2wuff.v v4, 0(a0)
	vlseg2wuff.v v4, (a0), v0.t
	vlseg2eff.v v4, (a0)
	vlseg2eff.v v4, 0(a0)
	vlseg2eff.v v4, (a0), v0.t

	vlseg3bff.v v4, (a0)
	vlseg3bff.v v4, 0(a0)
	vlseg3bff.v v4, (a0), v0.t
	vlseg3hff.v v4, (a0)
	vlseg3hff.v v4, 0(a0)
	vlseg3hff.v v4, (a0), v0.t
	vlseg3wff.v v4, (a0)
	vlseg3wff.v v4, 0(a0)
	vlseg3wff.v v4, (a0), v0.t
	vlseg3buff.v v4, (a0)
	vlseg3buff.v v4, 0(a0)
	vlseg3buff.v v4, (a0), v0.t
	vlseg3huff.v v4, (a0)
	vlseg3huff.v v4, 0(a0)
	vlseg3huff.v v4, (a0), v0.t
	vlseg3wuff.v v4, (a0)
	vlseg3wuff.v v4, 0(a0)
	vlseg3wuff.v v4, (a0), v0.t
	vlseg3eff.v v4, (a0)
	vlseg3eff.v v4, 0(a0)
	vlseg3eff.v v4, (a0), v0.t

	vlseg4bff.v v4, (a0)
	vlseg4bff.v v4, 0(a0)
	vlseg4bff.v v4, (a0), v0.t
	vlseg4hff.v v4, (a0)
	vlseg4hff.v v4, 0(a0)
	vlseg4hff.v v4, (a0), v0.t
	vlseg4wff.v v4, (a0)
	vlseg4wff.v v4, 0(a0)
	vlseg4wff.v v4, (a0), v0.t
	vlseg4buff.v v4, (a0)
	vlseg4buff.v v4, 0(a0)
	vlseg4buff.v v4, (a0), v0.t
	vlseg4huff.v v4, (a0)
	vlseg4huff.v v4, 0(a0)
	vlseg4huff.v v4, (a0), v0.t
	vlseg4wuff.v v4, (a0)
	vlseg4wuff.v v4, 0(a0)
	vlseg4wuff.v v4, (a0), v0.t
	vlseg4eff.v v4, (a0)
	vlseg4eff.v v4, 0(a0)
	vlseg4eff.v v4, (a0), v0.t

	vlseg5bff.v v4, (a0)
	vlseg5bff.v v4, 0(a0)
	vlseg5bff.v v4, (a0), v0.t
	vlseg5hff.v v4, (a0)
	vlseg5hff.v v4, 0(a0)
	vlseg5hff.v v4, (a0), v0.t
	vlseg5wff.v v4, (a0)
	vlseg5wff.v v4, 0(a0)
	vlseg5wff.v v4, (a0), v0.t
	vlseg5buff.v v4, (a0)
	vlseg5buff.v v4, 0(a0)
	vlseg5buff.v v4, (a0), v0.t
	vlseg5huff.v v4, (a0)
	vlseg5huff.v v4, 0(a0)
	vlseg5huff.v v4, (a0), v0.t
	vlseg5wuff.v v4, (a0)
	vlseg5wuff.v v4, 0(a0)
	vlseg5wuff.v v4, (a0), v0.t
	vlseg5eff.v v4, (a0)
	vlseg5eff.v v4, 0(a0)
	vlseg5eff.v v4, (a0), v0.t

	vlseg6bff.v v4, (a0)
	vlseg6bff.v v4, 0(a0)
	vlseg6bff.v v4, (a0), v0.t
	vlseg6hff.v v4, (a0)
	vlseg6hff.v v4, 0(a0)
	vlseg6hff.v v4, (a0), v0.t
	vlseg6wff.v v4, (a0)
	vlseg6wff.v v4, 0(a0)
	vlseg6wff.v v4, (a0), v0.t
	vlseg6buff.v v4, (a0)
	vlseg6buff.v v4, 0(a0)
	vlseg6buff.v v4, (a0), v0.t
	vlseg6huff.v v4, (a0)
	vlseg6huff.v v4, 0(a0)
	vlseg6huff.v v4, (a0), v0.t
	vlseg6wuff.v v4, (a0)
	vlseg6wuff.v v4, 0(a0)
	vlseg6wuff.v v4, (a0), v0.t
	vlseg6eff.v v4, (a0)
	vlseg6eff.v v4, 0(a0)
	vlseg6eff.v v4, (a0), v0.t

	vlseg7bff.v v4, (a0)
	vlseg7bff.v v4, 0(a0)
	vlseg7bff.v v4, (a0), v0.t
	vlseg7hff.v v4, (a0)
	vlseg7hff.v v4, 0(a0)
	vlseg7hff.v v4, (a0), v0.t
	vlseg7wff.v v4, (a0)
	vlseg7wff.v v4, 0(a0)
	vlseg7wff.v v4, (a0), v0.t
	vlseg7buff.v v4, (a0)
	vlseg7buff.v v4, 0(a0)
	vlseg7buff.v v4, (a0), v0.t
	vlseg7huff.v v4, (a0)
	vlseg7huff.v v4, 0(a0)
	vlseg7huff.v v4, (a0), v0.t
	vlseg7wuff.v v4, (a0)
	vlseg7wuff.v v4, 0(a0)
	vlseg7wuff.v v4, (a0), v0.t
	vlseg7eff.v v4, (a0)
	vlseg7eff.v v4, 0(a0)
	vlseg7eff.v v4, (a0), v0.t

	vlseg8bff.v v4, (a0)
	vlseg8bff.v v4, 0(a0)
	vlseg8bff.v v4, (a0), v0.t
	vlseg8hff.v v4, (a0)
	vlseg8hff.v v4, 0(a0)
	vlseg8hff.v v4, (a0), v0.t
	vlseg8wff.v v4, (a0)
	vlseg8wff.v v4, 0(a0)
	vlseg8wff.v v4, (a0), v0.t
	vlseg8buff.v v4, (a0)
	vlseg8buff.v v4, 0(a0)
	vlseg8buff.v v4, (a0), v0.t
	vlseg8huff.v v4, (a0)
	vlseg8huff.v v4, 0(a0)
	vlseg8huff.v v4, (a0), v0.t
	vlseg8wuff.v v4, (a0)
	vlseg8wuff.v v4, 0(a0)
	vlseg8wuff.v v4, (a0), v0.t
	vlseg8eff.v v4, (a0)
	vlseg8eff.v v4, 0(a0)
	vlseg8eff.v v4, (a0), v0.t

	vamoaddw.v v4, v8, (a1), v4
	vamoaddw.v x0, v8, (a1), v4
	vamoadde.v v4, v8, (a1), v4
	vamoadde.v x0, v8, (a1), v4
	vamoaddw.v v4, v8, (a1), v4, v0.t
	vamoaddw.v x0, v8, (a1), v4, v0.t
	vamoadde.v v4, v8, (a1), v4, v0.t
	vamoadde.v x0, v8, (a1), v4, v0.t
	vamoswapw.v v4, v8, (a1), v4
	vamoswapw.v x0, v8, (a1), v4
	vamoswape.v v4, v8, (a1), v4
	vamoswape.v x0, v8, (a1), v4
	vamoswapw.v v4, v8, (a1), v4, v0.t
	vamoswapw.v x0, v8, (a1), v4, v0.t
	vamoswape.v v4, v8, (a1), v4, v0.t
	vamoswape.v x0, v8, (a1), v4, v0.t

	vamoxorw.v v4, v8, (a1), v4
	vamoxorw.v x0, v8, (a1), v4
	vamoxore.v v4, v8, (a1), v4
	vamoxore.v x0, v8, (a1), v4
	vamoxorw.v v4, v8, (a1), v4, v0.t
	vamoxorw.v x0, v8, (a1), v4, v0.t
	vamoxore.v v4, v8, (a1), v4, v0.t
	vamoxore.v x0, v8, (a1), v4, v0.t
	vamoandw.v v4, v8, (a1), v4
	vamoandw.v x0, v8, (a1), v4
	vamoande.v v4, v8, (a1), v4
	vamoande.v x0, v8, (a1), v4
	vamoandw.v v4, v8, (a1), v4, v0.t
	vamoandw.v x0, v8, (a1), v4, v0.t
	vamoande.v v4, v8, (a1), v4, v0.t
	vamoande.v x0, v8, (a1), v4, v0.t
	vamoorw.v v4, v8, (a1), v4
	vamoorw.v x0, v8, (a1), v4
	vamoore.v v4, v8, (a1), v4
	vamoore.v x0, v8, (a1), v4
	vamoorw.v v4, v8, (a1), v4, v0.t
	vamoorw.v x0, v8, (a1), v4, v0.t
	vamoore.v v4, v8, (a1), v4, v0.t
	vamoore.v x0, v8, (a1), v4, v0.t

	vamominw.v v4, v8, (a1), v4
	vamominw.v x0, v8, (a1), v4
	vamomine.v v4, v8, (a1), v4
	vamomine.v x0, v8, (a1), v4
	vamominw.v v4, v8, (a1), v4, v0.t
	vamominw.v x0, v8, (a1), v4, v0.t
	vamomine.v v4, v8, (a1), v4, v0.t
	vamomine.v x0, v8, (a1), v4, v0.t
	vamomaxw.v v4, v8, (a1), v4
	vamomaxw.v x0, v8, (a1), v4
	vamomaxe.v v4, v8, (a1), v4
	vamomaxe.v x0, v8, (a1), v4
	vamomaxw.v v4, v8, (a1), v4, v0.t
	vamomaxw.v x0, v8, (a1), v4, v0.t
	vamomaxe.v v4, v8, (a1), v4, v0.t
	vamomaxe.v x0, v8, (a1), v4, v0.t
	vamominuw.v v4, v8, (a1), v4
	vamominuw.v x0, v8, (a1), v4
	vamominue.v v4, v8, (a1), v4
	vamominue.v x0, v8, (a1), v4
	vamominuw.v v4, v8, (a1), v4, v0.t
	vamominuw.v x0, v8, (a1), v4, v0.t
	vamominue.v v4, v8, (a1), v4, v0.t
	vamominue.v x0, v8, (a1), v4, v0.t
	vamomaxuw.v v4, v8, (a1), v4
	vamomaxuw.v x0, v8, (a1), v4
	vamomaxue.v v4, v8, (a1), v4
	vamomaxue.v x0, v8, (a1), v4
	vamomaxuw.v v4, v8, (a1), v4, v0.t
	vamomaxuw.v x0, v8, (a1), v4, v0.t
	vamomaxue.v v4, v8, (a1), v4, v0.t
	vamomaxue.v x0, v8, (a1), v4, v0.t

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

	vadc.vvm v4, v8, v12, v0
	vadc.vxm v4, v8, a1, v0
	vadc.vim v4, v8, 15, v0
	vadc.vim v4, v8, -16, v0
	vmadc.vvm v4, v8, v12, v0
	vmadc.vxm v4, v8, a1, v0
	vmadc.vim v4, v8, 15, v0
	vmadc.vim v4, v8, -16, v0
	vsbc.vvm v4, v8, v12, v0
	vsbc.vxm v4, v8, a1, v0
	vmsbc.vvm v4, v8, v12, v0
	vmsbc.vxm v4, v8, a1, v0

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

	vnsrl.vv v4, v8, v12
	vnsrl.vx v4, v8, a1
	vnsrl.vi v4, v8, 1
	vnsrl.vi v4, v8, 31
	vnsrl.vv v4, v8, v12, v0.t
	vnsrl.vx v4, v8, a1, v0.t
	vnsrl.vi v4, v8, 1, v0.t
	vnsrl.vi v4, v8, 31, v0.t
	vnsra.vv v4, v8, v12
	vnsra.vx v4, v8, a1
	vnsra.vi v4, v8, 1
	vnsra.vi v4, v8, 31
	vnsra.vv v4, v8, v12, v0.t
	vnsra.vx v4, v8, a1, v0.t
	vnsra.vi v4, v8, 1, v0.t
	vnsra.vi v4, v8, 31, v0.t

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

	# Macros
	vmsge.vx v4, v8, a1
	vmsgeu.vx v4, v8, a1
	vmsge.vx v8, v12, a2, v0.t
	vmsgeu.vx v8, v12, a2, v0.t
	vmsge.vx v4, v8, a1, v0.t, v12
	vmsgeu.vx v4, v8, a1, v0.t, v12

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

	vaadd.vv v4, v8, v12
	vaadd.vx v4, v8, a1
	vaadd.vi v4, v8, 15
	vaadd.vi v4, v8, -16
	vaadd.vv v4, v8, v12, v0.t
	vaadd.vx v4, v8, a1, v0.t
	vaadd.vi v4, v8, 15, v0.t
	vaadd.vi v4, v8, -16, v0.t
	vasub.vv v4, v8, v12
	vasub.vx v4, v8, a1
	vasub.vv v4, v8, v12, v0.t
	vasub.vx v4, v8, a1, v0.t

	vsmul.vv v4, v8, v12
	vsmul.vx v4, v8, a1
	vsmul.vv v4, v8, v12, v0.t
	vsmul.vx v4, v8, a1, v0.t

	vwsmaccu.vv v4, v12, v8
	vwsmaccu.vx v4, a1, v8
	vwsmacc.vv v4, v12, v8
	vwsmacc.vx v4, a1, v8
	vwsmaccsu.vv v4, v12, v8
	vwsmaccsu.vx v4, a1, v8
	vwsmaccus.vx v4, a1, v8
	vwsmaccu.vv v4, v12, v8, v0.t
	vwsmaccu.vx v4, a1, v8, v0.t
	vwsmacc.vv v4, v12, v8, v0.t
	vwsmacc.vx v4, a1, v8, v0.t
	vwsmaccsu.vv v4, v12, v8, v0.t
	vwsmaccsu.vx v4, a1, v8, v0.t
	vwsmaccus.vx v4, a1, v8, v0.t

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

	vnclipu.vv v4, v8, v12
	vnclipu.vx v4, v8, a1
	vnclipu.vi v4, v8, 1
	vnclipu.vi v4, v8, 31
	vnclipu.vv v4, v8, v12, v0.t
	vnclipu.vx v4, v8, a1, v0.t
	vnclipu.vi v4, v8, 1, v0.t
	vnclipu.vi v4, v8, 31, v0.t
	vnclip.vv v4, v8, v12
	vnclip.vx v4, v8, a1
	vnclip.vi v4, v8, 1
	vnclip.vi v4, v8, 31
	vnclip.vv v4, v8, v12, v0.t
	vnclip.vx v4, v8, a1, v0.t
	vnclip.vi v4, v8, 1, v0.t
	vnclip.vi v4, v8, 31, v0.t

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
	vfcvt.f.xu.v v4, v8
	vfcvt.f.x.v v4, v8
	vfcvt.xu.f.v v4, v8, v0.t
	vfcvt.x.f.v v4, v8, v0.t
	vfcvt.f.xu.v v4, v8, v0.t
	vfcvt.f.x.v v4, v8, v0.t

	vfwcvt.xu.f.v v4, v8
	vfwcvt.x.f.v v4, v8
	vfwcvt.f.xu.v v4, v8
	vfwcvt.f.x.v v4, v8
	vfwcvt.f.f.v v4, v8
	vfwcvt.xu.f.v v4, v8, v0.t
	vfwcvt.x.f.v v4, v8, v0.t
	vfwcvt.f.xu.v v4, v8, v0.t
	vfwcvt.f.x.v v4, v8, v0.t
	vfwcvt.f.f.v v4, v8, v0.t

	vfncvt.xu.f.v v4, v8
	vfncvt.x.f.v v4, v8
	vfncvt.f.xu.v v4, v8
	vfncvt.f.x.v v4, v8
	vfncvt.f.f.v v4, v8
	vfncvt.xu.f.v v4, v8, v0.t
	vfncvt.x.f.v v4, v8, v0.t
	vfncvt.f.xu.v v4, v8, v0.t
	vfncvt.f.x.v v4, v8, v0.t
	vfncvt.f.f.v v4, v8, v0.t

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

	vrgather.vv v4, v8, v12
	vrgather.vx v4, v8, a1
	vrgather.vi v4, v8, 0
	vrgather.vi v4, v8, 31
	vrgather.vv v4, v8, v12, v0.t
	vrgather.vx v4, v8, a1, v0.t
	vrgather.vi v4, v8, 0, v0.t
	vrgather.vi v4, v8, 31, v0.t

	vcompress.vm v4, v8, v12

	vdot.vv v4, v8, v12
	vdotu.vv v4, v8, v12
	vfdot.vv v4, v8, v12
	vdot.vv v4, v8, v12, v0.t
	vdotu.vv v4, v8, v12, v0.t
	vfdot.vv v4, v8, v12, v0.t

	csrr a0, vstart
	csrr a0, vxsat
	csrr a0, vxrm
	csrr a0, vl
	csrr a0, vtype
