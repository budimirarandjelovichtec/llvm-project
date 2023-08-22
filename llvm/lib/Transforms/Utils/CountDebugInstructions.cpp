#include "llvm/IR/DebugInfo.h"
#include "llvm/Transforms/Utils/CountDebugInstructions.h"

using namespace llvm;

cl::opt<bool> ExperimentalInstrument(
    "experimental-instrument", llvm::cl::init(false),
    llvm::cl::desc("Runs pass that counts debug instructions")
);

PreservedAnalyses CountDebugInstructions::run(Function &F,
                                        FunctionAnalysisManager &AM) {

    errs() << "Function: " << F.getName() << "\n";

    int numOfDbgDeclarseInsts = 0;
    int numOfDbgValueInsts = 0;
    int numOfDbgVariableIntrinsics = 0;

    for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
            if (isa<DbgDeclareInst>(I)) {
                numOfDbgDeclarseInsts++;
            }
            else if (isa<DbgValueInst>(I)) {
                numOfDbgValueInsts++;
            }
            else if (isa<DbgVariableIntrinsic>(I)){
                numOfDbgVariableIntrinsics++;
            }
        }
    }

    errs() << "llvm.dbg.values: "
            << numOfDbgValueInsts << "\n";
    errs() << "llvm.dbg.declare: "
            << numOfDbgDeclarseInsts << "\n";
    errs() << "llvm.dbg.variableIntrinsic: "
            << numOfDbgVariableIntrinsics << "\n";

    return PreservedAnalyses::all();
}