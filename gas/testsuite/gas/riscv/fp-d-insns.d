#as: -march=rv64ifd
#source: fp-d-insns.s
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+00000597[ 	]+auipc[ 	]+a1,0x0
.*R_RISCV_PCREL_HI20.*
.*R_RISCV_RELAX.*
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\).*
.*R_RISCV_PCREL_LO12_I.*
.*R_RISCV_RELAX.*
[ 	]+[0-9a-f]+:[ 	]+00000597[ 	]+auipc[ 	]+a1,0x0
.*R_RISCV_PCREL_HI20.*
.*R_RISCV_RELAX.*
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\).*
.*R_RISCV_PCREL_LO12_S.*
.*R_RISCV_RELAX.*
[ 	]+[0-9a-f]+:[ 	]+22b58553[ 	]+fmv.d[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+22b59553[ 	]+fneg.d[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+22b5a553[ 	]+fabs.d[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+22c58553[ 	]+fsgnj.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+22c59553[ 	]+fsgnjn.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+22c5a553[ 	]+fsgnjx.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+02c5f553[ 	]+fadd.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+02c58553[ 	]+fadd.d[ 	]+fa0,fa1,fa2,rne
[ 	]+[0-9a-f]+:[ 	]+0ac5f553[ 	]+fsub.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+0ac58553[ 	]+fsub.d[ 	]+fa0,fa1,fa2,rne
[ 	]+[0-9a-f]+:[ 	]+12c5f553[ 	]+fmul.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+12c58553[ 	]+fmul.d[ 	]+fa0,fa1,fa2,rne
[ 	]+[0-9a-f]+:[ 	]+1ac5f553[ 	]+fdiv.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+1ac58553[ 	]+fdiv.d[ 	]+fa0,fa1,fa2,rne
[ 	]+[0-9a-f]+:[ 	]+5a05f553[ 	]+fsqrt.d[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+5a058553[ 	]+fsqrt.d[ 	]+fa0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+2ac58553[ 	]+fmin.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+2ac59553[ 	]+fmax.d[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+6ac5f543[ 	]+fmadd.d[ 	]+fa0,fa1,fa2,fa3
[ 	]+[0-9a-f]+:[ 	]+6ac58543[ 	]+fmadd.d[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+[0-9a-f]+:[ 	]+6ac5f54f[ 	]+fnmadd.d[ 	]+fa0,fa1,fa2,fa3
[ 	]+[0-9a-f]+:[ 	]+6ac5854f[ 	]+fnmadd.d[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+[0-9a-f]+:[ 	]+6ac5f547[ 	]+fmsub.d[ 	]+fa0,fa1,fa2,fa3
[ 	]+[0-9a-f]+:[ 	]+6ac58547[ 	]+fmsub.d[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+[0-9a-f]+:[ 	]+6ac5f54b[ 	]+fnmsub.d[ 	]+fa0,fa1,fa2,fa3
[ 	]+[0-9a-f]+:[ 	]+6ac5854b[ 	]+fnmsub.d[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+[0-9a-f]+:[ 	]+c205f553[ 	]+fcvt.w.d[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+c2058553[ 	]+fcvt.w.d[ 	]+a0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+c215f553[ 	]+fcvt.wu.d[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+c2158553[ 	]+fcvt.wu.d[ 	]+a0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+d2058553[ 	]+fcvt.d.w[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+d2158553[ 	]+fcvt.d.wu[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+c225f553[ 	]+fcvt.l.d[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+c2258553[ 	]+fcvt.l.d[ 	]+a0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+c235f553[ 	]+fcvt.lu.d[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+c2358553[ 	]+fcvt.lu.d[ 	]+a0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+d225f553[ 	]+fcvt.d.l[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+d2258553[ 	]+fcvt.d.l[ 	]+fa0,a1,rne
[ 	]+[0-9a-f]+:[ 	]+d235f553[ 	]+fcvt.d.lu[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+d2358553[ 	]+fcvt.d.lu[ 	]+fa0,a1,rne
[ 	]+[0-9a-f]+:[ 	]+e2058553[ 	]+fmv.x.d[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+f2058553[ 	]+fmv.d.x[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+4015f553[ 	]+fcvt.s.d[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+40158553[ 	]+fcvt.s.d[ 	]+fa0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+42058553[ 	]+fcvt.d.s[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+e2059553[ 	]+fclass.d[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+a2c5a553[ 	]+feq.d[ 	]+a0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+a2c59553[ 	]+flt.d[ 	]+a0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+a2c58553[ 	]+fle.d[ 	]+a0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+a2c59553[ 	]+flt.d[ 	]+a0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+a2c58553[ 	]+fle.d[ 	]+a0,fa1,fa2
