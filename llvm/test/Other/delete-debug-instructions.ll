; RUN: opt -passes=delete-debug-instructions -S < %s | FileCheck %s

@.str = private unnamed_addr constant [28 x i8] c"Function returns: %d %d %d\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [22 x i8] c"Sum of variables: %d\0A\00", align 1, !dbg !7

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @getNumber(i32 noundef %0, i32 noundef %1) #0 !dbg !22 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  ; CHECK-NOT: call void @llvm.dbg.declare
  call void @llvm.dbg.declare(metadata ptr %4, metadata !27, metadata !DIExpression()), !dbg !28
  store i32 %1, ptr %5, align 4
  ; CHECK-NOT: call void @llvm.dbg.declare
  call void @llvm.dbg.declare(metadata ptr %5, metadata !29, metadata !DIExpression()), !dbg !30
  %6 = load i32, ptr %4, align 4, !dbg !31
  %7 = load i32, ptr %5, align 4, !dbg !33
  %8 = icmp sgt i32 %6, %7, !dbg !34
  br i1 %8, label %9, label %13, !dbg !35

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4, !dbg !36
  %11 = load i32, ptr %4, align 4, !dbg !38
  %12 = sub nsw i32 %11, %10, !dbg !38
  store i32 %12, ptr %4, align 4, !dbg !38
  store i32 1, ptr %3, align 4, !dbg !39
  br label %22, !dbg !39

13:                                               ; preds = %2
  %14 = load i32, ptr %4, align 4, !dbg !40
  %15 = load i32, ptr %5, align 4, !dbg !42
  %16 = icmp eq i32 %14, %15, !dbg !43
  br i1 %16, label %17, label %18, !dbg !44

17:                                               ; preds = %13
  store i32 2, ptr %3, align 4, !dbg !45
  br label %22, !dbg !45

18:                                               ; preds = %13
  %19 = load i32, ptr %5, align 4, !dbg !46
  %20 = load i32, ptr %4, align 4, !dbg !48
  %21 = add nsw i32 %20, %19, !dbg !48
  store i32 %21, ptr %4, align 4, !dbg !48
  store i32 0, ptr %3, align 4, !dbg !49
  br label %22, !dbg !49

22:                                               ; preds = %18, %17, %9
  %23 = load i32, ptr %3, align 4, !dbg !50
  ret i32 %23, !dbg !50
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !51 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  ; CHECK-NOT: call void @llvm.dbg.declare
  call void @llvm.dbg.declare(metadata ptr %2, metadata !54, metadata !DIExpression()), !dbg !55
  %6 = call i32 @getNumber(i32 noundef 13, i32 noundef 5), !dbg !56
  store i32 %6, ptr %2, align 4, !dbg !55
  ; CHECK-NOT: call void @llvm.dbg.declare
  call void @llvm.dbg.declare(metadata ptr %3, metadata !57, metadata !DIExpression()), !dbg !58
  %7 = call i32 @getNumber(i32 noundef 2, i32 noundef 2), !dbg !59
  store i32 %7, ptr %3, align 4, !dbg !58
  ; CHECK-NOT: call void @llvm.dbg.declare
  call void @llvm.dbg.declare(metadata ptr %4, metadata !60, metadata !DIExpression()), !dbg !61
  %8 = call i32 @getNumber(i32 noundef -1, i32 noundef 11), !dbg !62
  store i32 %8, ptr %4, align 4, !dbg !61
  %9 = load i32, ptr %2, align 4, !dbg !63
  %10 = load i32, ptr %3, align 4, !dbg !64
  %11 = load i32, ptr %4, align 4, !dbg !65
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %9, i32 noundef %10, i32 noundef %11), !dbg !66
  ; CHECK-NOT: call void @llvm.dbg.declare
  call void @llvm.dbg.declare(metadata ptr %5, metadata !67, metadata !DIExpression()), !dbg !68
  %13 = load i32, ptr %2, align 4, !dbg !69
  %14 = load i32, ptr %3, align 4, !dbg !70
  %15 = add nsw i32 %13, %14, !dbg !71
  %16 = load i32, ptr %4, align 4, !dbg !72
  %17 = add nsw i32 %15, %16, !dbg !73
  store i32 %17, ptr %5, align 4, !dbg !68
  %18 = load i32, ptr %5, align 4, !dbg !74
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %18), !dbg !75
  ret i32 0, !dbg !76
}

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 19, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "myExample.c", directory: "/home/syrmia/Radni/Primeri/LLVMPassTests", checksumkind: CSK_MD5, checksum: "aec6e5250c42320da2be9c7713b64054")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 224, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 28)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 22, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 22)
!12 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 17.0.0 (git@github.com:budimirarandjelovicsyrmia/llvm-project.git ccd36ad3ae88caa065943141efdc8a8a11530e34)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !13, splitDebugInlining: false, nameTableKind: None)
!13 = !{!0, !7}
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 8, !"PIC Level", i32 2}
!18 = !{i32 7, !"PIE Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 2}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 17.0.0 (git@github.com:budimirarandjelovicsyrmia/llvm-project.git ccd36ad3ae88caa065943141efdc8a8a11530e34)"}
!22 = distinct !DISubprogram(name: "getNumber", scope: !2, file: !2, line: 3, type: !23, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !26)
!23 = !DISubroutineType(types: !24)
!24 = !{!25, !25, !25}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{}
!27 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !2, line: 3, type: !25)
!28 = !DILocation(line: 3, column: 19, scope: !22)
!29 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !2, line: 3, type: !25)
!30 = !DILocation(line: 3, column: 26, scope: !22)
!31 = !DILocation(line: 4, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !22, file: !2, line: 4, column: 9)
!33 = !DILocation(line: 4, column: 13, scope: !32)
!34 = !DILocation(line: 4, column: 11, scope: !32)
!35 = !DILocation(line: 4, column: 9, scope: !22)
!36 = !DILocation(line: 5, column: 11, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !2, line: 4, column: 16)
!38 = !DILocation(line: 5, column: 8, scope: !37)
!39 = !DILocation(line: 6, column: 6, scope: !37)
!40 = !DILocation(line: 8, column: 14, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !2, line: 8, column: 14)
!42 = !DILocation(line: 8, column: 19, scope: !41)
!43 = !DILocation(line: 8, column: 16, scope: !41)
!44 = !DILocation(line: 8, column: 14, scope: !32)
!45 = !DILocation(line: 8, column: 22, scope: !41)
!46 = !DILocation(line: 10, column: 11, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !2, line: 9, column: 10)
!48 = !DILocation(line: 10, column: 8, scope: !47)
!49 = !DILocation(line: 11, column: 6, scope: !47)
!50 = !DILocation(line: 13, column: 1, scope: !22)
!51 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 15, type: !52, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !26)
!52 = !DISubroutineType(types: !53)
!53 = !{!25}
!54 = !DILocalVariable(name: "a1", scope: !51, file: !2, line: 16, type: !25)
!55 = !DILocation(line: 16, column: 9, scope: !51)
!56 = !DILocation(line: 16, column: 14, scope: !51)
!57 = !DILocalVariable(name: "a2", scope: !51, file: !2, line: 17, type: !25)
!58 = !DILocation(line: 17, column: 9, scope: !51)
!59 = !DILocation(line: 17, column: 14, scope: !51)
!60 = !DILocalVariable(name: "a3", scope: !51, file: !2, line: 18, type: !25)
!61 = !DILocation(line: 18, column: 9, scope: !51)
!62 = !DILocation(line: 18, column: 14, scope: !51)
!63 = !DILocation(line: 19, column: 44, scope: !51)
!64 = !DILocation(line: 19, column: 48, scope: !51)
!65 = !DILocation(line: 19, column: 52, scope: !51)
!66 = !DILocation(line: 19, column: 5, scope: !51)
!67 = !DILocalVariable(name: "sum", scope: !51, file: !2, line: 21, type: !25)
!68 = !DILocation(line: 21, column: 9, scope: !51)
!69 = !DILocation(line: 21, column: 15, scope: !51)
!70 = !DILocation(line: 21, column: 20, scope: !51)
!71 = !DILocation(line: 21, column: 18, scope: !51)
!72 = !DILocation(line: 21, column: 25, scope: !51)
!73 = !DILocation(line: 21, column: 23, scope: !51)
!74 = !DILocation(line: 22, column: 38, scope: !51)
!75 = !DILocation(line: 22, column: 5, scope: !51)
!76 = !DILocation(line: 24, column: 5, scope: !51)