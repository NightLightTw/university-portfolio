; ModuleID = 'mmd_serial改.ll'
source_filename = "mmd_serial\E6\94\B9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@c = dso_local local_unnamed_addr global double** null, align 8
@a = dso_local local_unnamed_addr global double** null, align 8
@b = dso_local local_unnamed_addr global double** null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%f \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind uwtable
define dso_local double @matrixMult(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %.preheader.lr.ph, label %._crit_edge26

.preheader.lr.ph:                                 ; preds = %1
  %wide.trip.count36 = zext i32 %0 to i64
  %wide.trip.count31 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge23
  %indvars.iv33 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next34, %._crit_edge23 ]
  br label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader, %._crit_edge
  %indvars.iv28 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next29, %._crit_edge ]
  %3 = load double**, double*** @c, align 8
  %4 = getelementptr inbounds double*, double** %3, i64 %indvars.iv33
  %5 = load double*, double** %4, align 8
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv28
  store double 0.000000e+00, double* %6, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %7 = load double**, double*** @a, align 8
  %8 = getelementptr inbounds double*, double** %7, i64 %indvars.iv33
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = load double**, double*** @b, align 8
  %13 = getelementptr inbounds double*, double** %12, i64 %indvars.iv
  %14 = load double*, double** %13, align 8
  %15 = getelementptr inbounds double, double* %14, i64 %indvars.iv28
  %16 = load double, double* %15, align 8
  %17 = load double**, double*** @c, align 8
  %18 = getelementptr inbounds double*, double** %17, i64 %indvars.iv33
  %19 = load double*, double** %18, align 8
  %20 = getelementptr inbounds double, double* %19, i64 %indvars.iv28
  %21 = load double, double* %20, align 8
  %22 = call double @llvm.fmuladd.f64(double %11, double %16, double %21)
  store double %22, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !6

._crit_edge:                                      ; preds = %.lr.ph
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond32.not = icmp eq i64 %indvars.iv.next29, %wide.trip.count31
  br i1 %exitcond32.not, label %._crit_edge23, label %.lr.ph.preheader, !llvm.loop !8

._crit_edge23:                                    ; preds = %._crit_edge
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond37.not = icmp eq i64 %indvars.iv.next34, %wide.trip.count36
  br i1 %exitcond37.not, label %._crit_edge26, label %.preheader, !llvm.loop !9

._crit_edge26:                                    ; preds = %._crit_edge23, %1
  ret double undef
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @print(i32 noundef %0) local_unnamed_addr #2 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %.preheader.lr.ph, label %._crit_edge13

.preheader.lr.ph:                                 ; preds = %1
  %wide.trip.count18 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader.lr.ph, %._crit_edge
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge ]
  br label %3

3:                                                ; preds = %.preheader, %3
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %3 ]
  %4 = load double**, double*** @c, align 8
  %5 = getelementptr inbounds double*, double** %4, i64 %indvars.iv15
  %6 = load double*, double** %5, align 8
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double noundef %8)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %3, !llvm.loop !10

._crit_edge:                                      ; preds = %3
  %10 = call i32 @putchar(i32 noundef 10)
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond19.not = icmp eq i64 %indvars.iv.next16, %wide.trip.count18
  br i1 %exitcond19.not, label %._crit_edge13, label %.preheader, !llvm.loop !11

._crit_edge13:                                    ; preds = %._crit_edge, %1
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #4 {
  %1 = call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  store i8* %1, i8** bitcast (double*** @a to i8**), align 8
  %2 = call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  store i8* %2, i8** bitcast (double*** @b to i8**), align 8
  %3 = call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  store i8* %3, i8** bitcast (double*** @c to i8**), align 8
  br label %4

4:                                                ; preds = %0, %4
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %4 ]
  %5 = call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %6 = load double**, double*** @a, align 8
  %7 = getelementptr inbounds double*, double** %6, i64 %indvars.iv
  %8 = bitcast double** %7 to i8**
  store i8* %5, i8** %8, align 8
  %9 = call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %10 = load double**, double*** @b, align 8
  %11 = getelementptr inbounds double*, double** %10, i64 %indvars.iv
  %12 = bitcast double** %11 to i8**
  store i8* %9, i8** %12, align 8
  %13 = call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %14 = load double**, double*** @c, align 8
  %15 = getelementptr inbounds double*, double** %14, i64 %indvars.iv
  %16 = bitcast double** %15 to i8**
  store i8* %13, i8** %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 2048
  br i1 %exitcond.not, label %.preheader, label %4, !llvm.loop !12

.preheader:                                       ; preds = %4, %42
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %42 ], [ 0, %4 ]
  br label %17

17:                                               ; preds = %17, %.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next34.1, %17 ]
  %18 = load double**, double*** @a, align 8
  %19 = getelementptr inbounds double*, double** %18, i64 %indvars.iv37
  %20 = load double*, double** %19, align 8
  %21 = getelementptr inbounds double, double* %20, i64 %indvars.iv33
  store double 2.000000e+00, double* %21, align 8
  %22 = load double**, double*** @b, align 8
  %23 = getelementptr inbounds double*, double** %22, i64 %indvars.iv37
  %24 = load double*, double** %23, align 8
  %25 = getelementptr inbounds double, double* %24, i64 %indvars.iv33
  store double 5.000000e+00, double* %25, align 8
  %26 = load double**, double*** @c, align 8
  %27 = getelementptr inbounds double*, double** %26, i64 %indvars.iv37
  %28 = load double*, double** %27, align 8
  %29 = getelementptr inbounds double, double* %28, i64 %indvars.iv33
  store double 0.000000e+00, double* %29, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %30 = load double**, double*** @a, align 8
  %31 = getelementptr inbounds double*, double** %30, i64 %indvars.iv37
  %32 = load double*, double** %31, align 8
  %33 = getelementptr inbounds double, double* %32, i64 %indvars.iv.next34
  store double 2.000000e+00, double* %33, align 8
  %34 = load double**, double*** @b, align 8
  %35 = getelementptr inbounds double*, double** %34, i64 %indvars.iv37
  %36 = load double*, double** %35, align 8
  %37 = getelementptr inbounds double, double* %36, i64 %indvars.iv.next34
  store double 5.000000e+00, double* %37, align 8
  %38 = load double**, double*** @c, align 8
  %39 = getelementptr inbounds double*, double** %38, i64 %indvars.iv37
  %40 = load double*, double** %39, align 8
  %41 = getelementptr inbounds double, double* %40, i64 %indvars.iv.next34
  store double 0.000000e+00, double* %41, align 8
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond36.not.1 = icmp eq i64 %indvars.iv.next34.1, 2048
  br i1 %exitcond36.not.1, label %42, label %17, !llvm.loop !13

42:                                               ; preds = %17
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40.not = icmp eq i64 %indvars.iv.next38, 2048
  br i1 %exitcond40.not, label %43, label %.preheader, !llvm.loop !14

43:                                               ; preds = %42
  %44 = call double @matrixMult(i32 noundef 2048)
  %45 = load double**, double*** @c, align 8
  %46 = getelementptr inbounds double*, double** %45, i64 2047
  %47 = load double*, double** %46, align 8
  %48 = getelementptr inbounds double, double* %47, i64 2047
  %49 = load double, double* %48, align 8
  %50 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double noundef %49)
  %51 = load i8*, i8** bitcast (double*** @a to i8**), align 8
  call void @free(i8* noundef %51) #8
  %52 = load i8*, i8** bitcast (double*** @b to i8**), align 8
  call void @free(i8* noundef %52) #8
  %53 = load i8*, i8** bitcast (double*** @c to i8**), align 8
  call void @free(i8* noundef %53) #8
  call void @exit(i32 noundef 0) #9
  unreachable
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #5

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare void @free(i8* nocapture noundef) local_unnamed_addr #6

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #7

attributes #0 = { nofree noinline nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

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
