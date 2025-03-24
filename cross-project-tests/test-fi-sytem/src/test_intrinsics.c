void __builtin_riscv_fpint_set_dl_vvv_s(int, int, int);
void __builtin_riscv_fpint_set_dl_vvv_v(int, int, int);
void __builtin_riscv_fpint_dl_vvv_f32_mult(int*, int*, int*, int, int, int);

int test_intrinsics(int a, int b, int c) {
  int d = a + 1;
  __builtin_riscv_fpint_set_dl_vvv_s(1, 2, 3);
  __builtin_riscv_fpint_set_dl_vvv_v(1, 2, 3);
  __builtin_riscv_fpint_dl_vvv_f32_mult(&a, &b, &c, 1, 0, 1);
  return d;
}