; ModuleID = 'mmd_serial改.ll'
source_filename = "mmd_serial\E6\94\B9.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@c = local_unnamed_addr global ptr null, align 8
@a = local_unnamed_addr global ptr null, align 8
@b = local_unnamed_addr global ptr null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%f \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind ssp memory(readwrite, inaccessiblemem: none) uwtable(sync)
define double @matrixMult(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %.preheader.lr.ph, label %._crit_edge25

.preheader.lr.ph:                                 ; preds = %1
  %wide.trip.count35 = zext i32 %0 to i64
  %wide.trip.count30 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge23
  %indvars.iv32 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next33, %._crit_edge23 ]
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader, %._crit_edge
  %indvars.iv27 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next28, %._crit_edge ]
  %3 = load ptr, ptr @c, align 8
  %4 = getelementptr inbounds ptr, ptr %3, i64 %indvars.iv32
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds double, ptr %5, i64 %indvars.iv27
  store double 0.000000e+00, ptr %6, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %7 = load ptr, ptr @a, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 %indvars.iv32
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds double, ptr %9, i64 %indvars.iv
  %11 = load double, ptr %10, align 8
  %12 = load ptr, ptr @b, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 %indvars.iv
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds double, ptr %14, i64 %indvars.iv27
  %16 = load double, ptr %15, align 8
  %17 = load ptr, ptr @c, align 8
  %18 = getelementptr inbounds ptr, ptr %17, i64 %indvars.iv32
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds double, ptr %19, i64 %indvars.iv27
  %21 = load double, ptr %20, align 8
  %22 = tail call double @llvm.fmuladd.f64(double %11, double %16, double %21)
  store double %22, ptr %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !5

._crit_edge:                                      ; preds = %.lr.ph
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond31.not = icmp eq i64 %indvars.iv.next28, %wide.trip.count30
  br i1 %exitcond31.not, label %._crit_edge23, label %.lr.ph.preheader, !llvm.loop !7

._crit_edge23:                                    ; preds = %._crit_edge
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond36.not = icmp eq i64 %indvars.iv.next33, %wide.trip.count35
  br i1 %exitcond36.not, label %._crit_edge25, label %.preheader, !llvm.loop !8

._crit_edge25:                                    ; preds = %._crit_edge23, %1
  ret double undef
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree noinline nounwind ssp uwtable(sync)
define void @print(i32 noundef %0) local_unnamed_addr #2 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %.preheader.lr.ph, label %._crit_edge12

.preheader.lr.ph:                                 ; preds = %1
  %wide.trip.count17 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next15, %._crit_edge ]
  br label %3

3:                                                ; preds = %.preheader, %3
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %3 ]
  %4 = load ptr, ptr @c, align 8
  %5 = getelementptr inbounds ptr, ptr %4, i64 %indvars.iv14
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds double, ptr %6, i64 %indvars.iv
  %8 = load double, ptr %7, align 8
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, double noundef %8)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %3, !llvm.loop !9

._crit_edge:                                      ; preds = %3
  %10 = tail call i32 @putchar(i32 noundef 10)
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18.not = icmp eq i64 %indvars.iv.next15, %wide.trip.count17
  br i1 %exitcond18.not, label %._crit_edge12, label %.preheader, !llvm.loop !10

._crit_edge12:                                    ; preds = %._crit_edge, %1
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind ssp uwtable(sync)
define i32 @main() local_unnamed_addr #4 {
  %1 = tail call dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #8
  store ptr %1, ptr @a, align 8
  %2 = tail call dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #8
  store ptr %2, ptr @b, align 8
  %3 = tail call dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #8
  store ptr %3, ptr @c, align 8
  br label %4

4:                                                ; preds = %0, %4
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %4 ]
  %5 = tail call dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #8
  %6 = load ptr, ptr @a, align 8
  %7 = getelementptr inbounds ptr, ptr %6, i64 %indvars.iv
  store ptr %5, ptr %7, align 8
  %8 = tail call dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #8
  %9 = load ptr, ptr @b, align 8
  %10 = getelementptr inbounds ptr, ptr %9, i64 %indvars.iv
  store ptr %8, ptr %10, align 8
  %11 = tail call dereferenceable_or_null(16384) ptr @malloc(i64 noundef 16384) #8
  %12 = load ptr, ptr @c, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 %indvars.iv
  store ptr %11, ptr %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 2048
  br i1 %exitcond.not, label %.preheader, label %4, !llvm.loop !11

.preheader:                                       ; preds = %4, %27
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %27 ], [ 0, %4 ]
  br label %14

14:                                               ; preds = %.preheader, %14
  %indvars.iv33 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next34, %14 ]
  %15 = load ptr, ptr @a, align 8
  %16 = getelementptr inbounds ptr, ptr %15, i64 %indvars.iv37
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds double, ptr %17, i64 %indvars.iv33
  store double 2.000000e+00, ptr %18, align 8
  %19 = load ptr, ptr @b, align 8
  %20 = getelementptr inbounds ptr, ptr %19, i64 %indvars.iv37
  %21 = load ptr, ptr %20, align 8
  %22 = getelementptr inbounds double, ptr %21, i64 %indvars.iv33
  store double 5.000000e+00, ptr %22, align 8
  %23 = load ptr, ptr @c, align 8
  %24 = getelementptr inbounds ptr, ptr %23, i64 %indvars.iv37
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds double, ptr %25, i64 %indvars.iv33
  store double 0.000000e+00, ptr %26, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36.not = icmp eq i64 %indvars.iv.next34, 2048
  br i1 %exitcond36.not, label %27, label %14, !llvm.loop !12

27:                                               ; preds = %14
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40.not = icmp eq i64 %indvars.iv.next38, 2048
  br i1 %exitcond40.not, label %28, label %.preheader, !llvm.loop !13

28:                                               ; preds = %27
  %29 = tail call double @matrixMult(i32 noundef 2048)
  %30 = load ptr, ptr @c, align 8
  %31 = getelementptr inbounds ptr, ptr %30, i64 2047
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds double, ptr %32, i64 2047
  %34 = load double, ptr %33, align 8
  %35 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %34)
  %36 = load ptr, ptr @a, align 8
  tail call void @free(ptr noundef %36)
  %37 = load ptr, ptr @b, align 8
  tail call void @free(ptr noundef %37)
  %38 = load ptr, ptr @c, align 8
  tail call void @free(ptr noundef %38)
  tail call void @exit(i32 noundef 0) #9
  unreachable
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #6

; Function Attrs: noreturn
declare void @exit(i32 noundef) local_unnamed_addr #7

attributes #0 = { nofree noinline nosync nounwind ssp memory(readwrite, inaccessiblemem: none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nofree noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { noinline noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #6 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #7 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #8 = { allocsize(0) }
attributes #9 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 16.0.3"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
