#as: -march=rv64ifdq
#objdump: -dr -Mno-aliases

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <foo>:
[ 	]+[0-9a-f]+:[ 	]+00058503[ 	]+lb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00059503[ 	]+lh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005a503[ 	]+lw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005b503[ 	]+ld[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005c503[ 	]+lbu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005d503[ 	]+lhu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005e503[ 	]+lwu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005a507[ 	]+flw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005c507[ 	]+flq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a58023[ 	]+sb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a59023[ 	]+sh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5b023[ 	]+sd[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a027[ 	]+fsw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5c027[ 	]+fsq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00058503[ 	]+lb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00059503[ 	]+lh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005a503[ 	]+lw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005b503[ 	]+ld[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005c503[ 	]+lbu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005d503[ 	]+lhu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005e503[ 	]+lwu[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005a507[ 	]+flw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005b507[ 	]+fld[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005c507[ 	]+flq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a58023[ 	]+sb[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a59023[ 	]+sh[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5b023[ 	]+sd[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a027[ 	]+fsw[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5b027[ 	]+fsd[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5c027[ 	]+fsq[ 	]+fa0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+foo
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
0+088 <bar>:
[ 	]+[0-9a-f]+:[ 	]+0005a503[ 	]+lw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+bar
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005a503[ 	]+lw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+bar\+0x8
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0045a503[ 	]+lw[ 	]+a0,4\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+bar
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0045a503[ 	]+lw[ 	]+a0,4\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_LOAD[ 	]+bar\+0x8
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+bar
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+bar\+0x8
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a223[ 	]+sw[ 	]+a0,4\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+bar
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a223[ 	]+sw[ 	]+a0,4\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GPREL_STORE[ 	]+bar\+0x8
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005a503[ 	]+lw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+bar
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0005a503[ 	]+lw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+bar\+0x8
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0045a503[ 	]+lw[ 	]+a0,4\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+bar
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+0045a503[ 	]+lw[ 	]+a0,4\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_LOAD[ 	]+bar\+0x8
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+bar
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a023[ 	]+sw[ 	]+a0,0\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+bar\+0x8
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a223[ 	]+sw[ 	]+a0,4\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+bar
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
[ 	]+[0-9a-f]+:[ 	]+00a5a223[ 	]+sw[ 	]+a0,4\(a1\)
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_GOT_GPREL_STORE[ 	]+bar\+0x8
[ 	]+[0-9a-f]+:[ 	]+R_RISCV_RELAX[ 	]+.*
