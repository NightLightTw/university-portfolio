; ModuleID = 'quickSort.ll'
source_filename = "quickSort.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx13.0.0"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@str = private unnamed_addr constant [15 x i8] c"Sorted array: \00", align 1

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(argmem: readwrite) uwtable(sync)
define void @swap(ptr nocapture noundef %0, ptr nocapture noundef %1) local_unnamed_addr #0 {
  %3 = load i32, ptr %0, align 4
  %4 = load i32, ptr %1, align 4
  store i32 %4, ptr %0, align 4
  store i32 %3, ptr %1, align 4
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define i32 @partition(ptr nocapture noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #1 {
  %4 = sext i32 %2 to i64
  %5 = getelementptr inbounds i32, ptr %0, i64 %4
  %6 = load i32, ptr %5, align 4
  %7 = add nsw i32 %1, -1
  %.not.not20 = icmp slt i32 %1, %2
  br i1 %.not.not20, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %8 = sext i32 %1 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %16
  %indvars.iv = phi i64 [ %8, %.lr.ph.preheader ], [ %indvars.iv.next, %16 ]
  %.01921 = phi i32 [ %7, %.lr.ph.preheader ], [ %.1, %16 ]
  %9 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %10, %6
  br i1 %11, label %12, label %16

12:                                               ; preds = %.lr.ph
  %13 = add nsw i32 %.01921, 1
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %0, i64 %14
  tail call void @swap(ptr noundef %15, ptr noundef nonnull %9)
  br label %16

16:                                               ; preds = %.lr.ph, %12
  %.1 = phi i32 [ %13, %12 ], [ %.01921, %.lr.ph ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !5

._crit_edge:                                      ; preds = %16, %3
  %.019.lcssa = phi i32 [ %7, %3 ], [ %.1, %16 ]
  %17 = add nsw i32 %.019.lcssa, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %0, i64 %18
  tail call void @swap(ptr noundef %19, ptr noundef nonnull %5)
  ret i32 %17
}

; Function Attrs: nofree noinline nosync nounwind ssp memory(argmem: readwrite) uwtable(sync)
define void @quickSort(ptr noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = icmp slt i32 %1, %2
  br i1 %4, label %tailrecurse, label %tailrecurse._crit_edge

tailrecurse:                                      ; preds = %3, %tailrecurse
  %.tr1113 = phi i32 [ %7, %tailrecurse ], [ %1, %3 ]
  %5 = tail call i32 @partition(ptr noundef %0, i32 noundef %.tr1113, i32 noundef %2)
  %6 = add nsw i32 %5, -1
  tail call void @quickSort(ptr noundef %0, i32 noundef %.tr1113, i32 noundef %6)
  %7 = add nsw i32 %5, 1
  %8 = icmp slt i32 %7, %2
  br i1 %8, label %tailrecurse, label %tailrecurse._crit_edge

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %3
  ret void
}

; Function Attrs: nofree noinline nounwind ssp uwtable(sync)
define void @printArray(ptr nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #3 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %1 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph ]
  %4 = getelementptr inbounds i32, ptr %0, i64 %indvars.iv
  %5 = load i32, ptr %4, align 4
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %5)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !7

._crit_edge:                                      ; preds = %.lr.ph, %2
  %putchar = tail call i32 @putchar(i32 10)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree noinline nounwind ssp uwtable(sync)
define i32 @main() local_unnamed_addr #3 {
vector.ph:
  %0 = alloca [10000 x i32], align 4
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %1 = getelementptr inbounds [10000 x i32], ptr %0, i64 0, i64 %index
  %2 = sub <4 x i32> <i32 10000, i32 10000, i32 10000, i32 10000>, %vec.ind
  %3 = sub <4 x i32> <i32 9996, i32 9996, i32 9996, i32 9996>, %vec.ind
  %4 = sub <4 x i32> <i32 9992, i32 9992, i32 9992, i32 9992>, %vec.ind
  %5 = sub <4 x i32> <i32 9988, i32 9988, i32 9988, i32 9988>, %vec.ind
  store <4 x i32> %2, ptr %1, align 4
  %6 = getelementptr inbounds i32, ptr %1, i64 4
  store <4 x i32> %3, ptr %6, align 4
  %7 = getelementptr inbounds i32, ptr %1, i64 8
  store <4 x i32> %4, ptr %7, align 4
  %8 = getelementptr inbounds i32, ptr %1, i64 12
  store <4 x i32> %5, ptr %8, align 4
  %index.next = add nuw i64 %index, 16
  %vec.ind.next = add <4 x i32> %vec.ind, <i32 16, i32 16, i32 16, i32 16>
  %9 = icmp eq i64 %index.next, 10000
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  call void @quickSort(ptr noundef nonnull %0, i32 noundef 0, i32 noundef 9999)
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printArray(ptr noundef nonnull %0, i32 noundef 10000)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { mustprogress nofree noinline norecurse nosync nounwind ssp willreturn memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nofree noinline norecurse nosync nounwind ssp memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #2 = { nofree noinline nosync nounwind ssp memory(argmem: readwrite) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { nofree noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { nofree nounwind }

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
!8 = distinct !{!8, !6, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
