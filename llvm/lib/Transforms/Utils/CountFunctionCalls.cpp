//#include "llvm/IR/DebugInfo.h"
//#include "llvm/ADT/DenseMap.h"
#include "llvm/Transforms/Utils/CountFunctionCalls.h"
//#include <map>

using namespace llvm;

void CountFunctionCalls::printNumberOfFunctionCalls() {
    errs() << "Direct function calls:\n";
    for (const std::pair el : mapOfDirectFunctionCalls) {
        errs() << "Address: " << el.first << "\n";
        errs() << "Calls: " << el.second << "\n";
    }
}

PreservedAnalyses CountFunctionCalls::run(Module &M,
                                    ModuleAnalysisManager &AM) {
    for (Function &F : M) {
        for (BasicBlock &BB : F) {
            for (Instruction &I : BB) {
                if (I.getOpcode() != Instruction::Call)
                    continue;
                
                for (int i = 0; i < I.getNumOperands(); ++i) {
                    const Value* op(I.getOperand(i));
                    if (op->getValueID() == Value::ConstantFirstVal)
                        mapOfDirectFunctionCalls[I.getOperand(i)]++;
                    else if (op->getValueID() == Value::ConstantFirstVal)
                        continue;
                }
            }
        }
    }

    printNumberOfFunctionCalls();
    
    return PreservedAnalyses::all();
}