.*: Assembler messages:
.*: Error: illegal operand imm \(shift amount\) must be 0...31 `sllw x1,x2,32'
.*: Error: illegal operand imm \(shift amount\) must be 0...\(XLEN-1\) `sll x1,x2,64'
.*: Error: illegal operand CSRXI imm must be 0...31 `csrrwi x1,0x1,32'
.*: Error: illegal operand CSR address must be 0x0...0xfff `csrr x1,0x1000'
.*: Error: illegal operand lui expression not in range 0x0...0xfffff `lui x1,0x100000'
