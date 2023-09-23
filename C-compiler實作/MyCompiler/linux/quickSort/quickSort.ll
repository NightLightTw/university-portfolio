; ModuleID = 'quickSort.c'
source_filename = "quickSort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Sorted array: \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @swap(i32* noundef %0, i32* noundef %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32* %1, i32** %4, align 8
  %6 = load i32*, i32** %3, align 8
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %5, align 4
  %8 = load i32*, i32** %4, align 8
  %9 = load i32, i32* %8, align 4
  %10 = load i32*, i32** %3, align 8
  store i32 %9, i32* %10, align 4
  %11 = load i32, i32* %5, align 4
  %12 = load i32*, i32** %4, align 8
  store i32 %11, i32* %12, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @partition(i32* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %10 = load i32*, i32** %4, align 8
  %11 = load i32, i32* %6, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32* %10, i64 %12
  %14 = load i32, i32* %13, align 4
  store i32 %14, i32* %7, align 4
  %15 = load i32, i32* %5, align 4
  %16 = sub nsw i32 %15, 1
  store i32 %16, i32* %8, align 4
  %17 = load i32, i32* %5, align 4
  store i32 %17, i32* %9, align 4
  br label %18

18:                                               ; preds = %43, %3
  %19 = load i32, i32* %9, align 4
  %20 = load i32, i32* %6, align 4
  %21 = sub nsw i32 %20, 1
  %22 = icmp sle i32 %19, %21
  br i1 %22, label %23, label %46

23:                                               ; preds = %18
  %24 = load i32*, i32** %4, align 8
  %25 = load i32, i32* %9, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32* %24, i64 %26
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %7, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %42

31:                                               ; preds = %23
  %32 = load i32, i32* %8, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %8, align 4
  %34 = load i32*, i32** %4, align 8
  %35 = load i32, i32* %8, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32* %34, i64 %36
  %38 = load i32*, i32** %4, align 8
  %39 = load i32, i32* %9, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32* %38, i64 %40
  call void @swap(i32* noundef %37, i32* noundef %41)
  br label %42

42:                                               ; preds = %31, %23
  br label %43

43:                                               ; preds = %42
  %44 = load i32, i32* %9, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %9, align 4
  br label %18, !llvm.loop !6

46:                                               ; preds = %18
  %47 = load i32*, i32** %4, align 8
  %48 = load i32, i32* %8, align 4
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32* %47, i64 %50
  %52 = load i32*, i32** %4, align 8
  %53 = load i32, i32* %6, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32* %52, i64 %54
  call void @swap(i32* noundef %51, i32* noundef %55)
  %56 = load i32, i32* %8, align 4
  %57 = add nsw i32 %56, 1
  ret i32 %57
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @quickSort(i32* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %8 = load i32, i32* %5, align 4
  %9 = load i32, i32* %6, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %24

11:                                               ; preds = %3
  %12 = load i32*, i32** %4, align 8
  %13 = load i32, i32* %5, align 4
  %14 = load i32, i32* %6, align 4
  %15 = call i32 @partition(i32* noundef %12, i32 noundef %13, i32 noundef %14)
  store i32 %15, i32* %7, align 4
  %16 = load i32*, i32** %4, align 8
  %17 = load i32, i32* %5, align 4
  %18 = load i32, i32* %7, align 4
  %19 = sub nsw i32 %18, 1
  call void @quickSort(i32* noundef %16, i32 noundef %17, i32 noundef %19)
  %20 = load i32*, i32** %4, align 8
  %21 = load i32, i32* %7, align 4
  %22 = add nsw i32 %21, 1
  %23 = load i32, i32* %6, align 4
  call void @quickSort(i32* noundef %20, i32 noundef %22, i32 noundef %23)
  br label %24

24:                                               ; preds = %11, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @printArray(i32* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %6

6:                                                ; preds = %17, %2
  %7 = load i32, i32* %5, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %20

10:                                               ; preds = %6
  %11 = load i32*, i32** %3, align 8
  %12 = load i32, i32* %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32* %11, i64 %13
  %15 = load i32, i32* %14, align 4
  %16 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %15)
  br label %17

17:                                               ; preds = %10
  %18 = load i32, i32* %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %5, align 4
  br label %6, !llvm.loop !8

20:                                               ; preds = %6
  %21 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10000 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %14, %0
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 10000
  br i1 %7, label %8, label %17

8:                                                ; preds = %5
  %9 = load i32, i32* %3, align 4
  %10 = sub nsw i32 10000, %9
  %11 = load i32, i32* %3, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [10000 x i32], [10000 x i32]* %2, i64 0, i64 %12
  store i32 %10, i32* %13, align 4
  br label %14

14:                                               ; preds = %8
  %15 = load i32, i32* %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %3, align 4
  br label %5, !llvm.loop !9

17:                                               ; preds = %5
  store i32 10000, i32* %4, align 4
  %18 = getelementptr inbounds [10000 x i32], [10000 x i32]* %2, i64 0, i64 0
  %19 = load i32, i32* %4, align 4
  %20 = sub nsw i32 %19, 1
  call void @quickSort(i32* noundef %18, i32 noundef 0, i32 noundef %20)
  %21 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0))
  %22 = getelementptr inbounds [10000 x i32], [10000 x i32]* %2, i64 0, i64 0
  %23 = load i32, i32* %4, align 4
  call void @printArray(i32* noundef %22, i32 noundef %23)
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
