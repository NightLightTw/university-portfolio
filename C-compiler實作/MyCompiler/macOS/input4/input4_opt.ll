; ModuleID = 'input4.ll'
source_filename = "input4.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@.str = private unnamed_addr constant [8 x i8] c"a = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"b = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"a + b = %d\0A\00", align 1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @add(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = add nsw i32 %5, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 1, ptr %2, align 4
  store i32 2, ptr %3, align 4
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %5)
  %7 = load i32, ptr %3, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %7)
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr %3, align 4
  %11 = call i32 @add(i32 noundef %9, i32 noundef %10)
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %4, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %12)
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
