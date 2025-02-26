cmake ../llvm \
  -DLLVM_ENABLE_DOXYGEN=On \
  -DCMAKE_BUILD_TYPE=Debug \
  -DLLVM_ENABLE_PROJECTS="clang;lld"
make doxygen-llvm -j64