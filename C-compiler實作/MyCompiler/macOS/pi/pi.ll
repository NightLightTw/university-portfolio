; ModuleID = 'pi.c'
source_filename = "pi.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@.str = private unnamed_addr constant [34 x i8] c"Estimate after %d iterations: %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Final estimate of Pi = %f\0A\00", align 1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define double @randomFloat() #0 {
  %1 = call i32 @rand()
  %2 = sitofp i32 %1 to double
  %3 = fdiv double %2, 0x41DFFFFFFFC00000
  ret double %3
}

declare i32 @rand() #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  store i32 0, ptr %1, align 4
  %9 = call i64 @time(ptr noundef null)
  %10 = trunc i64 %9 to i32
  call void @srand(i32 noundef %10)
  store i32 100000, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %50, %0
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %2, align 4
  %14 = load i32, ptr %2, align 4
  %15 = mul nsw i32 %13, %14
  %16 = icmp slt i32 %12, %15
  br i1 %16, label %17, label %53

17:                                               ; preds = %11
  %18 = call double @randomFloat()
  store double %18, ptr %6, align 8
  %19 = call double @randomFloat()
  store double %19, ptr %7, align 8
  %20 = load double, ptr %6, align 8
  %21 = load double, ptr %6, align 8
  %22 = load double, ptr %7, align 8
  %23 = load double, ptr %7, align 8
  %24 = fmul double %22, %23
  %25 = call double @llvm.fmuladd.f64(double %20, double %21, double %24)
  %26 = fcmp ole double %25, 1.000000e+00
  br i1 %26, label %27, label %30

27:                                               ; preds = %17
  %28 = load i32, ptr %3, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, ptr %3, align 4
  br label %30

30:                                               ; preds = %27, %17
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  %33 = load i32, ptr %5, align 4
  %34 = load i32, ptr %2, align 4
  %35 = srem i32 %33, %34
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %49

37:                                               ; preds = %30
  %38 = load i32, ptr %5, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %49

40:                                               ; preds = %37
  %41 = load i32, ptr %5, align 4
  %42 = load i32, ptr %3, align 4
  %43 = sitofp i32 %42 to double
  %44 = fmul double 4.000000e+00, %43
  %45 = load i32, ptr %4, align 4
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %44, %46
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %41, double noundef %47)
  br label %49

49:                                               ; preds = %40, %37, %30
  br label %50

50:                                               ; preds = %49
  %51 = load i32, ptr %5, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %5, align 4
  br label %11, !llvm.loop !5

53:                                               ; preds = %11
  %54 = load i32, ptr %3, align 4
  %55 = sitofp i32 %54 to double
  %56 = fmul double 4.000000e+00, %55
  %57 = load i32, ptr %4, align 4
  %58 = sitofp i32 %57 to double
  %59 = fdiv double %56, %58
  store double %59, ptr %8, align 8
  %60 = load double, ptr %8, align 8
  %61 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, double noundef %60)
  ret i32 0
}

declare void @srand(i32 noundef) #1

declare i64 @time(ptr noundef) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 16.0.3"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
