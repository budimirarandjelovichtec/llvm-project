#ifndef LLVM_TRANSFORMS_UTILS_DELETEDEBUGINSTRUCTIONS_H
#define LLVM_TRANSFORMS_UTILS_DELETEDEBUGINSTRUCTIONS_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class DeleteDebugInstructions : public PassInfoMixin<DeleteDebugInstructions> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} // namespace llvm

#endif