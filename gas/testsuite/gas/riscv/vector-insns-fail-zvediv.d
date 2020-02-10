#as: -march=rv32iv
#source: vector-insns-fail-zvediv.s
#warning_output: vector-insns-fail-zvediv.l
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <.text>:
[ 	]+[0-9a-f]+:[ 	]+0005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,d1
[ 	]+[0-9a-f]+:[ 	]+7ff5f557[ 	]+vsetvli[ 	]+a0,a1,2047
[ 	]+[0-9a-f]+:[ 	]+0605f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,d8
[ 	]+[0-9a-f]+:[ 	]+79f5f557[ 	]+vsetvli[ 	]+a0,a1,1951
[ 	]+[0-9a-f]+:[ 	]+0005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,d1
[ 	]+[0-9a-f]+:[ 	]+0005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,d1
[ 	]+[0-9a-f]+:[ 	]+0205f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,d2
[ 	]+[0-9a-f]+:[ 	]+0405f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,d4
[ 	]+[0-9a-f]+:[ 	]+0605f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,d8
