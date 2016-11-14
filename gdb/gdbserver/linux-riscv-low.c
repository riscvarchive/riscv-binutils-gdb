/* GNU/Linux/RISC-V specific low level interface, GDBserver.

   Copyright (C) 2012-2017 Free Software Foundation, Inc.

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

#include "server.h"
#include "linux-low.h"

#include <arch/abi.h>
#include "nat/gdb_ptrace.h"

/* Defined in auto-generated file reg-riscv.c.  */
void init_registers_riscv (void);
extern const struct target_desc *tdesc_riscv;

#define riscv_num_regs 32

static int riscv_regmap[] =
{
   0,  1,  2,  3,  4,  5,  6,  7,
   8,  9, 10, 11, 12, 13, 14, 15,
  16, 17, 18, 19, 20, 21, 22, 23,
  24, 25, 26, 27, 28, 29, 30, 31,
  32, 33, 34, 35, 36, 37, 38, 39,
  40, 41, 42, 43, 44, 45, 46, 47,
  48, 49, 50, 51, 52, 53, 54, 55,
  56, 57, 58, 59, 60, 61, 62, 63
};

static int
riscv_cannot_fetch_register (int regno)
{
  if (regno >= 0 && regno < 63)
    return 0;
  else
    return 1;
}

static int
riscv_cannot_store_register (int regno)
{
  if (regno >= 0 && regno < 63)
    return 0;
  else
    return 1;
}

/* Implementation of linux_target_ops method "sw_breakpoint_from_kind".  */

static const gdb_byte ebreak[] = { 0x73, 0x00, 0x10, 0x00, };
static const gdb_byte c_ebreak[] = { 0x02, 0x90 };

static const gdb_byte *
riscv_sw_breakpoint_from_kind (int kind, int *size)
{
  *size = kind;
  switch (kind)
    {
    case 2:
      return c_ebreak;
    case 4:
      return ebreak;
    default:
      gdb_assert(0);
    }
}

static int
riscv_breakpoint_at (CORE_ADDR where)
{
  uint8_t insn[4];

  (*the_target->read_memory) (where, (unsigned char *) &insn, 4);
  if (insn[0] == ebreak[0] && inst[1] == ebreak[1]
      && inst[2] == ebreak[2] && inst[3] == ebreak[3])
    return 1;
  if (insn[0] == c_ebreak[0] && inst[1] == c_ebreak[1])
    return 1;

  /* If necessary, recognize more trap instructions here.  GDB only uses the
     one.  */
  return 0;
}

static void
riscv_fill_gregset (struct regcache *regcache, void *buf)
{
  int i;

  for (i = 0; i < riscv_num_regs; i++)
    if (riscv_regmap[i] != -1)
      collect_register (regcache, i, ((uint_reg_t *) buf) + riscv_regmap[i]);
}

static void
riscv_store_gregset (struct regcache *regcache, const void *buf)
{
  int i;

  for (i = 0; i < riscv_num_regs; i++)
    if (riscv_regmap[i] != -1)
      supply_register (regcache, i, ((uint_reg_t *) buf) + riscv_regmap[i]);
}

static struct regset_info riscv_regsets[] =
{
  { PTRACE_GETREGS, PTRACE_SETREGS, 0, riscv_num_regs * 8,
    GENERAL_REGS, riscv_fill_gregset, riscv_store_gregset },
  NULL_REGSET
};

static struct regsets_info riscv_regsets_info =
  {
    riscv_regsets, /* regsets */
    0, /* num_regsets */
    NULL, /* disabled_regsets */
  };

static struct usrregs_info riscv_usrregs_info =
  {
    riscv_num_regs,
    riscv_regmap,
  };

static struct regs_info regs_info =
  {
    NULL, /* regset_bitmap */
    &riscv_usrregs_info,
    &riscv_regsets_info,
  };

static const struct regs_info *
riscv_regs_info (void)
{
  return &regs_info;
}

static void
riscv_arch_setup (void)
{
  int pid = pid_of (current_thread);
  unsigned int machine;
  int is_elf64 = linux_pid_exe_is_elf_64_file (pid, &machine);

  if (sizeof (void *) == 4)
    if (is_elf64 > 0)
      error (_("Can't debug 64-bit process with 32-bit GDBserver"));

  if (!is_elf64)
    current_process ()->tdesc = tdesc_riscvgx32;
  else
    current_process ()->tdesc = tdesc_riscvgx;
}

/* Support for hardware single step.  */

static int
riscv_supports_hardware_single_step (void)
{
  return 0;
}


struct linux_target_ops the_low_target =
{
  riscv_arch_setup,
  riscv_regs_info,
  riscv_cannot_fetch_register,
  riscv_cannot_store_register,
  NULL,
  linux_get_pc_64bit,
  linux_set_pc_64bit,
  NULL, /* breakpoint_kind_from_pc */
  riscv_sw_breakpoint_from_kind,
  NULL,
  0,
  riscv_breakpoint_at,
  NULL, /* supports_z_point_type */
  NULL, /* insert_point */
  NULL, /* remove_point */
  NULL, /* stopped_by_watchpoint */
  NULL, /* stopped_data_address */
  NULL, /* collect_ptrace_register */
  NULL, /* supply_ptrace_register */
  NULL, /* siginfo_fixup */
  NULL, /* new_process */
  NULL, /* new_thread */
  NULL, /* new_fork */
  NULL, /* prepare_to_resume */
  NULL, /* process_qsupported */
  NULL, /* supports_tracepoints */
  NULL, /* get_thread_area */
  NULL, /* install_fast_tracepoint_jump_pad */
  NULL, /* emit_ops */
  NULL, /* get_min_fast_tracepoint_insn_len */
  NULL, /* supports_range_stepping */
  NULL, /* breakpoint_kind_from_current_state */
  riscv_supports_hardware_single_step,
};

void
initialize_low_arch (void)
{
  init_registers_riscv();

  initialize_regsets_info (&riscv_regsets_info);
}
