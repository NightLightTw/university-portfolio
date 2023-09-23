; ModuleID = 'fibonacci.ll'
source_filename = "fibonacci.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [28 x i8] c"Fibonacci number #%d: %lld\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind readnone uwtable
define dso_local i64 @fib(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 1
  br i1 %2, label %11, label %3

3:                                                ; preds = %1
  %4 = icmp eq i32 %0, 1
  br i1 %4, label %11, label %5

5:                                                ; preds = %3
  %6 = add nsw i32 %0, -1
  %7 = call i64 @fib(i32 noundef %6)
  %8 = add nsw i32 %0, -2
  %9 = call i64 @fib(i32 noundef %8)
  %10 = add nsw i64 %9, %7
  br label %11

11:                                               ; preds = %3, %1, %5
  %.0 = phi i64 [ %10, %5 ], [ 0, %1 ], [ 1, %3 ]
  ret i64 %.0
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  %1 = call i64 @fib(i32 noundef 50)
  %2 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i64 0, i64 0), i32 noundef 50, i64 noundef %1)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

attributes #0 = { nofree noinline nosync nounwind readnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
