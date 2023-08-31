#include "llvm/Transforms/Utils/CountFunctionCalls.h"

using namespace llvm;

void CountFunctionCalls::printNumberOfFunctionCalls() {
    errs() << "Direct function calls\n";
    for (const std::pair el : mapOfDirectFunctionCalls) {
        el.first->dump();
        errs() << "Calls: " << el.second << "\n";
    }

    errs() << "Indirect function calls\n";
    for (const std::pair el : mapOfIndirectFunctionCalls) {
        el.first->dump();
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

                    switch (op->getValueID()) {
                    case Value::ConstantFirstVal:
                        mapOfDirectFunctionCalls[I.getOperand(i)]++;
                        break;
                    case Value::GlobalVariableVal:
                        mapOfIndirectFunctionCalls[I.getOperand(i)]++;
                        break;
                    }
                }
            }
        }
    }

    printNumberOfFunctionCalls();
    
    return PreservedAnalyses::all();
}