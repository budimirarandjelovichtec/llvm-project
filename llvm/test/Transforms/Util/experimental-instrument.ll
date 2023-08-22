; RUN: opt %s -S -O1 -experimental-instrument -disable-output 2>&1 | FileCheck %s

; ModuleID = '/home/syrmia/Radni/Primeri/testExperimentalInstrument.c'
source_filename = "/home/syrmia/Radni/Primeri/testExperimentalInstrument.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Coordinates = type { i32, i32, i32 }

@.str.1 = private unnamed_addr constant [5 x i8] c"x = \00", align 1, !dbg !0
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !7
@.str.3 = private unnamed_addr constant [5 x i8] c"y = \00", align 1, !dbg !12
@.str.4 = private unnamed_addr constant [5 x i8] c"z = \00", align 1, !dbg !14
@.str.5 = private unnamed_addr constant [35 x i8] c"Your coordinates are: (%d, %d, %d)\00", align 1, !dbg !16
@str = private unnamed_addr constant [25 x i8] c"Insert your coordinates:\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local void @insertCoordinates(i64 %0, i32 %1) local_unnamed_addr #0 !dbg !36 {
  %3 = alloca %struct.Coordinates, align 8
  store i64 %0, ptr %3, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 8
  store i32 %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !46, metadata !DIExpression()), !dbg !47
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !48
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !49
  %7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef nonnull @.str.2, ptr noundef nonnull %3), !dbg !50
  %8 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3), !dbg !51
  %9 = getelementptr inbounds %struct.Coordinates, ptr %3, i64 0, i32 1, !dbg !52
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef nonnull @.str.2, ptr noundef nonnull %9), !dbg !53
  %11 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4), !dbg !54
  %12 = getelementptr inbounds %struct.Coordinates, ptr %3, i64 0, i32 2, !dbg !55
  %13 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef nonnull @.str.2, ptr noundef nonnull %12), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare !dbg !58 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare !dbg !66 noundef i32 @__isoc99_scanf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind uwtable
define dso_local void @printCoordinates(i64 %0, i32 %1) local_unnamed_addr #0 !dbg !67 {
  %3 = trunc i64 %0 to i32
  call void @llvm.dbg.value(metadata i32 %3, metadata !69, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !70
  %4 = lshr i64 %0, 32
  %5 = trunc i64 %4 to i32
  call void @llvm.dbg.value(metadata i32 %5, metadata !69, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !70
  call void @llvm.dbg.value(metadata i32 %1, metadata !69, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !70
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %3, i32 noundef %5, i32 noundef %1), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #0 !dbg !73 {
  %3 = alloca %struct.Coordinates, align 8
  call void @llvm.dbg.value(metadata i32 %0, metadata !79, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.value(metadata ptr %1, metadata !80, metadata !DIExpression()), !dbg !82
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3)
  call void @llvm.dbg.declare(metadata ptr %3, metadata !46, metadata !DIExpression()), !dbg !83
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !85
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1), !dbg !86
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef nonnull @.str.2, ptr noundef nonnull %3), !dbg !87
  %7 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3), !dbg !88
  %8 = getelementptr inbounds %struct.Coordinates, ptr %3, i64 0, i32 1, !dbg !89
  %9 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef nonnull @.str.2, ptr noundef nonnull %8), !dbg !90
  %10 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4), !dbg !91
  %11 = getelementptr inbounds %struct.Coordinates, ptr %3, i64 0, i32 2, !dbg !92
  %12 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef nonnull @.str.2, ptr noundef nonnull %11), !dbg !93
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3), !dbg !94
  call void @llvm.dbg.value(metadata i32 undef, metadata !69, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 32)), !dbg !95
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 32)), !dbg !95
  call void @llvm.dbg.value(metadata i32 undef, metadata !69, metadata !DIExpression(DW_OP_LLVM_fragment, 64, 32)), !dbg !95
  %13 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef undef, i32 noundef 0, i32 noundef undef), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #5

attributes #0 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nounwind }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!21}
!llvm.module.flags = !{!29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testExperimentalInstrument.c", directory: "/home/syrmia/Radni/Primeri", checksumkind: CSK_MD5, checksum: "6b9df4f739733600e74aaac7d5887c13")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 5)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 12, type: !3, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 13, type: !3, isLocal: true, isDefinition: true)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(scope: null, file: !2, line: 17, type: !18, isLocal: true, isDefinition: true)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 280, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 35)
!21 = distinct !DICompileUnit(language: DW_LANG_C11, file: !22, producer: "clang version 17.0.0 (git@github.com:budimirarandjelovicsyrmia/llvm-project.git 4d0c14e266fcadaee7d8eb70d200d62b8dd9107f)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !23, splitDebugInlining: false, nameTableKind: None)
!22 = !DIFile(filename: "/home/syrmia/Radni/Primeri/testExperimentalInstrument.c", directory: "/home/syrmia/Radni/Primeri", checksumkind: CSK_MD5, checksum: "6b9df4f739733600e74aaac7d5887c13")
!23 = !{!24, !0, !7, !12, !14, !16}
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !26, isLocal: true, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 208, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 26)
!29 = !{i32 7, !"Dwarf Version", i32 5}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 8, !"PIC Level", i32 2}
!33 = !{i32 7, !"PIE Level", i32 2}
!34 = !{i32 7, !"uwtable", i32 2}
!35 = !{!"clang version 17.0.0 (git@github.com:budimirarandjelovicsyrmia/llvm-project.git 4d0c14e266fcadaee7d8eb70d200d62b8dd9107f)"}
!36 = distinct !DISubprogram(name: "insertCoordinates", scope: !2, file: !2, line: 9, type: !37, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !21, retainedNodes: !45)
!37 = !DISubroutineType(types: !38)
!38 = !{null, !39}
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Coordinates", file: !2, line: 5, size: 96, elements: !40)
!40 = !{!41, !43, !44}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !39, file: !2, line: 6, baseType: !42, size: 32)
!42 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !39, file: !2, line: 6, baseType: !42, size: 32, offset: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !39, file: !2, line: 6, baseType: !42, size: 32, offset: 64)
!45 = !{!46}
!46 = !DILocalVariable(name: "coord", arg: 1, scope: !36, file: !2, line: 9, type: !39)
!47 = !DILocation(line: 9, column: 43, scope: !36)
!48 = !DILocation(line: 10, column: 2, scope: !36)
!49 = !DILocation(line: 11, column: 2, scope: !36)
!50 = !DILocation(line: 11, column: 18, scope: !36)
!51 = !DILocation(line: 12, column: 2, scope: !36)
!52 = !DILocation(line: 12, column: 37, scope: !36)
!53 = !DILocation(line: 12, column: 18, scope: !36)
!54 = !DILocation(line: 13, column: 2, scope: !36)
!55 = !DILocation(line: 13, column: 37, scope: !36)
!56 = !DILocation(line: 13, column: 18, scope: !36)
!57 = !DILocation(line: 14, column: 1, scope: !36)
!58 = !DISubprogram(name: "printf", scope: !59, file: !59, line: 356, type: !60, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !65)
!59 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!60 = !DISubroutineType(types: !61)
!61 = !{!42, !62, null}
!62 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!65 = !{}
!66 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !59, file: !59, line: 437, type: !60, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !65)
!67 = distinct !DISubprogram(name: "printCoordinates", scope: !2, file: !2, line: 16, type: !37, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !21, retainedNodes: !68)
!68 = !{!69}
!69 = !DILocalVariable(name: "coord", arg: 1, scope: !67, file: !2, line: 16, type: !39)
!70 = !DILocation(line: 0, scope: !67)
!71 = !DILocation(line: 17, column: 2, scope: !67)
!72 = !DILocation(line: 18, column: 1, scope: !67)
!73 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 20, type: !74, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !21, retainedNodes: !78)
!74 = !DISubroutineType(types: !75)
!75 = !{!42, !42, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!78 = !{!79, !80, !81}
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !2, line: 20, type: !42)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !2, line: 20, type: !76)
!81 = !DILocalVariable(name: "coords", scope: !73, file: !2, line: 21, type: !39)
!82 = !DILocation(line: 0, scope: !73)
!83 = !DILocation(line: 9, column: 43, scope: !36, inlinedAt: !84)
!84 = distinct !DILocation(line: 23, column: 2, scope: !73)
!85 = !DILocation(line: 10, column: 2, scope: !36, inlinedAt: !84)
!86 = !DILocation(line: 11, column: 2, scope: !36, inlinedAt: !84)
!87 = !DILocation(line: 11, column: 18, scope: !36, inlinedAt: !84)
!88 = !DILocation(line: 12, column: 2, scope: !36, inlinedAt: !84)
!89 = !DILocation(line: 12, column: 37, scope: !36, inlinedAt: !84)
!90 = !DILocation(line: 12, column: 18, scope: !36, inlinedAt: !84)
!91 = !DILocation(line: 13, column: 2, scope: !36, inlinedAt: !84)
!92 = !DILocation(line: 13, column: 37, scope: !36, inlinedAt: !84)
!93 = !DILocation(line: 13, column: 18, scope: !36, inlinedAt: !84)
!94 = !DILocation(line: 14, column: 1, scope: !36, inlinedAt: !84)
!95 = !DILocation(line: 0, scope: !67, inlinedAt: !96)
!96 = distinct !DILocation(line: 24, column: 2, scope: !73)
!97 = !DILocation(line: 17, column: 2, scope: !67, inlinedAt: !96)
!98 = !DILocation(line: 26, column: 2, scope: !73)