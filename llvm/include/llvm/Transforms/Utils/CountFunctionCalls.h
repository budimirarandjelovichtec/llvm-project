#ifndef LLVM_TRANSFORMS_UTILS_COUNTFUNCTIONCALLS_H
#define LLVM_TRANSFORMS_UTILS_COUNTFUNCTIONCALLS_H

#include "llvm/ADT/DenseMap.h"
#include "llvm/IR/PassManager.h"

namespace llvm {

class CountFunctionCalls : public PassInfoMixin<CountFunctionCalls> {
public:
    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);

private:
    void printNumberOfFunctionCalls();

    DenseMap<Value*, int> mapOfDirectFunctionCalls;
    DenseMap<Value*, int> mapOfIndirectFunctionCalls;
};

} // namespace llvm

#endif