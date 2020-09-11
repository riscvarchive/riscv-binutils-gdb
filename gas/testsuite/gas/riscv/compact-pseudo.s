.text
#.option compact
# Don't set the pseudo gp, so use the gp directly
la:	la.got.gprel	a0, foo
lla:	lla.gprel	a0, foo
lb:	lb.gprel	a0, foo
lh:	lh.gprel	a0, foo
lw:	lw.gprel	a0, foo
lbu:	lbu.gprel	a0, foo
lhu:	lhu.gprel	a0, foo
flw:	flw.gprel	fa0, foo, a1
sb:	sb.gprel	a0, foo, a1
sh:	sh.gprel	a0, foo, a1
sw:	sw.gprel	a0, foo, a1
fsw:	fsw.gprel	fa0, foo, a1

# Use a2 as the pseudo gp
la_pseudo_gp:	la.got.gprel	a0, foo, a2
lla_pseudo_gp:	lla.gprel	a0, foo, a2
lb_pseudo_gp:	lb.gprel	a0, foo, a2
lh_pseudo_gp:	lh.gprel	a0, foo, a2
lw_pseudo_gp:	lw.gprel	a0, foo, a2
lbu_pseudo_gp:	lbu.gprel	a0, foo, a2
lhu_pseudo_gp:	lhu.gprel	a0, foo, a2
flw_pseudo_gp:	flw.gprel	fa0, foo, a1, a2
sb_pseudo_gp:	sb.gprel	a0, foo, a1, a2
sh_pseudo_gp:	sh.gprel	a0, foo, a1, a2
sw_pseudo_gp:	sw.gprel	a0, foo, a1, a2
fsw_pseudo_gp:	fsw.gprel	fa0, foo, a1, a2

# RV64 patterns
.ifdef __64_bit__
.section .text.rv64
#.option compact
lwu:		lwu.gprel	a0, foo
ld:		ld.gprel	a0, foo
fld:		fld.gprel	fa0, foo, a1
sd:		sd.gprel	a0, foo, a1
fsd:		fsd.gprel	fa0, foo, a1
lwu_pseudo_gp:	lwu.gprel	a0, foo, a2
ld_pseudo_gp:	ld.gprel	a0, foo, a2
fld_pseudo_gp:	fld.gprel	fa0, foo, a1, a2
sd_pseudo_gp:	sd.gprel	a0, foo, a1, a2
fsd_pseudo_gp:	fsd.gprel	fa0, foo, a1, a2
.endif
