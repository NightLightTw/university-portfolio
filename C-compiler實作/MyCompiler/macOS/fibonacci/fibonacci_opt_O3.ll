; ModuleID = 'fibonacci.ll'
source_filename = "fibonacci.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@.str = private unnamed_addr constant [28 x i8] c"Fibonacci number #%d: %lld\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind ssp memory(none) uwtable(sync)
define i64 @fib(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 1
  br i1 %2, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %1, %tailrecurse
  %.tr7 = phi i32 [ %6, %tailrecurse ], [ %0, %1 ]
  %accumulator.tr6 = phi i64 [ %7, %tailrecurse ], [ 0, %1 ]
  %3 = icmp eq i32 %.tr7, 1
  br i1 %3, label %._crit_edge.loopexit, label %tailrecurse

tailrecurse:                                      ; preds = %.lr.ph
  %4 = add nsw i32 %.tr7, -1
  %5 = tail call i64 @fib(i32 noundef %4)
  %6 = add nsw i32 %.tr7, -2
  %7 = add nsw i64 %5, %accumulator.tr6
  %8 = icmp ult i32 %.tr7, 3
  br i1 %8, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph, %tailrecurse
  %accumulator.tr.lcssa.ph = phi i64 [ %7, %tailrecurse ], [ %accumulator.tr6, %.lr.ph ]
  %.0.ph = phi i64 [ 0, %tailrecurse ], [ 1, %.lr.ph ]
  %9 = add nsw i64 %.0.ph, %accumulator.tr.lcssa.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %accumulator.ret.tr = phi i64 [ %9, %._crit_edge.loopexit ], [ 0, %1 ]
  ret i64 %accumulator.ret.tr
}

; Function Attrs: nofree noinline nounwind ssp uwtable(sync)
define i32 @main() local_unnamed_addr #1 {
  %1 = tail call i64 @fib(i32 noundef 50)
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef 50, i64 noundef %1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

attributes #0 = { nofree noinline nosync nounwind ssp memory(none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nofree noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 16.0.3"}
