#as: -march=rv64gc_zbpbo_zpn_zpsf
#source: insn-dsp64-zbpbo.s
#objdump: -d

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <dsp64>:
[ 	]+.*:[ 	]+.*[ 	]+cmix[ 	]+a1,a2,a3,a4
[ 	]+.*:[ 	]+.*[ 	]+cmix[ 	]+a0,a2,a1,a3
[ 	]+.*:[ 	]+.*[ 	]+fsrw[ 	]+a1,a2,a3,a4
[ 	]+.*:[ 	]+.*[ 	]+max[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+min[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+max[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+min[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+pack[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+packu[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+pack[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+packu[ 	]+a1,a2,a3
[ 	]+.*:[ 	]+.*[ 	]+rev[ 	]+a1,a2
[ 	]+.*:[ 	]+.*[ 	]+rev8.h[ 	]+a1,a2
[ 	]+.*:[ 	]+.*[ 	]+rev8.h[ 	]+a1,a2
