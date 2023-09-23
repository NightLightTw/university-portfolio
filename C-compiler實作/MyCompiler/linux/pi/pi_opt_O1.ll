; ModuleID = 'pi.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"Estimate after %d iterations: %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Final estimate of Pi = %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @randomFloat() local_unnamed_addr #0 {
  %1 = call i32 @rand() #4
  %2 = sitofp i32 %1 to double
  %3 = fdiv double %2, 0x41DFFFFFFFC00000
  ret double %3
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = call i64 @time(i64* noundef null) #4
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #4
  br label %3

3:                                                ; preds = %0, %20
  %.024 = phi i32 [ 0, %0 ], [ %.1, %20 ]
  %.01923 = phi i32 [ 0, %0 ], [ %10, %20 ]
  %4 = call double @randomFloat()
  %5 = call double @randomFloat()
  %6 = fmul double %5, %5
  %7 = call double @llvm.fmuladd.f64(double %4, double %4, double %6)
  %8 = fcmp ole double %7, 1.000000e+00
  %9 = zext i1 %8 to i32
  %.1 = add nuw nsw i32 %.024, %9
  %10 = add nuw nsw i32 %.01923, 1
  %11 = urem i32 %.01923, 100000
  %12 = icmp eq i32 %11, 0
  %13 = icmp ne i32 %.01923, 0
  %or.cond = and i1 %13, %12
  br i1 %or.cond, label %14, label %20

14:                                               ; preds = %3
  %15 = sitofp i32 %.1 to double
  %16 = fmul double %15, 4.000000e+00
  %17 = sitofp i32 %10 to double
  %18 = fdiv double %16, %17
  %19 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i32 noundef %.01923, double noundef %18)
  br label %20

20:                                               ; preds = %3, %14
  %exitcond.not = icmp eq i32 %10, 1410065408
  br i1 %exitcond.not, label %21, label %3, !llvm.loop !6

21:                                               ; preds = %20
  %22 = sitofp i32 %.1 to double
  %23 = fmul double %22, 4.000000e+00
  %24 = fdiv double %23, 0x41D502F900000000
  %25 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double noundef %24)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @time(i64* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
