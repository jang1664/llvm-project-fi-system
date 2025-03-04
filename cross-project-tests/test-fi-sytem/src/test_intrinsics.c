void __builtin_riscv_fpint_set_dl_vvv_s(int, int, int);

int test_intrinsics(int a) {
  int b = a + 1;
  __builtin_riscv_fpint_set_dl_vvv_s(1, 2, 3);
  return b;
}