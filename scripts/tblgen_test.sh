# llvm-tblgen -o RISCVGenRegisterInfo.inc            --gen-register-info                                                 ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
llvm-tblgen -o RISCVGenInstrInfo.inc               --gen-instr-info                                                    ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenAsmMatcher.inc              --gen-asm-matcher                                                   ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenAsmWriter.inc               --gen-asm-writer                                                    ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenCompressInstEmitter.inc     --gen-compress-inst-emitter                                         ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenMacroFusion.inc             --gen-macro-fusion-pred                                             ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
llvm-tblgen -o RISCVGenDAGISel.inc                 --gen-dag-isel                                                      ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenDisassemblerTables.inc      --gen-disassembler                                                  ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenInstrInfo.inc               --gen-instr-info                                                    ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenMCCodeEmitter.inc           --gen-emitter                                                       ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenMCPseudoLowering.inc        --gen-pseudo-lowering                                               ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenRegisterBank.inc            --gen-register-bank                                                 ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenRegisterInfo.inc            --gen-register-info                                                 ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenSearchableTables.inc        --gen-searchable-tables                                             ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenSubtargetInfo.inc           --gen-subtarget                                                     ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenExegesis.inc                --gen-exegesis                                                      ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenGlobalISel.inc              --gen-global-isel                                                   ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenO0PreLegalizeGICombiner.inc --gen-global-isel-combiner -combiners="RISCVO0PreLegalizerCombiner" ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenPreLegalizeGICombiner.inc   --gen-global-isel-combiner -combiners="RISCVPreLegalizerCombiner"   ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 
# llvm-tblgen -o RISCVGenPostLegalizeGICombiner.inc  --gen-global-isel-combiner -combiners="RISCVPostLegalizerCombiner"  ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 

# llvm-tblgen ../llvm/lib/Target/RISCV/RISCV.td -I../llvm/include -I../llvm/lib/Target/RISCV 