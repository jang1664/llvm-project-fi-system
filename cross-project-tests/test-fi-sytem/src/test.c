int test(int a) {
  int b = 0;
  asm(".word 0x12345678");
  asm("mv %0, %1" : "=r"(a) : "r"(a));
  b = a + 1;
  return b;
}