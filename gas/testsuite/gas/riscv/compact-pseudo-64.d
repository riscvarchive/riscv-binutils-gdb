#as: -defsym __64_bit__=1 -mno-relax -march=rv64ifdq
#source: compact-pseudo.s
#objdump: -dr -Mno-aliases

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <la>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00053503[ 	]+ld[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lla>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00050513[ 	]+addi[ 	]+a0,a0,0 # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lb>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00050503[ 	]+lb[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lh>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00051503[ 	]+lh[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lw>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00052503[ 	]+lw[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lbu>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00054503[ 	]+lbu[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lhu>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00055503[ 	]+lhu[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <flw>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+003585b3[ 	]+add[ 	]+a1,a1,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005a507[ 	]+flw[ 	]+fa0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <sb>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+003585b3[ 	]+add[ 	]+a1,a1,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a58023[ 	]+sb[ 	]+a0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <sh>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+003585b3[ 	]+add[ 	]+a1,a1,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a59023[ 	]+sh[ 	]+a0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <sw>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+003585b3[ 	]+add[ 	]+a1,a1,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <fsw>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+003585b3[ 	]+add[ 	]+a1,a1,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a027[ 	]+fsw[ 	]+fa0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <la_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00053503[ 	]+ld[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lla_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00050513[ 	]+addi[ 	]+a0,a0,0 # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lb_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00050503[ 	]+lb[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lh_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00051503[ 	]+lh[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lw_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00052503[ 	]+lw[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lbu_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00054503[ 	]+lbu[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <lhu_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00055503[ 	]+lhu[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <flw_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c585b3[ 	]+add[ 	]+a1,a1,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005a507[ 	]+flw[ 	]+fa0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <sb_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c585b3[ 	]+add[ 	]+a1,a1,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a58023[ 	]+sb[ 	]+a0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <sh_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c585b3[ 	]+add[ 	]+a1,a1,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a59023[ 	]+sh[ 	]+a0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <sw_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c585b3[ 	]+add[ 	]+a1,a1,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <fsw_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c585b3[ 	]+add[ 	]+a1,a1,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a027[ 	]+fsw[ 	]+fa0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
#...
Disassembly of section .text.rv64:

[0-9a-f]+ <lwu>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00056503[ 	]+lwu[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <ld>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00053503[ 	]+ld[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <fld>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+003585b3[ 	]+add[ 	]+a1,a1,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <sd>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+003585b3[ 	]+add[ 	]+a1,a1,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b023[ 	]+sd[ 	]+a0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <fsd>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+003585b3[ 	]+add[ 	]+a1,a1,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <lwu_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00056503[ 	]+lwu[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <ld_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c50533[ 	]+add[ 	]+a0,a0,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00053503[ 	]+ld[ 	]+a0,0\(a0\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <fld_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c585b3[ 	]+add[ 	]+a1,a1,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <sd_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c585b3[ 	]+add[ 	]+a1,a1,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b023[ 	]+sd[ 	]+a0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <fsd_pseudo_gp>:
[ 	]+[0-9a-f]+:[ 	]+000005b7[ 	]+lui[ 	]+a1,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00c585b3[ 	]+add[ 	]+a1,a1,a2
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\) # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
