#as: -march=rv64ifdq
#source: fp-q-insns.s
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+[0-9a-f]+:[ 	]+0005c507[ 	]+flq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+00a5c027[ 	]+fsq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+26b58553[ 	]+fmv.q[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+26b59553[ 	]+fneg.q[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+26b5a553[ 	]+fabs.q[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+26c58553[ 	]+fsgnj.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+26c59553[ 	]+fsgnjn.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+26c5a553[ 	]+fsgnjx.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+06c5f553[ 	]+fadd.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+06c58553[ 	]+fadd.q[ 	]+fa0,fa1,fa2,rne
[ 	]+[0-9a-f]+:[ 	]+0ec5f553[ 	]+fsub.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+0ec58553[ 	]+fsub.q[ 	]+fa0,fa1,fa2,rne
[ 	]+[0-9a-f]+:[ 	]+16c5f553[ 	]+fmul.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+16c58553[ 	]+fmul.q[ 	]+fa0,fa1,fa2,rne
[ 	]+[0-9a-f]+:[ 	]+1ec5f553[ 	]+fdiv.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+1ec58553[ 	]+fdiv.q[ 	]+fa0,fa1,fa2,rne
[ 	]+[0-9a-f]+:[ 	]+5e05f553[ 	]+fsqrt.q[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+5e058553[ 	]+fsqrt.q[ 	]+fa0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+2ec58553[ 	]+fmin.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+2ec59553[ 	]+fmax.q[ 	]+fa0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+6ec5f543[ 	]+fmadd.q[ 	]+fa0,fa1,fa2,fa3
[ 	]+[0-9a-f]+:[ 	]+6ec58543[ 	]+fmadd.q[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+[0-9a-f]+:[ 	]+6ec5f54f[ 	]+fnmadd.q[ 	]+fa0,fa1,fa2,fa3
[ 	]+[0-9a-f]+:[ 	]+6ec5854f[ 	]+fnmadd.q[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+[0-9a-f]+:[ 	]+6ec5f547[ 	]+fmsub.q[ 	]+fa0,fa1,fa2,fa3
[ 	]+[0-9a-f]+:[ 	]+6ec58547[ 	]+fmsub.q[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+[0-9a-f]+:[ 	]+6ec5f54b[ 	]+fnmsub.q[ 	]+fa0,fa1,fa2,fa3
[ 	]+[0-9a-f]+:[ 	]+6ec5854b[ 	]+fnmsub.q[ 	]+fa0,fa1,fa2,fa3,rne
[ 	]+[0-9a-f]+:[ 	]+c605f553[ 	]+fcvt.w.q[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+c6058553[ 	]+fcvt.w.q[ 	]+a0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+c615f553[ 	]+fcvt.wu.q[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+c6158553[ 	]+fcvt.wu.q[ 	]+a0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+d6058553[ 	]+fcvt.q.w[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+d6158553[ 	]+fcvt.q.wu[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+c625f553[ 	]+fcvt.l.q[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+c6258553[ 	]+fcvt.l.q[ 	]+a0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+c635f553[ 	]+fcvt.lu.q[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+c6358553[ 	]+fcvt.lu.q[ 	]+a0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+d625f553[ 	]+fcvt.q.l[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+d6258553[ 	]+fcvt.q.l[ 	]+fa0,a1,rne
[ 	]+[0-9a-f]+:[ 	]+d635f553[ 	]+fcvt.q.lu[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+d6358553[ 	]+fcvt.q.lu[ 	]+fa0,a1,rne
[ 	]+[0-9a-f]+:[ 	]+e6058553[ 	]+fmv.x.q[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+f6058553[ 	]+fmv.q.x[ 	]+fa0,a1
[ 	]+[0-9a-f]+:[ 	]+4035f553[ 	]+fcvt.s.q[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+40358553[ 	]+fcvt.s.q[ 	]+fa0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+4235f553[ 	]+fcvt.d.q[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+42358553[ 	]+fcvt.d.q[ 	]+fa0,fa1,rne
[ 	]+[0-9a-f]+:[ 	]+46058553[ 	]+fcvt.q.s[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+46158553[ 	]+fcvt.q.d[ 	]+fa0,fa1
[ 	]+[0-9a-f]+:[ 	]+e6059553[ 	]+fclass.q[ 	]+a0,fa1
[ 	]+[0-9a-f]+:[ 	]+a6c5a553[ 	]+feq.q[ 	]+a0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+a6c59553[ 	]+flt.q[ 	]+a0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+a6c58553[ 	]+fle.q[ 	]+a0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+a6c59553[ 	]+flt.q[ 	]+a0,fa1,fa2
[ 	]+[0-9a-f]+:[ 	]+a6c58553[ 	]+fle.q[ 	]+a0,fa1,fa2
