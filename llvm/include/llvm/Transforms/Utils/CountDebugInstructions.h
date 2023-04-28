#ifndef LLVM_TRANSFORMS_UTILS_COUNTDEBUGINSTRUCTIONS_H
#define LLVM_TRANSFORMS_UTILS_COUNTDEBUGINSTRUCTIONS_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class CountDebugInstructions : public PassInfoMixin<CountDebugInstructions> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} // namespace llvm

#endif