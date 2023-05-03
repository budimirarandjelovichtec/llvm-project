#include "llvm/IR/DebugInfo.h"
#include "llvm/Transforms/Utils/DeleteDebugInstructions.h"

using namespace llvm;

PreservedAnalyses DeleteDebugInstructions::run(Function &F,
                                        FunctionAnalysisManager &AM) {

    errs() << "Function: " << F.getName() << "\n";

    int numOfDebugInstructions = 0;

    for (BasicBlock &BB : F) {
        for (Instruction &I : make_early_inc_range(BB)) {
            if (isa<DbgDeclareInst>(I)
                    || isa<DbgValueInst>(I)
                    || isa<DbgVariableIntrinsic>(I)) {
                I.eraseFromParent();
                numOfDebugInstructions++;
            }
        }
    }

    errs() << "Number of llvm.debug.* instructions deleted: "
                << numOfDebugInstructions << "\n";

    return PreservedAnalyses::all();
}