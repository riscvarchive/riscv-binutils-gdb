#as: -mno-relax -march=rv64ifdq
#objdump: -dr -Mno-aliases

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <gprel_lla>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00050513[ 	]+addi[ 	]+a0,a0,0 # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <got_gprel_la>:
[ 	]+[0-9a-f]+:[ 	]+00000537[ 	]+lui[ 	]+a0,0x0
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_HI20[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00350533[ 	]+add[ 	]+a0,a0,gp
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_ADD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00050513[ 	]+addi[ 	]+a0,a0,0 # 0 <.*>
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <gprel_lo12_i>:
[ 	]+[0-9a-f]+:[ 	]+00050503[ 	]+lb[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00051503[ 	]+lh[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00052503[ 	]+lw[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00053503[ 	]+ld[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00054503[ 	]+lbu[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00055503[ 	]+lhu[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00056503[ 	]+lwu[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005a507[ 	]+flw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005c507[ 	]+flq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <gprel_lo12_s>:
[ 	]+[0-9a-f]+:[ 	]+00a58023[ 	]+sb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a59023[ 	]+sh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b023[ 	]+sd[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a027[ 	]+fsw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5c027[ 	]+fsq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LO12_S[ 	]+foo
[0-9a-f]+ <got_gprel_lo12_i>:
[ 	]+[0-9a-f]+:[ 	]+00050503[ 	]+lb[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00051503[ 	]+lh[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00052503[ 	]+lw[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00053503[ 	]+ld[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00054503[ 	]+lbu[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00055503[ 	]+lhu[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00056503[ 	]+lwu[ 	]+a0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005a507[ 	]+flw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005c507[ 	]+flq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LO12_I[ 	]+foo
[0-9a-f]+ <gprel_load>:
[ 	]+[0-9a-f]+:[ 	]+00058503[ 	]+lb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00059503[ 	]+lh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005a503[ 	]+lw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005b503[ 	]+ld[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005c503[ 	]+lbu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005d503[ 	]+lhu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005e503[ 	]+lwu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005a507[ 	]+flw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005c507[ 	]+flq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[0-9a-f]+ <gprel_store>:
[ 	]+[0-9a-f]+:[ 	]+00a58023[ 	]+sb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a59023[ 	]+sh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b023[ 	]+sd[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a027[ 	]+fsw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5c027[ 	]+fsq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[0-9a-f]+ <got_gprel_load>:
[ 	]+[0-9a-f]+:[ 	]+00058503[ 	]+lb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00059503[ 	]+lh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005a503[ 	]+lw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005b503[ 	]+ld[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005c503[ 	]+lbu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005d503[ 	]+lhu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005e503[ 	]+lwu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005a507[ 	]+flw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+0005c507[ 	]+flq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[0-9a-f]+ <got_gprel_store>:
[ 	]+[0-9a-f]+:[ 	]+00a58023[ 	]+sb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a59023[ 	]+sh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b023[ 	]+sd[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5a027[ 	]+fsw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+00a5c027[ 	]+fsq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
