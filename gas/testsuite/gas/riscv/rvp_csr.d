#as: -march=rv32gc_zpn
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <rvp>:
[ 	]+[0-9a-f]+:[ 	]+00905073[ 	]+csrwi[ 	]+vxsat,0
[ 	]+[0-9a-f]+:[ 	]+0090f073[ 	]+csrci[ 	]+vxsat,1
[ 	]+[0-9a-f]+:[ 	]+009022f3[ 	]+csrr[ 	]+t0,vxsat
