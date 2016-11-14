/* Target-dependent code for GNU/Linux RISC-V.

   Copyright (C) 2015 Free Software Foundation, Inc.
   Contributed by Albert Ou <albert@sifive.com>.

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

#include "defs.h"

#include "gdbarch.h"
#include "osabi.h"
#include "linux-tdep.h"
#include "solib-svr4.h"
#include "glibc-tdep.h"

#include "riscv-tdep.h"
#include "riscv-linux-tdep.h"

#include "regcache.h"
#include "regset.h"

static const struct regcache_map_entry riscv_linux_gregmap[] =
{
  { 1,  RISCV_PC_REGNUM, 0 },
  { 31, RISCV_RA_REGNUM, 0 }, /* x1 to x31 */
  { 0 }
};

const struct regset riscv_linux_gregset =
{
  riscv_linux_gregmap, regcache_supply_regset, regcache_collect_regset
};

static void
riscv_linux_iterate_over_regset_sections (struct gdbarch *gdbarch,
					  iterate_over_regset_sections_cb *cb,
					  void *cb_data,
					  const struct regcache *regcache)
{
  cb (".reg", (RISCV_NGREG * riscv_isa_regsize (gdbarch)),
      &riscv_linux_gregset, NULL, cb_data);
}

static void
riscv_linux_init_abi (struct gdbarch_info info, struct gdbarch *gdbarch)
{
  linux_init_abi (info, gdbarch);

  /* GNU/Linux uses SVR4-style shared libraries.  */
  set_solib_svr4_fetch_link_map_offsets
    (gdbarch, gdbarch_tdep (gdbarch)->riscv_abi == RISCV_ABI_FLAG_RV32I ?
      svr4_ilp32_fetch_link_map_offsets :
      svr4_lp64_fetch_link_map_offsets);

  set_gdbarch_iterate_over_regset_sections
    (gdbarch, riscv_linux_iterate_over_regset_sections);
}

/* Provide a prototype to silence -Wmissing-prototypes.  */
extern initialize_file_ftype _initialize_riscv_linux_tdep;

void
_initialize_riscv_linux_tdep (void)
{
  gdbarch_register_osabi (bfd_arch_riscv, 0, GDB_OSABI_LINUX,
			  riscv_linux_init_abi);
}
