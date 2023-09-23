; ModuleID = 'pi.ll'
source_filename = "pi.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@.str = private unnamed_addr constant [34 x i8] c"Estimate after %d iterations: %f\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"Final estimate of Pi = %f\0A\00", align 1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define double @randomFloat() local_unnamed_addr #0 {
  %1 = tail call i32 @rand() #4
  %2 = sitofp i32 %1 to double
  %3 = fdiv double %2, 0x41DFFFFFFFC00000
  ret double %3
}

declare i32 @rand() local_unnamed_addr #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() local_unnamed_addr #0 {
  %1 = tail call i64 @time(ptr noundef null) #4
  %2 = trunc i64 %1 to i32
  tail call void @srand(i32 noundef %2) #4
  br label %3

3:                                                ; preds = %0, %20
  %.023 = phi i32 [ 0, %0 ], [ %.1, %20 ]
  %.01922 = phi i32 [ 0, %0 ], [ %10, %20 ]
  %4 = tail call double @randomFloat()
  %5 = tail call double @randomFloat()
  %6 = fmul double %5, %5
  %7 = tail call double @llvm.fmuladd.f64(double %4, double %4, double %6)
  %8 = fcmp ole double %7, 1.000000e+00
  %9 = zext i1 %8 to i32
  %.1 = add nuw nsw i32 %.023, %9
  %10 = add nuw nsw i32 %.01922, 1
  %11 = urem i32 %.01922, 100000
  %12 = icmp eq i32 %11, 0
  %13 = icmp ne i32 %.01922, 0
  %or.cond = and i1 %13, %12
  br i1 %or.cond, label %14, label %20

14:                                               ; preds = %3
  %15 = sitofp i32 %.1 to double
  %16 = fmul double %15, 4.000000e+00
  %17 = sitofp i32 %10 to double
  %18 = fdiv double %16, %17
  %19 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %.01922, double noundef %18)
  br label %20

20:                                               ; preds = %3, %14
  %exitcond.not = icmp eq i32 %10, 1410065408
  br i1 %exitcond.not, label %21, label %3, !llvm.loop !5

21:                                               ; preds = %20
  %22 = sitofp i32 %.1 to double
  %23 = fmul double %22, 4.000000e+00
  %24 = fdiv double %23, 0x41D502F900000000
  %25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %24)
  ret i32 0
}

declare void @srand(i32 noundef) local_unnamed_addr #1

declare i64 @time(ptr noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 16.0.3"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
