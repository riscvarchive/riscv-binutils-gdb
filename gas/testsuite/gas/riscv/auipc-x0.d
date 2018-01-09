#as: -march=rv32i
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+0:[ 	]+00000017[ 	]+auipc[ 	]+zero,0x0
[ 	]+4:[ 	]+00003003[ 	]+lw[ 	]+zero,0\(zero\)
