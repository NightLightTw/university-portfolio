; ModuleID = 'quickSort.ll'
source_filename = "quickSort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@str = private unnamed_addr constant [15 x i8] c"Sorted array: \00", align 1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind uwtable willreturn
define dso_local void @swap(i32* nocapture noundef %0, i32* nocapture noundef %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %0, align 4
  %4 = load i32, i32* %1, align 4
  store i32 %4, i32* %0, align 4
  store i32 %3, i32* %1, align 4
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind uwtable
define dso_local i32 @partition(i32* nocapture noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #1 {
  %4 = sext i32 %2 to i64
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4
  %7 = add nsw i32 %1, -1
  %.not.not20 = icmp slt i32 %1, %2
  br i1 %.not.not20, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %8 = sext i32 %1 to i64
  %wide.trip.count = sext i32 %2 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %16
  %indvars.iv = phi i64 [ %8, %.lr.ph.preheader ], [ %indvars.iv.next, %16 ]
  %.01921 = phi i32 [ %7, %.lr.ph.preheader ], [ %.1, %16 ]
  %9 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %10 = load i32, i32* %9, align 4
  %11 = icmp slt i32 %10, %6
  br i1 %11, label %12, label %16

12:                                               ; preds = %.lr.ph
  %13 = add nsw i32 %.01921, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32* %0, i64 %14
  call void @swap(i32* noundef %15, i32* noundef nonnull %9)
  br label %16

16:                                               ; preds = %.lr.ph, %12
  %.1 = phi i32 [ %13, %12 ], [ %.01921, %.lr.ph ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !6

._crit_edge:                                      ; preds = %16, %3
  %.019.lcssa = phi i32 [ %7, %3 ], [ %.1, %16 ]
  %17 = add nsw i32 %.019.lcssa, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32* %0, i64 %18
  call void @swap(i32* noundef %19, i32* noundef nonnull %5)
  ret i32 %17
}

; Function Attrs: nofree noinline nosync nounwind uwtable
define dso_local void @quickSort(i32* noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = icmp slt i32 %1, %2
  br i1 %4, label %5, label %9

5:                                                ; preds = %3
  %6 = call i32 @partition(i32* noundef %0, i32 noundef %1, i32 noundef %2)
  %7 = add nsw i32 %6, -1
  call void @quickSort(i32* noundef %0, i32 noundef %1, i32 noundef %7)
  %8 = add nsw i32 %6, 1
  call void @quickSort(i32* noundef %0, i32 noundef %8, i32 noundef %2)
  br label %9

9:                                                ; preds = %5, %3
  ret void
}

; Function Attrs: nofree noinline nounwind uwtable
define dso_local void @printArray(i32* nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #3 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %1 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %4 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  %5 = load i32, i32* %4, align 4
  %6 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %5)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !8

._crit_edge:                                      ; preds = %.lr.ph, %2
  %putchar = call i32 @putchar(i32 10)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree noinline nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #3 {
  %1 = alloca [10000 x i32], align 16
  br label %2

2:                                                ; preds = %2, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next.4, %2 ]
  %3 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 %indvars.iv
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 10000, %4
  store i32 %5, i32* %3, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 %indvars.iv.next
  %7 = trunc i64 %indvars.iv.next to i32
  %8 = sub nuw nsw i32 10000, %7
  store i32 %8, i32* %6, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %9 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 %indvars.iv.next.1
  %10 = trunc i64 %indvars.iv.next.1 to i32
  %11 = sub nuw nsw i32 10000, %10
  store i32 %11, i32* %9, align 4
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %12 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 %indvars.iv.next.2
  %13 = trunc i64 %indvars.iv.next.2 to i32
  %14 = sub nuw nsw i32 10000, %13
  store i32 %14, i32* %12, align 4
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %15 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 %indvars.iv.next.3
  %16 = trunc i64 %indvars.iv.next.3 to i32
  %17 = sub nuw nsw i32 10000, %16
  store i32 %17, i32* %15, align 4
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.not.4 = icmp eq i64 %indvars.iv.next.4, 10000
  br i1 %exitcond.not.4, label %18, label %2, !llvm.loop !9

18:                                               ; preds = %2
  %19 = getelementptr inbounds [10000 x i32], [10000 x i32]* %1, i64 0, i64 0
  call void @quickSort(i32* noundef nonnull %19, i32 noundef 0, i32 noundef 9999)
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str, i64 0, i64 0))
  call void @printArray(i32* noundef nonnull %19, i32 noundef 10000)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind uwtable willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline norecurse nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree noinline nosync nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind }

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
