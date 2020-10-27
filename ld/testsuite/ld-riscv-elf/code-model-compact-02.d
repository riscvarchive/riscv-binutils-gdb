#source: code-model.s
#as: -march=rv64i -mabi=lp64 --defsym __compact__=1
#ld: -Tcode-model-02.ld -melf64lriscv --no-relax
#objdump: -d -Mno-aliases

.*:[ 	]+file format .*


Disassembly of section .text:

0+800000000 <_start>:
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+auipc[ 	]+gp,0x[0-9a-f]+
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+gp,gp,[0-9]+ # [0-9a-f]+ <__global_pointer__>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+ld[ 	]+t0,0\(gp\) # [0-9a-f]+ <_GLOBAL_OFFSET_TABLE_>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+add[ 	]+gp,gp,t0
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+lui[ 	]+t0,0x[0-9a-f]+
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+add[ 	]+t0,t0,gp
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+t0,t0,\-[0-9]+ # [0-9a-f]+ <.*>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+lui[ 	]+t0,0x[0-9a-f]+
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+add[ 	]+t0,t0,gp
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+addi[ 	]+t0,t0,\-[0-9]+ # [0-9a-f]+ <.*>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+lui[ 	]+t0,0x[0-9a-f]+
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+add[ 	]+t0,t0,gp
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+ld[ 	]+t0,[0-9]+\(t0\) # [0-9a-f]+ <.*>
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+lui[ 	]+t0,0x[0-9a-f]+
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+add[ 	]+t0,t0,gp
[ 	]+[0-9a-f]+:[ 	]+[0-9a-f]+[ 	]+ld[ 	]+t0,[0-9]+\(t0\) # [0-9a-f]+ <.*>

[0-9a-f]+ <__global_pointer__>:
#...
