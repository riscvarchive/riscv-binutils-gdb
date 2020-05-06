#as: -march=rv32iv
#source: vector-insns-fail-zvediv.s
#warning_output: vector-insns-fail-zvediv.l
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <.text>:
[ 	]+[0-9a-f]+:[ 	]+0005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,tu,mu,d1
[ 	]+[0-9a-f]+:[ 	]+7ff5f557[ 	]+vsetvli[ 	]+a0,a1,2047
[ 	]+[0-9a-f]+:[ 	]+3005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,tu,mu,d8
[ 	]+[0-9a-f]+:[ 	]+4ff5f557[ 	]+vsetvli[ 	]+a0,a1,1279
[ 	]+[0-9a-f]+:[ 	]+0005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,tu,mu,d1
[ 	]+[0-9a-f]+:[ 	]+0005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,tu,mu,d1
[ 	]+[0-9a-f]+:[ 	]+1005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,tu,mu,d2
[ 	]+[0-9a-f]+:[ 	]+2005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,tu,mu,d4
[ 	]+[0-9a-f]+:[ 	]+3005f557[ 	]+vsetvli[ 	]+a0,a1,e8,m1,tu,mu,d8
