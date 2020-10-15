#as: -march=rv32ic
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+0:[ 	]+8330000f[ 	]+fence.tso
[ 	]+4:[ 	]+0100000f[ 	]+pause
[ 	]+8:[ 	]+0ff0000f[ 	]+fence
[ 	]+c:[ 	]+0ff0000f[ 	]+fence
