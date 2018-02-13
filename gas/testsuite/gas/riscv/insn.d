#as: -march=rv32ic
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+0:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[ 	]+4:[ 	]+00d58513[ 	]+addi[ 	]+a0,a1,13
[ 	]+8:[ 	]+00a58567[ 	]+jalr[ 	]+a0,10\(a1\)
[ 	]+c:[ 	]+00458503[ 	]+lb[ 	]+a0,4\(a1\)
[ 	]+10:[ 	]+feb508e3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[	]+10: R_RISCV_BRANCH[	]+target
[ 	]+14:[ 	]+00a58223[ 	]+sb[ 	]+a0,4\(a1\)
[ 	]+18:[ 	]+00fff537[ 	]+lui[ 	]+a0,0xfff
[ 	]+1c:[ 	]+fe5ff56f[ 	]+jal[ 	]+a0,0 \<target\>
[	]+1c: R_RISCV_JAL[	]+target
[ 	]+20:[ 	]+0511[ 	]+addi[ 	]+a0,a0,4
[ 	]+22:[ 	]+852e[ 	]+mv[ 	]+a0,a1
[ 	]+24:[ 	]+45a9[ 	]+li[ 	]+a1,10
[ 	]+26:[ 	]+dde9[ 	]+beqz[ 	]+a1,0 \<target\>
[	]+26: R_RISCV_RVC_BRANCH[	]+target
[ 	]+28:[ 	]+bfe1[ 	]+j[ 	]+0 \<target\>
[	]+28: R_RISCV_RVC_JUMP[	]+target
