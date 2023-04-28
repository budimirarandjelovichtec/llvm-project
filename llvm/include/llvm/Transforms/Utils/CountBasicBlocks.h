#ifndef LLVM_TRANSFORMS_UTILS_COUNTBASICBLOCKS_H
#define LLVM_TRANSFORMS_UTILS_COUNTBASICBLOCKS_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class CountBasicBlocks : public PassInfoMixin<CountBasicBlocks> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} // namespace llvm

#endif