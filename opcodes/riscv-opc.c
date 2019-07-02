/* RISC-V opcode list
   Copyright (C) 2011-2019 Free Software Foundation, Inc.

   Contributed by Andrew Waterman (andrew@sifive.com).
   Based on MIPS target.

   This file is part of the GNU opcodes library.

   This library is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3, or (at your option)
   any later version.

   It is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; see the file COPYING3. If not,
   see <http://www.gnu.org/licenses/>.  */

#include "sysdep.h"
#include "opcode/riscv.h"
#include <stdio.h>

/* Register names used by gas and objdump.  */

const char * const riscv_gpr_names_numeric[NGPR] =
{
  "x0",   "x1",   "x2",   "x3",   "x4",   "x5",   "x6",   "x7",
  "x8",   "x9",   "x10",  "x11",  "x12",  "x13",  "x14",  "x15",
  "x16",  "x17",  "x18",  "x19",  "x20",  "x21",  "x22",  "x23",
  "x24",  "x25",  "x26",  "x27",  "x28",  "x29",  "x30",  "x31"
};

const char * const riscv_gpr_names_abi[NGPR] = {
  "zero", "ra", "sp",  "gp",  "tp", "t0",  "t1",  "t2",
  "s0",   "s1", "a0",  "a1",  "a2", "a3",  "a4",  "a5",
  "a6",   "a7", "s2",  "s3",  "s4", "s5",  "s6",  "s7",
  "s8",   "s9", "s10", "s11", "t3", "t4",  "t5",  "t6"
};

const char * const riscv_fpr_names_numeric[NFPR] =
{
  "f0",   "f1",   "f2",   "f3",   "f4",   "f5",   "f6",   "f7",
  "f8",   "f9",   "f10",  "f11",  "f12",  "f13",  "f14",  "f15",
  "f16",  "f17",  "f18",  "f19",  "f20",  "f21",  "f22",  "f23",
  "f24",  "f25",  "f26",  "f27",  "f28",  "f29",  "f30",  "f31"
};

const char * const riscv_fpr_names_abi[NFPR] = {
  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
};

const char * const riscv_vecr_names_numeric[NVECR] =
{
  "v0",   "v1",   "v2",   "v3",   "v4",   "v5",   "v6",   "v7",
  "v8",   "v9",   "v10",  "v11",  "v12",  "v13",  "v14",  "v15",
  "v16",  "v17",  "v18",  "v19",  "v20",  "v21",  "v22",  "v23",
  "v24",  "v25",  "v26",  "v27",  "v28",  "v29",  "v30",  "v31"
};

const char * const riscv_vecm_names_numeric[NVECM] =
{
  "v0.t"
};

/* The order of overloaded instructions matters.  Label arguments and
   register arguments look the same. Instructions that can have either
   for arguments must apear in the correct order in this table for the
   assembler to pick the right one. In other words, entries with
   immediate operands must apear after the same instruction with
   registers.

   Because of the lookup algorithm used, entries with the same opcode
   name must be contiguous.  */

#define MASK_RS1 (OP_MASK_RS1 << OP_SH_RS1)
#define MASK_RS2 (OP_MASK_RS2 << OP_SH_RS2)
#define MASK_RD (OP_MASK_RD << OP_SH_RD)
#define MASK_CRS2 (OP_MASK_CRS2 << OP_SH_CRS2)
#define MASK_IMM ENCODE_ITYPE_IMM (-1U)
#define MASK_RVC_IMM ENCODE_RVC_IMM (-1U)
#define MASK_UIMM ENCODE_UTYPE_IMM (-1U)
#define MASK_RM (OP_MASK_RM << OP_SH_RM)
#define MASK_PRED (OP_MASK_PRED << OP_SH_PRED)
#define MASK_SUCC (OP_MASK_SUCC << OP_SH_SUCC)
#define MASK_AQ (OP_MASK_AQ << OP_SH_AQ)
#define MASK_RL (OP_MASK_RL << OP_SH_RL)
#define MASK_AQRL (MASK_AQ | MASK_RL)
#define MASK_VD  (OP_MASK_VD << OP_SH_VD)
#define MASK_VS1 (OP_MASK_VS1 << OP_SH_VS1)
#define MASK_VS2 (OP_MASK_VS2 << OP_SH_VS2)

static int
match_opcode (const struct riscv_opcode *op, insn_t insn)
{
  return ((insn ^ op->match) & op->mask) == 0;
}

static int
match_never (const struct riscv_opcode *op ATTRIBUTE_UNUSED,
	     insn_t insn ATTRIBUTE_UNUSED)
{
  return 0;
}

static int
match_rs1_eq_rs2 (const struct riscv_opcode *op, insn_t insn)
{
  int rs1 = (insn & MASK_RS1) >> OP_SH_RS1;
  int rs2 = (insn & MASK_RS2) >> OP_SH_RS2;
  return match_opcode (op, insn) && rs1 == rs2;
}

static int
match_vs1_eq_vs2 (const struct riscv_opcode *op, insn_t insn)
{
  int vs1 = (insn & MASK_VS1) >> OP_SH_VS1;
  int vs2 = (insn & MASK_VS2) >> OP_SH_VS2;
  return match_opcode (op, insn) && vs1 == vs2;
}

static int
match_vd_eq_vs1_eq_vs2 (const struct riscv_opcode *op, insn_t insn)
{
  int vd =  (insn & MASK_VD) >> OP_SH_VD;
  int vs1 = (insn & MASK_VS1) >> OP_SH_VS1;
  int vs2 = (insn & MASK_VS2) >> OP_SH_VS2;
  return match_opcode (op, insn) && vd == vs1 && vs1 == vs2;
}

static int
match_rd_nonzero (const struct riscv_opcode *op, insn_t insn)
{
  return match_opcode (op, insn) && ((insn & MASK_RD) != 0);
}

static int
match_c_add (const struct riscv_opcode *op, insn_t insn)
{
  return match_rd_nonzero (op, insn) && ((insn & MASK_CRS2) != 0);
}

/* We don't allow mv zero,X to become a c.mv hint, so we need a separate
   matching function for this.  */

static int
match_c_add_with_hint (const struct riscv_opcode *op, insn_t insn)
{
  return match_opcode (op, insn) && ((insn & MASK_CRS2) != 0);
}

static int
match_c_nop (const struct riscv_opcode *op, insn_t insn)
{
  return (match_opcode (op, insn)
	  && (((insn & MASK_RD) >> OP_SH_RD) == 0));
}

static int
match_c_addi16sp (const struct riscv_opcode *op, insn_t insn)
{
  return (match_opcode (op, insn)
	  && (((insn & MASK_RD) >> OP_SH_RD) == 2)
	  && EXTRACT_RVC_ADDI16SP_IMM (insn) != 0);
}

static int
match_c_lui (const struct riscv_opcode *op, insn_t insn)
{
  return (match_rd_nonzero (op, insn)
	  && (((insn & MASK_RD) >> OP_SH_RD) != 2)
	  && EXTRACT_RVC_LUI_IMM (insn) != 0);
}

/* We don't allow lui zero,X to become a c.lui hint, so we need a separate
   matching function for this.  */

static int
match_c_lui_with_hint (const struct riscv_opcode *op, insn_t insn)
{
  return (match_opcode (op, insn)
	  && (((insn & MASK_RD) >> OP_SH_RD) != 2)
	  && EXTRACT_RVC_LUI_IMM (insn) != 0);
}

static int
match_c_addi4spn (const struct riscv_opcode *op, insn_t insn)
{
  return match_opcode (op, insn) && EXTRACT_RVC_ADDI4SPN_IMM (insn) != 0;
}

/* This requires a non-zero shift.  A zero rd is a hint, so is allowed.  */

static int
match_c_slli (const struct riscv_opcode *op, insn_t insn)
{
  return match_opcode (op, insn) && EXTRACT_RVC_IMM (insn) != 0;
}

/* This requires a non-zero rd, and a non-zero shift.  */

static int
match_slli_as_c_slli (const struct riscv_opcode *op, insn_t insn)
{
  return match_rd_nonzero (op, insn) && EXTRACT_RVC_IMM (insn) != 0;
}

/* This requires a zero shift.  A zero rd is a hint, so is allowed.  */

static int
match_c_slli64 (const struct riscv_opcode *op, insn_t insn)
{
  return match_opcode (op, insn) && EXTRACT_RVC_IMM (insn) == 0;
}

/* This is used for both srli and srai.  This requires a non-zero shift.
   A zero rd is not possible.  */

static int
match_srxi_as_c_srxi (const struct riscv_opcode *op, insn_t insn)
{
  return match_opcode (op, insn) && EXTRACT_RVC_IMM (insn) != 0;
}

const struct riscv_opcode riscv_opcodes[] =
{
/* name,     xlen, isa,   operands, match, mask, match_func, pinfo.  */
{"unimp",       0, {"C", 0},   "",  0, 0xffffU,  match_opcode, INSN_ALIAS },
{"unimp",       0, {"I", 0},   "",  MATCH_CSRRW | (CSR_CYCLE << OP_SH_CSR), 0xffffffffU,  match_opcode, 0 }, /* csrw cycle, x0 */
{"ebreak",      0, {"C", 0},   "",  MATCH_C_EBREAK, MASK_C_EBREAK, match_opcode, INSN_ALIAS },
{"ebreak",      0, {"I", 0},   "",    MATCH_EBREAK, MASK_EBREAK, match_opcode, 0 },
{"sbreak",      0, {"C", 0},   "",  MATCH_C_EBREAK, MASK_C_EBREAK, match_opcode, INSN_ALIAS },
{"sbreak",      0, {"I", 0},   "",    MATCH_EBREAK, MASK_EBREAK, match_opcode, INSN_ALIAS },
{"ret",         0, {"C", 0},   "",  MATCH_C_JR | (X_RA << OP_SH_RD), MASK_C_JR | MASK_RD, match_opcode, INSN_ALIAS|INSN_BRANCH },
{"ret",         0, {"I", 0},   "",  MATCH_JALR | (X_RA << OP_SH_RS1), MASK_JALR | MASK_RD | MASK_RS1 | MASK_IMM, match_opcode, INSN_ALIAS|INSN_BRANCH },
{"jr",          0, {"C", 0},   "d",  MATCH_C_JR, MASK_C_JR, match_rd_nonzero, INSN_ALIAS|INSN_BRANCH },
{"jr",          0, {"I", 0},   "s",  MATCH_JALR, MASK_JALR | MASK_RD | MASK_IMM, match_opcode, INSN_ALIAS|INSN_BRANCH },
{"jr",          0, {"I", 0},   "o(s)",  MATCH_JALR, MASK_JALR | MASK_RD, match_opcode, INSN_ALIAS|INSN_BRANCH },
{"jr",          0, {"I", 0},   "s,j",  MATCH_JALR, MASK_JALR | MASK_RD, match_opcode, INSN_ALIAS|INSN_BRANCH },
{"jalr",        0, {"C", 0},   "d",  MATCH_C_JALR, MASK_C_JALR, match_rd_nonzero, INSN_ALIAS|INSN_JSR },
{"jalr",        0, {"I", 0},   "s",  MATCH_JALR | (X_RA << OP_SH_RD), MASK_JALR | MASK_RD | MASK_IMM, match_opcode, INSN_ALIAS|INSN_JSR },
{"jalr",        0, {"I", 0},   "o(s)",  MATCH_JALR | (X_RA << OP_SH_RD), MASK_JALR | MASK_RD, match_opcode, INSN_ALIAS|INSN_JSR },
{"jalr",        0, {"I", 0},   "s,j",  MATCH_JALR | (X_RA << OP_SH_RD), MASK_JALR | MASK_RD, match_opcode, INSN_ALIAS|INSN_JSR },
{"jalr",        0, {"I", 0},   "d,s",  MATCH_JALR, MASK_JALR | MASK_IMM, match_opcode, INSN_ALIAS|INSN_JSR },
{"jalr",        0, {"I", 0},   "d,o(s)",  MATCH_JALR, MASK_JALR, match_opcode, INSN_JSR },
{"jalr",        0, {"I", 0},   "d,s,j",  MATCH_JALR, MASK_JALR, match_opcode, INSN_JSR },
{"j",           0, {"C", 0},   "Ca",  MATCH_C_J, MASK_C_J, match_opcode, INSN_ALIAS|INSN_BRANCH },
{"j",           0, {"I", 0},   "a",  MATCH_JAL, MASK_JAL | MASK_RD, match_opcode, INSN_ALIAS|INSN_BRANCH },
{"jal",         0, {"I", 0},   "d,a",  MATCH_JAL, MASK_JAL, match_opcode, INSN_JSR },
{"jal",        32, {"C", 0},   "Ca",  MATCH_C_JAL, MASK_C_JAL, match_opcode, INSN_ALIAS|INSN_JSR },
{"jal",         0, {"I", 0},   "a",  MATCH_JAL | (X_RA << OP_SH_RD), MASK_JAL | MASK_RD, match_opcode, INSN_ALIAS|INSN_JSR },
{"call",        0, {"I", 0},   "d,c", (X_T1 << OP_SH_RS1), (int) M_CALL,  match_never, INSN_MACRO },
{"call",        0, {"I", 0},   "c", (X_RA << OP_SH_RS1) | (X_RA << OP_SH_RD), (int) M_CALL,  match_never, INSN_MACRO },
{"tail",        0, {"I", 0},   "c", (X_T1 << OP_SH_RS1), (int) M_CALL,  match_never, INSN_MACRO },
{"jump",        0, {"I", 0},   "c,s", 0, (int) M_CALL,  match_never, INSN_MACRO },
{"nop",         0, {"C", 0},   "",  MATCH_C_ADDI, 0xffff, match_opcode, INSN_ALIAS },
{"nop",         0, {"I", 0},   "",         MATCH_ADDI, MASK_ADDI | MASK_RD | MASK_RS1 | MASK_IMM, match_opcode, INSN_ALIAS },
{"lui",         0, {"C", 0},   "d,Cu",  MATCH_C_LUI, MASK_C_LUI, match_c_lui, INSN_ALIAS },
{"lui",         0, {"I", 0},   "d,u",  MATCH_LUI, MASK_LUI, match_opcode, 0 },
{"li",          0, {"C", 0},   "d,Cv",  MATCH_C_LUI, MASK_C_LUI, match_c_lui, INSN_ALIAS },
{"li",          0, {"C", 0},   "d,Co",  MATCH_C_LI, MASK_C_LI, match_rd_nonzero, INSN_ALIAS },
{"li",          0, {"I", 0},   "d,j",      MATCH_ADDI, MASK_ADDI | MASK_RS1, match_opcode, INSN_ALIAS }, /* addi */
{"li",          0, {"I", 0},   "d,I",  0,    (int) M_LI,  match_never, INSN_MACRO },
{"mv",          0, {"C", 0},   "d,CV",  MATCH_C_MV, MASK_C_MV, match_c_add, INSN_ALIAS },
{"mv",          0, {"I", 0},   "d,s",  MATCH_ADDI, MASK_ADDI | MASK_IMM, match_opcode, INSN_ALIAS },
{"move",        0, {"C", 0},   "d,CV",  MATCH_C_MV, MASK_C_MV, match_c_add, INSN_ALIAS },
{"move",        0, {"I", 0},   "d,s",  MATCH_ADDI, MASK_ADDI | MASK_IMM, match_opcode, INSN_ALIAS },
{"andi",        0, {"C", 0},   "Cs,Cw,Co",  MATCH_C_ANDI, MASK_C_ANDI, match_opcode, INSN_ALIAS },
{"andi",        0, {"I", 0},   "d,s,j",  MATCH_ANDI, MASK_ANDI, match_opcode, 0 },
{"and",         0, {"C", 0},   "Cs,Cw,Ct",  MATCH_C_AND, MASK_C_AND, match_opcode, INSN_ALIAS },
{"and",         0, {"C", 0},   "Cs,Ct,Cw",  MATCH_C_AND, MASK_C_AND, match_opcode, INSN_ALIAS },
{"and",         0, {"C", 0},   "Cs,Cw,Co",  MATCH_C_ANDI, MASK_C_ANDI, match_opcode, INSN_ALIAS },
{"and",         0, {"I", 0},   "d,s,t",  MATCH_AND, MASK_AND, match_opcode, 0 },
{"and",         0, {"I", 0},   "d,s,j",  MATCH_ANDI, MASK_ANDI, match_opcode, INSN_ALIAS },
{"beqz",        0, {"C", 0},   "Cs,Cp",  MATCH_C_BEQZ, MASK_C_BEQZ, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"beqz",        0, {"I", 0},   "s,p",  MATCH_BEQ, MASK_BEQ | MASK_RS2, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"beq",         0, {"I", 0},   "s,t,p",  MATCH_BEQ, MASK_BEQ, match_opcode, INSN_CONDBRANCH },
{"blez",        0, {"I", 0},   "t,p",  MATCH_BGE, MASK_BGE | MASK_RS1, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bgez",        0, {"I", 0},   "s,p",  MATCH_BGE, MASK_BGE | MASK_RS2, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bge",         0, {"I", 0},   "s,t,p",  MATCH_BGE, MASK_BGE, match_opcode, INSN_CONDBRANCH },
{"bgeu",        0, {"I", 0},   "s,t,p",  MATCH_BGEU, MASK_BGEU, match_opcode, INSN_CONDBRANCH },
{"ble",         0, {"I", 0},   "t,s,p",  MATCH_BGE, MASK_BGE, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bleu",        0, {"I", 0},   "t,s,p",  MATCH_BGEU, MASK_BGEU, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bltz",        0, {"I", 0},   "s,p",  MATCH_BLT, MASK_BLT | MASK_RS2, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bgtz",        0, {"I", 0},   "t,p",  MATCH_BLT, MASK_BLT | MASK_RS1, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"blt",         0, {"I", 0},   "s,t,p",  MATCH_BLT, MASK_BLT, match_opcode, INSN_CONDBRANCH },
{"bltu",        0, {"I", 0},   "s,t,p",  MATCH_BLTU, MASK_BLTU, match_opcode, INSN_CONDBRANCH },
{"bgt",         0, {"I", 0},   "t,s,p",  MATCH_BLT, MASK_BLT, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bgtu",        0, {"I", 0},   "t,s,p",  MATCH_BLTU, MASK_BLTU, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bnez",        0, {"C", 0},   "Cs,Cp",  MATCH_C_BNEZ, MASK_C_BNEZ, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bnez",        0, {"I", 0},   "s,p",  MATCH_BNE, MASK_BNE | MASK_RS2, match_opcode, INSN_ALIAS|INSN_CONDBRANCH },
{"bne",         0, {"I", 0},   "s,t,p",  MATCH_BNE, MASK_BNE, match_opcode, INSN_CONDBRANCH },
{"addi",        0, {"C", 0},   "Ct,Cc,CK", MATCH_C_ADDI4SPN, MASK_C_ADDI4SPN, match_c_addi4spn, INSN_ALIAS },
{"addi",        0, {"C", 0},   "d,CU,Cj",  MATCH_C_ADDI, MASK_C_ADDI, match_rd_nonzero, INSN_ALIAS },
{"addi",        0, {"C", 0},   "d,CU,z",    MATCH_C_NOP, MASK_C_ADDI | MASK_RVC_IMM, match_c_nop, INSN_ALIAS },
{"addi",        0, {"C", 0},   "Cc,Cc,CL", MATCH_C_ADDI16SP, MASK_C_ADDI16SP, match_c_addi16sp, INSN_ALIAS },
{"addi",        0, {"I", 0},   "d,s,j",  MATCH_ADDI, MASK_ADDI, match_opcode, 0 },
{"add",         0, {"C", 0},   "d,CU,CV",  MATCH_C_ADD, MASK_C_ADD, match_c_add, INSN_ALIAS },
{"add",         0, {"C", 0},   "d,CV,CU",  MATCH_C_ADD, MASK_C_ADD, match_c_add, INSN_ALIAS },
{"add",         0, {"C", 0},   "d,CU,Co",  MATCH_C_ADDI, MASK_C_ADDI, match_rd_nonzero, INSN_ALIAS },
{"add",         0, {"C", 0},   "Ct,Cc,CK", MATCH_C_ADDI4SPN, MASK_C_ADDI4SPN, match_c_addi4spn, INSN_ALIAS },
{"add",         0, {"C", 0},   "Cc,Cc,CL", MATCH_C_ADDI16SP, MASK_C_ADDI16SP, match_c_addi16sp, INSN_ALIAS },
{"add",         0, {"I", 0},   "d,s,t",  MATCH_ADD, MASK_ADD, match_opcode, 0 },
/* This is used for TLS, where the fourth arg is %tprel_add, to get a reloc
   applied to an add instruction, for relaxation to use.  */
{"add",         0, {"I", 0},   "d,s,t,1",MATCH_ADD, MASK_ADD, match_opcode, 0 },
{"add",         0, {"I", 0},   "d,s,j",  MATCH_ADDI, MASK_ADDI, match_opcode, INSN_ALIAS },
{"la",          0, {"I", 0},   "d,B",  0,    (int) M_LA,  match_never, INSN_MACRO },
{"lla",         0, {"I", 0},   "d,B",  0,    (int) M_LLA,  match_never, INSN_MACRO },
{"la.tls.gd",   0, {"I", 0},   "d,A",  0,    (int) M_LA_TLS_GD,  match_never, INSN_MACRO },
{"la.tls.ie",   0, {"I", 0},   "d,A",  0,    (int) M_LA_TLS_IE,  match_never, INSN_MACRO },
{"neg",         0, {"I", 0},   "d,t",  MATCH_SUB, MASK_SUB | MASK_RS1, match_opcode, INSN_ALIAS }, /* sub 0 */
{"slli",        0, {"C", 0},   "d,CU,C>",  MATCH_C_SLLI, MASK_C_SLLI, match_slli_as_c_slli, INSN_ALIAS },
{"slli",        0, {"I", 0},   "d,s,>",   MATCH_SLLI, MASK_SLLI, match_opcode, 0 },
{"sll",         0, {"C", 0},   "d,CU,C>",  MATCH_C_SLLI, MASK_C_SLLI, match_slli_as_c_slli, INSN_ALIAS },
{"sll",         0, {"I", 0},   "d,s,t",   MATCH_SLL, MASK_SLL, match_opcode, 0 },
{"sll",         0, {"I", 0},   "d,s,>",   MATCH_SLLI, MASK_SLLI, match_opcode, INSN_ALIAS },
{"srli",        0, {"C", 0},   "Cs,Cw,C>",  MATCH_C_SRLI, MASK_C_SRLI, match_srxi_as_c_srxi, INSN_ALIAS },
{"srli",        0, {"I", 0},   "d,s,>",   MATCH_SRLI, MASK_SRLI, match_opcode, 0 },
{"srl",         0, {"C", 0},   "Cs,Cw,C>",  MATCH_C_SRLI, MASK_C_SRLI, match_srxi_as_c_srxi, INSN_ALIAS },
{"srl",         0, {"I", 0},   "d,s,t",   MATCH_SRL, MASK_SRL, match_opcode, 0 },
{"srl",         0, {"I", 0},   "d,s,>",   MATCH_SRLI, MASK_SRLI, match_opcode, INSN_ALIAS },
{"srai",        0, {"C", 0},   "Cs,Cw,C>",  MATCH_C_SRAI, MASK_C_SRAI, match_srxi_as_c_srxi, INSN_ALIAS },
{"srai",        0, {"I", 0},   "d,s,>",   MATCH_SRAI, MASK_SRAI, match_opcode, 0 },
{"sra",         0, {"C", 0},   "Cs,Cw,C>",  MATCH_C_SRAI, MASK_C_SRAI, match_srxi_as_c_srxi, INSN_ALIAS },
{"sra",         0, {"I", 0},   "d,s,t",   MATCH_SRA, MASK_SRA, match_opcode, 0 },
{"sra",         0, {"I", 0},   "d,s,>",   MATCH_SRAI, MASK_SRAI, match_opcode, INSN_ALIAS },
{"sub",         0, {"C", 0},   "Cs,Cw,Ct",  MATCH_C_SUB, MASK_C_SUB, match_opcode, INSN_ALIAS },
{"sub",         0, {"I", 0},   "d,s,t",  MATCH_SUB, MASK_SUB, match_opcode, 0 },
{"lb",          0, {"I", 0},   "d,o(s)",  MATCH_LB, MASK_LB, match_opcode, INSN_DREF|INSN_1_BYTE },
{"lb",          0, {"I", 0},   "d,A",  0, (int) M_LB, match_never, INSN_MACRO },
{"lbu",         0, {"I", 0},   "d,o(s)",  MATCH_LBU, MASK_LBU, match_opcode, INSN_DREF|INSN_1_BYTE },
{"lbu",         0, {"I", 0},   "d,A",  0, (int) M_LBU, match_never, INSN_MACRO },
{"lh",          0, {"I", 0},   "d,o(s)",  MATCH_LH, MASK_LH, match_opcode, INSN_DREF|INSN_2_BYTE },
{"lh",          0, {"I", 0},   "d,A",  0, (int) M_LH, match_never, INSN_MACRO },
{"lhu",         0, {"I", 0},   "d,o(s)",  MATCH_LHU, MASK_LHU, match_opcode, INSN_DREF|INSN_2_BYTE },
{"lhu",         0, {"I", 0},   "d,A",  0, (int) M_LHU, match_never, INSN_MACRO },
{"lw",          0, {"C", 0},   "d,Cm(Cc)",  MATCH_C_LWSP, MASK_C_LWSP, match_rd_nonzero, INSN_ALIAS|INSN_DREF|INSN_4_BYTE },
{"lw",          0, {"C", 0},   "Ct,Ck(Cs)",  MATCH_C_LW, MASK_C_LW, match_opcode, INSN_ALIAS|INSN_DREF|INSN_4_BYTE },
{"lw",          0, {"I", 0},   "d,o(s)",  MATCH_LW, MASK_LW, match_opcode, INSN_DREF|INSN_4_BYTE },
{"lw",          0, {"I", 0},   "d,A",  0, (int) M_LW, match_never, INSN_MACRO },
{"not",         0, {"I", 0},   "d,s",  MATCH_XORI | MASK_IMM, MASK_XORI | MASK_IMM, match_opcode, INSN_ALIAS },
{"ori",         0, {"I", 0},   "d,s,j",  MATCH_ORI, MASK_ORI, match_opcode, 0 },
{"or",          0, {"C", 0},   "Cs,Cw,Ct",  MATCH_C_OR, MASK_C_OR, match_opcode, INSN_ALIAS },
{"or",          0, {"C", 0},   "Cs,Ct,Cw",  MATCH_C_OR, MASK_C_OR, match_opcode, INSN_ALIAS },
{"or",          0, {"I", 0},   "d,s,t",  MATCH_OR, MASK_OR, match_opcode, 0 },
{"or",          0, {"I", 0},   "d,s,j",  MATCH_ORI, MASK_ORI, match_opcode, INSN_ALIAS },
{"auipc",       0, {"I", 0},   "d,u",  MATCH_AUIPC, MASK_AUIPC, match_opcode, 0 },
{"seqz",        0, {"I", 0},   "d,s",  MATCH_SLTIU | ENCODE_ITYPE_IMM (1), MASK_SLTIU | MASK_IMM, match_opcode, INSN_ALIAS },
{"snez",        0, {"I", 0},   "d,t",  MATCH_SLTU, MASK_SLTU | MASK_RS1, match_opcode, INSN_ALIAS },
{"sltz",        0, {"I", 0},   "d,s",  MATCH_SLT, MASK_SLT | MASK_RS2, match_opcode, INSN_ALIAS },
{"sgtz",        0, {"I", 0},   "d,t",  MATCH_SLT, MASK_SLT | MASK_RS1, match_opcode, INSN_ALIAS },
{"slti",        0, {"I", 0},   "d,s,j",  MATCH_SLTI, MASK_SLTI, match_opcode, 0 },
{"slt",         0, {"I", 0},   "d,s,t",  MATCH_SLT, MASK_SLT, match_opcode, 0 },
{"slt",         0, {"I", 0},   "d,s,j",  MATCH_SLTI, MASK_SLTI, match_opcode, INSN_ALIAS },
{"sltiu",       0, {"I", 0},   "d,s,j",  MATCH_SLTIU, MASK_SLTIU, match_opcode, 0 },
{"sltu",        0, {"I", 0},   "d,s,t",  MATCH_SLTU, MASK_SLTU, match_opcode, 0 },
{"sltu",        0, {"I", 0},   "d,s,j",  MATCH_SLTIU, MASK_SLTIU, match_opcode, INSN_ALIAS },
{"sgt",         0, {"I", 0},   "d,t,s",  MATCH_SLT, MASK_SLT, match_opcode, INSN_ALIAS },
{"sgtu",        0, {"I", 0},   "d,t,s",  MATCH_SLTU, MASK_SLTU, match_opcode, INSN_ALIAS },
{"sb",          0, {"I", 0},   "t,q(s)",  MATCH_SB, MASK_SB, match_opcode, INSN_DREF|INSN_1_BYTE },
{"sb",          0, {"I", 0},   "t,A,s",  0, (int) M_SB, match_never, INSN_MACRO },
{"sh",          0, {"I", 0},   "t,q(s)",  MATCH_SH, MASK_SH, match_opcode, INSN_DREF|INSN_2_BYTE },
{"sh",          0, {"I", 0},   "t,A,s",  0, (int) M_SH, match_never, INSN_MACRO },
{"sw",          0, {"C", 0},   "CV,CM(Cc)",  MATCH_C_SWSP, MASK_C_SWSP, match_opcode, INSN_ALIAS|INSN_DREF|INSN_4_BYTE },
{"sw",          0, {"C", 0},   "Ct,Ck(Cs)",  MATCH_C_SW, MASK_C_SW, match_opcode, INSN_ALIAS|INSN_DREF|INSN_4_BYTE },
{"sw",          0, {"I", 0},   "t,q(s)",  MATCH_SW, MASK_SW, match_opcode, INSN_DREF|INSN_4_BYTE },
{"sw",          0, {"I", 0},   "t,A,s",  0, (int) M_SW, match_never, INSN_MACRO },
{"fence",       0, {"I", 0},   "",  MATCH_FENCE | MASK_PRED | MASK_SUCC, MASK_FENCE | MASK_RD | MASK_RS1 | MASK_IMM, match_opcode, INSN_ALIAS },
{"fence",       0, {"I", 0},   "P,Q",  MATCH_FENCE, MASK_FENCE | MASK_RD | MASK_RS1 | (MASK_IMM & ~MASK_PRED & ~MASK_SUCC), match_opcode, 0 },
{"fence.i",     0, {"I", 0},   "",  MATCH_FENCE_I, MASK_FENCE | MASK_RD | MASK_RS1 | MASK_IMM, match_opcode, 0 },
{"fence.tso",   0, {"I", 0},   "",  MATCH_FENCE_TSO, MASK_FENCE_TSO | MASK_RD | MASK_RS1, match_opcode, INSN_ALIAS },
{"rdcycle",     0, {"I", 0},   "d",  MATCH_RDCYCLE, MASK_RDCYCLE, match_opcode, INSN_ALIAS },
{"rdinstret",   0, {"I", 0},   "d",  MATCH_RDINSTRET, MASK_RDINSTRET, match_opcode, INSN_ALIAS },
{"rdtime",      0, {"I", 0},   "d",  MATCH_RDTIME, MASK_RDTIME, match_opcode, INSN_ALIAS },
{"rdcycleh",   32, {"I", 0},   "d",  MATCH_RDCYCLEH, MASK_RDCYCLEH, match_opcode, INSN_ALIAS },
{"rdinstreth", 32, {"I", 0},   "d",  MATCH_RDINSTRETH, MASK_RDINSTRETH, match_opcode, INSN_ALIAS },
{"rdtimeh",    32, {"I", 0},   "d",  MATCH_RDTIMEH, MASK_RDTIMEH, match_opcode, INSN_ALIAS },
{"ecall",       0, {"I", 0},   "",    MATCH_SCALL, MASK_SCALL, match_opcode, 0 },
{"scall",       0, {"I", 0},   "",    MATCH_SCALL, MASK_SCALL, match_opcode, 0 },
{"xori",        0, {"I", 0},   "d,s,j",  MATCH_XORI, MASK_XORI, match_opcode, 0 },
{"xor",         0, {"C", 0},   "Cs,Cw,Ct",  MATCH_C_XOR, MASK_C_XOR, match_opcode, INSN_ALIAS },
{"xor",         0, {"C", 0},   "Cs,Ct,Cw",  MATCH_C_XOR, MASK_C_XOR, match_opcode, INSN_ALIAS },
{"xor",         0, {"I", 0},   "d,s,t",  MATCH_XOR, MASK_XOR, match_opcode, 0 },
{"xor",         0, {"I", 0},   "d,s,j",  MATCH_XORI, MASK_XORI, match_opcode, INSN_ALIAS },
{"lwu",        64, {"I", 0}, "d,o(s)",  MATCH_LWU, MASK_LWU, match_opcode, INSN_DREF|INSN_4_BYTE },
{"lwu",        64, {"I", 0}, "d,A",  0, (int) M_LWU, match_never, INSN_MACRO },
{"ld",         64, {"C", 0}, "d,Cn(Cc)",  MATCH_C_LDSP, MASK_C_LDSP, match_rd_nonzero, INSN_ALIAS|INSN_DREF|INSN_8_BYTE },
{"ld",         64, {"C", 0}, "Ct,Cl(Cs)",  MATCH_C_LD, MASK_C_LD, match_opcode, INSN_ALIAS|INSN_DREF|INSN_8_BYTE },
{"ld",         64, {"I", 0}, "d,o(s)", MATCH_LD, MASK_LD, match_opcode, INSN_DREF|INSN_8_BYTE },
{"ld",         64, {"I", 0}, "d,A",  0, (int) M_LD, match_never, INSN_MACRO },
{"sd",         64, {"C", 0}, "CV,CN(Cc)",  MATCH_C_SDSP, MASK_C_SDSP, match_opcode, INSN_ALIAS|INSN_DREF|INSN_8_BYTE },
{"sd",         64, {"C", 0}, "Ct,Cl(Cs)",  MATCH_C_SD, MASK_C_SD, match_opcode, INSN_ALIAS|INSN_DREF|INSN_8_BYTE },
{"sd",         64, {"I", 0}, "t,q(s)",  MATCH_SD, MASK_SD, match_opcode, INSN_DREF|INSN_8_BYTE },
{"sd",         64, {"I", 0}, "t,A,s",  0, (int) M_SD, match_never, INSN_MACRO },
{"sext.w",     64, {"C", 0}, "d,CU",  MATCH_C_ADDIW, MASK_C_ADDIW | MASK_RVC_IMM, match_rd_nonzero, INSN_ALIAS },
{"sext.w",     64, {"I", 0}, "d,s",  MATCH_ADDIW, MASK_ADDIW | MASK_IMM, match_opcode, INSN_ALIAS },
{"addiw",      64, {"C", 0}, "d,CU,Co",  MATCH_C_ADDIW, MASK_C_ADDIW, match_rd_nonzero, INSN_ALIAS },
{"addiw",      64, {"I", 0}, "d,s,j",  MATCH_ADDIW, MASK_ADDIW, match_opcode, 0 },
{"addw",       64, {"C", 0}, "Cs,Cw,Ct",  MATCH_C_ADDW, MASK_C_ADDW, match_opcode, INSN_ALIAS },
{"addw",       64, {"C", 0}, "Cs,Ct,Cw",  MATCH_C_ADDW, MASK_C_ADDW, match_opcode, INSN_ALIAS },
{"addw",       64, {"C", 0}, "d,CU,Co",  MATCH_C_ADDIW, MASK_C_ADDIW, match_rd_nonzero, INSN_ALIAS },
{"addw",       64, {"I", 0}, "d,s,t",  MATCH_ADDW, MASK_ADDW, match_opcode, 0 },
{"addw",       64, {"I", 0}, "d,s,j",  MATCH_ADDIW, MASK_ADDIW, match_opcode, INSN_ALIAS },
{"negw",       64, {"I", 0}, "d,t",  MATCH_SUBW, MASK_SUBW | MASK_RS1, match_opcode, INSN_ALIAS }, /* sub 0 */
{"slliw",      64, {"I", 0}, "d,s,<",   MATCH_SLLIW, MASK_SLLIW, match_opcode, 0 },
{"sllw",       64, {"I", 0}, "d,s,t",   MATCH_SLLW, MASK_SLLW, match_opcode, 0 },
{"sllw",       64, {"I", 0}, "d,s,<",   MATCH_SLLIW, MASK_SLLIW, match_opcode, INSN_ALIAS },
{"srliw",      64, {"I", 0}, "d,s,<",   MATCH_SRLIW, MASK_SRLIW, match_opcode, 0 },
{"srlw",       64, {"I", 0}, "d,s,t",   MATCH_SRLW, MASK_SRLW, match_opcode, 0 },
{"srlw",       64, {"I", 0}, "d,s,<",   MATCH_SRLIW, MASK_SRLIW, match_opcode, INSN_ALIAS },
{"sraiw",      64, {"I", 0}, "d,s,<",   MATCH_SRAIW, MASK_SRAIW, match_opcode, 0 },
{"sraw",       64, {"I", 0}, "d,s,t",   MATCH_SRAW, MASK_SRAW, match_opcode, 0 },
{"sraw",       64, {"I", 0}, "d,s,<",   MATCH_SRAIW, MASK_SRAIW, match_opcode, INSN_ALIAS },
{"subw",       64, {"C", 0}, "Cs,Cw,Ct",  MATCH_C_SUBW, MASK_C_SUBW, match_opcode, INSN_ALIAS },
{"subw",       64, {"I", 0}, "d,s,t",  MATCH_SUBW, MASK_SUBW, match_opcode, 0 },

/* Atomic memory operation instruction subset */
{"lr.w",         0, {"A", 0},   "d,0(s)",    MATCH_LR_W, MASK_LR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"sc.w",         0, {"A", 0},   "d,t,0(s)",  MATCH_SC_W, MASK_SC_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoadd.w",     0, {"A", 0},   "d,t,0(s)",  MATCH_AMOADD_W, MASK_AMOADD_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoswap.w",    0, {"A", 0},   "d,t,0(s)",  MATCH_AMOSWAP_W, MASK_AMOSWAP_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoand.w",     0, {"A", 0},   "d,t,0(s)",  MATCH_AMOAND_W, MASK_AMOAND_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoor.w",      0, {"A", 0},   "d,t,0(s)",  MATCH_AMOOR_W, MASK_AMOOR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoxor.w",     0, {"A", 0},   "d,t,0(s)",  MATCH_AMOXOR_W, MASK_AMOXOR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomax.w",     0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMAX_W, MASK_AMOMAX_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomaxu.w",    0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMAXU_W, MASK_AMOMAXU_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomin.w",     0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMIN_W, MASK_AMOMIN_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amominu.w",    0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMINU_W, MASK_AMOMINU_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"lr.w.aq",      0, {"A", 0},   "d,0(s)",    MATCH_LR_W | MASK_AQ, MASK_LR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"sc.w.aq",      0, {"A", 0},   "d,t,0(s)",  MATCH_SC_W | MASK_AQ, MASK_SC_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoadd.w.aq",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOADD_W | MASK_AQ, MASK_AMOADD_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoswap.w.aq", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOSWAP_W | MASK_AQ, MASK_AMOSWAP_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoand.w.aq",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOAND_W | MASK_AQ, MASK_AMOAND_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoor.w.aq",   0, {"A", 0},   "d,t,0(s)",  MATCH_AMOOR_W | MASK_AQ, MASK_AMOOR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoxor.w.aq",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOXOR_W | MASK_AQ, MASK_AMOXOR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomax.w.aq",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMAX_W | MASK_AQ, MASK_AMOMAX_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomaxu.w.aq", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMAXU_W | MASK_AQ, MASK_AMOMAXU_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomin.w.aq",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMIN_W | MASK_AQ, MASK_AMOMIN_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amominu.w.aq", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMINU_W | MASK_AQ, MASK_AMOMINU_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"lr.w.rl",      0, {"A", 0},   "d,0(s)",    MATCH_LR_W | MASK_RL, MASK_LR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"sc.w.rl",      0, {"A", 0},   "d,t,0(s)",  MATCH_SC_W | MASK_RL, MASK_SC_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoadd.w.rl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOADD_W | MASK_RL, MASK_AMOADD_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoswap.w.rl", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOSWAP_W | MASK_RL, MASK_AMOSWAP_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoand.w.rl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOAND_W | MASK_RL, MASK_AMOAND_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoor.w.rl",   0, {"A", 0},   "d,t,0(s)",  MATCH_AMOOR_W | MASK_RL, MASK_AMOOR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoxor.w.rl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOXOR_W | MASK_RL, MASK_AMOXOR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomax.w.rl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMAX_W | MASK_RL, MASK_AMOMAX_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomaxu.w.rl", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMAXU_W | MASK_RL, MASK_AMOMAXU_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomin.w.rl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMIN_W | MASK_RL, MASK_AMOMIN_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amominu.w.rl", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMINU_W | MASK_RL, MASK_AMOMINU_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"lr.w.aqrl",    0, {"A", 0},   "d,0(s)",    MATCH_LR_W | MASK_AQRL, MASK_LR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"sc.w.aqrl",    0, {"A", 0},   "d,t,0(s)",  MATCH_SC_W | MASK_AQRL, MASK_SC_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoadd.w.aqrl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOADD_W | MASK_AQRL, MASK_AMOADD_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoswap.w.aqrl", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOSWAP_W | MASK_AQRL, MASK_AMOSWAP_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoand.w.aqrl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOAND_W | MASK_AQRL, MASK_AMOAND_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoor.w.aqrl",   0, {"A", 0},   "d,t,0(s)",  MATCH_AMOOR_W | MASK_AQRL, MASK_AMOOR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amoxor.w.aqrl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOXOR_W | MASK_AQRL, MASK_AMOXOR_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomax.w.aqrl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMAX_W | MASK_AQRL, MASK_AMOMAX_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomaxu.w.aqrl", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMAXU_W | MASK_AQRL, MASK_AMOMAXU_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amomin.w.aqrl",  0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMIN_W | MASK_AQRL, MASK_AMOMIN_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"amominu.w.aqrl", 0, {"A", 0},   "d,t,0(s)",  MATCH_AMOMINU_W | MASK_AQRL, MASK_AMOMINU_W | MASK_AQRL, match_opcode, INSN_DREF|INSN_4_BYTE },
{"lr.d",         64, {"A", 0} , "d,0(s)",    MATCH_LR_D, MASK_LR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"sc.d",         64, {"A", 0} , "d,t,0(s)",  MATCH_SC_D, MASK_SC_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoadd.d",     64, {"A", 0} , "d,t,0(s)",  MATCH_AMOADD_D, MASK_AMOADD_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoswap.d",    64, {"A", 0} , "d,t,0(s)",  MATCH_AMOSWAP_D, MASK_AMOSWAP_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoand.d",     64, {"A", 0} , "d,t,0(s)",  MATCH_AMOAND_D, MASK_AMOAND_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoor.d",      64, {"A", 0} , "d,t,0(s)",  MATCH_AMOOR_D, MASK_AMOOR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoxor.d",     64, {"A", 0} , "d,t,0(s)",  MATCH_AMOXOR_D, MASK_AMOXOR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomax.d",     64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMAX_D, MASK_AMOMAX_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomaxu.d",    64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMAXU_D, MASK_AMOMAXU_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomin.d",     64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMIN_D, MASK_AMOMIN_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amominu.d",    64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMINU_D, MASK_AMOMINU_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"lr.d.aq",      64, {"A", 0} , "d,0(s)",    MATCH_LR_D | MASK_AQ, MASK_LR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"sc.d.aq",      64, {"A", 0} , "d,t,0(s)",  MATCH_SC_D | MASK_AQ, MASK_SC_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoadd.d.aq",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOADD_D | MASK_AQ, MASK_AMOADD_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoswap.d.aq", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOSWAP_D | MASK_AQ, MASK_AMOSWAP_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoand.d.aq",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOAND_D | MASK_AQ, MASK_AMOAND_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoor.d.aq",   64, {"A", 0} , "d,t,0(s)",  MATCH_AMOOR_D | MASK_AQ, MASK_AMOOR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoxor.d.aq",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOXOR_D | MASK_AQ, MASK_AMOXOR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomax.d.aq",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMAX_D | MASK_AQ, MASK_AMOMAX_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomaxu.d.aq", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMAXU_D | MASK_AQ, MASK_AMOMAXU_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomin.d.aq",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMIN_D | MASK_AQ, MASK_AMOMIN_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amominu.d.aq", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMINU_D | MASK_AQ, MASK_AMOMINU_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"lr.d.rl",      64, {"A", 0} , "d,0(s)",    MATCH_LR_D | MASK_RL, MASK_LR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"sc.d.rl",      64, {"A", 0} , "d,t,0(s)",  MATCH_SC_D | MASK_RL, MASK_SC_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoadd.d.rl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOADD_D | MASK_RL, MASK_AMOADD_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoswap.d.rl", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOSWAP_D | MASK_RL, MASK_AMOSWAP_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoand.d.rl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOAND_D | MASK_RL, MASK_AMOAND_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoor.d.rl",   64, {"A", 0} , "d,t,0(s)",  MATCH_AMOOR_D | MASK_RL, MASK_AMOOR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoxor.d.rl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOXOR_D | MASK_RL, MASK_AMOXOR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomax.d.rl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMAX_D | MASK_RL, MASK_AMOMAX_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomaxu.d.rl", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMAXU_D | MASK_RL, MASK_AMOMAXU_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomin.d.rl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMIN_D | MASK_RL, MASK_AMOMIN_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amominu.d.rl", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMINU_D | MASK_RL, MASK_AMOMINU_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"lr.d.aqrl",    64, {"A", 0} , "d,0(s)",    MATCH_LR_D | MASK_AQRL, MASK_LR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"sc.d.aqrl",    64, {"A", 0} , "d,t,0(s)",  MATCH_SC_D | MASK_AQRL, MASK_SC_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoadd.d.aqrl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOADD_D | MASK_AQRL, MASK_AMOADD_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoswap.d.aqrl", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOSWAP_D | MASK_AQRL, MASK_AMOSWAP_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoand.d.aqrl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOAND_D | MASK_AQRL, MASK_AMOAND_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoor.d.aqrl",   64, {"A", 0} , "d,t,0(s)",  MATCH_AMOOR_D | MASK_AQRL, MASK_AMOOR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amoxor.d.aqrl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOXOR_D | MASK_AQRL, MASK_AMOXOR_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomax.d.aqrl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMAX_D | MASK_AQRL, MASK_AMOMAX_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomaxu.d.aqrl", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMAXU_D | MASK_AQRL, MASK_AMOMAXU_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amomin.d.aqrl",  64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMIN_D | MASK_AQRL, MASK_AMOMIN_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },
{"amominu.d.aqrl", 64, {"A", 0} , "d,t,0(s)",  MATCH_AMOMINU_D | MASK_AQRL, MASK_AMOMINU_D | MASK_AQRL, match_opcode, INSN_DREF|INSN_8_BYTE },

/* Multiply/Divide instruction subset */
{"mul",       0, {"M", 0},   "d,s,t",  MATCH_MUL, MASK_MUL, match_opcode, 0 },
{"mulh",      0, {"M", 0},   "d,s,t",  MATCH_MULH, MASK_MULH, match_opcode, 0 },
{"mulhu",     0, {"M", 0},   "d,s,t",  MATCH_MULHU, MASK_MULHU, match_opcode, 0 },
{"mulhsu",    0, {"M", 0},   "d,s,t",  MATCH_MULHSU, MASK_MULHSU, match_opcode, 0 },
{"div",       0, {"M", 0},   "d,s,t",  MATCH_DIV, MASK_DIV, match_opcode, 0 },
{"divu",      0, {"M", 0},   "d,s,t",  MATCH_DIVU, MASK_DIVU, match_opcode, 0 },
{"rem",       0, {"M", 0},   "d,s,t",  MATCH_REM, MASK_REM, match_opcode, 0 },
{"remu",      0, {"M", 0},   "d,s,t",  MATCH_REMU, MASK_REMU, match_opcode, 0 },
{"mulw",     64, {"M", 0}, "d,s,t",  MATCH_MULW, MASK_MULW, match_opcode, 0 },
{"divw",     64, {"M", 0}, "d,s,t",  MATCH_DIVW, MASK_DIVW, match_opcode, 0 },
{"divuw",    64, {"M", 0}, "d,s,t",  MATCH_DIVUW, MASK_DIVUW, match_opcode, 0 },
{"remw",     64, {"M", 0}, "d,s,t",  MATCH_REMW, MASK_REMW, match_opcode, 0 },
{"remuw",    64, {"M", 0}, "d,s,t",  MATCH_REMUW, MASK_REMUW, match_opcode, 0 },

/* Single-precision floating-point instruction subset */
{"frsr",      0, {"F", 0},   "d",  MATCH_FRCSR, MASK_FRCSR, match_opcode, 0 },
{"fssr",      0, {"F", 0},   "s",  MATCH_FSCSR, MASK_FSCSR | MASK_RD, match_opcode, 0 },
{"fssr",      0, {"F", 0},   "d,s",  MATCH_FSCSR, MASK_FSCSR, match_opcode, 0 },
{"frcsr",     0, {"F", 0},   "d",  MATCH_FRCSR, MASK_FRCSR, match_opcode, 0 },
{"fscsr",     0, {"F", 0},   "s",  MATCH_FSCSR, MASK_FSCSR | MASK_RD, match_opcode, 0 },
{"fscsr",     0, {"F", 0},   "d,s",  MATCH_FSCSR, MASK_FSCSR, match_opcode, 0 },
{"frrm",      0, {"F", 0},   "d",  MATCH_FRRM, MASK_FRRM, match_opcode, 0 },
{"fsrm",      0, {"F", 0},   "s",  MATCH_FSRM, MASK_FSRM | MASK_RD, match_opcode, 0 },
{"fsrm",      0, {"F", 0},   "d,s",  MATCH_FSRM, MASK_FSRM, match_opcode, 0 },
{"fsrmi",     0, {"F", 0},   "d,Z",  MATCH_FSRMI, MASK_FSRMI, match_opcode, 0 },
{"fsrmi",     0, {"F", 0},   "Z",  MATCH_FSRMI, MASK_FSRMI | MASK_RD, match_opcode, 0 },
{"frflags",   0, {"F", 0},   "d",  MATCH_FRFLAGS, MASK_FRFLAGS, match_opcode, 0 },
{"fsflags",   0, {"F", 0},   "s",  MATCH_FSFLAGS, MASK_FSFLAGS | MASK_RD, match_opcode, 0 },
{"fsflags",   0, {"F", 0},   "d,s",  MATCH_FSFLAGS, MASK_FSFLAGS, match_opcode, 0 },
{"fsflagsi",  0, {"F", 0},   "d,Z",  MATCH_FSFLAGSI, MASK_FSFLAGSI, match_opcode, 0 },
{"fsflagsi",  0, {"F", 0},   "Z",  MATCH_FSFLAGSI, MASK_FSFLAGSI | MASK_RD, match_opcode, 0 },
{"flw",      32, {"F", "C", 0}, "D,Cm(Cc)",  MATCH_C_FLWSP, MASK_C_FLWSP, match_opcode, INSN_ALIAS|INSN_DREF|INSN_4_BYTE },
{"flw",      32, {"F", "C", 0}, "CD,Ck(Cs)",  MATCH_C_FLW, MASK_C_FLW, match_opcode, INSN_ALIAS|INSN_DREF|INSN_4_BYTE },
{"flw",       0, {"F", 0},   "D,o(s)",  MATCH_FLW, MASK_FLW, match_opcode, INSN_DREF|INSN_4_BYTE },
{"flw",       0, {"F", 0},   "D,A,s",  0, (int) M_FLW, match_never, INSN_MACRO },
{"fsw",      32, {"F", "C", 0}, "CT,CM(Cc)",  MATCH_C_FSWSP, MASK_C_FSWSP, match_opcode, INSN_ALIAS|INSN_DREF|INSN_4_BYTE },
{"fsw",      32, {"F", "C", 0}, "CD,Ck(Cs)",  MATCH_C_FSW, MASK_C_FSW, match_opcode, INSN_ALIAS|INSN_DREF|INSN_4_BYTE },
{"fsw",       0, {"F", 0},   "T,q(s)",  MATCH_FSW, MASK_FSW, match_opcode, INSN_DREF|INSN_4_BYTE },
{"fsw",       0, {"F", 0},   "T,A,s",  0, (int) M_FSW, match_never, INSN_MACRO },

{"fmv.x.w",    0, {"F", 0},   "d,S",  MATCH_FMV_X_S, MASK_FMV_X_S, match_opcode, 0 },
{"fmv.w.x",    0, {"F", 0},   "D,s",  MATCH_FMV_S_X, MASK_FMV_S_X, match_opcode, 0 },

{"fmv.x.s",    0, {"F", 0},   "d,S",  MATCH_FMV_X_S, MASK_FMV_X_S, match_opcode, 0 },
{"fmv.s.x",    0, {"F", 0},   "D,s",  MATCH_FMV_S_X, MASK_FMV_S_X, match_opcode, 0 },

{"fmv.s",      0, {"F", 0},   "D,U",  MATCH_FSGNJ_S, MASK_FSGNJ_S, match_rs1_eq_rs2, INSN_ALIAS },
{"fneg.s",     0, {"F", 0},   "D,U",  MATCH_FSGNJN_S, MASK_FSGNJN_S, match_rs1_eq_rs2, INSN_ALIAS },
{"fabs.s",     0, {"F", 0},   "D,U",  MATCH_FSGNJX_S, MASK_FSGNJX_S, match_rs1_eq_rs2, INSN_ALIAS },
{"fsgnj.s",    0, {"F", 0},   "D,S,T",  MATCH_FSGNJ_S, MASK_FSGNJ_S, match_opcode, 0 },
{"fsgnjn.s",   0, {"F", 0},   "D,S,T",  MATCH_FSGNJN_S, MASK_FSGNJN_S, match_opcode, 0 },
{"fsgnjx.s",   0, {"F", 0},   "D,S,T",  MATCH_FSGNJX_S, MASK_FSGNJX_S, match_opcode, 0 },
{"fadd.s",     0, {"F", 0},   "D,S,T",  MATCH_FADD_S | MASK_RM, MASK_FADD_S | MASK_RM, match_opcode, 0 },
{"fadd.s",     0, {"F", 0},   "D,S,T,m",  MATCH_FADD_S, MASK_FADD_S, match_opcode, 0 },
{"fsub.s",     0, {"F", 0},   "D,S,T",  MATCH_FSUB_S | MASK_RM, MASK_FSUB_S | MASK_RM, match_opcode, 0 },
{"fsub.s",     0, {"F", 0},   "D,S,T,m",  MATCH_FSUB_S, MASK_FSUB_S, match_opcode, 0 },
{"fmul.s",     0, {"F", 0},   "D,S,T",  MATCH_FMUL_S | MASK_RM, MASK_FMUL_S | MASK_RM, match_opcode, 0 },
{"fmul.s",     0, {"F", 0},   "D,S,T,m",  MATCH_FMUL_S, MASK_FMUL_S, match_opcode, 0 },
{"fdiv.s",     0, {"F", 0},   "D,S,T",  MATCH_FDIV_S | MASK_RM, MASK_FDIV_S | MASK_RM, match_opcode, 0 },
{"fdiv.s",     0, {"F", 0},   "D,S,T,m",  MATCH_FDIV_S, MASK_FDIV_S, match_opcode, 0 },
{"fsqrt.s",    0, {"F", 0},   "D,S",  MATCH_FSQRT_S | MASK_RM, MASK_FSQRT_S | MASK_RM, match_opcode, 0 },
{"fsqrt.s",    0, {"F", 0},   "D,S,m",  MATCH_FSQRT_S, MASK_FSQRT_S, match_opcode, 0 },
{"fmin.s",     0, {"F", 0},   "D,S,T",  MATCH_FMIN_S, MASK_FMIN_S, match_opcode, 0 },
{"fmax.s",     0, {"F", 0},   "D,S,T",  MATCH_FMAX_S, MASK_FMAX_S, match_opcode, 0 },
{"fmadd.s",    0, {"F", 0},   "D,S,T,R",  MATCH_FMADD_S | MASK_RM, MASK_FMADD_S | MASK_RM, match_opcode, 0 },
{"fmadd.s",    0, {"F", 0},   "D,S,T,R,m",  MATCH_FMADD_S, MASK_FMADD_S, match_opcode, 0 },
{"fnmadd.s",   0, {"F", 0},   "D,S,T,R",  MATCH_FNMADD_S | MASK_RM, MASK_FNMADD_S | MASK_RM, match_opcode, 0 },
{"fnmadd.s",   0, {"F", 0},   "D,S,T,R,m",  MATCH_FNMADD_S, MASK_FNMADD_S, match_opcode, 0 },
{"fmsub.s",    0, {"F", 0},   "D,S,T,R",  MATCH_FMSUB_S | MASK_RM, MASK_FMSUB_S | MASK_RM, match_opcode, 0 },
{"fmsub.s",    0, {"F", 0},   "D,S,T,R,m",  MATCH_FMSUB_S, MASK_FMSUB_S, match_opcode, 0 },
{"fnmsub.s",   0, {"F", 0},   "D,S,T,R",  MATCH_FNMSUB_S | MASK_RM, MASK_FNMSUB_S | MASK_RM, match_opcode, 0 },
{"fnmsub.s",   0, {"F", 0},   "D,S,T,R,m",  MATCH_FNMSUB_S, MASK_FNMSUB_S, match_opcode, 0 },
{"fcvt.w.s",   0, {"F", 0},   "d,S",  MATCH_FCVT_W_S | MASK_RM, MASK_FCVT_W_S | MASK_RM, match_opcode, 0 },
{"fcvt.w.s",   0, {"F", 0},   "d,S,m",  MATCH_FCVT_W_S, MASK_FCVT_W_S, match_opcode, 0 },
{"fcvt.wu.s",  0, {"F", 0},   "d,S",  MATCH_FCVT_WU_S | MASK_RM, MASK_FCVT_WU_S | MASK_RM, match_opcode, 0 },
{"fcvt.wu.s",  0, {"F", 0},   "d,S,m",  MATCH_FCVT_WU_S, MASK_FCVT_WU_S, match_opcode, 0 },
{"fcvt.s.w",   0, {"F", 0},   "D,s",  MATCH_FCVT_S_W | MASK_RM, MASK_FCVT_S_W | MASK_RM, match_opcode, 0 },
{"fcvt.s.w",   0, {"F", 0},   "D,s,m",  MATCH_FCVT_S_W, MASK_FCVT_S_W, match_opcode, 0 },
{"fcvt.s.wu",  0, {"F", 0},   "D,s",  MATCH_FCVT_S_WU | MASK_RM, MASK_FCVT_S_W | MASK_RM, match_opcode, 0 },
{"fcvt.s.wu",  0, {"F", 0},   "D,s,m",  MATCH_FCVT_S_WU, MASK_FCVT_S_WU, match_opcode, 0 },
{"fclass.s",   0, {"F", 0},   "d,S",  MATCH_FCLASS_S, MASK_FCLASS_S, match_opcode, 0 },
{"feq.s",      0, {"F", 0},   "d,S,T",    MATCH_FEQ_S, MASK_FEQ_S, match_opcode, 0 },
{"flt.s",      0, {"F", 0},   "d,S,T",    MATCH_FLT_S, MASK_FLT_S, match_opcode, 0 },
{"fle.s",      0, {"F", 0},   "d,S,T",    MATCH_FLE_S, MASK_FLE_S, match_opcode, 0 },
{"fgt.s",      0, {"F", 0},   "d,T,S",    MATCH_FLT_S, MASK_FLT_S, match_opcode, 0 },
{"fge.s",      0, {"F", 0},   "d,T,S",    MATCH_FLE_S, MASK_FLE_S, match_opcode, 0 },
{"fcvt.l.s",  64, {"F", 0}, "d,S",  MATCH_FCVT_L_S | MASK_RM, MASK_FCVT_L_S | MASK_RM, match_opcode, 0 },
{"fcvt.l.s",  64, {"F", 0}, "d,S,m",  MATCH_FCVT_L_S, MASK_FCVT_L_S, match_opcode, 0 },
{"fcvt.lu.s", 64, {"F", 0}, "d,S",  MATCH_FCVT_LU_S | MASK_RM, MASK_FCVT_LU_S | MASK_RM, match_opcode, 0 },
{"fcvt.lu.s", 64, {"F", 0}, "d,S,m",  MATCH_FCVT_LU_S, MASK_FCVT_LU_S, match_opcode, 0 },
{"fcvt.s.l",  64, {"F", 0}, "D,s",  MATCH_FCVT_S_L | MASK_RM, MASK_FCVT_S_L | MASK_RM, match_opcode, 0 },
{"fcvt.s.l",  64, {"F", 0}, "D,s,m",  MATCH_FCVT_S_L, MASK_FCVT_S_L, match_opcode, 0 },
{"fcvt.s.lu", 64, {"F", 0}, "D,s",  MATCH_FCVT_S_LU | MASK_RM, MASK_FCVT_S_L | MASK_RM, match_opcode, 0 },
{"fcvt.s.lu", 64, {"F", 0}, "D,s,m",  MATCH_FCVT_S_LU, MASK_FCVT_S_LU, match_opcode, 0 },

/* Double-precision floating-point instruction subset */
{"fld",        0, {"D", "C", 0},   "D,Cn(Cc)",  MATCH_C_FLDSP, MASK_C_FLDSP, match_opcode, INSN_ALIAS|INSN_DREF|INSN_8_BYTE },
{"fld",        0, {"D", "C", 0},   "CD,Cl(Cs)",  MATCH_C_FLD, MASK_C_FLD, match_opcode, INSN_ALIAS|INSN_DREF|INSN_8_BYTE },
{"fld",        0, {"D", 0},   "D,o(s)",  MATCH_FLD, MASK_FLD, match_opcode, INSN_DREF|INSN_8_BYTE },
{"fld",        0, {"D", 0},   "D,A,s",  0, (int) M_FLD, match_never, INSN_MACRO },
{"fsd",        0, {"D", "C", 0},   "CT,CN(Cc)",  MATCH_C_FSDSP, MASK_C_FSDSP, match_opcode, INSN_ALIAS|INSN_DREF|INSN_8_BYTE },
{"fsd",        0, {"D", "C", 0},   "CD,Cl(Cs)",  MATCH_C_FSD, MASK_C_FSD, match_opcode, INSN_ALIAS|INSN_DREF|INSN_8_BYTE },
{"fsd",        0, {"D", 0},   "T,q(s)",  MATCH_FSD, MASK_FSD, match_opcode, INSN_DREF|INSN_8_BYTE },
{"fsd",        0, {"D", 0},   "T,A,s",  0, (int) M_FSD, match_never, INSN_MACRO },
{"fmv.d",      0, {"D", 0},   "D,U",  MATCH_FSGNJ_D, MASK_FSGNJ_D, match_rs1_eq_rs2, INSN_ALIAS },
{"fneg.d",     0, {"D", 0},   "D,U",  MATCH_FSGNJN_D, MASK_FSGNJN_D, match_rs1_eq_rs2, INSN_ALIAS },
{"fabs.d",     0, {"D", 0},   "D,U",  MATCH_FSGNJX_D, MASK_FSGNJX_D, match_rs1_eq_rs2, INSN_ALIAS },
{"fsgnj.d",    0, {"D", 0},   "D,S,T",  MATCH_FSGNJ_D, MASK_FSGNJ_D, match_opcode, 0 },
{"fsgnjn.d",   0, {"D", 0},   "D,S,T",  MATCH_FSGNJN_D, MASK_FSGNJN_D, match_opcode, 0 },
{"fsgnjx.d",   0, {"D", 0},   "D,S,T",  MATCH_FSGNJX_D, MASK_FSGNJX_D, match_opcode, 0 },
{"fadd.d",     0, {"D", 0},   "D,S,T",  MATCH_FADD_D | MASK_RM, MASK_FADD_D | MASK_RM, match_opcode, 0 },
{"fadd.d",     0, {"D", 0},   "D,S,T,m",  MATCH_FADD_D, MASK_FADD_D, match_opcode, 0 },
{"fsub.d",     0, {"D", 0},   "D,S,T",  MATCH_FSUB_D | MASK_RM, MASK_FSUB_D | MASK_RM, match_opcode, 0 },
{"fsub.d",     0, {"D", 0},   "D,S,T,m",  MATCH_FSUB_D, MASK_FSUB_D, match_opcode, 0 },
{"fmul.d",     0, {"D", 0},   "D,S,T",  MATCH_FMUL_D | MASK_RM, MASK_FMUL_D | MASK_RM, match_opcode, 0 },
{"fmul.d",     0, {"D", 0},   "D,S,T,m",  MATCH_FMUL_D, MASK_FMUL_D, match_opcode, 0 },
{"fdiv.d",     0, {"D", 0},   "D,S,T",  MATCH_FDIV_D | MASK_RM, MASK_FDIV_D | MASK_RM, match_opcode, 0 },
{"fdiv.d",     0, {"D", 0},   "D,S,T,m",  MATCH_FDIV_D, MASK_FDIV_D, match_opcode, 0 },
{"fsqrt.d",    0, {"D", 0},   "D,S",  MATCH_FSQRT_D | MASK_RM, MASK_FSQRT_D | MASK_RM, match_opcode, 0 },
{"fsqrt.d",    0, {"D", 0},   "D,S,m",  MATCH_FSQRT_D, MASK_FSQRT_D, match_opcode, 0 },
{"fmin.d",     0, {"D", 0},   "D,S,T",  MATCH_FMIN_D, MASK_FMIN_D, match_opcode, 0 },
{"fmax.d",     0, {"D", 0},   "D,S,T",  MATCH_FMAX_D, MASK_FMAX_D, match_opcode, 0 },
{"fmadd.d",    0, {"D", 0},   "D,S,T,R",  MATCH_FMADD_D | MASK_RM, MASK_FMADD_D | MASK_RM, match_opcode, 0 },
{"fmadd.d",    0, {"D", 0},   "D,S,T,R,m",  MATCH_FMADD_D, MASK_FMADD_D, match_opcode, 0 },
{"fnmadd.d",   0, {"D", 0},   "D,S,T,R",  MATCH_FNMADD_D | MASK_RM, MASK_FNMADD_D | MASK_RM, match_opcode, 0 },
{"fnmadd.d",   0, {"D", 0},   "D,S,T,R,m",  MATCH_FNMADD_D, MASK_FNMADD_D, match_opcode, 0 },
{"fmsub.d",    0, {"D", 0},   "D,S,T,R",  MATCH_FMSUB_D | MASK_RM, MASK_FMSUB_D | MASK_RM, match_opcode, 0 },
{"fmsub.d",    0, {"D", 0},   "D,S,T,R,m",  MATCH_FMSUB_D, MASK_FMSUB_D, match_opcode, 0 },
{"fnmsub.d",   0, {"D", 0},   "D,S,T,R",  MATCH_FNMSUB_D | MASK_RM, MASK_FNMSUB_D | MASK_RM, match_opcode, 0 },
{"fnmsub.d",   0, {"D", 0},   "D,S,T,R,m",  MATCH_FNMSUB_D, MASK_FNMSUB_D, match_opcode, 0 },
{"fcvt.w.d",   0, {"D", 0},   "d,S",  MATCH_FCVT_W_D | MASK_RM, MASK_FCVT_W_D | MASK_RM, match_opcode, 0 },
{"fcvt.w.d",   0, {"D", 0},   "d,S,m",  MATCH_FCVT_W_D, MASK_FCVT_W_D, match_opcode, 0 },
{"fcvt.wu.d",  0, {"D", 0},   "d,S",  MATCH_FCVT_WU_D | MASK_RM, MASK_FCVT_WU_D | MASK_RM, match_opcode, 0 },
{"fcvt.wu.d",  0, {"D", 0},   "d,S,m",  MATCH_FCVT_WU_D, MASK_FCVT_WU_D, match_opcode, 0 },
{"fcvt.d.w",   0, {"D", 0},   "D,s",  MATCH_FCVT_D_W, MASK_FCVT_D_W | MASK_RM, match_opcode, 0 },
{"fcvt.d.wu",  0, {"D", 0},   "D,s",  MATCH_FCVT_D_WU, MASK_FCVT_D_WU | MASK_RM, match_opcode, 0 },
{"fcvt.d.s",   0, {"D", 0},   "D,S",  MATCH_FCVT_D_S, MASK_FCVT_D_S | MASK_RM, match_opcode, 0 },
{"fcvt.s.d",   0, {"D", 0},   "D,S",  MATCH_FCVT_S_D | MASK_RM, MASK_FCVT_S_D | MASK_RM, match_opcode, 0 },
{"fcvt.s.d",   0, {"D", 0},   "D,S,m",  MATCH_FCVT_S_D, MASK_FCVT_S_D, match_opcode, 0 },
{"fclass.d",   0, {"D", 0},   "d,S",  MATCH_FCLASS_D, MASK_FCLASS_D, match_opcode, 0 },
{"feq.d",      0, {"D", 0},   "d,S,T",    MATCH_FEQ_D, MASK_FEQ_D, match_opcode, 0 },
{"flt.d",      0, {"D", 0},   "d,S,T",    MATCH_FLT_D, MASK_FLT_D, match_opcode, 0 },
{"fle.d",      0, {"D", 0},   "d,S,T",    MATCH_FLE_D, MASK_FLE_D, match_opcode, 0 },
{"fgt.d",      0, {"D", 0},   "d,T,S",    MATCH_FLT_D, MASK_FLT_D, match_opcode, 0 },
{"fge.d",      0, {"D", 0},   "d,T,S",    MATCH_FLE_D, MASK_FLE_D, match_opcode, 0 },
{"fmv.x.d",   64, {"D", 0}, "d,S",  MATCH_FMV_X_D, MASK_FMV_X_D, match_opcode, 0 },
{"fmv.d.x",   64, {"D", 0}, "D,s",  MATCH_FMV_D_X, MASK_FMV_D_X, match_opcode, 0 },
{"fcvt.l.d",  64, {"D", 0}, "d,S",  MATCH_FCVT_L_D | MASK_RM, MASK_FCVT_L_D | MASK_RM, match_opcode, 0 },
{"fcvt.l.d",  64, {"D", 0}, "d,S,m",  MATCH_FCVT_L_D, MASK_FCVT_L_D, match_opcode, 0 },
{"fcvt.lu.d", 64, {"D", 0}, "d,S",  MATCH_FCVT_LU_D | MASK_RM, MASK_FCVT_LU_D | MASK_RM, match_opcode, 0 },
{"fcvt.lu.d", 64, {"D", 0}, "d,S,m",  MATCH_FCVT_LU_D, MASK_FCVT_LU_D, match_opcode, 0 },
{"fcvt.d.l",  64, {"D", 0}, "D,s",  MATCH_FCVT_D_L | MASK_RM, MASK_FCVT_D_L | MASK_RM, match_opcode, 0 },
{"fcvt.d.l",  64, {"D", 0}, "D,s,m",  MATCH_FCVT_D_L, MASK_FCVT_D_L, match_opcode, 0 },
{"fcvt.d.lu", 64, {"D", 0}, "D,s",  MATCH_FCVT_D_LU | MASK_RM, MASK_FCVT_D_L | MASK_RM, match_opcode, 0 },
{"fcvt.d.lu", 64, {"D", 0}, "D,s,m",  MATCH_FCVT_D_LU, MASK_FCVT_D_LU, match_opcode, 0 },

/* Quad-precision floating-point instruction subset */
{"flq",        0, {"Q", 0},   "D,o(s)",  MATCH_FLQ, MASK_FLQ, match_opcode, INSN_DREF|INSN_16_BYTE },
{"flq",        0, {"Q", 0},   "D,A,s",  0, (int) M_FLQ, match_never, INSN_MACRO },
{"fsq",        0, {"Q", 0},   "T,q(s)",  MATCH_FSQ, MASK_FSQ, match_opcode, INSN_DREF|INSN_16_BYTE },
{"fsq",        0, {"Q", 0},   "T,A,s",  0, (int) M_FSQ, match_never, INSN_MACRO },
{"fmv.q",      0, {"Q", 0},   "D,U",  MATCH_FSGNJ_Q, MASK_FSGNJ_Q, match_rs1_eq_rs2, INSN_ALIAS },
{"fneg.q",     0, {"Q", 0},   "D,U",  MATCH_FSGNJN_Q, MASK_FSGNJN_Q, match_rs1_eq_rs2, INSN_ALIAS },
{"fabs.q",     0, {"Q", 0},   "D,U",  MATCH_FSGNJX_Q, MASK_FSGNJX_Q, match_rs1_eq_rs2, INSN_ALIAS },
{"fsgnj.q",    0, {"Q", 0},   "D,S,T",  MATCH_FSGNJ_Q, MASK_FSGNJ_Q, match_opcode, 0 },
{"fsgnjn.q",   0, {"Q", 0},   "D,S,T",  MATCH_FSGNJN_Q, MASK_FSGNJN_Q, match_opcode, 0 },
{"fsgnjx.q",   0, {"Q", 0},   "D,S,T",  MATCH_FSGNJX_Q, MASK_FSGNJX_Q, match_opcode, 0 },
{"fadd.q",     0, {"Q", 0},   "D,S,T",  MATCH_FADD_Q | MASK_RM, MASK_FADD_Q | MASK_RM, match_opcode, 0 },
{"fadd.q",     0, {"Q", 0},   "D,S,T,m",  MATCH_FADD_Q, MASK_FADD_Q, match_opcode, 0 },
{"fsub.q",     0, {"Q", 0},   "D,S,T",  MATCH_FSUB_Q | MASK_RM, MASK_FSUB_Q | MASK_RM, match_opcode, 0 },
{"fsub.q",     0, {"Q", 0},   "D,S,T,m",  MATCH_FSUB_Q, MASK_FSUB_Q, match_opcode, 0 },
{"fmul.q",     0, {"Q", 0},   "D,S,T",  MATCH_FMUL_Q | MASK_RM, MASK_FMUL_Q | MASK_RM, match_opcode, 0 },
{"fmul.q",     0, {"Q", 0},   "D,S,T,m",  MATCH_FMUL_Q, MASK_FMUL_Q, match_opcode, 0 },
{"fdiv.q",     0, {"Q", 0},   "D,S,T",  MATCH_FDIV_Q | MASK_RM, MASK_FDIV_Q | MASK_RM, match_opcode, 0 },
{"fdiv.q",     0, {"Q", 0},   "D,S,T,m",  MATCH_FDIV_Q, MASK_FDIV_Q, match_opcode, 0 },
{"fsqrt.q",    0, {"Q", 0},   "D,S",  MATCH_FSQRT_Q | MASK_RM, MASK_FSQRT_Q | MASK_RM, match_opcode, 0 },
{"fsqrt.q",    0, {"Q", 0},   "D,S,m",  MATCH_FSQRT_Q, MASK_FSQRT_Q, match_opcode, 0 },
{"fmin.q",     0, {"Q", 0},   "D,S,T",  MATCH_FMIN_Q, MASK_FMIN_Q, match_opcode, 0 },
{"fmax.q",     0, {"Q", 0},   "D,S,T",  MATCH_FMAX_Q, MASK_FMAX_Q, match_opcode, 0 },
{"fmadd.q",    0, {"Q", 0},   "D,S,T,R",  MATCH_FMADD_Q | MASK_RM, MASK_FMADD_Q | MASK_RM, match_opcode, 0 },
{"fmadd.q",    0, {"Q", 0},   "D,S,T,R,m",  MATCH_FMADD_Q, MASK_FMADD_Q, match_opcode, 0 },
{"fnmadd.q",   0, {"Q", 0},   "D,S,T,R",  MATCH_FNMADD_Q | MASK_RM, MASK_FNMADD_Q | MASK_RM, match_opcode, 0 },
{"fnmadd.q",   0, {"Q", 0},   "D,S,T,R,m",  MATCH_FNMADD_Q, MASK_FNMADD_Q, match_opcode, 0 },
{"fmsub.q",    0, {"Q", 0},   "D,S,T,R",  MATCH_FMSUB_Q | MASK_RM, MASK_FMSUB_Q | MASK_RM, match_opcode, 0 },
{"fmsub.q",    0, {"Q", 0},   "D,S,T,R,m",  MATCH_FMSUB_Q, MASK_FMSUB_Q, match_opcode, 0 },
{"fnmsub.q",   0, {"Q", 0},   "D,S,T,R",  MATCH_FNMSUB_Q | MASK_RM, MASK_FNMSUB_Q | MASK_RM, match_opcode, 0 },
{"fnmsub.q",   0, {"Q", 0},   "D,S,T,R,m",  MATCH_FNMSUB_Q, MASK_FNMSUB_Q, match_opcode, 0 },
{"fcvt.w.q",   0, {"Q", 0},   "d,S",  MATCH_FCVT_W_Q | MASK_RM, MASK_FCVT_W_Q | MASK_RM, match_opcode, 0 },
{"fcvt.w.q",   0, {"Q", 0},   "d,S,m",  MATCH_FCVT_W_Q, MASK_FCVT_W_Q, match_opcode, 0 },
{"fcvt.wu.q",  0, {"Q", 0},   "d,S",  MATCH_FCVT_WU_Q | MASK_RM, MASK_FCVT_WU_Q | MASK_RM, match_opcode, 0 },
{"fcvt.wu.q",  0, {"Q", 0},   "d,S,m",  MATCH_FCVT_WU_Q, MASK_FCVT_WU_Q, match_opcode, 0 },
{"fcvt.q.w",   0, {"Q", 0},   "D,s",  MATCH_FCVT_Q_W, MASK_FCVT_Q_W | MASK_RM, match_opcode, 0 },
{"fcvt.q.wu",  0, {"Q", 0},   "D,s",  MATCH_FCVT_Q_WU, MASK_FCVT_Q_WU | MASK_RM, match_opcode, 0 },
{"fcvt.q.s",   0, {"Q", 0},   "D,S",  MATCH_FCVT_Q_S, MASK_FCVT_Q_S | MASK_RM, match_opcode, 0 },
{"fcvt.q.d",   0, {"Q", 0},   "D,S",  MATCH_FCVT_Q_D, MASK_FCVT_Q_D | MASK_RM, match_opcode, 0 },
{"fcvt.s.q",   0, {"Q", 0},   "D,S",  MATCH_FCVT_S_Q | MASK_RM, MASK_FCVT_S_Q | MASK_RM, match_opcode, 0 },
{"fcvt.s.q",   0, {"Q", 0},   "D,S,m",  MATCH_FCVT_S_Q, MASK_FCVT_S_Q, match_opcode, 0 },
{"fcvt.d.q",   0, {"Q", 0},   "D,S",  MATCH_FCVT_D_Q | MASK_RM, MASK_FCVT_D_Q | MASK_RM, match_opcode, 0 },
{"fcvt.d.q",   0, {"Q", 0},   "D,S,m",  MATCH_FCVT_D_Q, MASK_FCVT_D_Q, match_opcode, 0 },
{"fclass.q",   0, {"Q", 0},   "d,S",  MATCH_FCLASS_Q, MASK_FCLASS_Q, match_opcode, 0 },
{"feq.q",      0, {"Q", 0},   "d,S,T",    MATCH_FEQ_Q, MASK_FEQ_Q, match_opcode, 0 },
{"flt.q",      0, {"Q", 0},   "d,S,T",    MATCH_FLT_Q, MASK_FLT_Q, match_opcode, 0 },
{"fle.q",      0, {"Q", 0},   "d,S,T",    MATCH_FLE_Q, MASK_FLE_Q, match_opcode, 0 },
{"fgt.q",      0, {"Q", 0},   "d,T,S",    MATCH_FLT_Q, MASK_FLT_Q, match_opcode, 0 },
{"fge.q",      0, {"Q", 0},   "d,T,S",    MATCH_FLE_Q, MASK_FLE_Q, match_opcode, 0 },
{"fmv.x.q",   64, {"Q", 0}, "d,S",  MATCH_FMV_X_Q, MASK_FMV_X_Q, match_opcode, 0 },
{"fmv.q.x",   64, {"Q", 0}, "D,s",  MATCH_FMV_Q_X, MASK_FMV_Q_X, match_opcode, 0 },
{"fcvt.l.q",  64, {"Q", 0}, "d,S",  MATCH_FCVT_L_Q | MASK_RM, MASK_FCVT_L_Q | MASK_RM, match_opcode, 0 },
{"fcvt.l.q",  64, {"Q", 0}, "d,S,m",  MATCH_FCVT_L_Q, MASK_FCVT_L_Q, match_opcode, 0 },
{"fcvt.lu.q", 64, {"Q", 0}, "d,S",  MATCH_FCVT_LU_Q | MASK_RM, MASK_FCVT_LU_Q | MASK_RM, match_opcode, 0 },
{"fcvt.lu.q", 64, {"Q", 0}, "d,S,m",  MATCH_FCVT_LU_Q, MASK_FCVT_LU_Q, match_opcode, 0 },
{"fcvt.q.l",  64, {"Q", 0}, "D,s",  MATCH_FCVT_Q_L | MASK_RM, MASK_FCVT_Q_L | MASK_RM, match_opcode, 0 },
{"fcvt.q.l",  64, {"Q", 0}, "D,s,m",  MATCH_FCVT_Q_L, MASK_FCVT_Q_L, match_opcode, 0 },
{"fcvt.q.lu", 64, {"Q", 0}, "D,s",  MATCH_FCVT_Q_LU | MASK_RM, MASK_FCVT_Q_L | MASK_RM, match_opcode, 0 },
{"fcvt.q.lu", 64, {"Q", 0}, "D,s,m",  MATCH_FCVT_Q_LU, MASK_FCVT_Q_LU, match_opcode, 0 },

/* Compressed instructions.  */
{"c.unimp",    0, {"C", 0},   "",  0, 0xffffU,  match_opcode, 0 },
{"c.ebreak",   0, {"C", 0},   "",  MATCH_C_EBREAK, MASK_C_EBREAK, match_opcode, 0 },
{"c.jr",       0, {"C", 0},   "d",  MATCH_C_JR, MASK_C_JR, match_rd_nonzero, INSN_BRANCH },
{"c.jalr",     0, {"C", 0},   "d",  MATCH_C_JALR, MASK_C_JALR, match_rd_nonzero, INSN_JSR },
{"c.j",        0, {"C", 0},   "Ca",  MATCH_C_J, MASK_C_J, match_opcode, INSN_BRANCH },
{"c.jal",     32, {"C", 0}, "Ca",  MATCH_C_JAL, MASK_C_JAL, match_opcode, INSN_JSR },
{"c.beqz",     0, {"C", 0},   "Cs,Cp",  MATCH_C_BEQZ, MASK_C_BEQZ, match_opcode, INSN_CONDBRANCH },
{"c.bnez",     0, {"C", 0},   "Cs,Cp",  MATCH_C_BNEZ, MASK_C_BNEZ, match_opcode, INSN_CONDBRANCH },
{"c.lwsp",     0, {"C", 0},   "d,Cm(Cc)",  MATCH_C_LWSP, MASK_C_LWSP, match_rd_nonzero, 0 },
{"c.lw",       0, {"C", 0},   "Ct,Ck(Cs)",  MATCH_C_LW, MASK_C_LW, match_opcode, INSN_DREF|INSN_4_BYTE },
{"c.swsp",     0, {"C", 0},   "CV,CM(Cc)",  MATCH_C_SWSP, MASK_C_SWSP, match_opcode, INSN_DREF|INSN_4_BYTE },
{"c.sw",       0, {"C", 0},   "Ct,Ck(Cs)",  MATCH_C_SW, MASK_C_SW, match_opcode, INSN_DREF|INSN_4_BYTE },
{"c.nop",      0, {"C", 0},   "",  MATCH_C_ADDI, 0xffff, match_opcode, INSN_ALIAS },
{"c.nop",      0, {"C", 0},   "Cj",  MATCH_C_ADDI, MASK_C_ADDI | MASK_RD, match_opcode, INSN_ALIAS },
{"c.mv",       0, {"C", 0},   "d,CV",  MATCH_C_MV, MASK_C_MV, match_c_add_with_hint, 0 },
{"c.lui",      0, {"C", 0},   "d,Cu",  MATCH_C_LUI, MASK_C_LUI, match_c_lui_with_hint, 0 },
{"c.li",       0, {"C", 0},   "d,Co",  MATCH_C_LI, MASK_C_LI, match_opcode, 0 },
{"c.addi4spn", 0, {"C", 0},   "Ct,Cc,CK", MATCH_C_ADDI4SPN, MASK_C_ADDI4SPN, match_c_addi4spn, 0 },
{"c.addi16sp", 0, {"C", 0},   "Cc,CL", MATCH_C_ADDI16SP, MASK_C_ADDI16SP, match_c_addi16sp, 0 },
{"c.addi",     0, {"C", 0},   "d,Co",  MATCH_C_ADDI, MASK_C_ADDI, match_opcode, 0 },
{"c.add",      0, {"C", 0},   "d,CV",  MATCH_C_ADD, MASK_C_ADD, match_c_add_with_hint, 0 },
{"c.sub",      0, {"C", 0},   "Cs,Ct",  MATCH_C_SUB, MASK_C_SUB, match_opcode, 0 },
{"c.and",      0, {"C", 0},   "Cs,Ct",  MATCH_C_AND, MASK_C_AND, match_opcode, 0 },
{"c.or",       0, {"C", 0},   "Cs,Ct",  MATCH_C_OR, MASK_C_OR, match_opcode, 0 },
{"c.xor",      0, {"C", 0},   "Cs,Ct",  MATCH_C_XOR, MASK_C_XOR, match_opcode, 0 },
{"c.slli",     0, {"C", 0},   "d,C>",  MATCH_C_SLLI, MASK_C_SLLI, match_c_slli, 0 },
{"c.srli",     0, {"C", 0},   "Cs,C>",  MATCH_C_SRLI, MASK_C_SRLI, match_c_slli, 0 },
{"c.srai",     0, {"C", 0},   "Cs,C>",  MATCH_C_SRAI, MASK_C_SRAI, match_c_slli, 0 },
{"c.slli64",   0, {"C", 0},   "d",  MATCH_C_SLLI64, MASK_C_SLLI64, match_c_slli64, 0 },
{"c.srli64",   0, {"C", 0},   "Cs",  MATCH_C_SRLI64, MASK_C_SRLI64, match_c_slli64, 0 },
{"c.srai64",   0, {"C", 0},   "Cs",  MATCH_C_SRAI64, MASK_C_SRAI64, match_c_slli64, 0 },
{"c.andi",     0, {"C", 0},   "Cs,Co",  MATCH_C_ANDI, MASK_C_ANDI, match_opcode, 0 },
{"c.addiw",   64, {"C", 0}, "d,Co",  MATCH_C_ADDIW, MASK_C_ADDIW, match_rd_nonzero, 0 },
{"c.addw",    64, {"C", 0}, "Cs,Ct",  MATCH_C_ADDW, MASK_C_ADDW, match_opcode, 0 },
{"c.subw",    64, {"C", 0}, "Cs,Ct",  MATCH_C_SUBW, MASK_C_SUBW, match_opcode, 0 },
{"c.ldsp",    64, {"C", 0}, "d,Cn(Cc)",  MATCH_C_LDSP, MASK_C_LDSP, match_rd_nonzero, INSN_DREF|INSN_8_BYTE },
{"c.ld",      64, {"C", 0}, "Ct,Cl(Cs)",  MATCH_C_LD, MASK_C_LD, match_opcode, INSN_DREF|INSN_8_BYTE },
{"c.sdsp",    64, {"C", 0}, "CV,CN(Cc)",  MATCH_C_SDSP, MASK_C_SDSP, match_opcode, INSN_DREF|INSN_8_BYTE },
{"c.sd",      64, {"C", 0}, "Ct,Cl(Cs)",  MATCH_C_SD, MASK_C_SD, match_opcode, INSN_DREF|INSN_8_BYTE },
{"c.fldsp",    0, {"D", "C", 0},   "D,Cn(Cc)",  MATCH_C_FLDSP, MASK_C_FLDSP, match_opcode, INSN_DREF|INSN_8_BYTE },
{"c.fld",      0, {"D", "C", 0},   "CD,Cl(Cs)",  MATCH_C_FLD, MASK_C_FLD, match_opcode, INSN_DREF|INSN_8_BYTE },
{"c.fsdsp",    0, {"D", "C", 0},   "CT,CN(Cc)",  MATCH_C_FSDSP, MASK_C_FSDSP, match_opcode, INSN_DREF|INSN_8_BYTE },
{"c.fsd",      0, {"D", "C", 0},   "CD,Cl(Cs)",  MATCH_C_FSD, MASK_C_FSD, match_opcode, INSN_DREF|INSN_8_BYTE },
{"c.flwsp",   32, {"F", "C", 0}, "D,Cm(Cc)",  MATCH_C_FLWSP, MASK_C_FLWSP, match_opcode, INSN_DREF|INSN_4_BYTE },
{"c.flw",     32, {"F", "C", 0}, "CD,Ck(Cs)",  MATCH_C_FLW, MASK_C_FLW, match_opcode, INSN_DREF|INSN_4_BYTE },
{"c.fswsp",   32, {"F", "C", 0}, "CT,CM(Cc)",  MATCH_C_FSWSP, MASK_C_FSWSP, match_opcode, INSN_DREF|INSN_4_BYTE },
{"c.fsw",     32, {"F", "C", 0}, "CD,Ck(Cs)",  MATCH_C_FSW, MASK_C_FSW, match_opcode, INSN_DREF|INSN_4_BYTE },

/* Supervisor instructions */
{"csrr",       0, {"I", 0},   "d,E",  MATCH_CSRRS, MASK_CSRRS | MASK_RS1, match_opcode, INSN_ALIAS },
{"csrwi",      0, {"I", 0},   "E,Z",  MATCH_CSRRWI, MASK_CSRRWI | MASK_RD, match_opcode, INSN_ALIAS },
{"csrsi",      0, {"I", 0},   "E,Z",  MATCH_CSRRSI, MASK_CSRRSI | MASK_RD, match_opcode, INSN_ALIAS },
{"csrci",      0, {"I", 0},   "E,Z",  MATCH_CSRRCI, MASK_CSRRCI | MASK_RD, match_opcode, INSN_ALIAS },
{"csrw",       0, {"I", 0},   "E,s",  MATCH_CSRRW, MASK_CSRRW | MASK_RD, match_opcode, INSN_ALIAS },
{"csrw",       0, {"I", 0},   "E,Z",  MATCH_CSRRWI, MASK_CSRRWI | MASK_RD, match_opcode, INSN_ALIAS },
{"csrs",       0, {"I", 0},   "E,s",  MATCH_CSRRS, MASK_CSRRS | MASK_RD, match_opcode, INSN_ALIAS },
{"csrs",       0, {"I", 0},   "E,Z",  MATCH_CSRRSI, MASK_CSRRSI | MASK_RD, match_opcode, INSN_ALIAS },
{"csrc",       0, {"I", 0},   "E,s",  MATCH_CSRRC, MASK_CSRRC | MASK_RD, match_opcode, INSN_ALIAS },
{"csrc",       0, {"I", 0},   "E,Z",  MATCH_CSRRCI, MASK_CSRRCI | MASK_RD, match_opcode, INSN_ALIAS },
{"csrrwi",     0, {"I", 0},   "d,E,Z",  MATCH_CSRRWI, MASK_CSRRWI, match_opcode, 0 },
{"csrrsi",     0, {"I", 0},   "d,E,Z",  MATCH_CSRRSI, MASK_CSRRSI, match_opcode, 0 },
{"csrrci",     0, {"I", 0},   "d,E,Z",  MATCH_CSRRCI, MASK_CSRRCI, match_opcode, 0 },
{"csrrw",      0, {"I", 0},   "d,E,s",  MATCH_CSRRW, MASK_CSRRW, match_opcode, 0 },
{"csrrw",      0, {"I", 0},   "d,E,Z",  MATCH_CSRRWI, MASK_CSRRWI, match_opcode, INSN_ALIAS },
{"csrrs",      0, {"I", 0},   "d,E,s",  MATCH_CSRRS, MASK_CSRRS, match_opcode, 0 },
{"csrrs",      0, {"I", 0},   "d,E,Z",  MATCH_CSRRSI, MASK_CSRRSI, match_opcode, INSN_ALIAS },
{"csrrc",      0, {"I", 0},   "d,E,s",  MATCH_CSRRC, MASK_CSRRC, match_opcode, 0 },
{"csrrc",      0, {"I", 0},   "d,E,Z",  MATCH_CSRRCI, MASK_CSRRCI, match_opcode, INSN_ALIAS },
{"uret",       0, {"I", 0},   "",     MATCH_URET, MASK_URET, match_opcode, 0 },
{"sret",       0, {"I", 0},   "",     MATCH_SRET, MASK_SRET, match_opcode, 0 },
{"hret",       0, {"I", 0},   "",     MATCH_HRET, MASK_HRET, match_opcode, 0 },
{"mret",       0, {"I", 0},   "",     MATCH_MRET, MASK_MRET, match_opcode, 0 },
{"dret",       0, {"I", 0},   "",     MATCH_DRET, MASK_DRET, match_opcode, 0 },
{"sfence.vm",  0, {"I", 0},   "",     MATCH_SFENCE_VM, MASK_SFENCE_VM | MASK_RS1, match_opcode, 0 },
{"sfence.vm",  0, {"I", 0},   "s",    MATCH_SFENCE_VM, MASK_SFENCE_VM, match_opcode, 0 },
{"sfence.vma", 0, {"I", 0},   "",     MATCH_SFENCE_VMA, MASK_SFENCE_VMA | MASK_RS1 | MASK_RS2, match_opcode, INSN_ALIAS },
{"sfence.vma", 0, {"I", 0},   "s",    MATCH_SFENCE_VMA, MASK_SFENCE_VMA | MASK_RS2, match_opcode, INSN_ALIAS },
{"sfence.vma", 0, {"I", 0},   "s,t",  MATCH_SFENCE_VMA, MASK_SFENCE_VMA, match_opcode, 0 },
{"wfi",        0, {"I", 0},   "",     MATCH_WFI, MASK_WFI, match_opcode, 0 },

/* RVV */
{"vsetvl",     0, {"V", 0},  "d,s,t", MATCH_VSETVL, MASK_VSETVL, match_opcode, 0},
{"vsetvli",    0, {"V", 0},  "d,s,Vc", MATCH_VSETVLI, MASK_VSETVLI, match_opcode, 0},

{"vlb.v",      0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLBV, MASK_VLBV, match_opcode, INSN_DREF },
{"vlh.v",      0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLHV, MASK_VLHV, match_opcode, INSN_DREF },
{"vlw.v",      0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLWV, MASK_VLWV, match_opcode, INSN_DREF },
{"vlbu.v",     0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLBUV, MASK_VLBUV, match_opcode, INSN_DREF },
{"vlhu.v",     0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLHUV, MASK_VLHUV, match_opcode, INSN_DREF },
{"vlwu.v",     0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLWUV, MASK_VLWUV, match_opcode, INSN_DREF },
{"vle.v",      0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLEV, MASK_VLEV, match_opcode, INSN_DREF },
{"vsb.v",      0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSBV, MASK_VSBV, match_opcode, INSN_DREF },
{"vsh.v",      0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSHV, MASK_VSHV, match_opcode, INSN_DREF },
{"vsw.v",      0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSWV, MASK_VSWV, match_opcode, INSN_DREF },
{"vse.v",      0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSEV, MASK_VSEV, match_opcode, INSN_DREF },

{"vlsb.v",     0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSBV, MASK_VLSBV, match_opcode, INSN_DREF },
{"vlsh.v",     0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSHV, MASK_VLSHV, match_opcode, INSN_DREF },
{"vlsw.v",     0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSWV, MASK_VLSWV, match_opcode, INSN_DREF },
{"vlsbu.v",    0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSBUV, MASK_VLSBUV, match_opcode, INSN_DREF },
{"vlshu.v",    0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSHUV, MASK_VLSHUV, match_opcode, INSN_DREF },
{"vlswu.v",    0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSWUV, MASK_VLSWUV, match_opcode, INSN_DREF },
{"vlse.v",     0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSEV, MASK_VLSEV, match_opcode, INSN_DREF },
{"vssb.v",     0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSBV, MASK_VSSBV, match_opcode, INSN_DREF },
{"vssh.v",     0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSHV, MASK_VSSHV, match_opcode, INSN_DREF },
{"vssw.v",     0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSWV, MASK_VSSWV, match_opcode, INSN_DREF },
{"vsse.v",     0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSEV, MASK_VSSEV, match_opcode, INSN_DREF },

{"vlxb.v",     0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXBV, MASK_VLXBV, match_opcode, INSN_DREF },
{"vlxh.v",     0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXHV, MASK_VLXHV, match_opcode, INSN_DREF },
{"vlxw.v",     0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXWV, MASK_VLXWV, match_opcode, INSN_DREF },
{"vlxbu.v",    0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXBUV, MASK_VLXBUV, match_opcode, INSN_DREF },
{"vlxhu.v",    0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXHUV, MASK_VLXHUV, match_opcode, INSN_DREF },
{"vlxwu.v",    0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXWUV, MASK_VLXWUV, match_opcode, INSN_DREF },
{"vlxe.v",     0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXEV, MASK_VLXEV, match_opcode, INSN_DREF },
{"vsxb.v",     0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXBV, MASK_VSXBV, match_opcode, INSN_DREF },
{"vsxh.v",     0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXHV, MASK_VSXHV, match_opcode, INSN_DREF },
{"vsxw.v",     0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXWV, MASK_VSXWV, match_opcode, INSN_DREF },
{"vsxe.v",     0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXEV, MASK_VSXEV, match_opcode, INSN_DREF },
{"vsuxb.v",    0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSUXBV, MASK_VSUXBV, match_opcode, INSN_DREF },
{"vsuxh.v",    0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSUXHV, MASK_VSUXHV, match_opcode, INSN_DREF },
{"vsuxw.v",    0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSUXWV, MASK_VSUXWV, match_opcode, INSN_DREF },
{"vsuxe.v",    0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSUXEV, MASK_VSUXEV, match_opcode, INSN_DREF },

{"vlbff.v",    0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLBFFV, MASK_VLBFFV, match_opcode, INSN_DREF },
{"vlhff.v",    0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLHFFV, MASK_VLHFFV, match_opcode, INSN_DREF },
{"vlwff.v",    0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLWFFV, MASK_VLWFFV, match_opcode, INSN_DREF },
{"vlbuff.v",   0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLBUFFV, MASK_VLBUFFV, match_opcode, INSN_DREF },
{"vlhuff.v",   0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLHUFFV, MASK_VLHUFFV, match_opcode, INSN_DREF },
{"vlwuff.v",   0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLWUFFV, MASK_VLWUFFV, match_opcode, INSN_DREF },
{"vleff.v",    0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLEFFV, MASK_VLEFFV, match_opcode, INSN_DREF },

{"vlseg2b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2BV, MASK_VLSEG2BV, match_opcode, INSN_DREF },
{"vlseg2h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2HV, MASK_VLSEG2HV, match_opcode, INSN_DREF },
{"vlseg2w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2WV, MASK_VLSEG2WV, match_opcode, INSN_DREF },
{"vlseg2bu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2BUV, MASK_VLSEG2BUV, match_opcode, INSN_DREF },
{"vlseg2hu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2HUV, MASK_VLSEG2HUV, match_opcode, INSN_DREF },
{"vlseg2wu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2WUV, MASK_VLSEG2WUV, match_opcode, INSN_DREF },
{"vlseg2e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2EV, MASK_VLSEG2EV, match_opcode, INSN_DREF },
{"vsseg2b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG2BV, MASK_VSSEG2BV, match_opcode, INSN_DREF },
{"vsseg2h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG2HV, MASK_VSSEG2HV, match_opcode, INSN_DREF },
{"vsseg2w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG2WV, MASK_VSSEG2WV, match_opcode, INSN_DREF },
{"vsseg2e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG2EV, MASK_VSSEG2EV, match_opcode, INSN_DREF },

{"vlseg3b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3BV, MASK_VLSEG3BV, match_opcode, INSN_DREF },
{"vlseg3h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3HV, MASK_VLSEG3HV, match_opcode, INSN_DREF },
{"vlseg3w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3WV, MASK_VLSEG3WV, match_opcode, INSN_DREF },
{"vlseg3bu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3BUV, MASK_VLSEG3BUV, match_opcode, INSN_DREF },
{"vlseg3hu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3HUV, MASK_VLSEG3HUV, match_opcode, INSN_DREF },
{"vlseg3wu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3WUV, MASK_VLSEG3WUV, match_opcode, INSN_DREF },
{"vlseg3e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3EV, MASK_VLSEG3EV, match_opcode, INSN_DREF },
{"vsseg3b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG3BV, MASK_VSSEG3BV, match_opcode, INSN_DREF },
{"vsseg3h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG3HV, MASK_VSSEG3HV, match_opcode, INSN_DREF },
{"vsseg3w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG3WV, MASK_VSSEG3WV, match_opcode, INSN_DREF },
{"vsseg3e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG3EV, MASK_VSSEG3EV, match_opcode, INSN_DREF },

{"vlseg4b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4BV, MASK_VLSEG4BV, match_opcode, INSN_DREF },
{"vlseg4h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4HV, MASK_VLSEG4HV, match_opcode, INSN_DREF },
{"vlseg4w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4WV, MASK_VLSEG4WV, match_opcode, INSN_DREF },
{"vlseg4bu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4BUV, MASK_VLSEG4BUV, match_opcode, INSN_DREF },
{"vlseg4hu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4HUV, MASK_VLSEG4HUV, match_opcode, INSN_DREF },
{"vlseg4wu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4WUV, MASK_VLSEG4WUV, match_opcode, INSN_DREF },
{"vlseg4e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4EV, MASK_VLSEG4EV, match_opcode, INSN_DREF },
{"vsseg4b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG4BV, MASK_VSSEG4BV, match_opcode, INSN_DREF },
{"vsseg4h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG4HV, MASK_VSSEG4HV, match_opcode, INSN_DREF },
{"vsseg4w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG4WV, MASK_VSSEG4WV, match_opcode, INSN_DREF },
{"vsseg4e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG4EV, MASK_VSSEG4EV, match_opcode, INSN_DREF },

{"vlseg5b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5BV, MASK_VLSEG5BV, match_opcode, INSN_DREF },
{"vlseg5h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5HV, MASK_VLSEG5HV, match_opcode, INSN_DREF },
{"vlseg5w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5WV, MASK_VLSEG5WV, match_opcode, INSN_DREF },
{"vlseg5bu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5BUV, MASK_VLSEG5BUV, match_opcode, INSN_DREF },
{"vlseg5hu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5HUV, MASK_VLSEG5HUV, match_opcode, INSN_DREF },
{"vlseg5wu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5WUV, MASK_VLSEG5WUV, match_opcode, INSN_DREF },
{"vlseg5e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5EV, MASK_VLSEG5EV, match_opcode, INSN_DREF },
{"vsseg5b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG5BV, MASK_VSSEG5BV, match_opcode, INSN_DREF },
{"vsseg5h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG5HV, MASK_VSSEG5HV, match_opcode, INSN_DREF },
{"vsseg5w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG5WV, MASK_VSSEG5WV, match_opcode, INSN_DREF },
{"vsseg5e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG5EV, MASK_VSSEG5EV, match_opcode, INSN_DREF },

{"vlseg6b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6BV, MASK_VLSEG6BV, match_opcode, INSN_DREF },
{"vlseg6h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6HV, MASK_VLSEG6HV, match_opcode, INSN_DREF },
{"vlseg6w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6WV, MASK_VLSEG6WV, match_opcode, INSN_DREF },
{"vlseg6bu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6BUV, MASK_VLSEG6BUV, match_opcode, INSN_DREF },
{"vlseg6hu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6HUV, MASK_VLSEG6HUV, match_opcode, INSN_DREF },
{"vlseg6wu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6WUV, MASK_VLSEG6WUV, match_opcode, INSN_DREF },
{"vlseg6e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6EV, MASK_VLSEG6EV, match_opcode, INSN_DREF },
{"vsseg6b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG6BV, MASK_VSSEG6BV, match_opcode, INSN_DREF },
{"vsseg6h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG6HV, MASK_VSSEG6HV, match_opcode, INSN_DREF },
{"vsseg6w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG6WV, MASK_VSSEG6WV, match_opcode, INSN_DREF },
{"vsseg6e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG6EV, MASK_VSSEG6EV, match_opcode, INSN_DREF },

{"vlseg7b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7BV, MASK_VLSEG7BV, match_opcode, INSN_DREF },
{"vlseg7h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7HV, MASK_VLSEG7HV, match_opcode, INSN_DREF },
{"vlseg7w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7WV, MASK_VLSEG7WV, match_opcode, INSN_DREF },
{"vlseg7bu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7BUV, MASK_VLSEG7BUV, match_opcode, INSN_DREF },
{"vlseg7hu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7HUV, MASK_VLSEG7HUV, match_opcode, INSN_DREF },
{"vlseg7wu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7WUV, MASK_VLSEG7WUV, match_opcode, INSN_DREF },
{"vlseg7e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7EV, MASK_VLSEG7EV, match_opcode, INSN_DREF },
{"vsseg7b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG7BV, MASK_VSSEG7BV, match_opcode, INSN_DREF },
{"vsseg7h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG7HV, MASK_VSSEG7HV, match_opcode, INSN_DREF },
{"vsseg7w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG7WV, MASK_VSSEG7WV, match_opcode, INSN_DREF },
{"vsseg7e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG7EV, MASK_VSSEG7EV, match_opcode, INSN_DREF },

{"vlseg8b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8BV, MASK_VLSEG8BV, match_opcode, INSN_DREF },
{"vlseg8h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8HV, MASK_VLSEG8HV, match_opcode, INSN_DREF },
{"vlseg8w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8WV, MASK_VLSEG8WV, match_opcode, INSN_DREF },
{"vlseg8bu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8BUV, MASK_VLSEG8BUV, match_opcode, INSN_DREF },
{"vlseg8hu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8HUV, MASK_VLSEG8HUV, match_opcode, INSN_DREF },
{"vlseg8wu.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8WUV, MASK_VLSEG8WUV, match_opcode, INSN_DREF },
{"vlseg8e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8EV, MASK_VLSEG8EV, match_opcode, INSN_DREF },
{"vsseg8b.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG8BV, MASK_VSSEG8BV, match_opcode, INSN_DREF },
{"vsseg8h.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG8HV, MASK_VSSEG8HV, match_opcode, INSN_DREF },
{"vsseg8w.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG8WV, MASK_VSSEG8WV, match_opcode, INSN_DREF },
{"vsseg8e.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VSSEG8EV, MASK_VSSEG8EV, match_opcode, INSN_DREF },

{"vlsseg2b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG2BV, MASK_VLSSEG2BV, match_opcode, INSN_DREF },
{"vlsseg2h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG2HV, MASK_VLSSEG2HV, match_opcode, INSN_DREF },
{"vlsseg2w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG2WV, MASK_VLSSEG2WV, match_opcode, INSN_DREF },
{"vlsseg2bu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG2BUV, MASK_VLSSEG2BUV, match_opcode, INSN_DREF },
{"vlsseg2hu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG2HUV, MASK_VLSSEG2HUV, match_opcode, INSN_DREF },
{"vlsseg2wu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG2WUV, MASK_VLSSEG2WUV, match_opcode, INSN_DREF },
{"vlsseg2e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG2EV, MASK_VLSSEG2EV, match_opcode, INSN_DREF },
{"vssseg2b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG2BV, MASK_VSSSEG2BV, match_opcode, INSN_DREF },
{"vssseg2h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG2HV, MASK_VSSSEG2HV, match_opcode, INSN_DREF },
{"vssseg2w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG2WV, MASK_VSSSEG2WV, match_opcode, INSN_DREF },
{"vssseg2e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG2EV, MASK_VSSSEG2EV, match_opcode, INSN_DREF },

{"vlsseg3b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG3BV, MASK_VLSSEG3BV, match_opcode, INSN_DREF },
{"vlsseg3h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG3HV, MASK_VLSSEG3HV, match_opcode, INSN_DREF },
{"vlsseg3w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG3WV, MASK_VLSSEG3WV, match_opcode, INSN_DREF },
{"vlsseg3bu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG3BUV, MASK_VLSSEG3BUV, match_opcode, INSN_DREF },
{"vlsseg3hu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG3HUV, MASK_VLSSEG3HUV, match_opcode, INSN_DREF },
{"vlsseg3wu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG3WUV, MASK_VLSSEG3WUV, match_opcode, INSN_DREF },
{"vlsseg3e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG3EV, MASK_VLSSEG3EV, match_opcode, INSN_DREF },
{"vssseg3b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG3BV, MASK_VSSSEG3BV, match_opcode, INSN_DREF },
{"vssseg3h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG3HV, MASK_VSSSEG3HV, match_opcode, INSN_DREF },
{"vssseg3w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG3WV, MASK_VSSSEG3WV, match_opcode, INSN_DREF },
{"vssseg3e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG3EV, MASK_VSSSEG3EV, match_opcode, INSN_DREF },

{"vlsseg4b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG4BV, MASK_VLSSEG4BV, match_opcode, INSN_DREF },
{"vlsseg4h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG4HV, MASK_VLSSEG4HV, match_opcode, INSN_DREF },
{"vlsseg4w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG4WV, MASK_VLSSEG4WV, match_opcode, INSN_DREF },
{"vlsseg4bu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG4BUV, MASK_VLSSEG4BUV, match_opcode, INSN_DREF },
{"vlsseg4hu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG4HUV, MASK_VLSSEG4HUV, match_opcode, INSN_DREF },
{"vlsseg4wu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG4WUV, MASK_VLSSEG4WUV, match_opcode, INSN_DREF },
{"vlsseg4e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG4EV, MASK_VLSSEG4EV, match_opcode, INSN_DREF },
{"vssseg4b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG4BV, MASK_VSSSEG4BV, match_opcode, INSN_DREF },
{"vssseg4h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG4HV, MASK_VSSSEG4HV, match_opcode, INSN_DREF },
{"vssseg4w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG4WV, MASK_VSSSEG4WV, match_opcode, INSN_DREF },
{"vssseg4e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG4EV, MASK_VSSSEG4EV, match_opcode, INSN_DREF },

{"vlsseg5b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG5BV, MASK_VLSSEG5BV, match_opcode, INSN_DREF },
{"vlsseg5h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG5HV, MASK_VLSSEG5HV, match_opcode, INSN_DREF },
{"vlsseg5w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG5WV, MASK_VLSSEG5WV, match_opcode, INSN_DREF },
{"vlsseg5bu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG5BUV, MASK_VLSSEG5BUV, match_opcode, INSN_DREF },
{"vlsseg5hu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG5HUV, MASK_VLSSEG5HUV, match_opcode, INSN_DREF },
{"vlsseg5wu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG5WUV, MASK_VLSSEG5WUV, match_opcode, INSN_DREF },
{"vlsseg5e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG5EV, MASK_VLSSEG5EV, match_opcode, INSN_DREF },
{"vssseg5b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG5BV, MASK_VSSSEG5BV, match_opcode, INSN_DREF },
{"vssseg5h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG5HV, MASK_VSSSEG5HV, match_opcode, INSN_DREF },
{"vssseg5w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG5WV, MASK_VSSSEG5WV, match_opcode, INSN_DREF },
{"vssseg5e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG5EV, MASK_VSSSEG5EV, match_opcode, INSN_DREF },

{"vlsseg6b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG6BV, MASK_VLSSEG6BV, match_opcode, INSN_DREF },
{"vlsseg6h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG6HV, MASK_VLSSEG6HV, match_opcode, INSN_DREF },
{"vlsseg6w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG6WV, MASK_VLSSEG6WV, match_opcode, INSN_DREF },
{"vlsseg6bu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG6BUV, MASK_VLSSEG6BUV, match_opcode, INSN_DREF },
{"vlsseg6hu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG6HUV, MASK_VLSSEG6HUV, match_opcode, INSN_DREF },
{"vlsseg6wu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG6WUV, MASK_VLSSEG6WUV, match_opcode, INSN_DREF },
{"vlsseg6e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG6EV, MASK_VLSSEG6EV, match_opcode, INSN_DREF },
{"vssseg6b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG6BV, MASK_VSSSEG6BV, match_opcode, INSN_DREF },
{"vssseg6h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG6HV, MASK_VSSSEG6HV, match_opcode, INSN_DREF },
{"vssseg6w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG6WV, MASK_VSSSEG6WV, match_opcode, INSN_DREF },
{"vssseg6e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG6EV, MASK_VSSSEG6EV, match_opcode, INSN_DREF },

{"vlsseg7b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG7BV, MASK_VLSSEG7BV, match_opcode, INSN_DREF },
{"vlsseg7h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG7HV, MASK_VLSSEG7HV, match_opcode, INSN_DREF },
{"vlsseg7w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG7WV, MASK_VLSSEG7WV, match_opcode, INSN_DREF },
{"vlsseg7bu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG7BUV, MASK_VLSSEG7BUV, match_opcode, INSN_DREF },
{"vlsseg7hu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG7HUV, MASK_VLSSEG7HUV, match_opcode, INSN_DREF },
{"vlsseg7wu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG7WUV, MASK_VLSSEG7WUV, match_opcode, INSN_DREF },
{"vlsseg7e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG7EV, MASK_VLSSEG7EV, match_opcode, INSN_DREF },
{"vssseg7b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG7BV, MASK_VSSSEG7BV, match_opcode, INSN_DREF },
{"vssseg7h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG7HV, MASK_VSSSEG7HV, match_opcode, INSN_DREF },
{"vssseg7w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG7WV, MASK_VSSSEG7WV, match_opcode, INSN_DREF },
{"vssseg7e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG7EV, MASK_VSSSEG7EV, match_opcode, INSN_DREF },

{"vlsseg8b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG8BV, MASK_VLSSEG8BV, match_opcode, INSN_DREF },
{"vlsseg8h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG8HV, MASK_VLSSEG8HV, match_opcode, INSN_DREF },
{"vlsseg8w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG8WV, MASK_VLSSEG8WV, match_opcode, INSN_DREF },
{"vlsseg8bu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG8BUV, MASK_VLSSEG8BUV, match_opcode, INSN_DREF },
{"vlsseg8hu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG8HUV, MASK_VLSSEG8HUV, match_opcode, INSN_DREF },
{"vlsseg8wu.v", 0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG8WUV, MASK_VLSSEG8WUV, match_opcode, INSN_DREF },
{"vlsseg8e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VLSSEG8EV, MASK_VLSSEG8EV, match_opcode, INSN_DREF },
{"vssseg8b.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG8BV, MASK_VSSSEG8BV, match_opcode, INSN_DREF },
{"vssseg8h.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG8HV, MASK_VSSSEG8HV, match_opcode, INSN_DREF },
{"vssseg8w.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG8WV, MASK_VSSSEG8WV, match_opcode, INSN_DREF },
{"vssseg8e.v",  0, {"V", 0},  "Vd,0(s),tVm", MATCH_VSSSEG8EV, MASK_VSSSEG8EV, match_opcode, INSN_DREF },

{"vlxseg2b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG2BV, MASK_VLXSEG2BV, match_opcode, INSN_DREF },
{"vlxseg2h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG2HV, MASK_VLXSEG2HV, match_opcode, INSN_DREF },
{"vlxseg2w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG2WV, MASK_VLXSEG2WV, match_opcode, INSN_DREF },
{"vlxseg2bu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG2BUV, MASK_VLXSEG2BUV, match_opcode, INSN_DREF },
{"vlxseg2hu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG2HUV, MASK_VLXSEG2HUV, match_opcode, INSN_DREF },
{"vlxseg2wu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG2WUV, MASK_VLXSEG2WUV, match_opcode, INSN_DREF },
{"vlxseg2e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG2EV, MASK_VLXSEG2EV, match_opcode, INSN_DREF },
{"vsxseg2b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG2BV, MASK_VSXSEG2BV, match_opcode, INSN_DREF },
{"vsxseg2h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG2HV, MASK_VSXSEG2HV, match_opcode, INSN_DREF },
{"vsxseg2w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG2WV, MASK_VSXSEG2WV, match_opcode, INSN_DREF },
{"vsxseg2e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG2EV, MASK_VSXSEG2EV, match_opcode, INSN_DREF },

{"vlxseg3b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG3BV, MASK_VLXSEG3BV, match_opcode, INSN_DREF },
{"vlxseg3h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG3HV, MASK_VLXSEG3HV, match_opcode, INSN_DREF },
{"vlxseg3w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG3WV, MASK_VLXSEG3WV, match_opcode, INSN_DREF },
{"vlxseg3bu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG3BUV, MASK_VLXSEG3BUV, match_opcode, INSN_DREF },
{"vlxseg3hu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG3HUV, MASK_VLXSEG3HUV, match_opcode, INSN_DREF },
{"vlxseg3wu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG3WUV, MASK_VLXSEG3WUV, match_opcode, INSN_DREF },
{"vlxseg3e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG3EV, MASK_VLXSEG3EV, match_opcode, INSN_DREF },
{"vsxseg3b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG3BV, MASK_VSXSEG3BV, match_opcode, INSN_DREF },
{"vsxseg3h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG3HV, MASK_VSXSEG3HV, match_opcode, INSN_DREF },
{"vsxseg3w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG3WV, MASK_VSXSEG3WV, match_opcode, INSN_DREF },
{"vsxseg3e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG3EV, MASK_VSXSEG3EV, match_opcode, INSN_DREF },

{"vlxseg4b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG4BV, MASK_VLXSEG4BV, match_opcode, INSN_DREF },
{"vlxseg4h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG4HV, MASK_VLXSEG4HV, match_opcode, INSN_DREF },
{"vlxseg4w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG4WV, MASK_VLXSEG4WV, match_opcode, INSN_DREF },
{"vlxseg4bu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG4BUV, MASK_VLXSEG4BUV, match_opcode, INSN_DREF },
{"vlxseg4hu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG4HUV, MASK_VLXSEG4HUV, match_opcode, INSN_DREF },
{"vlxseg4wu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG4WUV, MASK_VLXSEG4WUV, match_opcode, INSN_DREF },
{"vlxseg4e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG4EV, MASK_VLXSEG4EV, match_opcode, INSN_DREF },
{"vsxseg4b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG4BV, MASK_VSXSEG4BV, match_opcode, INSN_DREF },
{"vsxseg4h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG4HV, MASK_VSXSEG4HV, match_opcode, INSN_DREF },
{"vsxseg4w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG4WV, MASK_VSXSEG4WV, match_opcode, INSN_DREF },
{"vsxseg4e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG4EV, MASK_VSXSEG4EV, match_opcode, INSN_DREF },

{"vlxseg5b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG5BV, MASK_VLXSEG5BV, match_opcode, INSN_DREF },
{"vlxseg5h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG5HV, MASK_VLXSEG5HV, match_opcode, INSN_DREF },
{"vlxseg5w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG5WV, MASK_VLXSEG5WV, match_opcode, INSN_DREF },
{"vlxseg5bu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG5BUV, MASK_VLXSEG5BUV, match_opcode, INSN_DREF },
{"vlxseg5hu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG5HUV, MASK_VLXSEG5HUV, match_opcode, INSN_DREF },
{"vlxseg5wu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG5WUV, MASK_VLXSEG5WUV, match_opcode, INSN_DREF },
{"vlxseg5e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG5EV, MASK_VLXSEG5EV, match_opcode, INSN_DREF },
{"vsxseg5b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG5BV, MASK_VSXSEG5BV, match_opcode, INSN_DREF },
{"vsxseg5h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG5HV, MASK_VSXSEG5HV, match_opcode, INSN_DREF },
{"vsxseg5w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG5WV, MASK_VSXSEG5WV, match_opcode, INSN_DREF },
{"vsxseg5e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG5EV, MASK_VSXSEG5EV, match_opcode, INSN_DREF },

{"vlxseg6b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG6BV, MASK_VLXSEG6BV, match_opcode, INSN_DREF },
{"vlxseg6h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG6HV, MASK_VLXSEG6HV, match_opcode, INSN_DREF },
{"vlxseg6w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG6WV, MASK_VLXSEG6WV, match_opcode, INSN_DREF },
{"vlxseg6bu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG6BUV, MASK_VLXSEG6BUV, match_opcode, INSN_DREF },
{"vlxseg6hu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG6HUV, MASK_VLXSEG6HUV, match_opcode, INSN_DREF },
{"vlxseg6wu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG6WUV, MASK_VLXSEG6WUV, match_opcode, INSN_DREF },
{"vlxseg6e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG6EV, MASK_VLXSEG6EV, match_opcode, INSN_DREF },
{"vsxseg6b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG6BV, MASK_VSXSEG6BV, match_opcode, INSN_DREF },
{"vsxseg6h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG6HV, MASK_VSXSEG6HV, match_opcode, INSN_DREF },
{"vsxseg6w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG6WV, MASK_VSXSEG6WV, match_opcode, INSN_DREF },
{"vsxseg6e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG6EV, MASK_VSXSEG6EV, match_opcode, INSN_DREF },

{"vlxseg7b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG7BV, MASK_VLXSEG7BV, match_opcode, INSN_DREF },
{"vlxseg7h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG7HV, MASK_VLXSEG7HV, match_opcode, INSN_DREF },
{"vlxseg7w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG7WV, MASK_VLXSEG7WV, match_opcode, INSN_DREF },
{"vlxseg7bu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG7BUV, MASK_VLXSEG7BUV, match_opcode, INSN_DREF },
{"vlxseg7hu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG7HUV, MASK_VLXSEG7HUV, match_opcode, INSN_DREF },
{"vlxseg7wu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG7WUV, MASK_VLXSEG7WUV, match_opcode, INSN_DREF },
{"vlxseg7e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG7EV, MASK_VLXSEG7EV, match_opcode, INSN_DREF },
{"vsxseg7b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG7BV, MASK_VSXSEG7BV, match_opcode, INSN_DREF },
{"vsxseg7h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG7HV, MASK_VSXSEG7HV, match_opcode, INSN_DREF },
{"vsxseg7w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG7WV, MASK_VSXSEG7WV, match_opcode, INSN_DREF },
{"vsxseg7e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG7EV, MASK_VSXSEG7EV, match_opcode, INSN_DREF },

{"vlxseg8b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG8BV, MASK_VLXSEG8BV, match_opcode, INSN_DREF },
{"vlxseg8h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG8HV, MASK_VLXSEG8HV, match_opcode, INSN_DREF },
{"vlxseg8w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG8WV, MASK_VLXSEG8WV, match_opcode, INSN_DREF },
{"vlxseg8bu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG8BUV, MASK_VLXSEG8BUV, match_opcode, INSN_DREF },
{"vlxseg8hu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG8HUV, MASK_VLXSEG8HUV, match_opcode, INSN_DREF },
{"vlxseg8wu.v", 0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG8WUV, MASK_VLXSEG8WUV, match_opcode, INSN_DREF },
{"vlxseg8e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VLXSEG8EV, MASK_VLXSEG8EV, match_opcode, INSN_DREF },
{"vsxseg8b.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG8BV, MASK_VSXSEG8BV, match_opcode, INSN_DREF },
{"vsxseg8h.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG8HV, MASK_VSXSEG8HV, match_opcode, INSN_DREF },
{"vsxseg8w.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG8WV, MASK_VSXSEG8WV, match_opcode, INSN_DREF },
{"vsxseg8e.v",  0, {"V", 0},  "Vd,0(s),VtVm", MATCH_VSXSEG8EV, MASK_VSXSEG8EV, match_opcode, INSN_DREF },

{"vlseg2bff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2BFFV, MASK_VLSEG2BFFV, match_opcode, INSN_DREF },
{"vlseg2hff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2HFFV, MASK_VLSEG2HFFV, match_opcode, INSN_DREF },
{"vlseg2wff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2WFFV, MASK_VLSEG2WFFV, match_opcode, INSN_DREF },
{"vlseg2buff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2BUFFV, MASK_VLSEG2BUFFV, match_opcode, INSN_DREF },
{"vlseg2huff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2HUFFV, MASK_VLSEG2HUFFV, match_opcode, INSN_DREF },
{"vlseg2wuff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2WUFFV, MASK_VLSEG2WUFFV, match_opcode, INSN_DREF },
{"vlseg2eff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG2EFFV, MASK_VLSEG2EFFV, match_opcode, INSN_DREF },

{"vlseg3bff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3BFFV, MASK_VLSEG3BFFV, match_opcode, INSN_DREF },
{"vlseg3hff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3HFFV, MASK_VLSEG3HFFV, match_opcode, INSN_DREF },
{"vlseg3wff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3WFFV, MASK_VLSEG3WFFV, match_opcode, INSN_DREF },
{"vlseg3buff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3BUFFV, MASK_VLSEG3BUFFV, match_opcode, INSN_DREF },
{"vlseg3huff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3HUFFV, MASK_VLSEG3HUFFV, match_opcode, INSN_DREF },
{"vlseg3wuff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3WUFFV, MASK_VLSEG3WUFFV, match_opcode, INSN_DREF },
{"vlseg3eff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG3EFFV, MASK_VLSEG3EFFV, match_opcode, INSN_DREF },

{"vlseg4bff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4BFFV, MASK_VLSEG4BFFV, match_opcode, INSN_DREF },
{"vlseg4hff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4HFFV, MASK_VLSEG4HFFV, match_opcode, INSN_DREF },
{"vlseg4wff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4WFFV, MASK_VLSEG4WFFV, match_opcode, INSN_DREF },
{"vlseg4buff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4BUFFV, MASK_VLSEG4BUFFV, match_opcode, INSN_DREF },
{"vlseg4huff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4HUFFV, MASK_VLSEG4HUFFV, match_opcode, INSN_DREF },
{"vlseg4wuff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4WUFFV, MASK_VLSEG4WUFFV, match_opcode, INSN_DREF },
{"vlseg4eff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG4EFFV, MASK_VLSEG4EFFV, match_opcode, INSN_DREF },

{"vlseg5bff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5BFFV, MASK_VLSEG5BFFV, match_opcode, INSN_DREF },
{"vlseg5hff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5HFFV, MASK_VLSEG5HFFV, match_opcode, INSN_DREF },
{"vlseg5wff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5WFFV, MASK_VLSEG5WFFV, match_opcode, INSN_DREF },
{"vlseg5buff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5BUFFV, MASK_VLSEG5BUFFV, match_opcode, INSN_DREF },
{"vlseg5huff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5HUFFV, MASK_VLSEG5HUFFV, match_opcode, INSN_DREF },
{"vlseg5wuff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5WUFFV, MASK_VLSEG5WUFFV, match_opcode, INSN_DREF },
{"vlseg5eff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG5EFFV, MASK_VLSEG5EFFV, match_opcode, INSN_DREF },

{"vlseg6bff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6BFFV, MASK_VLSEG6BFFV, match_opcode, INSN_DREF },
{"vlseg6hff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6HFFV, MASK_VLSEG6HFFV, match_opcode, INSN_DREF },
{"vlseg6wff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6WFFV, MASK_VLSEG6WFFV, match_opcode, INSN_DREF },
{"vlseg6buff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6BUFFV, MASK_VLSEG6BUFFV, match_opcode, INSN_DREF },
{"vlseg6huff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6HUFFV, MASK_VLSEG6HUFFV, match_opcode, INSN_DREF },
{"vlseg6wuff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6WUFFV, MASK_VLSEG6WUFFV, match_opcode, INSN_DREF },
{"vlseg6eff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG6EFFV, MASK_VLSEG6EFFV, match_opcode, INSN_DREF },

{"vlseg7bff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7BFFV, MASK_VLSEG7BFFV, match_opcode, INSN_DREF },
{"vlseg7hff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7HFFV, MASK_VLSEG7HFFV, match_opcode, INSN_DREF },
{"vlseg7wff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7WFFV, MASK_VLSEG7WFFV, match_opcode, INSN_DREF },
{"vlseg7buff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7BUFFV, MASK_VLSEG7BUFFV, match_opcode, INSN_DREF },
{"vlseg7huff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7HUFFV, MASK_VLSEG7HUFFV, match_opcode, INSN_DREF },
{"vlseg7wuff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7WUFFV, MASK_VLSEG7WUFFV, match_opcode, INSN_DREF },
{"vlseg7eff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG7EFFV, MASK_VLSEG7EFFV, match_opcode, INSN_DREF },

{"vlseg8bff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8BFFV, MASK_VLSEG8BFFV, match_opcode, INSN_DREF },
{"vlseg8hff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8HFFV, MASK_VLSEG8HFFV, match_opcode, INSN_DREF },
{"vlseg8wff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8WFFV, MASK_VLSEG8WFFV, match_opcode, INSN_DREF },
{"vlseg8buff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8BUFFV, MASK_VLSEG8BUFFV, match_opcode, INSN_DREF },
{"vlseg8huff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8HUFFV, MASK_VLSEG8HUFFV, match_opcode, INSN_DREF },
{"vlseg8wuff.v", 0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8WUFFV, MASK_VLSEG8WUFFV, match_opcode, INSN_DREF },
{"vlseg8eff.v",  0, {"V", 0},  "Vd,0(s)Vm", MATCH_VLSEG8EFFV, MASK_VLSEG8EFFV, match_opcode, INSN_DREF },

{"vamoaddw.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOADDWV, MASK_VAMOADDWV, match_opcode, INSN_DREF},
{"vamoaddd.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOADDDV, MASK_VAMOADDDV, match_opcode, INSN_DREF},
{"vamoswapw.v",  0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOSWAPWV, MASK_VAMOSWAPWV, match_opcode, INSN_DREF},
{"vamoswapd.v",  0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOSWAPDV, MASK_VAMOSWAPDV, match_opcode, INSN_DREF},

{"vamoxorw.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOXORWV, MASK_VAMOXORWV, match_opcode, INSN_DREF},
{"vamoxord.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOXORDV, MASK_VAMOXORDV, match_opcode, INSN_DREF},
{"vamoandw.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOANDWV, MASK_VAMOANDWV, match_opcode, INSN_DREF},
{"vamoandd.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOANDDV, MASK_VAMOANDDV, match_opcode, INSN_DREF},
{"vamoorw.v",    0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOORWV, MASK_VAMOORWV, match_opcode, INSN_DREF},
{"vamoord.v",    0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOORDV, MASK_VAMOORDV, match_opcode, INSN_DREF},

{"vamominw.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOMINWV, MASK_VAMOMINWV, match_opcode, INSN_DREF},
{"vamomind.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOMINDV, MASK_VAMOMINDV, match_opcode, INSN_DREF},
{"vamomaxw.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOMAXWV, MASK_VAMOMAXWV, match_opcode, INSN_DREF},
{"vamomaxd.v",   0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOMAXDV, MASK_VAMOMAXDV, match_opcode, INSN_DREF},
{"vamominuw.v",  0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOMINUWV, MASK_VAMOMINUWV, match_opcode, INSN_DREF},
{"vamominud.v",  0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOMINUDV, MASK_VAMOMINUDV, match_opcode, INSN_DREF},
{"vamomaxuw.v",  0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOMAXUWV, MASK_VAMOMAXUWV, match_opcode, INSN_DREF},
{"vamomaxud.v",  0, {"V", 0},  "Ve,Vt,(s),VfVm", MATCH_VAMOMAXUDV, MASK_VAMOMAXUDV, match_opcode, INSN_DREF},

{"vadd.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VADDVV, MASK_VADDVV, match_opcode, 0 },
{"vadd.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VADDVX, MASK_VADDVX, match_opcode, 0 },
{"vadd.vi",    0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VADDVI, MASK_VADDVI, match_opcode, 0 },
{"vsub.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSUBVV, MASK_VSUBVV, match_opcode, 0 },
{"vsub.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSUBVX, MASK_VSUBVX, match_opcode, 0 },
{"vrsub.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VRSUBVX, MASK_VRSUBVX, match_opcode, 0 },
{"vrsub.vi",   0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VRSUBVI, MASK_VRSUBVI, match_opcode, 0 },

{"vwcvt.x.x.v",0, {"V", 0},  "Vd,VtVm", MATCH_VWCVTXXV, MASK_VWCVTXXV, match_opcode, INSN_ALIAS },
{"vwcvtu.x.x.v",0,{"V", 0},  "Vd,VtVm", MATCH_VWCVTUXXV, MASK_VWCVTUXXV, match_opcode, INSN_ALIAS },

{"vwaddu.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWADDUVV, MASK_VWADDUVV, match_opcode, 0 },
{"vwaddu.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWADDUVX, MASK_VWADDUVX, match_opcode, 0 },
{"vwsubu.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWSUBUVV, MASK_VWSUBUVV, match_opcode, 0 },
{"vwsubu.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWSUBUVX, MASK_VWSUBUVX, match_opcode, 0 },
{"vwadd.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWADDVV, MASK_VWADDVV, match_opcode, 0 },
{"vwadd.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWADDVX, MASK_VWADDVX, match_opcode, 0 },
{"vwsub.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWSUBVV, MASK_VWSUBVV, match_opcode, 0 },
{"vwsub.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWSUBVX, MASK_VWSUBVX, match_opcode, 0 },
{"vwaddu.wv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWADDUWV, MASK_VWADDUWV, match_opcode, 0 },
{"vwaddu.wx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWADDUWX, MASK_VWADDUWX, match_opcode, 0 },
{"vwsubu.wv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWSUBUWV, MASK_VWSUBUWV, match_opcode, 0 },
{"vwsubu.wx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWSUBUWX, MASK_VWSUBUWX, match_opcode, 0 },
{"vwadd.wv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWADDWV, MASK_VWADDWV, match_opcode, 0 },
{"vwadd.wx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWADDWX, MASK_VWADDWX, match_opcode, 0 },
{"vwsub.wv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWSUBWV, MASK_VWSUBWV, match_opcode, 0 },
{"vwsub.wx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWSUBWX, MASK_VWSUBWX, match_opcode, 0 },

{"vadc.vvm",   0, {"V", 0},  "Vd,Vt,Vs,V0", MATCH_VADCVVM, MASK_VADCVVM, match_opcode, 0 },
{"vadc.vxm",   0, {"V", 0},  "Vd,Vt,s,V0", MATCH_VADCVXM, MASK_VADCVXM, match_opcode, 0 },
{"vadc.vim",   0, {"V", 0},  "Vd,Vt,Vi,V0", MATCH_VADCVIM, MASK_VADCVIM, match_opcode, 0 },
{"vmadc.vvm",  0, {"V", 0},  "Vd,Vt,Vs,V0", MATCH_VMADCVVM, MASK_VMADCVVM, match_opcode, 0 },
{"vmadc.vxm",  0, {"V", 0},  "Vd,Vt,s,V0", MATCH_VMADCVXM, MASK_VMADCVXM, match_opcode, 0 },
{"vmadc.vim",  0, {"V", 0},  "Vd,Vt,Vi,V0", MATCH_VMADCVIM, MASK_VMADCVIM, match_opcode, 0 },
{"vsbc.vvm",   0, {"V", 0},  "Vd,Vt,Vs,V0", MATCH_VSBCVVM, MASK_VSBCVVM, match_opcode, 0 },
{"vsbc.vxm",   0, {"V", 0},  "Vd,Vt,s,V0", MATCH_VSBCVXM, MASK_VSBCVXM, match_opcode, 0 },
{"vmsbc.vvm",  0, {"V", 0},  "Vd,Vt,Vs,V0", MATCH_VMSBCVVM, MASK_VMSBCVVM, match_opcode, 0 },
{"vmsbc.vxm",  0, {"V", 0},  "Vd,Vt,s,V0", MATCH_VMSBCVXM, MASK_VMSBCVXM, match_opcode, 0 },

{"vnot.v",     0, {"V", 0},  "Vd,VtVm", MATCH_VNOTV, MASK_VNOTV, match_opcode, INSN_ALIAS },

{"vand.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VANDVV, MASK_VANDVV, match_opcode, 0 },
{"vand.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VANDVX, MASK_VANDVX, match_opcode, 0 },
{"vand.vi",    0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VANDVI, MASK_VANDVI, match_opcode, 0 },
{"vor.vv",     0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VORVV, MASK_VORVV, match_opcode, 0 },
{"vor.vx",     0, {"V", 0},  "Vd,Vt,sVm", MATCH_VORVX, MASK_VORVX, match_opcode, 0 },
{"vor.vi",     0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VORVI, MASK_VORVI, match_opcode, 0 },
{"vxor.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VXORVV, MASK_VXORVV, match_opcode, 0 },
{"vxor.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VXORVX, MASK_VXORVX, match_opcode, 0 },
{"vxor.vi",    0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VXORVI, MASK_VXORVI, match_opcode, 0 },

{"vsll.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSLLVV, MASK_VSLLVV, match_opcode, 0 },
{"vsll.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSLLVX, MASK_VSLLVX, match_opcode, 0 },
{"vsll.vi",    0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VSLLVI, MASK_VSLLVI, match_opcode, 0 },
{"vsrl.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSRLVV, MASK_VSRLVV, match_opcode, 0 },
{"vsrl.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSRLVX, MASK_VSRLVX, match_opcode, 0 },
{"vsrl.vi",    0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VSRLVI, MASK_VSRLVI, match_opcode, 0 },
{"vsra.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSRAVV, MASK_VSRAVV, match_opcode, 0 },
{"vsra.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSRAVX, MASK_VSRAVX, match_opcode, 0 },
{"vsra.vi",    0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VSRAVI, MASK_VSRAVI, match_opcode, 0 },

{"vnsrl.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VNSRLVV, MASK_VNSRLVV, match_opcode, 0 },
{"vnsrl.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VNSRLVX, MASK_VNSRLVX, match_opcode, 0 },
{"vnsrl.vi",   0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VNSRLVI, MASK_VNSRLVI, match_opcode, 0 },
{"vnsra.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VNSRAVV, MASK_VNSRAVV, match_opcode, 0 },
{"vnsra.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VNSRAVX, MASK_VNSRAVX, match_opcode, 0 },
{"vnsra.vi",   0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VNSRAVI, MASK_VNSRAVI, match_opcode, 0 },

{"vmseq.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMSEQVV, MASK_VMSEQVV, match_opcode, 0 },
{"vmseq.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMSEQVX, MASK_VMSEQVX, match_opcode, 0 },
{"vmseq.vi",   0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VMSEQVI, MASK_VMSEQVI, match_opcode, 0 },
{"vmsne.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMSNEVV, MASK_VMSNEVV, match_opcode, 0 },
{"vmsne.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMSNEVX, MASK_VMSNEVX, match_opcode, 0 },
{"vmsne.vi",   0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VMSNEVI, MASK_VMSNEVI, match_opcode, 0 },
{"vmsltu.vv",  0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMSLTUVV, MASK_VMSLTUVV, match_opcode, 0 },
{"vmsltu.vx",  0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMSLTUVX, MASK_VMSLTUVX, match_opcode, 0 },
{"vmslt.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMSLTVV, MASK_VMSLTVV, match_opcode, 0 },
{"vmslt.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMSLTVX, MASK_VMSLTVX, match_opcode, 0 },
{"vmsleu.vv",  0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMSLEUVV, MASK_VMSLEUVV, match_opcode, 0 },
{"vmsleu.vx",  0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMSLEUVX, MASK_VMSLEUVX, match_opcode, 0 },
{"vmsleu.vi",  0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VMSLEUVI, MASK_VMSLEUVI, match_opcode, 0 },
{"vmsle.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMSLEVV, MASK_VMSLEVV, match_opcode, 0 },
{"vmsle.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMSLEVX, MASK_VMSLEVX, match_opcode, 0 },
{"vmsle.vi",   0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VMSLEVI, MASK_VMSLEVI, match_opcode, 0 },
{"vmsgtu.vx",  0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMSGTUVX, MASK_VMSGTUVX, match_opcode, 0 },
{"vmsgtu.vi",  0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VMSGTUVI, MASK_VMSGTUVI, match_opcode, 0 },
{"vmsgt.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMSGTVX, MASK_VMSGTVX, match_opcode, 0 },
{"vmsgt.vi",   0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VMSGTVI, MASK_VMSGTVI, match_opcode, 0 },

/* These aliases are for assembly but not disassembly.  */
{"vmsgt.vv",   0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VMSLTVV, MASK_VMSLTVV, match_opcode, INSN_ALIAS },
{"vmsgtu.vv",  0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VMSLTUVV, MASK_VMSLTUVV, match_opcode, INSN_ALIAS },
{"vmsge.vv",   0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VMSLEVV, MASK_VMSLEVV, match_opcode, INSN_ALIAS },
{"vmsgeu.vv",  0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VMSLEUVV, MASK_VMSLEUVV, match_opcode, INSN_ALIAS },
{"vmslt.vi",   0, {"V", 0},  "Vd,Vt,VkVm", MATCH_VMSLEVI, MASK_VMSLEVI, match_opcode, INSN_ALIAS },
{"vmsltu.vi",  0, {"V", 0},  "Vd,Vt,VkVm", MATCH_VMSLEUVI, MASK_VMSLEUVI, match_opcode, INSN_ALIAS },
{"vmsge.vi",   0, {"V", 0},  "Vd,Vt,VkVm", MATCH_VMSGTVI, MASK_VMSGTVI, match_opcode, INSN_ALIAS },
{"vmsgeu.vi",  0, {"V", 0},  "Vd,Vt,VkVm", MATCH_VMSGTUVI, MASK_VMSGTUVI, match_opcode, INSN_ALIAS },

{"vmsge.vx",   0, {"V", 0}, "Vd,Vt,sVm", 0, (int) M_VMSGE, match_never, INSN_MACRO },
{"vmsge.vx",   0, {"V", 0}, "Vd,Vt,s,VM,VT", 0, (int) M_VMSGE, match_never, INSN_MACRO },
{"vmsgeu.vx",  0, {"V", 0}, "Vd,Vt,sVm", 0, (int) M_VMSGEU, match_never, INSN_MACRO },
{"vmsgeu.vx",  0, {"V", 0}, "Vd,Vt,s,VM,VT", 0, (int) M_VMSGEU, match_never, INSN_MACRO },

{"vminu.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMINUVV, MASK_VMINUVV, match_opcode, 0},
{"vminu.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMINUVX, MASK_VMINUVX, match_opcode, 0},
{"vmin.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMINVV, MASK_VMINVV, match_opcode, 0},
{"vmin.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMINVX, MASK_VMINVX, match_opcode, 0},
{"vmaxu.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMAXUVV, MASK_VMAXUVV, match_opcode, 0},
{"vmaxu.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMAXUVX, MASK_VMAXUVX, match_opcode, 0},
{"vmax.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMAXVV, MASK_VMAXVV, match_opcode, 0},
{"vmax.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMAXVX, MASK_VMAXVX, match_opcode, 0},

{"vmul.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMULVV, MASK_VMULVV, match_opcode, 0 },
{"vmul.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMULVX, MASK_VMULVX, match_opcode, 0 },
{"vmulh.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMULHVV, MASK_VMULHVV, match_opcode, 0 },
{"vmulh.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMULHVX, MASK_VMULHVX, match_opcode, 0 },
{"vmulhu.vv",  0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMULHUVV, MASK_VMULHUVV, match_opcode, 0 },
{"vmulhu.vx",  0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMULHUVX, MASK_VMULHUVX, match_opcode, 0 },
{"vmulhsu.vv", 0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VMULHSUVV, MASK_VMULHSUVV, match_opcode, 0 },
{"vmulhsu.vx", 0, {"V", 0},  "Vd,Vt,sVm", MATCH_VMULHSUVX, MASK_VMULHSUVX, match_opcode, 0 },

{"vwmul.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWMULVV, MASK_VWMULVV, match_opcode, 0 },
{"vwmul.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWMULVX, MASK_VWMULVX, match_opcode, 0 },
{"vwmulu.vv",  0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWMULUVV, MASK_VWMULUVV, match_opcode, 0 },
{"vwmulu.vx",  0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWMULUVX, MASK_VWMULUVX, match_opcode, 0 },
{"vwmulsu.vv", 0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VWMULSUVV, MASK_VWMULSUVV, match_opcode, 0 },
{"vwmulsu.vx", 0, {"V", 0},  "Vd,Vt,sVm", MATCH_VWMULSUVX, MASK_VWMULSUVX, match_opcode, 0 },

{"vmacc.vv",   0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VMACCVV, MASK_VMACCVV, match_opcode, 0},
{"vmacc.vx",   0, {"V", 0},  "Vd,s,VtVm", MATCH_VMACCVX, MASK_VMACCVX, match_opcode, 0},
{"vmsac.vv",  0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VMSACVV, MASK_VMSACVV, match_opcode, 0},
{"vmsac.vx",  0, {"V", 0},  "Vd,s,VtVm", MATCH_VMSACVX, MASK_VMSACVX, match_opcode, 0},
{"vmadd.vv",   0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VMADDVV, MASK_VMADDVV, match_opcode, 0},
{"vmadd.vx",   0, {"V", 0},  "Vd,s,VtVm", MATCH_VMADDVX, MASK_VMADDVX, match_opcode, 0},
{"vmsub.vv",  0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VMSUBVV, MASK_VMSUBVV, match_opcode, 0},
{"vmsub.vx",  0, {"V", 0},  "Vd,s,VtVm", MATCH_VMSUBVX, MASK_VMSUBVX, match_opcode, 0},

{"vwmaccu.vv",   0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VWMACCUVV, MASK_VWMACCUVV, match_opcode, 0},
{"vwmaccu.vx",   0, {"V", 0},  "Vd,s,VtVm", MATCH_VWMACCUVX, MASK_VWMACCUVX, match_opcode, 0},
{"vwmacc.vv",   0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VWMACCVV, MASK_VWMACCVV, match_opcode, 0},
{"vwmacc.vx",   0, {"V", 0},  "Vd,s,VtVm", MATCH_VWMACCVX, MASK_VWMACCVX, match_opcode, 0},
{"vwmsacu.vv",   0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VWMSACUVV, MASK_VWMSACUVV, match_opcode, 0},
{"vwmsacu.vx",   0, {"V", 0},  "Vd,s,VtVm", MATCH_VWMSACUVX, MASK_VWMSACUVX, match_opcode, 0},
{"vwmsac.vv",   0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VWMSACVV, MASK_VWMSACVV, match_opcode, 0},
{"vwmsac.vx",   0, {"V", 0},  "Vd,s,VtVm", MATCH_VWMSACVX, MASK_VWMSACVX, match_opcode, 0},

{"vdivu.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VDIVUVV, MASK_VDIVUVV, match_opcode, 0 },
{"vdivu.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VDIVUVX, MASK_VDIVUVX, match_opcode, 0 },
{"vdiv.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VDIVVV, MASK_VDIVVV, match_opcode, 0 },
{"vdiv.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VDIVVX, MASK_VDIVVX, match_opcode, 0 },
{"vremu.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VREMUVV, MASK_VREMUVV, match_opcode, 0 },
{"vremu.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VREMUVX, MASK_VREMUVX, match_opcode, 0 },
{"vrem.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VREMVV, MASK_VREMVV, match_opcode, 0 },
{"vrem.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VREMVX, MASK_VREMVX, match_opcode, 0 },

{"vmerge.vvm", 0, {"V", 0},  "Vd,Vt,Vs,V0", MATCH_VMERGEVVM, MASK_VMERGEVVM, match_opcode, 0 },
{"vmerge.vxm", 0, {"V", 0},  "Vd,Vt,s,V0", MATCH_VMERGEVXM, MASK_VMERGEVXM, match_opcode, 0 },
{"vmerge.vim", 0, {"V", 0},  "Vd,Vt,Vi,V0", MATCH_VMERGEVIM, MASK_VMERGEVIM, match_opcode, 0 },

{"vmv.v.v",    0, {"V", 0},  "Vd,Vs", MATCH_VMVVV, MASK_VMVVV, match_opcode, 0 },
{"vmv.v.x",    0, {"V", 0},  "Vd,s", MATCH_VMVVX, MASK_VMVVX, match_opcode, 0 },
{"vmv.v.i",    0, {"V", 0},  "Vd,Vi", MATCH_VMVVI, MASK_VMVVI, match_opcode, 0 },

{"vsaddu.vv",  0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSADDUVV, MASK_VSADDUVV, match_opcode, 0 },
{"vsaddu.vx",  0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSADDUVX, MASK_VSADDUVX, match_opcode, 0 },
{"vsaddu.vi",  0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VSADDUVI, MASK_VSADDUVI, match_opcode, 0 },
{"vsadd.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSADDVV, MASK_VSADDVV, match_opcode, 0 },
{"vsadd.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSADDVX, MASK_VSADDVX, match_opcode, 0 },
{"vsadd.vi",   0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VSADDVI, MASK_VSADDVI, match_opcode, 0 },
{"vssubu.vv",  0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSSUBUVV, MASK_VSSUBUVV, match_opcode, 0 },
{"vssubu.vx",  0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSSUBUVX, MASK_VSSUBUVX, match_opcode, 0 },
{"vssub.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSSUBVV, MASK_VSSUBVV, match_opcode, 0 },
{"vssub.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSSUBVX, MASK_VSSUBVX, match_opcode, 0 },

{"vaadd.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VAADDVV, MASK_VAADDVV, match_opcode, 0 },
{"vaadd.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VAADDVX, MASK_VAADDVX, match_opcode, 0 },
{"vaadd.vi",   0, {"V", 0},  "Vd,Vt,ViVm", MATCH_VAADDVI, MASK_VAADDVI, match_opcode, 0 },
{"vasub.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VASUBVV, MASK_VASUBVV, match_opcode, 0 },
{"vasub.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VASUBVX, MASK_VASUBVX, match_opcode, 0 },

{"vsmul.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSMULVV, MASK_VSMULVV, match_opcode, 0 },
{"vsmul.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSMULVX, MASK_VSMULVX, match_opcode, 0 },

{"vwsmaccu.vv", 0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VWSMACCUVV, MASK_VWSMACCUVV, match_opcode, 0 },
{"vwsmaccu.vx", 0, {"V", 0},  "Vd,s,VtVm", MATCH_VWSMACCUVX, MASK_VWSMACCUVX, match_opcode, 0 },
{"vwsmacc.vv",  0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VWSMACCVV, MASK_VWSMACCVV, match_opcode, 0 },
{"vwsmacc.vx",  0, {"V", 0},  "Vd,s,VtVm", MATCH_VWSMACCVX, MASK_VWSMACCVX, match_opcode, 0 },
{"vwsmsacu.vv", 0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VWSMSACUVV, MASK_VWSMSACUVV, match_opcode, 0 },
{"vwsmsacu.vx", 0, {"V", 0},  "Vd,s,VtVm", MATCH_VWSMSACUVX, MASK_VWSMSACUVX, match_opcode, 0 },
{"vwsmsac.vv",  0, {"V", 0},  "Vd,Vs,VtVm", MATCH_VWSMSACVV, MASK_VWSMSACVV, match_opcode, 0 },
{"vwsmsac.vx",  0, {"V", 0},  "Vd,s,VtVm", MATCH_VWSMSACVX, MASK_VWSMSACVX, match_opcode, 0 },

{"vssrl.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSSRLVV, MASK_VSSRLVV, match_opcode, 0 },
{"vssrl.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSSRLVX, MASK_VSSRLVX, match_opcode, 0 },
{"vssrl.vi",    0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VSSRLVI, MASK_VSSRLVI, match_opcode, 0 },
{"vssra.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VSSRAVV, MASK_VSSRAVV, match_opcode, 0 },
{"vssra.vx",    0, {"V", 0},  "Vd,Vt,sVm", MATCH_VSSRAVX, MASK_VSSRAVX, match_opcode, 0 },
{"vssra.vi",    0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VSSRAVI, MASK_VSSRAVI, match_opcode, 0 },

{"vnclipu.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VNCLIPUVV, MASK_VNCLIPUVV, match_opcode, 0 },
{"vnclipu.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VNCLIPUVX, MASK_VNCLIPUVX, match_opcode, 0 },
{"vnclipu.vi",   0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VNCLIPUVI, MASK_VNCLIPUVI, match_opcode, 0 },
{"vnclip.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VNCLIPVV, MASK_VNCLIPVV, match_opcode, 0 },
{"vnclip.vx",   0, {"V", 0},  "Vd,Vt,sVm", MATCH_VNCLIPVX, MASK_VNCLIPVX, match_opcode, 0 },
{"vnclip.vi",   0, {"V", 0},  "Vd,Vt,VjVm", MATCH_VNCLIPVI, MASK_VNCLIPVI, match_opcode, 0 },

{"vfadd.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFADDVV, MASK_VFADDVV, match_opcode, 0},
{"vfadd.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFADDVF, MASK_VFADDVF, match_opcode, 0},
{"vfsub.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFSUBVV, MASK_VFSUBVV, match_opcode, 0},
{"vfsub.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFSUBVF, MASK_VFSUBVF, match_opcode, 0},
{"vfrsub.vf",  0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFRSUBVF, MASK_VFRSUBVF, match_opcode, 0},

{"vfwadd.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFWADDVV, MASK_VFWADDVV, match_opcode, 0},
{"vfwadd.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFWADDVF, MASK_VFWADDVF, match_opcode, 0},
{"vfwsub.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFWSUBVV, MASK_VFWSUBVV, match_opcode, 0},
{"vfwsub.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFWSUBVF, MASK_VFWSUBVF, match_opcode, 0},
{"vfwadd.wv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFWADDWV, MASK_VFWADDWV, match_opcode, 0},
{"vfwadd.wf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFWADDWF, MASK_VFWADDWF, match_opcode, 0},
{"vfwsub.wv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFWSUBWV, MASK_VFWSUBWV, match_opcode, 0},
{"vfwsub.wf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFWSUBWF, MASK_VFWSUBWF, match_opcode, 0},

{"vfmul.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFMULVV, MASK_VFMULVV, match_opcode, 0},
{"vfmul.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFMULVF, MASK_VFMULVF, match_opcode, 0},
{"vfdiv.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFDIVVV, MASK_VFDIVVV, match_opcode, 0},
{"vfdiv.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFDIVVF, MASK_VFDIVVF, match_opcode, 0},
{"vfrdiv.vf",  0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFRDIVVF, MASK_VFRDIVVF, match_opcode, 0},

{"vfwmul.vv",  0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFWMULVV, MASK_VFWMULVV, match_opcode, 0},
{"vfwmul.vf",  0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFWMULVF, MASK_VFWMULVF, match_opcode, 0},

{"vfmadd.vv",  0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFMADDVV, MASK_VFMADDVV, match_opcode, 0},
{"vfmadd.vf",  0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFMADDVF, MASK_VFMADDVF, match_opcode, 0},
{"vfnmadd.vv", 0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFNMADDVV, MASK_VFNMADDVV, match_opcode, 0},
{"vfnmadd.vf", 0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFNMADDVF, MASK_VFNMADDVF, match_opcode, 0},
{"vfmsub.vv",  0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFMSUBVV, MASK_VFMSUBVV, match_opcode, 0},
{"vfmsub.vf",  0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFMSUBVF, MASK_VFMSUBVF, match_opcode, 0},
{"vfnmsub.vv", 0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFNMSUBVV, MASK_VFNMSUBVV, match_opcode, 0},
{"vfnmsub.vf", 0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFNMSUBVF, MASK_VFNMSUBVF, match_opcode, 0},
{"vfmacc.vv",  0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFMACCVV, MASK_VFMACCVV, match_opcode, 0},
{"vfmacc.vf",  0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFMACCVF, MASK_VFMACCVF, match_opcode, 0},
{"vfnmacc.vv", 0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFNMACCVV, MASK_VFNMACCVV, match_opcode, 0},
{"vfnmacc.vf", 0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFNMACCVF, MASK_VFNMACCVF, match_opcode, 0},
{"vfmsac.vv",  0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFMSACVV, MASK_VFMSACVV, match_opcode, 0},
{"vfmsac.vf",  0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFMSACVF, MASK_VFMSACVF, match_opcode, 0},
{"vfnmsac.vv", 0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFNMSACVV, MASK_VFNMSACVV, match_opcode, 0},
{"vfnmsac.vf", 0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFNMSACVF, MASK_VFNMSACVF, match_opcode, 0},

{"vfwmacc.vv",  0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFWMACCVV, MASK_VFWMACCVV, match_opcode, 0},
{"vfwmacc.vf",  0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFWMACCVF, MASK_VFWMACCVF, match_opcode, 0},
{"vfwnmacc.vv", 0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFWNMACCVV, MASK_VFWNMACCVV, match_opcode, 0},
{"vfwnmacc.vf", 0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFWNMACCVF, MASK_VFWNMACCVF, match_opcode, 0},
{"vfwmsac.vv",  0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFWMSACVV, MASK_VFWMSACVV, match_opcode, 0},
{"vfwmsac.vf",  0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFWMSACVF, MASK_VFWMSACVF, match_opcode, 0},
{"vfwnmsac.vv", 0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VFWNMSACVV, MASK_VFWNMSACVV, match_opcode, 0},
{"vfwnmsac.vf", 0, {"V", "F", 0}, "Vd,S,VtVm", MATCH_VFWNMSACVF, MASK_VFWNMSACVF, match_opcode, 0},

{"vfsqrt.v",   0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFSQRTV, MASK_VFSQRTV, match_opcode, 0},

{"vfmin.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFMINVV, MASK_VFMINVV, match_opcode, 0},
{"vfmin.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFMINVF, MASK_VFMINVF, match_opcode, 0},
{"vfmax.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFMAXVV, MASK_VFMAXVV, match_opcode, 0},
{"vfmax.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFMAXVF, MASK_VFMAXVF, match_opcode, 0},

{"vfsgnj.vv",  0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFSGNJVV, MASK_VFSGNJVV, match_opcode, 0},
{"vfsgnj.vf",  0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFSGNJVF, MASK_VFSGNJVF, match_opcode, 0},
{"vfsgnjn.vv", 0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFSGNJNVV, MASK_VFSGNJNVV, match_opcode, 0},
{"vfsgnjn.vf", 0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFSGNJNVF, MASK_VFSGNJNVF, match_opcode, 0},
{"vfsgnjx.vv", 0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFSGNJXVV, MASK_VFSGNJXVV, match_opcode, 0},
{"vfsgnjx.vf", 0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VFSGNJXVF, MASK_VFSGNJXVF, match_opcode, 0},

{"vmfeq.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VMFEQVV, MASK_VMFEQVV, match_opcode, 0},
{"vmfeq.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VMFEQVF, MASK_VMFEQVF, match_opcode, 0},
{"vmfne.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VMFNEVV, MASK_VMFNEVV, match_opcode, 0},
{"vmfne.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VMFNEVF, MASK_VMFNEVF, match_opcode, 0},
{"vmflt.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VMFLTVV, MASK_VMFLTVV, match_opcode, 0},
{"vmflt.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VMFLTVF, MASK_VMFLTVF, match_opcode, 0},
{"vmfle.vv",   0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VMFLEVV, MASK_VMFLEVV, match_opcode, 0},
{"vmfle.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VMFLEVF, MASK_VMFLEVF, match_opcode, 0},
{"vmfgt.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VMFGTVF, MASK_VMFGTVF, match_opcode, 0},
{"vmfge.vf",   0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VMFGEVF, MASK_VMFGEVF, match_opcode, 0},

/* These aliases are for assembly but not disassembly.  */
{"vmfgt.vv",   0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VMFLTVV, MASK_VMFLTVV, match_opcode, INSN_ALIAS},
{"vmfge.vv",   0, {"V", "F", 0}, "Vd,Vs,VtVm", MATCH_VMFLEVV, MASK_VMFLEVV, match_opcode, INSN_ALIAS},

{"vmford.vv",  0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VMFORDVV, MASK_VMFORDVV, match_opcode, 0},
{"vmford.vf",  0, {"V", "F", 0}, "Vd,Vt,SVm", MATCH_VMFORDVF, MASK_VMFORDVF, match_opcode, 0},

{"vfclass.v",  0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFCLASSV, MASK_VFCLASSV, match_opcode, 0},

{"vfmerge.vfm",0, {"V", "F", 0}, "Vd,Vt,S,V0", MATCH_VFMERGEVFM, MASK_VFMERGEVFM, match_opcode, 0},
{"vfmv.v.f",   0, {"V", "F", 0}, "Vd,S", MATCH_VFMVVF, MASK_VFMVVF, match_opcode, 0 },

{"vfcvt.xu.f.v",0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFCVTXUFV, MASK_VFCVTXUFV, match_opcode, 0},
{"vfcvt.x.f.v", 0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFCVTXFV, MASK_VFCVTXFV, match_opcode, 0},
{"vfcvt.f.xu.v",0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFCVTFXUV, MASK_VFCVTFXUV, match_opcode, 0},
{"vfcvt.f.x.v", 0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFCVTFXV, MASK_VFCVTFXV, match_opcode, 0},

{"vfwcvt.xu.f.v",0,{"V", "F", 0}, "Vd,VtVm", MATCH_VFWCVTXUFV, MASK_VFWCVTXUFV, match_opcode, 0},
{"vfwcvt.x.f.v",0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFWCVTXFV, MASK_VFWCVTXFV, match_opcode, 0},
{"vfwcvt.f.xu.v",0,{"V", "F", 0}, "Vd,VtVm", MATCH_VFWCVTFXUV, MASK_VFWCVTFXUV, match_opcode, 0},
{"vfwcvt.f.x.v",0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFWCVTFXV, MASK_VFWCVTFXV, match_opcode, 0},
{"vfwcvt.f.f.v",0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFWCVTFFV, MASK_VFWCVTFFV, match_opcode, 0},

{"vfncvt.xu.f.v",0,{"V", "F", 0}, "Vd,VtVm", MATCH_VFNCVTXUFV, MASK_VFNCVTXUFV, match_opcode, 0},
{"vfncvt.x.f.v",0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFNCVTXFV, MASK_VFNCVTXFV, match_opcode, 0},
{"vfncvt.f.xu.v",0,{"V", "F", 0}, "Vd,VtVm", MATCH_VFNCVTFXUV, MASK_VFNCVTFXUV, match_opcode, 0},
{"vfncvt.f.x.v",0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFNCVTFXV, MASK_VFNCVTFXV, match_opcode, 0},
{"vfncvt.f.f.v",0, {"V", "F", 0}, "Vd,VtVm", MATCH_VFNCVTFFV, MASK_VFNCVTFFV, match_opcode, 0},

{"vredsum.vs", 0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VREDSUMVV, MASK_VREDSUMVV, match_opcode, 0},
{"vredmaxu.vs",0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VREDMAXUVV, MASK_VREDMAXUVV, match_opcode, 0},
{"vredmax.vs", 0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VREDMAXVV, MASK_VREDMAXVV, match_opcode, 0},
{"vredminu.vs",0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VREDMINUVV, MASK_VREDMINUVV, match_opcode, 0},
{"vredmin.vs", 0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VREDMINVV, MASK_VREDMINVV, match_opcode, 0},
{"vredand.vs", 0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VREDANDVV, MASK_VREDANDVV, match_opcode, 0},
{"vredor.vs",  0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VREDORVV, MASK_VREDORVV, match_opcode, 0},
{"vredxor.vs", 0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VREDXORVV, MASK_VREDXORVV, match_opcode, 0},

{"vwredsumu.vs",0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VWREDSUMUVV, MASK_VWREDSUMUVV, match_opcode, 0},
{"vwredsum.vs",0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VWREDSUMVV, MASK_VWREDSUMVV, match_opcode, 0},

{"vfredosum.vs",0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFREDOSUMV, MASK_VFREDOSUMV, match_opcode, 0},
{"vfredsum.vs", 0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFREDSUMV, MASK_VFREDSUMV, match_opcode, 0},
{"vfredmax.vs", 0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFREDMAXV, MASK_VFREDMAXV, match_opcode, 0},
{"vfredmin.vs", 0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFREDMINV, MASK_VFREDMINV, match_opcode, 0},

{"vfwredosum.vs",0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFWREDOSUMV, MASK_VFWREDOSUMV, match_opcode, 0},
{"vfwredsum.vs", 0, {"V", "F", 0}, "Vd,Vt,VsVm", MATCH_VFWREDSUMV, MASK_VFWREDSUMV, match_opcode, 0},

{"vmcpy.m",    0, {"V", 0}, "Vd,Vu", MATCH_VMANDMM, MASK_VMANDMM, match_vs1_eq_vs2, INSN_ALIAS},
{"vmclr.m",    0, {"V", 0}, "Vv", MATCH_VMXORMM, MASK_VMXORMM, match_vd_eq_vs1_eq_vs2, INSN_ALIAS},
{"vmset.m",    0, {"V", 0}, "Vv", MATCH_VMXNORMM, MASK_VMXNORMM, match_vd_eq_vs1_eq_vs2, INSN_ALIAS},
{"vmnot.m",    0, {"V", 0}, "Vd,Vu", MATCH_VMNANDMM, MASK_VMNANDMM, match_vs1_eq_vs2, INSN_ALIAS},

{"vmand.mm",   0, {"V", 0}, "Vd,Vt,Vs", MATCH_VMANDMM, MASK_VMANDMM, match_opcode, 0},
{"vmnand.mm",  0, {"V", 0}, "Vd,Vt,Vs", MATCH_VMNANDMM, MASK_VMNANDMM, match_opcode, 0},
{"vmandnot.mm",0, {"V", 0}, "Vd,Vt,Vs", MATCH_VMANDNOTMM, MASK_VMANDNOTMM, match_opcode, 0},
{"vmxor.mm",   0, {"V", 0}, "Vd,Vt,Vs", MATCH_VMXORMM, MASK_VMXORMM, match_opcode, 0},
{"vmor.mm",    0, {"V", 0}, "Vd,Vt,Vs", MATCH_VMORMM, MASK_VMORMM, match_opcode, 0},
{"vmnor.mm",   0, {"V", 0}, "Vd,Vt,Vs", MATCH_VMNORMM, MASK_VMNORMM, match_opcode, 0},
{"vmornot.mm", 0, {"V", 0}, "Vd,Vt,Vs", MATCH_VMORNOTMM, MASK_VMORNOTMM, match_opcode, 0},
{"vmxnor.mm",  0, {"V", 0}, "Vd,Vt,Vs", MATCH_VMXNORMM, MASK_VMXNORMM, match_opcode, 0},

{"vmpopc.m",   0, {"V", 0}, "d,VtVm", MATCH_VMPOPCM, MASK_VMPOPCM, match_opcode, 0},
{"vmfirst.m",  0, {"V", 0}, "d,VtVm", MATCH_VMFIRSTM, MASK_VMFIRSTM, match_opcode, 0},
{"vmsbf.m",    0, {"V", 0}, "Vd,VtVm", MATCH_VMSBFM, MASK_VMSBFM, match_opcode, 0},
{"vmsif.m",    0, {"V", 0}, "Vd,VtVm", MATCH_VMSIFM, MASK_VMSIFM, match_opcode, 0},
{"vmsof.m",    0, {"V", 0}, "Vd,VtVm", MATCH_VMSOFM, MASK_VMSOFM, match_opcode, 0},
{"viota.m",    0, {"V", 0}, "Vd,VtVm", MATCH_VIOTAM, MASK_VIOTAM, match_opcode, 0},
{"vid.v",      0, {"V", 0}, "VdVm", MATCH_VIDV, MASK_VIDV, match_opcode, 0},

{"vmv.x.s",    0, {"V", 0}, "d,Vt", MATCH_VMVXS, MASK_VMVXS, match_opcode, INSN_ALIAS},

{"vext.x.v",   0, {"V", 0}, "d,Vt,s", MATCH_VEXTXV, MASK_VEXTXV, match_opcode, 0},

{"vmv.s.x",    0, {"V", 0}, "Vd,s", MATCH_VMVSX, MASK_VMVSX, match_opcode, 0},

{"vfmv.f.s",   0, {"V", "F", 0}, "D,Vt", MATCH_VFMVFS, MASK_VFMVFS, match_opcode, 0},
{"vfmv.s.f",   0, {"V", "F", 0}, "Vd,S", MATCH_VFMVSF, MASK_VFMVSF, match_opcode, 0},

{"vslideup.vx",0, {"V", 0}, "Vd,Vt,sVm", MATCH_VSLIDEUPVX, MASK_VSLIDEUPVX, match_opcode, 0},
{"vslideup.vi",0, {"V", 0}, "Vd,Vt,VjVm", MATCH_VSLIDEUPVI, MASK_VSLIDEUPVI, match_opcode, 0},
{"vslidedown.vx",0,{"V", 0}, "Vd,Vt,sVm", MATCH_VSLIDEDOWNVX, MASK_VSLIDEDOWNVX, match_opcode, 0},
{"vslidedown.vi",0,{"V", 0}, "Vd,Vt,VjVm", MATCH_VSLIDEDOWNVI, MASK_VSLIDEDOWNVI, match_opcode, 0},

{"vslide1up.vx",0 ,{"V", 0}, "Vd,Vt,sVm", MATCH_VSLIDE1UPVX, MASK_VSLIDE1UPVX, match_opcode, 0},
{"vslide1down.vx",0,{"V", 0}, "Vd,Vt,sVm", MATCH_VSLIDE1DOWNVX, MASK_VSLIDE1DOWNVX, match_opcode, 0},

{"vrgather.vv",0, {"V", 0}, "Vd,Vt,VsVm", MATCH_VRGATHERVV, MASK_VRGATHERVV, match_opcode, 0},
{"vrgather.vx",0, {"V", 0}, "Vd,Vt,sVm", MATCH_VRGATHERVX, MASK_VRGATHERVX, match_opcode, 0},
{"vrgather.vi",0, {"V", 0}, "Vd,Vt,VjVm", MATCH_VRGATHERVI, MASK_VRGATHERVI, match_opcode, 0},

{"vcompress.vm",0, {"V", 0}, "Vd,Vt,Vs", MATCH_VCOMPRESSV, MASK_VCOMPRESSV, match_opcode, 0},

{"vdot.vv",    0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VDOTVV, MASK_VDOTVV, match_opcode, 0},
{"vdotu.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VDOTUVV, MASK_VDOTUVV, match_opcode, 0},
{"vfdot.vv",   0, {"V", 0},  "Vd,Vt,VsVm", MATCH_VFDOTVV, MASK_VFDOTVV, match_opcode, 0},
/* END RVV */

/* Terminate the list.  */
{0, 0, {0}, 0, 0, 0, 0, 0}
};

/* Instruction format for .insn directive.  */
const struct riscv_opcode riscv_insn_types[] =
{
/* name, xlen, isa,          operands, match, mask,    match_func, pinfo.  */
{"r",       0, {"I", 0},  "O4,F3,F7,d,s,t",     0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F7,D,s,t",     0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F7,d,S,t",     0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F7,D,S,t",     0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F7,d,s,T",     0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F7,D,s,T",     0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F7,d,S,T",     0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F7,D,S,T",     0,    0,  match_opcode, 0 },

{"r",       0, {"I", 0},  "O4,F3,F2,d,s,t,r",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,D,s,t,r",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,d,S,t,r",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,D,S,t,r",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,d,s,T,r",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,D,s,T,r",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,d,S,T,r",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,D,S,T,r",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,d,s,t,R",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,D,s,t,R",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,d,S,t,R",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,D,S,t,R",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,d,s,T,R",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,D,s,T,R",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,d,S,T,R",   0,    0,  match_opcode, 0 },
{"r",       0, {"I", 0},  "O4,F3,F2,D,S,T,R",   0,    0,  match_opcode, 0 },

{"i",       0, {"I", 0},  "O4,F3,d,s,j",        0,    0,  match_opcode, 0 },
{"i",       0, {"I", 0},  "O4,F3,D,s,j",        0,    0,  match_opcode, 0 },
{"i",       0, {"I", 0},  "O4,F3,d,S,j",        0,    0,  match_opcode, 0 },
{"i",       0, {"I", 0},  "O4,F3,D,S,j",        0,    0,  match_opcode, 0 },

{"i",       0, {"I", 0},  "O4,F3,d,o(s)",       0,    0,  match_opcode, 0 },
{"i",       0, {"I", 0},  "O4,F3,D,o(s)",       0,    0,  match_opcode, 0 },

{"s",       0, {"I", 0},  "O4,F3,d,o(s)",       0,    0,  match_opcode, 0 },
{"s",       0, {"I", 0},  "O4,F3,D,o(s)",       0,    0,  match_opcode, 0 },

{"sb",      0, {"I", 0},  "O4,F3,s,t,p",        0,    0,  match_opcode, 0 },
{"sb",      0, {"I", 0},  "O4,F3,S,t,p",        0,    0,  match_opcode, 0 },
{"sb",      0, {"I", 0},  "O4,F3,s,T,p",        0,    0,  match_opcode, 0 },
{"sb",      0, {"I", 0},  "O4,F3,S,T,p",        0,    0,  match_opcode, 0 },

{"sb",      0, {"I", 0},  "O4,F3,t,q(s)",       0,    0,  match_opcode, 0 },
{"sb",      0, {"I", 0},  "O4,F3,T,q(s)",       0,    0,  match_opcode, 0 },

{"u",       0, {"I", 0},  "O4,d,u",             0,    0,  match_opcode, 0 },
{"u",       0, {"I", 0},  "O4,D,u",             0,    0,  match_opcode, 0 },

{"uj",      0, {"I", 0},  "O4,d,a",             0,    0,  match_opcode, 0 },
{"uj",      0, {"I", 0},  "O4,D,a",             0,    0,  match_opcode, 0 },

{"cr",      0, {"C", 0},  "O2,CF4,d,CV",        0,    0,  match_opcode, 0 },
{"cr",      0, {"C", 0},  "O2,CF4,D,CV",        0,    0,  match_opcode, 0 },
{"cr",      0, {"C", 0},  "O2,CF4,d,CT",        0,    0,  match_opcode, 0 },
{"cr",      0, {"C", 0},  "O2,CF4,D,CT",        0,    0,  match_opcode, 0 },

{"ci",      0, {"C", 0},  "O2,CF3,d,Co",        0,    0,  match_opcode, 0 },
{"ci",      0, {"C", 0},  "O2,CF3,D,Co",        0,    0,  match_opcode, 0 },

{"ciw",     0, {"C", 0},  "O2,CF3,Ct,C8",       0,    0,  match_opcode, 0 },
{"ciw",     0, {"C", 0},  "O2,CF3,CD,C8",       0,    0,  match_opcode, 0 },

{"ca",      0, {"C", 0},  "O2,CF6,CF2,Cs,Ct",   0,    0,  match_opcode, 0 },
{"ca",      0, {"C", 0},  "O2,CF6,CF2,CS,Ct",   0,    0,  match_opcode, 0 },
{"ca",      0, {"C", 0},  "O2,CF6,CF2,Cs,CD",   0,    0,  match_opcode, 0 },
{"ca",      0, {"C", 0},  "O2,CF6,CF2,CS,CD",   0,    0,  match_opcode, 0 },

{"cb",      0, {"C", 0},  "O2,CF3,Cs,Cp",       0,    0,  match_opcode, 0 },
{"cb",      0, {"C", 0},  "O2,CF3,CS,Cp",       0,    0,  match_opcode, 0 },

{"cj",      0, {"C", 0},  "O2,CF3,Ca",          0,    0,  match_opcode, 0 },
/* Terminate the list.  */
{0, 0, {0}, 0, 0, 0, 0, 0}
};
