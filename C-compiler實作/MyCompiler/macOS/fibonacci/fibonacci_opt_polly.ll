; ModuleID = 'fibonacci.ll'
source_filename = "fibonacci.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@.str = private unnamed_addr constant [28 x i8] c"Fibonacci number #%d: %lld\0A\00", align 1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i64 @fib(i32 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sle i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i64 0, ptr %2, align 8
  br label %19

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i64 1, ptr %2, align 8
  br label %19

11:                                               ; preds = %7
  %12 = load i32, ptr %3, align 4
  %13 = sub nsw i32 %12, 1
  %14 = call i64 @fib(i32 noundef %13)
  %15 = load i32, ptr %3, align 4
  %16 = sub nsw i32 %15, 2
  %17 = call i64 @fib(i32 noundef %16)
  %18 = add nsw i64 %14, %17
  store i64 %18, ptr %2, align 8
  br label %19

19:                                               ; preds = %11, %10, %6
  %20 = load i64, ptr %2, align 8
  ret i64 %20
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 50, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i64 @fib(i32 noundef %4)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %3, i64 noundef %5)
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 16.0.3"}
