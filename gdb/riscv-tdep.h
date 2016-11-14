/* Target-dependent header for the RISC-V architecture, for GDB, the GNU Debugger.

   Copyright (C) 2002-2015 Free Software Foundation, Inc.

   Contributed by Alessandro Forin(af@cs.cmu.edu) at CMU
   and by Per Bothner(bothner@cs.wisc.edu) at U.Wisconsin
   and by Todd Snyder <todd@bluespec.com>
   and by Mike Frysinger <vapier@gentoo.org>.

   This file is part of GDB.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#ifndef RISCV_TDEP_H
#define RISCV_TDEP_H

struct gdbarch;

/* All the official RISC-V ABIs.  These mostly line up with mcpuid purely for
   convenience.  */
#define RISCV_ABI_FLAG_RV32I	(0x00000000)	/* 32-bit Integer GPRs.  */
#define RISCV_ABI_FLAG_RV64I	(0x40000000)	/* 64-bit Integer GPRs.  */
#define RISCV_ABI_FLAG_D	(1 << 3)	/* Double-Precision Floating-Point.  */
#define RISCV_ABI_FLAG_F	(1 << 5)	/* Single-Precision Floating-Point.  */

#define IS_RV32I(x)	(((x) & 0xF0000000) == RISCV_ABI_FLAG_RV32I)
#define IS_RV64I(x)	(((x) & 0xF0000000) == RISCV_ABI_FLAG_RV64I)

#define HAS_FPU(x)	((x) & (RISCV_ABI_FLAG_D | RISCV_ABI_FLAG_F))

enum {
  RISCV_ZERO_REGNUM = 0,	/* Read-only register, always 0.  */
  RISCV_RA_REGNUM = 1,		/* Return Address.  */
  RISCV_SP_REGNUM = 2,		/* Stack Pointer.  */
  RISCV_GP_REGNUM = 3,		/* Global Pointer.  */
  RISCV_TP_REGNUM = 4,		/* Thread Pointer.  */
  RISCV_FP_REGNUM = 8,		/* Frame Pointer.  */
  RISCV_A0_REGNUM = 10,		/* First argument.  */
  RISCV_A1_REGNUM = 11,		/* Second argument.  */
  RISCV_PC_REGNUM = 32,		/* Program Counter.  */

  RISCV_FIRST_FP_REGNUM = 33,	/* First Floating Point Register */
  RISCV_FA0_REGNUM = 49,
  RISCV_FA1_REGNUM = 50,
  RISCV_LAST_FP_REGNUM = 64,	/* Last Floating Point Register */

  RISCV_FIRST_CSR_REGNUM = 65,  /* First CSR */
#define DECLARE_CSR(name, num) RISCV_ ## num ## _REGNUM = RISCV_LAST_FP_REGNUM + 1 + num,
#include "opcode/riscv-opc.h"
#undef DECLARE_CSR
  RISCV_LAST_CSR_REGNUM = 4160,

  RISCV_PRIV_REGNUM = 4161,

  /* Leave this as the last enum.  */
  RISCV_NUM_REGS
};

#define RISCV_LAST_REGNUM (RISCV_NUM_REGS - 1)

/* RISC-V specific per-architecture information.  */
struct gdbarch_tdep
{
  int riscv_abi;
  enum auto_boolean supports_compressed_isa;
};

static inline int
riscv_isa_regsize (struct gdbarch *gdbarch)
{
  int abi = gdbarch_tdep (gdbarch)->riscv_abi;

  switch (abi)
    {
      case RISCV_ABI_FLAG_RV32I:
	return 4;
      case RISCV_ABI_FLAG_RV64I:
	return 8;
      default:
	internal_error (__FILE__, __LINE__, _("unknown abi %i"), abi);
	return 4;
    }
}

#endif /* RISCV_TDEP_H */
