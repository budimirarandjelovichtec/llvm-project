#ifndef LLVM_TRANSFORMS_UTILS_COUNTFUNCTIONCALLS_H
#define LLVM_TRANSFORMS_UTILS_COUNTFUNCTIONCALLS_H

#include "llvm/ADT/DenseMap.h"
#include "llvm/IR/PassManager.h"
#include <map>

namespace llvm {

class CountFunctionCalls : public PassInfoMixin<CountFunctionCalls> {
public:
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);

    PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM);

private:
    void printNumberOfFunctionCalls();

    std::map<Value*, int> mapOfDirectFunctionCalls;
};

} // namespace llvm

#endif