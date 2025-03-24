#!/bin/bash
# generate .s with debug flag
llc --mtriple=riscv32 -mattr=+xfpint $1 -o $2 \
  -filetype=obj \
  --debug-only=isel \
  --debug-pass=Details \
  -print-after-all &> ./logs/llc.log

  # -debug \
  # -force-hardware-loops \
  # -force-nested-hardware-loop \
  # --debug-pass=Details \
  # -print-after-all

# # # generate .o with debug flag
# llc --march=inode output/$fn_no_ext.ll -o ./output/$fn_no_ext.o \
#   -force-hardware-loops \
#   -force-nested-hardware-loop \
#   -filetype=obj \
#   -debug
#   # --debug-pass=Details \
#   # -print-after-all

# # # create binary using ld.lld
# ld.lld -e 0 -Ttext 0x0 --verbose -o output/$fn_no_ext output/$fn_no_ext.o

# # dump .o to .dump
# llvm-objdump -dr --triple=INODE output/$fn_no_ext.o > output/$fn_no_ext.dump
# llvm-objdump -dr --triple=INODE output/$fn_no_ext > output/$fn_no_ext.reloc.dump

# # generate binary with llvm-objcopy
# llvm-objcopy -O binary --only-section=.text output/$fn_no_ext.o output/$fn_no_ext.bin