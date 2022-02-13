#as: -march=rv32gc_zbpbo_zpn_zpsf
#source: insn-dsp-zbpbo.s
#objdump: -d

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <dsp>:
[ 	]+.*:[ 	]+.*[ 	]+clz[ 	]+a1,a2
[ 	]+.*:[ 	]+.*[ 	]+clz[ 	]+a1,a2
[ 	]+.*:[ 	]+.*[ 	]+cmix[ 	]+a1,a2,a3,a4
[ 	]+.*:[ 	]+.*[ 	]+fsr[ 	]+a1,a2,a3,a4
[ 	]+.*:[ 	]+.*[ 	]+fsri[ 	]+a1,a2,a3,0x5
[ 	]+.*:[ 	]+.*[ 	]+max[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+min[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+pack[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+packu[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+pack[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+packu[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+rev[ 	]+a1,a2
[ 	]+.*:[ 	]+.*[ 	]+rev8.h[ 	]+a1,a2
[ 	]+.*:[ 	]+.*[ 	]+rev8.h[ 	]+a1,a2
