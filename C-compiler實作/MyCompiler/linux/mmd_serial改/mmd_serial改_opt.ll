; ModuleID = 'mmd_serial改.ll'
source_filename = "mmd_serial\E6\94\B9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@c = dso_local global double** null, align 8
@a = dso_local global double** null, align 8
@b = dso_local global double** null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%f \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local double @matrixMult(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %45, %1
  %.02 = phi i32 [ 0, %1 ], [ %46, %45 ]
  %3 = icmp slt i32 %.02, %0
  br i1 %3, label %4, label %47

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %42, %4
  %.01 = phi i32 [ 0, %4 ], [ %43, %42 ]
  %6 = icmp slt i32 %.01, %0
  br i1 %6, label %7, label %44

7:                                                ; preds = %5
  %8 = load double**, double*** @c, align 8
  %9 = sext i32 %.02 to i64
  %10 = getelementptr inbounds double*, double** %8, i64 %9
  %11 = load double*, double** %10, align 8
  %12 = sext i32 %.01 to i64
  %13 = getelementptr inbounds double, double* %11, i64 %12
  store double 0.000000e+00, double* %13, align 8
  br label %14

14:                                               ; preds = %39, %7
  %.0 = phi i32 [ 0, %7 ], [ %40, %39 ]
  %15 = icmp slt i32 %.0, %0
  br i1 %15, label %16, label %41

16:                                               ; preds = %14
  %17 = load double**, double*** @a, align 8
  %18 = sext i32 %.02 to i64
  %19 = getelementptr inbounds double*, double** %17, i64 %18
  %20 = load double*, double** %19, align 8
  %21 = sext i32 %.0 to i64
  %22 = getelementptr inbounds double, double* %20, i64 %21
  %23 = load double, double* %22, align 8
  %24 = load double**, double*** @b, align 8
  %25 = sext i32 %.0 to i64
  %26 = getelementptr inbounds double*, double** %24, i64 %25
  %27 = load double*, double** %26, align 8
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds double, double* %27, i64 %28
  %30 = load double, double* %29, align 8
  %31 = load double**, double*** @c, align 8
  %32 = sext i32 %.02 to i64
  %33 = getelementptr inbounds double*, double** %31, i64 %32
  %34 = load double*, double** %33, align 8
  %35 = sext i32 %.01 to i64
  %36 = getelementptr inbounds double, double* %34, i64 %35
  %37 = load double, double* %36, align 8
  %38 = call double @llvm.fmuladd.f64(double %23, double %30, double %37)
  store double %38, double* %36, align 8
  br label %39

39:                                               ; preds = %16
  %40 = add nsw i32 %.0, 1
  br label %14, !llvm.loop !6

41:                                               ; preds = %14
  br label %42

42:                                               ; preds = %41
  %43 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !8

44:                                               ; preds = %5
  br label %45

45:                                               ; preds = %44
  %46 = add nsw i32 %.02, 1
  br label %2, !llvm.loop !9

47:                                               ; preds = %2
  ret double undef
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print(i32 noundef %0) #0 {
  br label %2

2:                                                ; preds = %20, %1
  %.01 = phi i32 [ 0, %1 ], [ %21, %20 ]
  %3 = icmp slt i32 %.01, %0
  br i1 %3, label %4, label %22

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %16, %4
  %.0 = phi i32 [ 0, %4 ], [ %17, %16 ]
  %6 = icmp slt i32 %.0, %0
  br i1 %6, label %7, label %18

7:                                                ; preds = %5
  %8 = load double**, double*** @c, align 8
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds double*, double** %8, i64 %9
  %11 = load double*, double** %10, align 8
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds double, double* %11, i64 %12
  %14 = load double, double* %13, align 8
  %15 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double noundef %14)
  br label %16

16:                                               ; preds = %7
  %17 = add nsw i32 %.0, 1
  br label %5, !llvm.loop !10

18:                                               ; preds = %5
  %19 = call i32 @putchar(i32 noundef 10)
  br label %20

20:                                               ; preds = %18
  %21 = add nsw i32 %.01, 1
  br label %2, !llvm.loop !11

22:                                               ; preds = %2
  ret void
}

declare i32 @printf(i8* noundef, ...) #2

declare i32 @putchar(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = sext i32 2048 to i64
  %2 = mul i64 8, %1
  %3 = call noalias i8* @malloc(i64 noundef %2) #5
  %4 = bitcast i8* %3 to double**
  store double** %4, double*** @a, align 8
  %5 = sext i32 2048 to i64
  %6 = mul i64 8, %5
  %7 = call noalias i8* @malloc(i64 noundef %6) #5
  %8 = bitcast i8* %7 to double**
  store double** %8, double*** @b, align 8
  %9 = sext i32 2048 to i64
  %10 = mul i64 8, %9
  %11 = call noalias i8* @malloc(i64 noundef %10) #5
  %12 = bitcast i8* %11 to double**
  store double** %12, double*** @c, align 8
  br label %13

13:                                               ; preds = %37, %0
  %.01 = phi i32 [ 0, %0 ], [ %38, %37 ]
  %14 = icmp slt i32 %.01, 2048
  br i1 %14, label %15, label %39

15:                                               ; preds = %13
  %16 = sext i32 2048 to i64
  %17 = mul i64 8, %16
  %18 = call noalias i8* @malloc(i64 noundef %17) #5
  %19 = bitcast i8* %18 to double*
  %20 = load double**, double*** @a, align 8
  %21 = sext i32 %.01 to i64
  %22 = getelementptr inbounds double*, double** %20, i64 %21
  store double* %19, double** %22, align 8
  %23 = sext i32 2048 to i64
  %24 = mul i64 8, %23
  %25 = call noalias i8* @malloc(i64 noundef %24) #5
  %26 = bitcast i8* %25 to double*
  %27 = load double**, double*** @b, align 8
  %28 = sext i32 %.01 to i64
  %29 = getelementptr inbounds double*, double** %27, i64 %28
  store double* %26, double** %29, align 8
  %30 = sext i32 2048 to i64
  %31 = mul i64 8, %30
  %32 = call noalias i8* @malloc(i64 noundef %31) #5
  %33 = bitcast i8* %32 to double*
  %34 = load double**, double*** @c, align 8
  %35 = sext i32 %.01 to i64
  %36 = getelementptr inbounds double*, double** %34, i64 %35
  store double* %33, double** %36, align 8
  br label %37

37:                                               ; preds = %15
  %38 = add nsw i32 %.01, 1
  br label %13, !llvm.loop !12

39:                                               ; preds = %13
  br label %40

40:                                               ; preds = %67, %39
  %.1 = phi i32 [ 0, %39 ], [ %68, %67 ]
  %41 = icmp slt i32 %.1, 2048
  br i1 %41, label %42, label %69

42:                                               ; preds = %40
  br label %43

43:                                               ; preds = %64, %42
  %.0 = phi i32 [ 0, %42 ], [ %65, %64 ]
  %44 = icmp slt i32 %.0, 2048
  br i1 %44, label %45, label %66

45:                                               ; preds = %43
  %46 = load double**, double*** @a, align 8
  %47 = sext i32 %.1 to i64
  %48 = getelementptr inbounds double*, double** %46, i64 %47
  %49 = load double*, double** %48, align 8
  %50 = sext i32 %.0 to i64
  %51 = getelementptr inbounds double, double* %49, i64 %50
  store double 2.000000e+00, double* %51, align 8
  %52 = load double**, double*** @b, align 8
  %53 = sext i32 %.1 to i64
  %54 = getelementptr inbounds double*, double** %52, i64 %53
  %55 = load double*, double** %54, align 8
  %56 = sext i32 %.0 to i64
  %57 = getelementptr inbounds double, double* %55, i64 %56
  store double 5.000000e+00, double* %57, align 8
  %58 = load double**, double*** @c, align 8
  %59 = sext i32 %.1 to i64
  %60 = getelementptr inbounds double*, double** %58, i64 %59
  %61 = load double*, double** %60, align 8
  %62 = sext i32 %.0 to i64
  %63 = getelementptr inbounds double, double* %61, i64 %62
  store double 0.000000e+00, double* %63, align 8
  br label %64

64:                                               ; preds = %45
  %65 = add nsw i32 %.0, 1
  br label %43, !llvm.loop !13

66:                                               ; preds = %43
  br label %67

67:                                               ; preds = %66
  %68 = add nsw i32 %.1, 1
  br label %40, !llvm.loop !14

69:                                               ; preds = %40
  %70 = call double @matrixMult(i32 noundef 2048)
  %71 = load double**, double*** @c, align 8
  %72 = sub nsw i32 2048, 1
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double*, double** %71, i64 %73
  %75 = load double*, double** %74, align 8
  %76 = sub nsw i32 2048, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double* %75, i64 %77
  %79 = load double, double* %78, align 8
  %80 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double noundef %79)
  %81 = load double**, double*** @a, align 8
  %82 = bitcast double** %81 to i8*
  call void @free(i8* noundef %82) #5
  %83 = load double**, double*** @b, align 8
  %84 = bitcast double** %83 to i8*
  call void @free(i8* noundef %84) #5
  %85 = load double**, double*** @c, align 8
  %86 = bitcast double** %85 to i8*
  call void @free(i8* noundef %86) #5
  call void @exit(i32 noundef 0) #6
  unreachable
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
