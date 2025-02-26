/root/tools/llvm/bin/clang --target=riscv32 -march=rv32gxfpint -mabi=ilp32d -o $2 -c --sysroot="/opt/riscv-newlib-32/riscv32-unknown-elf" --gcc-toolchain="/opt/riscv-newlib-32" $1
