; ModuleID = 'pi.ll'
source_filename = "pi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"Estimate after %d iterations: %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Final estimate of Pi = %f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @randomFloat() #0 {
  %1 = call i32 @rand() #4
  %2 = sitofp i32 %1 to double
  %3 = fdiv double %2, 0x41DFFFFFFFC00000
  ret double %3
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = call i64 @time(i64* noundef null) #4
  %2 = trunc i64 %1 to i32
  call void @srand(i32 noundef %2) #4
  br label %3

3:                                                ; preds = %27, %0
  %.02 = phi i32 [ 0, %0 ], [ %.1, %27 ]
  %.01 = phi i32 [ 0, %0 ], [ %15, %27 ]
  %.0 = phi i32 [ 0, %0 ], [ %28, %27 ]
  %4 = mul nsw i32 1000000, 1000000
  %5 = icmp slt i32 %.0, %4
  br i1 %5, label %6, label %29

6:                                                ; preds = %3
  %7 = call double @randomFloat()
  %8 = call double @randomFloat()
  %9 = fmul double %8, %8
  %10 = call double @llvm.fmuladd.f64(double %7, double %7, double %9)
  %11 = fcmp ole double %10, 1.000000e+00
  br i1 %11, label %12, label %14

12:                                               ; preds = %6
  %13 = add nsw i32 %.02, 1
  br label %14

14:                                               ; preds = %12, %6
  %.1 = phi i32 [ %13, %12 ], [ %.02, %6 ]
  %15 = add nsw i32 %.01, 1
  %16 = srem i32 %.0, 1000000
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %26

18:                                               ; preds = %14
  %19 = icmp ne i32 %.0, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %18
  %21 = sitofp i32 %.1 to double
  %22 = fmul double 4.000000e+00, %21
  %23 = sitofp i32 %15 to double
  %24 = fdiv double %22, %23
  %25 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0), i32 noundef %.0, double noundef %24)
  br label %26

26:                                               ; preds = %20, %18, %14
  br label %27

27:                                               ; preds = %26
  %28 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !6

29:                                               ; preds = %3
  %30 = sitofp i32 %.02 to double
  %31 = fmul double 4.000000e+00, %30
  %32 = sitofp i32 %.01 to double
  %33 = fdiv double %31, %32
  %34 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i64 0, i64 0), double noundef %33)
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(i64* noundef) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

declare i32 @printf(i8* noundef, ...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
