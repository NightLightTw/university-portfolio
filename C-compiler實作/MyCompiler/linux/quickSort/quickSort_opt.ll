; ModuleID = 'quickSort.ll'
source_filename = "quickSort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Sorted array: \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap(i32* noundef %0, i32* noundef %1) #0 {
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %1, align 4
  store i32 %4, i32* %0, align 4
  store i32 %3, i32* %1, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @partition(i32* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = sext i32 %2 to i64
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4
  %7 = sub nsw i32 %1, 1
  br label %8

8:                                                ; preds = %23, %3
  %.01 = phi i32 [ %7, %3 ], [ %.1, %23 ]
  %.0 = phi i32 [ %1, %3 ], [ %24, %23 ]
  %9 = sub nsw i32 %2, 1
  %10 = icmp sle i32 %.0, %9
  br i1 %10, label %11, label %25

11:                                               ; preds = %8
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  %14 = load i32, i32* %13, align 4
  %15 = icmp slt i32 %14, %6
  br i1 %15, label %16, label %22

16:                                               ; preds = %11
  %17 = add nsw i32 %.01, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32* %0, i64 %18
  %20 = sext i32 %.0 to i64
  %21 = getelementptr inbounds i32, i32* %0, i64 %20
  call void @swap(i32* noundef %19, i32* noundef %21)
  br label %22

22:                                               ; preds = %16, %11
  %.1 = phi i32 [ %17, %16 ], [ %.01, %11 ]
  br label %23

23:                                               ; preds = %22
  %24 = add nsw i32 %.0, 1
  br label %8, !llvm.loop !6

25:                                               ; preds = %8
  %26 = add nsw i32 %.01, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32* %0, i64 %27
  %29 = sext i32 %2 to i64
  %30 = getelementptr inbounds i32, i32* %0, i64 %29
  call void @swap(i32* noundef %28, i32* noundef %30)
  %31 = add nsw i32 %.01, 1
  ret i32 %31
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @quickSort(i32* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = icmp slt i32 %1, %2
  br i1 %4, label %5, label %9

5:                                                ; preds = %3
  %6 = call i32 @partition(i32* noundef %0, i32 noundef %1, i32 noundef %2)
  %7 = sub nsw i32 %6, 1
  call void @quickSort(i32* noundef %0, i32 noundef %1, i32 noundef %7)
  %8 = add nsw i32 %6, 1
  call void @quickSort(i32* noundef %0, i32 noundef %8, i32 noundef %2)
  br label %9

9:                                                ; preds = %5, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printArray(i32* noundef %0, i32 noundef %1) #0 {
  br label %3

3:                                                ; preds = %10, %2
  %.0 = phi i32 [ 0, %2 ], [ %11, %10 ]
  %4 = icmp slt i32 %.0, %1
  br i1 %4, label %5, label %12

5:                                                ; preds = %3
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds i32, i32* %0, i64 %6
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %8)
  br label %10

10:                                               ; preds = %5
  %11 = add nsw i32 %.0, 1
  br label %3, !llvm.loop !8

12:                                               ; preds = %3
  %13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [10000 x i32], align 16
  br label %2

2:                                                ; preds = %8, %0
  %.0 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %3 = icmp slt i32 %.0, 10000
  br i1 %3, label %4, label %10

4:                                                ; preds = %2
  %5 = sub nsw i32 10000, %.0
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 %6
  store i32 %5, i32* %7, align 4
  br label %8

8:                                                ; preds = %4
  %9 = add nsw i32 %.0, 1
  br label %2, !llvm.loop !9

10:                                               ; preds = %2
  %11 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 0
  %12 = sub nsw i32 10000, 1
  call void @quickSort(i32* noundef %11, i32 noundef 0, i32 noundef %12)
  %13 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0))
  %14 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 0
  call void @printArray(i32* noundef %14, i32 noundef 10000)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
