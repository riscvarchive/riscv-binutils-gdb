#source: code-model.s
#as: -march=rv64i -mabi=lp64 --defsym __medany__=1
#ld: -Tcode-model-01.ld -melf64lriscv --no-relax
#error: .*relocation truncated to fit: R_RISCV_PCREL_HI20 against `symbolA'
