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
  br i1 %2, label %.preheader.us.us.preheader, label %._crit_edge

.preheader.us.us.preheader:                       ; preds = %1
  %wide.trip.count38 = zext i32 %0 to i64
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge23.split.us.us.us
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge23.split.us.us.us ]
  br label %.lr.ph.us.us.us

.lr.ph.us.us.us:                                  ; preds = %._crit_edge.us.us.us, %.preheader.us.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us.us.us ], [ 0, %.preheader.us.us ]
  %3 = load double**, double*** @c, align 8
  %4 = getelementptr inbounds double*, double** %3, i64 %indvars.iv35
  %5 = load double*, double** %4, align 8
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv30
  store double 0.000000e+00, double* %6, align 8
  br label %7

7:                                                ; preds = %7, %.lr.ph.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %7 ], [ 0, %.lr.ph.us.us.us ]
  %8 = load double**, double*** @a, align 8
  %9 = getelementptr inbounds double*, double** %8, i64 %indvars.iv35
  %10 = load double*, double** %9, align 8
  %11 = getelementptr inbounds double, double* %10, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = load double**, double*** @b, align 8
  %14 = getelementptr inbounds double*, double** %13, i64 %indvars.iv
  %15 = load double*, double** %14, align 8
  %16 = getelementptr inbounds double, double* %15, i64 %indvars.iv30
  %17 = load double, double* %16, align 8
  %18 = load double**, double*** @c, align 8
  %19 = getelementptr inbounds double*, double** %18, i64 %indvars.iv35
  %20 = load double*, double** %19, align 8
  %21 = getelementptr inbounds double, double* %20, i64 %indvars.iv30
  %22 = load double, double* %21, align 8
  %23 = tail call double @llvm.fmuladd.f64(double %12, double %17, double %22)
  store double %23, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count38
  br i1 %exitcond.not, label %._crit_edge.us.us.us, label %7, !llvm.loop !6

._crit_edge.us.us.us:                             ; preds = %7
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond34.not = icmp eq i64 %indvars.iv.next31, %wide.trip.count38
  br i1 %exitcond34.not, label %._crit_edge23.split.us.us.us, label %.lr.ph.us.us.us, !llvm.loop !8

._crit_edge23.split.us.us.us:                     ; preds = %._crit_edge.us.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39.not = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39.not, label %._crit_edge, label %.preheader.us.us, !llvm.loop !9

._crit_edge:                                      ; preds = %._crit_edge23.split.us.us.us, %1
  ret double undef
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @print(i32 noundef %0) local_unnamed_addr #2 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %1
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  br label %3

3:                                                ; preds = %.preheader.us, %3
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %3 ]
  %4 = load double**, double*** @c, align 8
  %5 = getelementptr inbounds double*, double** %4, i64 %indvars.iv15
  %6 = load double*, double** %5, align 8
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double noundef %8)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count18
  br i1 %exitcond.not, label %._crit_edge.us, label %3, !llvm.loop !10

._crit_edge.us:                                   ; preds = %3
  %10 = tail call i32 @putchar(i32 noundef 10)
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond19.not = icmp eq i64 %indvars.iv.next16, %wide.trip.count18
  br i1 %exitcond19.not, label %._crit_edge13, label %.preheader.us, !llvm.loop !11

._crit_edge13:                                    ; preds = %._crit_edge.us, %1
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #4 {
  %1 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  store i8* %1, i8** bitcast (double*** @a to i8**), align 8
  %2 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  store i8* %2, i8** bitcast (double*** @b to i8**), align 8
  %3 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  store i8* %3, i8** bitcast (double*** @c to i8**), align 8
  %4 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %5 = bitcast i8* %1 to i8**
  store i8* %4, i8** %5, align 8
  %6 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %7 = load i8**, i8*** bitcast (double*** @b to i8***), align 8
  store i8* %6, i8** %7, align 8
  %8 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %9 = load i8**, i8*** bitcast (double*** @c to i8***), align 8
  store i8* %8, i8** %9, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %0, %._crit_edge
  %indvars.iv.next41 = phi i64 [ 1, %0 ], [ %indvars.iv.next, %._crit_edge ]
  %.pre = load double**, double*** @a, align 8
  %10 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %11 = getelementptr inbounds double*, double** %.pre, i64 %indvars.iv.next41
  %12 = bitcast double** %11 to i8**
  store i8* %10, i8** %12, align 8
  %13 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %14 = load double**, double*** @b, align 8
  %15 = getelementptr inbounds double*, double** %14, i64 %indvars.iv.next41
  %16 = bitcast double** %15 to i8**
  store i8* %13, i8** %16, align 8
  %17 = tail call noalias dereferenceable_or_null(16384) i8* @malloc(i64 noundef 16384) #8
  %18 = load double**, double*** @c, align 8
  %19 = getelementptr inbounds double*, double** %18, i64 %indvars.iv.next41
  %20 = bitcast double** %19 to i8**
  store i8* %17, i8** %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv.next41, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 2048
  br i1 %exitcond.not, label %.preheader, label %._crit_edge, !llvm.loop !12

.preheader:                                       ; preds = %._crit_edge, %46
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %46 ], [ 0, %._crit_edge ]
  br label %21

21:                                               ; preds = %21, %.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next34.1, %21 ]
  %22 = load double**, double*** @a, align 8
  %23 = getelementptr inbounds double*, double** %22, i64 %indvars.iv37
  %24 = load double*, double** %23, align 8
  %25 = getelementptr inbounds double, double* %24, i64 %indvars.iv33
  store double 2.000000e+00, double* %25, align 8
  %26 = load double**, double*** @b, align 8
  %27 = getelementptr inbounds double*, double** %26, i64 %indvars.iv37
  %28 = load double*, double** %27, align 8
  %29 = getelementptr inbounds double, double* %28, i64 %indvars.iv33
  store double 5.000000e+00, double* %29, align 8
  %30 = load double**, double*** @c, align 8
  %31 = getelementptr inbounds double*, double** %30, i64 %indvars.iv37
  %32 = load double*, double** %31, align 8
  %33 = getelementptr inbounds double, double* %32, i64 %indvars.iv33
  store double 0.000000e+00, double* %33, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %34 = load double**, double*** @a, align 8
  %35 = getelementptr inbounds double*, double** %34, i64 %indvars.iv37
  %36 = load double*, double** %35, align 8
  %37 = getelementptr inbounds double, double* %36, i64 %indvars.iv.next34
  store double 2.000000e+00, double* %37, align 8
  %38 = load double**, double*** @b, align 8
  %39 = getelementptr inbounds double*, double** %38, i64 %indvars.iv37
  %40 = load double*, double** %39, align 8
  %41 = getelementptr inbounds double, double* %40, i64 %indvars.iv.next34
  store double 5.000000e+00, double* %41, align 8
  %42 = load double**, double*** @c, align 8
  %43 = getelementptr inbounds double*, double** %42, i64 %indvars.iv37
  %44 = load double*, double** %43, align 8
  %45 = getelementptr inbounds double, double* %44, i64 %indvars.iv.next34
  store double 0.000000e+00, double* %45, align 8
  %indvars.iv.next34.1 = add nuw nsw i64 %indvars.iv33, 2
  %exitcond36.not.1 = icmp eq i64 %indvars.iv.next34.1, 2048
  br i1 %exitcond36.not.1, label %46, label %21, !llvm.loop !13

46:                                               ; preds = %21
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40.not = icmp eq i64 %indvars.iv.next38, 2048
  br i1 %exitcond40.not, label %47, label %.preheader, !llvm.loop !14

47:                                               ; preds = %46
  %48 = tail call double @matrixMult(i32 noundef 2048)
  %49 = load double**, double*** @c, align 8
  %50 = getelementptr inbounds double*, double** %49, i64 2047
  %51 = load double*, double** %50, align 8
  %52 = getelementptr inbounds double, double* %51, i64 2047
  %53 = load double, double* %52, align 8
  %54 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double noundef %53)
  %55 = load i8*, i8** bitcast (double*** @a to i8**), align 8
  tail call void @free(i8* noundef %55) #8
  %56 = load i8*, i8** bitcast (double*** @b to i8**), align 8
  tail call void @free(i8* noundef %56) #8
  %57 = load i8*, i8** bitcast (double*** @c to i8**), align 8
  tail call void @free(i8* noundef %57) #8
  tail call void @exit(i32 noundef 0) #9
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
