; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx90a %s -o - | FileCheck %s

define amdgpu_kernel void @load_idx_idy(ptr addrspace(4) %disp, ptr %g) {
; CHECK-LABEL: load_idx_idy:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    s_load_dword s6, s[4:5], 0x4
; CHECK-NEXT:    s_load_dwordx4 s[0:3], s[8:9], 0x0
; CHECK-NEXT:    s_add_u32 flat_scratch_lo, s12, s17
; CHECK-NEXT:    s_addc_u32 flat_scratch_hi, s13, 0
; CHECK-NEXT:    v_mov_b32_e32 v0, 0
; CHECK-NEXT:    s_waitcnt lgkmcnt(0)
; CHECK-NEXT:    s_lshr_b32 s4, s6, 16
; CHECK-NEXT:    s_bfe_i64 s[4:5], s[4:5], 0x10000
; CHECK-NEXT:    s_lshl_b64 s[4:5], s[4:5], 6
; CHECK-NEXT:    s_add_u32 s0, s0, s4
; CHECK-NEXT:    s_addc_u32 s1, s1, s5
; CHECK-NEXT:    global_load_ubyte v2, v0, s[0:1] offset:4
; CHECK-NEXT:    v_mov_b32_e32 v0, s2
; CHECK-NEXT:    v_mov_b32_e32 v1, s3
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    flat_store_byte v[0:1], v2
; CHECK-NEXT:    s_endpgm
entry:
  %disp1 = tail call ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %gep_y = getelementptr i8, ptr addrspace(4) %disp1, i64 6
  %L = load i1, ptr addrspace(4) %gep_y, align 1
  %idxprom = sext i1 %L to i64
  %gep0 = getelementptr <32 x i16>, ptr addrspace(4) %disp, i64 %idxprom
  %gep1 = getelementptr i8, ptr addrspace(4) %gep0, i64 4
  %L1 = load i8, ptr addrspace(4) %gep1
  store i8 %L1, ptr %g
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef nonnull align 4 ptr addrspace(4) @llvm.amdgcn.dispatch.ptr() #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
