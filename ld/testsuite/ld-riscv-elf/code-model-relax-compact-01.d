#source: code-model.s
#as: -march=rv64i -mabi=lp64 --defsym __compact__=1
#ld: -Tcode-model-01.ld -melf64lriscv --relax
#objdump: -d -Mno-aliases

.*:[ 	]+file format .*


Disassembly of section .text:

0+10000 <_start>:
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+gp,0x[0-9a-f]+
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+gp,gp,[0-9]+ # [0-9a-f]+ <__global_pointer__>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+ld[ 	]+t0,0\(gp\) # [0-9a-f]+ <_GLOBAL_OFFSET_TABLE_>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+add[ 	]+gp,gp,t0
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+t0,gp,\-[0-9]+ # [0-9a-f]+ <symbolL>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+t0,gp,\-[0-9]+ # [0-9a-f]+ <symbolG>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+t0,gp,\-[0-9]+ # [0-9a-f]+ <symbolL>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+t0,gp,\-[0-9]+ # [0-9a-f]+ <symbolG>

[0-9a-f]+ <__global_pointer__>:
#...
