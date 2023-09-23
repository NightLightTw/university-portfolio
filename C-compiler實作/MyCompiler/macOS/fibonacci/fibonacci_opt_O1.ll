; ModuleID = 'fibonacci.ll'
source_filename = "fibonacci.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@.str = private unnamed_addr constant [28 x i8] c"Fibonacci number #%d: %lld\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind ssp memory(none) uwtable(sync)
define i64 @fib(i32 noundef %0) local_unnamed_addr #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %5, %1
  %accumulator.tr = phi i64 [ 0, %1 ], [ %9, %5 ]
  %.tr = phi i32 [ %0, %1 ], [ %8, %5 ]
  %2 = icmp slt i32 %.tr, 1
  br i1 %2, label %10, label %3

3:                                                ; preds = %tailrecurse
  %4 = icmp eq i32 %.tr, 1
  br i1 %4, label %10, label %5

5:                                                ; preds = %3
  %6 = add nsw i32 %.tr, -1
  %7 = tail call i64 @fib(i32 noundef %6)
  %8 = add nsw i32 %.tr, -2
  %9 = add nsw i64 %accumulator.tr, %7
  br label %tailrecurse

10:                                               ; preds = %3, %tailrecurse
  %.0 = phi i64 [ 0, %tailrecurse ], [ 1, %3 ]
  %accumulator.ret.tr = add nsw i64 %accumulator.tr, %.0
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
