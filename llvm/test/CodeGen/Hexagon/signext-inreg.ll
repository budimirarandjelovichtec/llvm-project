; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=hexagon | FileCheck %s
; RUN: llc < %s -mtriple=hexagon -mattr=+hvx,hvx-length64b | FileCheck %s --check-prefix=CHECK-64B
; RUN: llc < %s -mtriple=hexagon -mattr=+hvx,hvx-length128b | FileCheck %s --check-prefix=CHECK-128B
define <2 x i32> @test1(<2 x i32> %m) {
; CHECK-LABEL: test1:
; CHECK:         .cfi_startproc
; CHECK-NEXT:  // %bb.0: // %entry
; CHECK-NEXT:    {
; CHECK-NEXT:     r1 = extract(r1,#8,#0)
; CHECK-NEXT:     r0 = sxtb(r0)
; CHECK-NEXT:     jumpr r31
; CHECK-NEXT:    }
;
; CHECK-64B-LABEL: test1:
; CHECK-64B:         .cfi_startproc
; CHECK-64B-NEXT:  // %bb.0: // %entry
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     r1 = extract(r1,#8,#0)
; CHECK-64B-NEXT:     r0 = sxtb(r0)
; CHECK-64B-NEXT:     jumpr r31
; CHECK-64B-NEXT:    }
;
; CHECK-128B-LABEL: test1:
; CHECK-128B:         .cfi_startproc
; CHECK-128B-NEXT:  // %bb.0: // %entry
; CHECK-128B-NEXT:    {
; CHECK-128B-NEXT:     r1 = extract(r1,#8,#0)
; CHECK-128B-NEXT:     r0 = sxtb(r0)
; CHECK-128B-NEXT:     jumpr r31
; CHECK-128B-NEXT:    }
entry:
  %shl = shl <2 x i32> %m, <i32 24, i32 24>
  %shr = ashr exact <2 x i32> %shl, <i32 24, i32 24>
  ret <2 x i32> %shr
}

define <16 x i32> @test2(<16 x i32> %m) {
; CHECK-LABEL: test2:
; CHECK:         .cfi_startproc
; CHECK-NEXT:  // %bb.0: // %entry
; CHECK-NEXT:    {
; CHECK-NEXT:     r3 = extract(r3,#8,#0)
; CHECK-NEXT:     r29 = add(r29,#-8)
; CHECK-NEXT:     r2 = sxtb(r2)
; CHECK-NEXT:     r4 = sxtb(r4)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r5 = extract(r5,#8,#0)
; CHECK-NEXT:     r13:12 = memd(r29+#48)
; CHECK-NEXT:     memd(r29+#0) = r17:16
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r13 = extract(r13,#8,#0)
; CHECK-NEXT:     r12 = sxtb(r12)
; CHECK-NEXT:     r15:14 = memd(r29+#40)
; CHECK-NEXT:     r9:8 = memd(r29+#32)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r9 = extract(r9,#8,#0)
; CHECK-NEXT:     r8 = sxtb(r8)
; CHECK-NEXT:     r11:10 = memd(r29+#24)
; CHECK-NEXT:     r7:6 = memd(r29+#16)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r11 = extract(r11,#8,#0)
; CHECK-NEXT:     r10 = sxtb(r10)
; CHECK-NEXT:     r14 = sxtb(r14)
; CHECK-NEXT:     r17:16 = memd(r29+#8)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r15 = extract(r15,#8,#0)
; CHECK-NEXT:     r17 = extract(r17,#8,#0)
; CHECK-NEXT:     r16 = sxtb(r16)
; CHECK-NEXT:     r6 = sxtb(r6)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r7 = extract(r7,#8,#0)
; CHECK-NEXT:     memd(r0+#56) = r13:12
; CHECK-NEXT:     memd(r0+#48) = r15:14
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     memd(r0+#40) = r9:8
; CHECK-NEXT:     memd(r0+#32) = r11:10
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     memd(r0+#24) = r7:6
; CHECK-NEXT:     memd(r0+#16) = r17:16
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     memd(r0+#8) = r5:4
; CHECK-NEXT:     memd(r0+#0) = r3:2
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r29 = add(r29,#8)
; CHECK-NEXT:     r17:16 = memd(r29+#0)
; CHECK-NEXT:     jumpr r31
; CHECK-NEXT:    } // 8-byte Folded Reload
;
; CHECK-64B-LABEL: test2:
; CHECK-64B:         .cfi_startproc
; CHECK-64B-NEXT:  // %bb.0: // %entry
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     r0 = #24
; CHECK-64B-NEXT:    }
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     v0.w = vasl(v0.w,r0)
; CHECK-64B-NEXT:    }
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     v0.w = vasr(v0.w,r0)
; CHECK-64B-NEXT:     jumpr r31
; CHECK-64B-NEXT:    }
;
; CHECK-128B-LABEL: test2:
; CHECK-128B:         .cfi_startproc
; CHECK-128B-NEXT:  // %bb.0: // %entry
; CHECK-128B-NEXT:    {
; CHECK-128B-NEXT:     r0 = #24
; CHECK-128B-NEXT:    }
; CHECK-128B-NEXT:    {
; CHECK-128B-NEXT:     v0.w = vasl(v0.w,r0)
; CHECK-128B-NEXT:    }
; CHECK-128B-NEXT:    {
; CHECK-128B-NEXT:     v0.w = vasr(v0.w,r0)
; CHECK-128B-NEXT:     jumpr r31
; CHECK-128B-NEXT:    }
entry:
  %shl = shl <16 x i32> %m, <i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24>
  %shr = ashr exact <16 x i32> %shl, <i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24, i32 24>
  ret <16 x i32> %shr
}

define <64 x i16> @test3(<64 x i16> %m) {
; CHECK-LABEL: test3:
; CHECK:         .cfi_startproc
; CHECK-NEXT:  // %bb.0: // %entry
; CHECK-NEXT:    {
; CHECK-NEXT:     r3:2 = vaslh(r3:2,#8)
; CHECK-NEXT:     r5:4 = vaslh(r5:4,#8)
; CHECK-NEXT:     r9:8 = memd(r29+#96)
; CHECK-NEXT:     r11:10 = memd(r29+#88)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r9:8 = vaslh(r9:8,#8)
; CHECK-NEXT:     r11:10 = vaslh(r11:10,#8)
; CHECK-NEXT:     r13:12 = memd(r29+#80)
; CHECK-NEXT:     r7:6 = memd(r29+#104)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r15:14 = vaslh(r7:6,#8)
; CHECK-NEXT:     r13:12 = vaslh(r13:12,#8)
; CHECK-NEXT:     r7:6 = memd(r29+#72)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r15:14 = vasrh(r15:14,#8)
; CHECK-NEXT:     r9:8 = vasrh(r9:8,#8)
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r11:10 = vasrh(r11:10,#8)
; CHECK-NEXT:     r13:12 = vasrh(r13:12,#8)
; CHECK-NEXT:     r15:14 = memd(r29+#64)
; CHECK-NEXT:     memd(r0+#120) = r15:14
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r7:6 = vaslh(r7:6,#8)
; CHECK-NEXT:     r15:14 = vaslh(r15:14,#8)
; CHECK-NEXT:     r9:8 = memd(r29+#56)
; CHECK-NEXT:     memd(r0+#112) = r9:8
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r9:8 = vaslh(r9:8,#8)
; CHECK-NEXT:     r7:6 = vasrh(r7:6,#8)
; CHECK-NEXT:     r11:10 = memd(r29+#48)
; CHECK-NEXT:     memd(r0+#104) = r11:10
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r11:10 = vaslh(r11:10,#8)
; CHECK-NEXT:     r15:14 = vasrh(r15:14,#8)
; CHECK-NEXT:     r13:12 = memd(r29+#40)
; CHECK-NEXT:     memd(r0+#96) = r13:12
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r13:12 = vaslh(r13:12,#8)
; CHECK-NEXT:     r9:8 = vasrh(r9:8,#8)
; CHECK-NEXT:     r7:6 = memd(r29+#32)
; CHECK-NEXT:     memd(r0+#88) = r7:6
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r11:10 = vasrh(r11:10,#8)
; CHECK-NEXT:     r13:12 = vasrh(r13:12,#8)
; CHECK-NEXT:     r15:14 = memd(r29+#0)
; CHECK-NEXT:     memd(r0+#80) = r15:14
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r7:6 = vaslh(r7:6,#8)
; CHECK-NEXT:     r15:14 = vaslh(r15:14,#8)
; CHECK-NEXT:     r9:8 = memd(r29+#16)
; CHECK-NEXT:     memd(r0+#72) = r9:8
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r9:8 = vaslh(r9:8,#8)
; CHECK-NEXT:     r7:6 = vasrh(r7:6,#8)
; CHECK-NEXT:     r11:10 = memd(r29+#24)
; CHECK-NEXT:     memd(r0+#64) = r11:10
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r11:10 = vaslh(r11:10,#8)
; CHECK-NEXT:     r3:2 = vasrh(r3:2,#8)
; CHECK-NEXT:     r13:12 = memd(r29+#8)
; CHECK-NEXT:     memd(r0+#56) = r13:12
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r13:12 = vaslh(r13:12,#8)
; CHECK-NEXT:     r9:8 = vasrh(r9:8,#8)
; CHECK-NEXT:     memd(r0+#48) = r7:6
; CHECK-NEXT:     memd(r0+#0) = r3:2
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r11:10 = vasrh(r11:10,#8)
; CHECK-NEXT:     r7:6 = vasrh(r15:14,#8)
; CHECK-NEXT:     memd(r0+#32) = r9:8
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     r13:12 = vasrh(r13:12,#8)
; CHECK-NEXT:     r5:4 = vasrh(r5:4,#8)
; CHECK-NEXT:     memd(r0+#40) = r11:10
; CHECK-NEXT:     memd(r0+#16) = r7:6
; CHECK-NEXT:    }
; CHECK-NEXT:    {
; CHECK-NEXT:     jumpr r31
; CHECK-NEXT:     memd(r0+#24) = r13:12
; CHECK-NEXT:     memd(r0+#8) = r5:4
; CHECK-NEXT:    }
;
; CHECK-64B-LABEL: test3:
; CHECK-64B:         .cfi_startproc
; CHECK-64B-NEXT:  // %bb.0: // %entry
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     r0 = #8
; CHECK-64B-NEXT:    }
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     v0.h = vasl(v0.h,r0)
; CHECK-64B-NEXT:    }
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     v1.h = vasl(v1.h,r0)
; CHECK-64B-NEXT:    }
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     v0.h = vasr(v0.h,r0)
; CHECK-64B-NEXT:    }
; CHECK-64B-NEXT:    {
; CHECK-64B-NEXT:     v1.h = vasr(v1.h,r0)
; CHECK-64B-NEXT:     jumpr r31
; CHECK-64B-NEXT:    }
;
; CHECK-128B-LABEL: test3:
; CHECK-128B:         .cfi_startproc
; CHECK-128B-NEXT:  // %bb.0: // %entry
; CHECK-128B-NEXT:    {
; CHECK-128B-NEXT:     r0 = #8
; CHECK-128B-NEXT:    }
; CHECK-128B-NEXT:    {
; CHECK-128B-NEXT:     v0.h = vasl(v0.h,r0)
; CHECK-128B-NEXT:    }
; CHECK-128B-NEXT:    {
; CHECK-128B-NEXT:     v0.h = vasr(v0.h,r0)
; CHECK-128B-NEXT:     jumpr r31
; CHECK-128B-NEXT:    }
entry:
  %shl = shl <64 x i16> %m, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  %shr = ashr exact <64 x i16> %shl, <i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8, i16 8>
  ret <64 x i16> %shr
}
