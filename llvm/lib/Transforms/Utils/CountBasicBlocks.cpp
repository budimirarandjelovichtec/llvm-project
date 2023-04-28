#include "llvm/Transforms/Utils/CountBasicBlocks.h"

using namespace llvm;

PreservedAnalyses CountBasicBlocks::run(Function &F,
                                        FunctionAnalysisManager &AM) {
    int numOfBasicBlocks = 0;
    for (BasicBlock &BB : F) {
        numOfBasicBlocks++;
    }

    errs() << F.getName() << " has "
            << numOfBasicBlocks << " basic blocks\n";

    return PreservedAnalyses::all();
}