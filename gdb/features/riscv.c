/* THIS FILE IS GENERATED.  -*- buffer-read-only: t -*- vi:set ro:
  Original: riscv.xml */

#include "defs.h"
#include "osabi.h"
#include "target-descriptions.h"

struct target_desc *tdesc_riscv;
static void
initialize_tdesc_riscv (void)
{
  struct target_desc *result = allocate_target_description ();
  struct tdesc_feature *feature;

  set_tdesc_architecture (result, bfd_scan_arch ("riscv:rv64"));

  feature = tdesc_create_feature (result, "org.gnu.gdb.riscv.rv64i");
  tdesc_create_reg (feature, "x0", 0, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x1", 1, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x2", 2, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x3", 3, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x4", 4, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x5", 5, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x6", 6, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x7", 7, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x8", 8, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x9", 9, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x10", 10, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x11", 11, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x12", 12, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x13", 13, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x14", 14, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x15", 15, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x16", 16, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x17", 17, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x18", 18, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x19", 19, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x20", 20, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x21", 21, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x22", 22, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x23", 23, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x24", 24, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x25", 25, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x26", 26, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x27", 27, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x28", 28, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x29", 29, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x30", 30, 1, "general", 64, "int");
  tdesc_create_reg (feature, "x31", 31, 1, "general", 64, "int");

  feature = tdesc_create_feature (result, "org.gnu.gdb.riscv.rv64d");
  tdesc_create_reg (feature, "f0", 32, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f1", 33, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f2", 34, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f3", 35, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f4", 36, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f5", 37, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f6", 38, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f7", 39, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f8", 40, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f9", 41, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f10", 42, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f11", 43, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f12", 44, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f13", 45, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f14", 46, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f15", 47, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f16", 48, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f17", 49, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f18", 50, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f19", 51, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f20", 52, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f21", 53, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f22", 54, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f23", 55, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f24", 56, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f25", 57, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f26", 58, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f27", 59, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f28", 60, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f29", 61, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f30", 62, 1, "float", 64, "float");
  tdesc_create_reg (feature, "f31", 63, 1, "float", 64, "float");

  tdesc_riscv = result;
}
