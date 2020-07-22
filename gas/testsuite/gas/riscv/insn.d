#as: -march=rv32ifcv
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00d58513[ 	]+addi[ 	]+a0,a1,13
[^:]+:[ 	]+00a58567[ 	]+jalr[ 	]+a0,10\(a1\)
[^:]+:[ 	]+00458503[ 	]+lb[ 	]+a0,4\(a1\)
[^:]+:[ 	]+feb508e3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[^:]+: R_RISCV_BRANCH[	]+target
[^:]+:[ 	]+feb506e3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[^:]+: R_RISCV_BRANCH[	]+target
[^:]+:[ 	]+00a58223[ 	]+sb[ 	]+a0,4\(a1\)
[^:]+:[ 	]+00fff537[ 	]+lui[ 	]+a0,0xfff
[^:]+:[ 	]+fe1ff56f[ 	]+jal[ 	]+a0,0 \<target\>
[^:]+: R_RISCV_JAL[	]+target
[^:]+:[ 	]+fddff56f[ 	]+jal[ 	]+a0,0 \<target\>
[^:]+: R_RISCV_JAL[	]+target
[^:]+:[ 	]+0511[ 	]+addi[ 	]+a0,a0,4
[^:]+:[ 	]+852e[ 	]+mv[ 	]+a0,a1
[^:]+:[ 	]+002c[ 	]+addi[ 	]+a1,sp,8
[^:]+:[ 	]+d9e9[ 	]+beqz[ 	]+a1,0 \<target\>
[^:]+: R_RISCV_RVC_BRANCH[	]+target
[^:]+:[ 	]+bfc1[ 	]+j[ 	]+0 \<target\>
[^:]+: R_RISCV_RVC_JUMP[	]+target
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00d58513[ 	]+addi[ 	]+a0,a1,13
[^:]+:[ 	]+00a58567[ 	]+jalr[ 	]+a0,10\(a1\)
[^:]+:[ 	]+00458503[ 	]+lb[ 	]+a0,4\(a1\)
[^:]+:[ 	]+fab50fe3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[^:]+: R_RISCV_BRANCH[	]+target
[^:]+:[ 	]+fab50de3[ 	]+beq[ 	]+a0,a1,0 \<target\>
[^:]+: R_RISCV_BRANCH[	]+target
[^:]+:[ 	]+00a58223[ 	]+sb[ 	]+a0,4\(a1\)
[^:]+:[ 	]+00fff537[ 	]+lui[ 	]+a0,0xfff
[^:]+:[ 	]+fafff56f[ 	]+jal[ 	]+a0,0 \<target\>
[^:]+: R_RISCV_JAL[	]+target
[^:]+:[ 	]+fabff56f[ 	]+jal[ 	]+a0,0 \<target\>
[^:]+: R_RISCV_JAL[	]+target
[^:]+:[ 	]+0511[ 	]+addi[ 	]+a0,a0,4
[^:]+:[ 	]+852e[ 	]+mv[ 	]+a0,a1
[^:]+:[ 	]+002c[ 	]+addi[ 	]+a1,sp,8
[^:]+:[ 	]+8d6d[ 	]+and[ 	]+a0,a0,a1
[^:]+:[ 	]+ddd9[ 	]+beqz[ 	]+a1,0 \<target\>
[^:]+: R_RISCV_RVC_BRANCH[	]+target
[^:]+:[ 	]+bf71[ 	]+j[ 	]+0 \<target\>
[^:]+: R_RISCV_RVC_JUMP[	]+target
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+68c58543[ 	]+fmadd.s[ 	]+fa0,fa1,fa2,fa3,rne
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00c58533[ 	]+add[ 	]+a0,a1,a2
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+00d675af[ 	]+vamoaddei64.v[ 	]+zero,\(a2\),v13,v11,v0.t
[^:]+:[ 	]+08d67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+08d67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+08d67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+08d67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+08d67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+0ad67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+0ad67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+0ad67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+0ad67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+0ad67587[ 	]+vlse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+08d675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+08d675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+08d675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+08d675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+08d675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3,v0.t
[^:]+:[ 	]+0ad675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+0ad675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+0ad675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+0ad675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+0ad675a7[ 	]+vsse64.v[ 	]+v11,\(a2\),a3
[^:]+:[ 	]+00067587[ 	]+vle64.v[ 	]+v11,\(a2\),v0.t
[^:]+:[ 	]+03067587[ 	]+vle64ff.v[ 	]+v11,\(a2\)
[^:]+:[ 	]+000675a7[ 	]+vse64.v[ 	]+v11,\(a2\),v0.t
[^:]+:[ 	]+00d605d7[ 	]+vadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d605d7[ 	]+vadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d605d7[ 	]+vadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d605d7[ 	]+vadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d605d7[ 	]+vadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d605d7[ 	]+vadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d605d7[ 	]+vadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d615d7[ 	]+vfadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d615d7[ 	]+vfadd.vv[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d625d7[ 	]+vredsum.vs[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d625d7[ 	]+vredsum.vs[ 	]+v11,v13,v12,v0.t
[^:]+:[ 	]+00d645d7[ 	]+vadd.vx[ 	]+v11,v13,a2,v0.t
[^:]+:[ 	]+00d645d7[ 	]+vadd.vx[ 	]+v11,v13,a2,v0.t
[^:]+:[ 	]+00d655d7[ 	]+vfadd.vf[ 	]+v11,v13,fa2,v0.t
[^:]+:[ 	]+00d655d7[ 	]+vfadd.vf[ 	]+v11,v13,fa2,v0.t
[^:]+:[ 	]+38d665d7[ 	]+vslide1up.vx[ 	]+v11,v13,a2,v0.t
[^:]+:[ 	]+3cd665d7[ 	]+vslide1down.vx[ 	]+v11,v13,a2,v0.t
[^:]+:[ 	]+00d675d7[ 	]+vsetvli[ 	]+a1,a2,e16,mf8,tu,mu,d1
[^:]+:[ 	]+00d675d7[ 	]+vsetvli[ 	]+a1,a2,e16,mf8,tu,mu,d1
[^:]+:[ 	]+00d035d7[ 	]+vadd.vi[ 	]+v11,v13,0,v0.t
[^:]+:[ 	]+00d0b5d7[ 	]+vadd.vi[ 	]+v11,v13,1,v0.t
[^:]+:[ 	]+00d7b5d7[ 	]+vadd.vi[ 	]+v11,v13,15,v0.t
[^:]+:[ 	]+00d835d7[ 	]+vadd.vi[ 	]+v11,v13,-16,v0.t
[^:]+:[ 	]+00df35d7[ 	]+vadd.vi[ 	]+v11,v13,-2,v0.t
[^:]+:[ 	]+00dfb5d7[ 	]+vadd.vi[ 	]+v11,v13,-1,v0.t
