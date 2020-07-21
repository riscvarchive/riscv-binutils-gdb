#name: Test dot relative expressions.
#source: dot-rel.s
#as: -march=rv32i
#objdump: -r

.*:[ 	]+file format elf32-.*

RELOCATION RECORDS FOR .+:
OFFSET[ 	]+TYPE[ 	]+VALUE[         ]+
0+000[ 	]+R_RISCV_32[ 	]+.+ \+0x0+10
0+004[ 	]+R_RISCV_64[ 	]+.+ \-0x0+10
