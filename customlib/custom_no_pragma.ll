; ModuleID = 'custom.c'
source_filename = "custom.c"
target datalayout = "E-m:a-Fi64-i64:64-i128:128-n32:64-f64:32:64-S128-v256:256:256-v512:512:512"
target triple = "powerpc64-ibm-aix7.3.0.0"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define float @fvec_L2sqr_ref(ptr noundef readonly captures(none) %x, ptr noundef readonly captures(none) %y, i64 noundef %d) local_unnamed_addr #0 !dbg !11 {
entry:
    #dbg_value(ptr %x, !21, !DIExpression(), !30)
    #dbg_value(ptr %y, !22, !DIExpression(), !30)
    #dbg_value(i64 %d, !23, !DIExpression(), !30)
    #dbg_value(float 0.000000e+00, !25, !DIExpression(), !30)
    #dbg_value(i64 0, !24, !DIExpression(), !30)
  %cmp7.not = icmp eq i64 %d, 0, !dbg !31
  br i1 %cmp7.not, label %for.end, label %for.body.preheader, !dbg !32

for.body.preheader:                               ; preds = %entry
  %xtraiter = and i64 %d, 3, !dbg !33
  %0 = icmp ult i64 %d, 4, !dbg !33
  br i1 %0, label %for.body.epil.preheader, label %for.body.preheader.new, !dbg !33

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %d, -4, !dbg !33
  br label %for.body, !dbg !33

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %i.09 = phi i64 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %res.08 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %12, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
    #dbg_value(i64 %i.09, !24, !DIExpression(), !30)
    #dbg_value(float %res.08, !25, !DIExpression(), !30)
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.09, !dbg !34
  %1 = load float, ptr %arrayidx, align 4, !dbg !34, !tbaa !35
  %arrayidx1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.09, !dbg !34
  %2 = load float, ptr %arrayidx1, align 4, !dbg !34, !tbaa !35
  %sub = fsub float %1, %2, !dbg !37
    #dbg_value(float %sub, !26, !DIExpression(), !38)
  %3 = tail call float @llvm.fmuladd.f32(float %sub, float %sub, float %res.08), !dbg !39
    #dbg_value(float %3, !25, !DIExpression(), !30)
  %inc = or disjoint i64 %i.09, 1, !dbg !40
    #dbg_value(i64 %inc, !24, !DIExpression(), !30)
  %arrayidx.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc, !dbg !34
  %4 = load float, ptr %arrayidx.1, align 4, !dbg !34, !tbaa !35
  %arrayidx1.1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc, !dbg !34
  %5 = load float, ptr %arrayidx1.1, align 4, !dbg !34, !tbaa !35
  %sub.1 = fsub float %4, %5, !dbg !41
    #dbg_value(float %sub.1, !26, !DIExpression(), !38)
  %6 = tail call float @llvm.fmuladd.f32(float %sub.1, float %sub.1, float %3), !dbg !42
    #dbg_value(float %6, !25, !DIExpression(), !30)
  %inc.1 = or disjoint i64 %i.09, 2, !dbg !43
    #dbg_value(i64 %inc.1, !24, !DIExpression(), !30)
  %arrayidx.2 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc.1, !dbg !34
  %7 = load float, ptr %arrayidx.2, align 4, !dbg !34, !tbaa !35
  %arrayidx1.2 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc.1, !dbg !34
  %8 = load float, ptr %arrayidx1.2, align 4, !dbg !34, !tbaa !35
  %sub.2 = fsub float %7, %8, !dbg !44
    #dbg_value(float %sub.2, !26, !DIExpression(), !38)
  %9 = tail call float @llvm.fmuladd.f32(float %sub.2, float %sub.2, float %6), !dbg !45
    #dbg_value(float %9, !25, !DIExpression(), !30)
  %inc.2 = or disjoint i64 %i.09, 3, !dbg !46
    #dbg_value(i64 %inc.2, !24, !DIExpression(), !30)
  %arrayidx.3 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc.2, !dbg !34
  %10 = load float, ptr %arrayidx.3, align 4, !dbg !34, !tbaa !35
  %arrayidx1.3 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc.2, !dbg !34
  %11 = load float, ptr %arrayidx1.3, align 4, !dbg !34, !tbaa !35
  %sub.3 = fsub float %10, %11, !dbg !47
    #dbg_value(float %sub.3, !26, !DIExpression(), !38)
  %12 = tail call float @llvm.fmuladd.f32(float %sub.3, float %sub.3, float %9), !dbg !48
    #dbg_value(float %12, !25, !DIExpression(), !30)
  %inc.3 = add nuw i64 %i.09, 4, !dbg !49
    #dbg_value(i64 %inc.3, !24, !DIExpression(), !30)
  %niter.next.3 = add i64 %niter, 4, !dbg !50
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !50
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !50, !llvm.loop !51

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !33
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader, !dbg !33

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %i.09.epil.init = phi i64 [ 0, %for.body.preheader ], [ %inc.3, %for.end.loopexit.unr-lcssa ]
  %res.08.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %12, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod11 = icmp ne i64 %xtraiter, 0, !dbg !54
  tail call void @llvm.assume(i1 %lcmp.mod11), !dbg !54
  br label %for.body.epil, !dbg !54

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %i.09.epil = phi i64 [ %inc.epil, %for.body.epil ], [ %i.09.epil.init, %for.body.epil.preheader ]
  %res.08.epil = phi float [ %15, %for.body.epil ], [ %res.08.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
    #dbg_value(i64 %i.09.epil, !24, !DIExpression(), !30)
    #dbg_value(float %res.08.epil, !25, !DIExpression(), !30)
  %arrayidx.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.09.epil, !dbg !34
  %13 = load float, ptr %arrayidx.epil, align 4, !dbg !34, !tbaa !35
  %arrayidx1.epil = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.09.epil, !dbg !34
  %14 = load float, ptr %arrayidx1.epil, align 4, !dbg !34, !tbaa !35
  %sub.epil = fsub float %13, %14, !dbg !55
    #dbg_value(float %sub.epil, !26, !DIExpression(), !38)
  %15 = tail call float @llvm.fmuladd.f32(float %sub.epil, float %sub.epil, float %res.08.epil), !dbg !56
    #dbg_value(float %15, !25, !DIExpression(), !30)
  %inc.epil = add nuw i64 %i.09.epil, 1, !dbg !57
    #dbg_value(i64 %inc.epil, !24, !DIExpression(), !30)
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !58
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !58
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %entry
  %res.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %12, %for.end.loopexit.unr-lcssa ], [ %15, %for.body.epil ], !dbg !30
  ret float %res.0.lcssa, !dbg !61
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define float @fvec_L1_ref(ptr noundef readonly captures(none) %x, ptr noundef readonly captures(none) %y, i64 noundef %d) local_unnamed_addr #0 !dbg !62 {
entry:
    #dbg_value(ptr %x, !64, !DIExpression(), !73)
    #dbg_value(ptr %y, !65, !DIExpression(), !73)
    #dbg_value(i64 %d, !66, !DIExpression(), !73)
    #dbg_value(float 0.000000e+00, !68, !DIExpression(), !73)
    #dbg_value(i64 0, !67, !DIExpression(), !73)
  %cmp8.not = icmp eq i64 %d, 0, !dbg !74
  br i1 %cmp8.not, label %for.end, label %for.body.preheader, !dbg !75

for.body.preheader:                               ; preds = %entry
  %xtraiter = and i64 %d, 3, !dbg !76
  %0 = icmp ult i64 %d, 4, !dbg !76
  br i1 %0, label %for.body.epil.preheader, label %for.body.preheader.new, !dbg !76

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %d, -4, !dbg !76
  br label %for.body, !dbg !76

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %i.010 = phi i64 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %res.09 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %conv3.3, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
    #dbg_value(i64 %i.010, !67, !DIExpression(), !73)
    #dbg_value(float %res.09, !68, !DIExpression(), !73)
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.010, !dbg !77
  %1 = load float, ptr %arrayidx, align 4, !dbg !77, !tbaa !35
  %arrayidx1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.010, !dbg !77
  %2 = load float, ptr %arrayidx1, align 4, !dbg !77, !tbaa !35
  %sub = fsub float %1, %2, !dbg !78
    #dbg_value(float %sub, !69, !DIExpression(), !79)
  %3 = tail call float @llvm.fabs.f32(float %sub), !dbg !80
  %conv3 = fadd float %res.09, %3, !dbg !81
    #dbg_value(float %conv3, !68, !DIExpression(), !73)
  %inc = or disjoint i64 %i.010, 1, !dbg !82
    #dbg_value(i64 %inc, !67, !DIExpression(), !73)
  %arrayidx.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc, !dbg !77
  %4 = load float, ptr %arrayidx.1, align 4, !dbg !77, !tbaa !35
  %arrayidx1.1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc, !dbg !77
  %5 = load float, ptr %arrayidx1.1, align 4, !dbg !77, !tbaa !35
  %sub.1 = fsub float %4, %5, !dbg !83
    #dbg_value(float %sub.1, !69, !DIExpression(), !79)
  %6 = tail call float @llvm.fabs.f32(float %sub.1), !dbg !80
  %conv3.1 = fadd float %conv3, %6, !dbg !84
    #dbg_value(float %conv3.1, !68, !DIExpression(), !73)
  %inc.1 = or disjoint i64 %i.010, 2, !dbg !85
    #dbg_value(i64 %inc.1, !67, !DIExpression(), !73)
  %arrayidx.2 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc.1, !dbg !77
  %7 = load float, ptr %arrayidx.2, align 4, !dbg !77, !tbaa !35
  %arrayidx1.2 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc.1, !dbg !77
  %8 = load float, ptr %arrayidx1.2, align 4, !dbg !77, !tbaa !35
  %sub.2 = fsub float %7, %8, !dbg !86
    #dbg_value(float %sub.2, !69, !DIExpression(), !79)
  %9 = tail call float @llvm.fabs.f32(float %sub.2), !dbg !80
  %conv3.2 = fadd float %conv3.1, %9, !dbg !87
    #dbg_value(float %conv3.2, !68, !DIExpression(), !73)
  %inc.2 = or disjoint i64 %i.010, 3, !dbg !88
    #dbg_value(i64 %inc.2, !67, !DIExpression(), !73)
  %arrayidx.3 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc.2, !dbg !77
  %10 = load float, ptr %arrayidx.3, align 4, !dbg !77, !tbaa !35
  %arrayidx1.3 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc.2, !dbg !77
  %11 = load float, ptr %arrayidx1.3, align 4, !dbg !77, !tbaa !35
  %sub.3 = fsub float %10, %11, !dbg !89
    #dbg_value(float %sub.3, !69, !DIExpression(), !79)
  %12 = tail call float @llvm.fabs.f32(float %sub.3), !dbg !80
  %conv3.3 = fadd float %conv3.2, %12, !dbg !90
    #dbg_value(float %conv3.3, !68, !DIExpression(), !73)
  %inc.3 = add nuw i64 %i.010, 4, !dbg !91
    #dbg_value(i64 %inc.3, !67, !DIExpression(), !73)
  %niter.next.3 = add i64 %niter, 4, !dbg !92
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !92
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !92, !llvm.loop !93

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !76
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader, !dbg !76

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %i.010.epil.init = phi i64 [ 0, %for.body.preheader ], [ %inc.3, %for.end.loopexit.unr-lcssa ]
  %res.09.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %conv3.3, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod12 = icmp ne i64 %xtraiter, 0, !dbg !95
  tail call void @llvm.assume(i1 %lcmp.mod12), !dbg !95
  br label %for.body.epil, !dbg !95

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %i.010.epil = phi i64 [ %inc.epil, %for.body.epil ], [ %i.010.epil.init, %for.body.epil.preheader ]
  %res.09.epil = phi float [ %conv3.epil, %for.body.epil ], [ %res.09.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
    #dbg_value(i64 %i.010.epil, !67, !DIExpression(), !73)
    #dbg_value(float %res.09.epil, !68, !DIExpression(), !73)
  %arrayidx.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.010.epil, !dbg !77
  %13 = load float, ptr %arrayidx.epil, align 4, !dbg !77, !tbaa !35
  %arrayidx1.epil = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.010.epil, !dbg !77
  %14 = load float, ptr %arrayidx1.epil, align 4, !dbg !77, !tbaa !35
  %sub.epil = fsub float %13, %14, !dbg !96
    #dbg_value(float %sub.epil, !69, !DIExpression(), !79)
  %15 = tail call float @llvm.fabs.f32(float %sub.epil), !dbg !80
  %conv3.epil = fadd float %res.09.epil, %15, !dbg !97
    #dbg_value(float %conv3.epil, !68, !DIExpression(), !73)
  %inc.epil = add nuw i64 %i.010.epil, 1, !dbg !98
    #dbg_value(i64 %inc.epil, !67, !DIExpression(), !73)
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !99
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !99
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %entry
  %res.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %conv3.3, %for.end.loopexit.unr-lcssa ], [ %conv3.epil, %for.body.epil ], !dbg !73
  ret float %res.0.lcssa, !dbg !101
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define float @fvec_inner_product_ref(ptr noundef readonly captures(none) %x, ptr noundef readonly captures(none) %y, i64 noundef %d) local_unnamed_addr #0 !dbg !102 {
entry:
    #dbg_value(ptr %x, !104, !DIExpression(), !109)
    #dbg_value(ptr %y, !105, !DIExpression(), !109)
    #dbg_value(i64 %d, !106, !DIExpression(), !109)
    #dbg_value(float 0.000000e+00, !108, !DIExpression(), !109)
    #dbg_value(i64 0, !107, !DIExpression(), !109)
  %cmp6.not = icmp eq i64 %d, 0, !dbg !110
  br i1 %cmp6.not, label %for.end, label %for.body.preheader, !dbg !113

for.body.preheader:                               ; preds = %entry
  %xtraiter = and i64 %d, 3, !dbg !114
  %0 = icmp ult i64 %d, 4, !dbg !114
  br i1 %0, label %for.body.epil.preheader, label %for.body.preheader.new, !dbg !114

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %d, -4, !dbg !114
  br label %for.body, !dbg !114

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %res.08 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %12, %for.body ]
  %i.07 = phi i64 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
    #dbg_value(float %res.08, !108, !DIExpression(), !109)
    #dbg_value(i64 %i.07, !107, !DIExpression(), !109)
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.07, !dbg !115
  %1 = load float, ptr %arrayidx, align 4, !dbg !115, !tbaa !35
  %arrayidx1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.07, !dbg !115
  %2 = load float, ptr %arrayidx1, align 4, !dbg !115, !tbaa !35
  %3 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %res.08), !dbg !117
    #dbg_value(float %3, !108, !DIExpression(), !109)
  %inc = or disjoint i64 %i.07, 1, !dbg !118
    #dbg_value(i64 %inc, !107, !DIExpression(), !109)
  %arrayidx.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc, !dbg !115
  %4 = load float, ptr %arrayidx.1, align 4, !dbg !115, !tbaa !35
  %arrayidx1.1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc, !dbg !115
  %5 = load float, ptr %arrayidx1.1, align 4, !dbg !115, !tbaa !35
  %6 = tail call float @llvm.fmuladd.f32(float %4, float %5, float %3), !dbg !119
    #dbg_value(float %6, !108, !DIExpression(), !109)
  %inc.1 = or disjoint i64 %i.07, 2, !dbg !120
    #dbg_value(i64 %inc.1, !107, !DIExpression(), !109)
  %arrayidx.2 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc.1, !dbg !115
  %7 = load float, ptr %arrayidx.2, align 4, !dbg !115, !tbaa !35
  %arrayidx1.2 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc.1, !dbg !115
  %8 = load float, ptr %arrayidx1.2, align 4, !dbg !115, !tbaa !35
  %9 = tail call float @llvm.fmuladd.f32(float %7, float %8, float %6), !dbg !121
    #dbg_value(float %9, !108, !DIExpression(), !109)
  %inc.2 = or disjoint i64 %i.07, 3, !dbg !122
    #dbg_value(i64 %inc.2, !107, !DIExpression(), !109)
  %arrayidx.3 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc.2, !dbg !115
  %10 = load float, ptr %arrayidx.3, align 4, !dbg !115, !tbaa !35
  %arrayidx1.3 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc.2, !dbg !115
  %11 = load float, ptr %arrayidx1.3, align 4, !dbg !115, !tbaa !35
  %12 = tail call float @llvm.fmuladd.f32(float %10, float %11, float %9), !dbg !123
    #dbg_value(float %12, !108, !DIExpression(), !109)
  %inc.3 = add nuw i64 %i.07, 4, !dbg !124
    #dbg_value(i64 %inc.3, !107, !DIExpression(), !109)
  %niter.next.3 = add i64 %niter, 4, !dbg !125
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !125
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !125, !llvm.loop !126

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !114
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil.preheader, !dbg !114

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.preheader
  %res.08.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %12, %for.end.loopexit.unr-lcssa ]
  %i.07.epil.init = phi i64 [ 0, %for.body.preheader ], [ %inc.3, %for.end.loopexit.unr-lcssa ]
  %lcmp.mod10 = icmp ne i64 %xtraiter, 0, !dbg !128
  tail call void @llvm.assume(i1 %lcmp.mod10), !dbg !128
  br label %for.body.epil, !dbg !128

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %res.08.epil = phi float [ %15, %for.body.epil ], [ %res.08.epil.init, %for.body.epil.preheader ]
  %i.07.epil = phi i64 [ %inc.epil, %for.body.epil ], [ %i.07.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
    #dbg_value(float %res.08.epil, !108, !DIExpression(), !109)
    #dbg_value(i64 %i.07.epil, !107, !DIExpression(), !109)
  %arrayidx.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.07.epil, !dbg !115
  %13 = load float, ptr %arrayidx.epil, align 4, !dbg !115, !tbaa !35
  %arrayidx1.epil = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.07.epil, !dbg !115
  %14 = load float, ptr %arrayidx1.epil, align 4, !dbg !115, !tbaa !35
  %15 = tail call float @llvm.fmuladd.f32(float %13, float %14, float %res.08.epil), !dbg !129
    #dbg_value(float %15, !108, !DIExpression(), !109)
  %inc.epil = add nuw i64 %i.07.epil, 1, !dbg !130
    #dbg_value(i64 %inc.epil, !107, !DIExpression(), !109)
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !131
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !131
  br i1 %epil.iter.cmp.not, label %for.end, label %for.body.epil, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.end.loopexit.unr-lcssa, %for.body.epil, %entry
  %res.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %12, %for.end.loopexit.unr-lcssa ], [ %15, %for.body.epil ], !dbg !109
  ret float %res.0.lcssa, !dbg !133
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read, errnomem: write)
define float @cosine_distance_ref(ptr noundef readonly captures(none) %x, ptr noundef readonly captures(none) %y, i64 noundef %d) local_unnamed_addr #2 !dbg !134 {
entry:
    #dbg_value(ptr %x, !136, !DIExpression(), !145)
    #dbg_value(ptr %y, !137, !DIExpression(), !145)
    #dbg_value(i64 %d, !138, !DIExpression(), !145)
    #dbg_value(float 0.000000e+00, !139, !DIExpression(), !145)
    #dbg_value(float 0.000000e+00, !140, !DIExpression(), !145)
    #dbg_value(float 0.000000e+00, !141, !DIExpression(), !145)
    #dbg_value(float 0.000000e+00, !142, !DIExpression(), !145)
    #dbg_value(i64 0, !143, !DIExpression(), !146)
  %cmp22.not = icmp eq i64 %d, 0, !dbg !147
  br i1 %cmp22.not, label %for.cond.cleanup, label %for.body.preheader, !dbg !149

for.body.preheader:                               ; preds = %entry
  %xtraiter = and i64 %d, 3, !dbg !150
  %0 = icmp ult i64 %d, 4, !dbg !150
  br i1 %0, label %for.body.epil.preheader, label %for.body.preheader.new, !dbg !150

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %d, -4, !dbg !150
  br label %for.body, !dbg !150

for.cond.cleanup.loopexit.unr-lcssa:              ; preds = %for.body
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !150
  br i1 %lcmp.mod.not, label %for.cond.cleanup.loopexit, label %for.body.epil.preheader, !dbg !150

for.body.epil.preheader:                          ; preds = %for.cond.cleanup.loopexit.unr-lcssa, %for.body.preheader
  %i.026.epil.init = phi i64 [ 0, %for.body.preheader ], [ %inc.3, %for.cond.cleanup.loopexit.unr-lcssa ]
  %mag_vy.025.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %28, %for.cond.cleanup.loopexit.unr-lcssa ]
  %mag_vx.024.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %27, %for.cond.cleanup.loopexit.unr-lcssa ]
  %dotpdt.023.epil.init = phi float [ 0.000000e+00, %for.body.preheader ], [ %26, %for.cond.cleanup.loopexit.unr-lcssa ]
  %lcmp.mod42 = icmp ne i64 %xtraiter, 0, !dbg !151
  tail call void @llvm.assume(i1 %lcmp.mod42), !dbg !151
  br label %for.body.epil, !dbg !151

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %i.026.epil = phi i64 [ %inc.epil, %for.body.epil ], [ %i.026.epil.init, %for.body.epil.preheader ]
  %mag_vy.025.epil = phi float [ %5, %for.body.epil ], [ %mag_vy.025.epil.init, %for.body.epil.preheader ]
  %mag_vx.024.epil = phi float [ %4, %for.body.epil ], [ %mag_vx.024.epil.init, %for.body.epil.preheader ]
  %dotpdt.023.epil = phi float [ %3, %for.body.epil ], [ %dotpdt.023.epil.init, %for.body.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body.epil ], [ 0, %for.body.epil.preheader ]
    #dbg_value(i64 %i.026.epil, !143, !DIExpression(), !146)
    #dbg_value(float %mag_vy.025.epil, !142, !DIExpression(), !145)
    #dbg_value(float %mag_vx.024.epil, !141, !DIExpression(), !145)
    #dbg_value(float %dotpdt.023.epil, !140, !DIExpression(), !145)
  %arrayidx.epil = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.026.epil, !dbg !152
  %1 = load float, ptr %arrayidx.epil, align 4, !dbg !152, !tbaa !35
  %arrayidx1.epil = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.026.epil, !dbg !152
  %2 = load float, ptr %arrayidx1.epil, align 4, !dbg !152, !tbaa !35
  %3 = tail call float @llvm.fmuladd.f32(float %1, float %2, float %dotpdt.023.epil), !dbg !154
    #dbg_value(float %3, !140, !DIExpression(), !145)
  %4 = tail call float @llvm.fmuladd.f32(float %1, float %1, float %mag_vx.024.epil), !dbg !155
    #dbg_value(float %4, !141, !DIExpression(), !145)
  %5 = tail call float @llvm.fmuladd.f32(float %2, float %2, float %mag_vy.025.epil), !dbg !156
    #dbg_value(float %5, !142, !DIExpression(), !145)
  %inc.epil = add nuw i64 %i.026.epil, 1, !dbg !157
    #dbg_value(i64 %inc.epil, !143, !DIExpression(), !146)
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !158
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !158
  br i1 %epil.iter.cmp.not, label %for.cond.cleanup.loopexit, label %for.body.epil, !dbg !158, !llvm.loop !159

for.cond.cleanup.loopexit:                        ; preds = %for.body.epil, %for.cond.cleanup.loopexit.unr-lcssa
  %.lcssa38 = phi float [ %26, %for.cond.cleanup.loopexit.unr-lcssa ], [ %3, %for.body.epil ], !dbg !160
  %.lcssa37 = phi float [ %27, %for.cond.cleanup.loopexit.unr-lcssa ], [ %4, %for.body.epil ], !dbg !161
  %.lcssa = phi float [ %28, %for.cond.cleanup.loopexit.unr-lcssa ], [ %5, %for.body.epil ], !dbg !162
  %6 = fpext float %.lcssa38 to double, !dbg !163
  %7 = fmul float %.lcssa37, %.lcssa, !dbg !163
  %8 = fpext float %7 to double, !dbg !163
  br label %for.cond.cleanup, !dbg !163

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %dotpdt.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %6, %for.cond.cleanup.loopexit ], !dbg !145
  %mul = phi double [ 0.000000e+00, %entry ], [ %8, %for.cond.cleanup.loopexit ], !dbg !163
  %call = tail call double @sqrt(double noundef %mul) #6, !dbg !163, !tbaa !7
  %div = fdiv double %dotpdt.0.lcssa, %call, !dbg !163
  %sub = fsub double 1.000000e+00, %div, !dbg !164
  %conv7 = fptrunc double %sub to float, !dbg !165
    #dbg_value(float %conv7, !139, !DIExpression(), !145)
  ret float %conv7, !dbg !166

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %i.026 = phi i64 [ 0, %for.body.preheader.new ], [ %inc.3, %for.body ]
  %mag_vy.025 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %28, %for.body ]
  %mag_vx.024 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %27, %for.body ]
  %dotpdt.023 = phi float [ 0.000000e+00, %for.body.preheader.new ], [ %26, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
    #dbg_value(i64 %i.026, !143, !DIExpression(), !146)
    #dbg_value(float %mag_vy.025, !142, !DIExpression(), !145)
    #dbg_value(float %mag_vx.024, !141, !DIExpression(), !145)
    #dbg_value(float %dotpdt.023, !140, !DIExpression(), !145)
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.026, !dbg !152
  %9 = load float, ptr %arrayidx, align 4, !dbg !152, !tbaa !35
  %arrayidx1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.026, !dbg !152
  %10 = load float, ptr %arrayidx1, align 4, !dbg !152, !tbaa !35
  %11 = tail call float @llvm.fmuladd.f32(float %9, float %10, float %dotpdt.023), !dbg !160
    #dbg_value(float %11, !140, !DIExpression(), !145)
  %12 = tail call float @llvm.fmuladd.f32(float %9, float %9, float %mag_vx.024), !dbg !161
    #dbg_value(float %12, !141, !DIExpression(), !145)
  %13 = tail call float @llvm.fmuladd.f32(float %10, float %10, float %mag_vy.025), !dbg !162
    #dbg_value(float %13, !142, !DIExpression(), !145)
  %inc = or disjoint i64 %i.026, 1, !dbg !167
    #dbg_value(i64 %inc, !143, !DIExpression(), !146)
  %arrayidx.1 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc, !dbg !152
  %14 = load float, ptr %arrayidx.1, align 4, !dbg !152, !tbaa !35
  %arrayidx1.1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc, !dbg !152
  %15 = load float, ptr %arrayidx1.1, align 4, !dbg !152, !tbaa !35
  %16 = tail call float @llvm.fmuladd.f32(float %14, float %15, float %11), !dbg !168
    #dbg_value(float %16, !140, !DIExpression(), !145)
  %17 = tail call float @llvm.fmuladd.f32(float %14, float %14, float %12), !dbg !169
    #dbg_value(float %17, !141, !DIExpression(), !145)
  %18 = tail call float @llvm.fmuladd.f32(float %15, float %15, float %13), !dbg !170
    #dbg_value(float %18, !142, !DIExpression(), !145)
  %inc.1 = or disjoint i64 %i.026, 2, !dbg !171
    #dbg_value(i64 %inc.1, !143, !DIExpression(), !146)
  %arrayidx.2 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc.1, !dbg !152
  %19 = load float, ptr %arrayidx.2, align 4, !dbg !152, !tbaa !35
  %arrayidx1.2 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc.1, !dbg !152
  %20 = load float, ptr %arrayidx1.2, align 4, !dbg !152, !tbaa !35
  %21 = tail call float @llvm.fmuladd.f32(float %19, float %20, float %16), !dbg !172
    #dbg_value(float %21, !140, !DIExpression(), !145)
  %22 = tail call float @llvm.fmuladd.f32(float %19, float %19, float %17), !dbg !173
    #dbg_value(float %22, !141, !DIExpression(), !145)
  %23 = tail call float @llvm.fmuladd.f32(float %20, float %20, float %18), !dbg !174
    #dbg_value(float %23, !142, !DIExpression(), !145)
  %inc.2 = or disjoint i64 %i.026, 3, !dbg !175
    #dbg_value(i64 %inc.2, !143, !DIExpression(), !146)
  %arrayidx.3 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %inc.2, !dbg !152
  %24 = load float, ptr %arrayidx.3, align 4, !dbg !152, !tbaa !35
  %arrayidx1.3 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %inc.2, !dbg !152
  %25 = load float, ptr %arrayidx1.3, align 4, !dbg !152, !tbaa !35
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float %21), !dbg !176
    #dbg_value(float %26, !140, !DIExpression(), !145)
  %27 = tail call float @llvm.fmuladd.f32(float %24, float %24, float %22), !dbg !177
    #dbg_value(float %27, !141, !DIExpression(), !145)
  %28 = tail call float @llvm.fmuladd.f32(float %25, float %25, float %23), !dbg !178
    #dbg_value(float %28, !142, !DIExpression(), !145)
  %inc.3 = add nuw i64 %i.026, 4, !dbg !179
    #dbg_value(i64 %inc.3, !143, !DIExpression(), !146)
  %niter.next.3 = add i64 %niter, 4, !dbg !180
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !180
  br i1 %niter.ncmp.3, label %for.cond.cleanup.loopexit.unr-lcssa, label %for.body, !dbg !180, !llvm.loop !181
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(errnomem: write)
declare double @sqrt(double noundef) local_unnamed_addr #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #5

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pwr7" "target-features"="+64bit-support,+allow-unaligned-fp-access,+altivec,+bpermd,+cmpb,+extdiv,+fcpsgn,+fpcvt,+fprnd,+fpu,+fre,+fres,+frsqrte,+frsqrtes,+fsqrt,+hard-float,+isa-v206-instructions,+isel,+ldbrx,+lfiwax,+mfocrf,+modern-aix-as,+popcntd,+recipprec,+stfiwx,+two-const-nr,+vsx" }
attributes #1 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nofree norecurse nosync nounwind memory(argmem: read, errnomem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pwr7" "target-features"="+64bit-support,+allow-unaligned-fp-access,+altivec,+bpermd,+cmpb,+extdiv,+fcpsgn,+fpcvt,+fprnd,+fpu,+fre,+fres,+frsqrte,+frsqrtes,+fsqrt,+hard-float,+isa-v206-instructions,+isel,+ldbrx,+lfiwax,+mfocrf,+modern-aix-as,+popcntd,+recipprec,+stfiwx,+two-const-nr,+vsx" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(errnomem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pwr7" "target-features"="+64bit-support,+allow-unaligned-fp-access,+altivec,+bpermd,+cmpb,+extdiv,+fcpsgn,+fpcvt,+fprnd,+fpu,+fre,+fres,+frsqrte,+frsqrtes,+fsqrt,+hard-float,+isa-v206-instructions,+isel,+ldbrx,+lfiwax,+mfocrf,+modern-aix-as,+popcntd,+recipprec,+stfiwx,+two-const-nr,+vsx" }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}
!llvm.errno.tbaa = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "IBM Open XL C/C++ for AIX 17.1.5 (5725-C72, 5765-J18), version 17.1.5.0, clang version 23.0.0git (ssh://git@github.ibm.com:22/compiler/llvm-project.git 7913f6f24d01489cf96d2e3ed4b0b03036d0f4f8)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "custom.c", directory: "/home/curtisd/annoy/customlib")
!2 = !{i32 7, !"Dwarf Version", i32 3}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!6 = !{!"IBM Open XL C/C++ for AIX 17.1.5 (5725-C72, 5765-J18), version 17.1.5.0, clang version 23.0.0git (ssh://git@github.ibm.com:22/compiler/llvm-project.git 7913f6f24d01489cf96d2e3ed4b0b03036d0f4f8)"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !DISubprogram(name: "fvec_L2sqr_ref", scope: !1, file: !1, line: 4, type: !12, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !20, keyInstructions: true)
!12 = !DISubroutineType(types: !13)
!13 = !{!14, !15, !15, !17}
!14 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 18, baseType: !19)
!18 = !DIFile(filename: "/compgpfs/build/xlcit/continuous/openxlC/aix/wyvern_dev/13887/opt/IBM/openxlC/17.1.5/lib/clang/23/include/__stddef_size_t.h", directory: "")
!19 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!20 = !{!21, !22, !23, !24, !25, !26}
!21 = !DILocalVariable(name: "x", arg: 1, scope: !11, file: !1, line: 4, type: !15)
!22 = !DILocalVariable(name: "y", arg: 2, scope: !11, file: !1, line: 4, type: !15)
!23 = !DILocalVariable(name: "d", arg: 3, scope: !11, file: !1, line: 4, type: !17)
!24 = !DILocalVariable(name: "i", scope: !11, file: !1, line: 5, type: !17)
!25 = !DILocalVariable(name: "res", scope: !11, file: !1, line: 6, type: !14)
!26 = !DILocalVariable(name: "tmp", scope: !27, file: !1, line: 8, type: !16)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 7)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 7)
!29 = distinct !DILexicalBlock(scope: !11, file: !1, line: 7)
!30 = !DILocation(line: 0, scope: !11)
!31 = !DILocation(line: 7, scope: !28, atomGroup: 16, atomRank: 1)
!32 = !DILocation(line: 7, scope: !29, atomGroup: 17, atomRank: 1)
!33 = !DILocation(line: 7, scope: !29)
!34 = !DILocation(line: 8, scope: !27)
!35 = !{!36, !36, i64 0}
!36 = !{!"float", !9, i64 0}
!37 = !DILocation(line: 8, scope: !27, atomGroup: 5, atomRank: 2)
!38 = !DILocation(line: 0, scope: !27)
!39 = !DILocation(line: 9, scope: !27, atomGroup: 6, atomRank: 2)
!40 = !DILocation(line: 7, scope: !28, atomGroup: 7, atomRank: 2)
!41 = !DILocation(line: 8, scope: !27, atomGroup: 29, atomRank: 2)
!42 = !DILocation(line: 9, scope: !27, atomGroup: 30, atomRank: 2)
!43 = !DILocation(line: 7, scope: !28, atomGroup: 31, atomRank: 2)
!44 = !DILocation(line: 8, scope: !27, atomGroup: 34, atomRank: 2)
!45 = !DILocation(line: 9, scope: !27, atomGroup: 35, atomRank: 2)
!46 = !DILocation(line: 7, scope: !28, atomGroup: 36, atomRank: 2)
!47 = !DILocation(line: 8, scope: !27, atomGroup: 39, atomRank: 2)
!48 = !DILocation(line: 9, scope: !27, atomGroup: 40, atomRank: 2)
!49 = !DILocation(line: 7, scope: !28, atomGroup: 41, atomRank: 2)
!50 = !DILocation(line: 7, scope: !29, atomGroup: 43, atomRank: 1)
!51 = distinct !{!51, !33, !52, !53}
!52 = !DILocation(line: 10, scope: !29)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocation(line: 7, scope: !29, atomGroup: 4, atomRank: 1)
!55 = !DILocation(line: 8, scope: !27, atomGroup: 24, atomRank: 2)
!56 = !DILocation(line: 9, scope: !27, atomGroup: 25, atomRank: 2)
!57 = !DILocation(line: 7, scope: !28, atomGroup: 26, atomRank: 2)
!58 = !DILocation(line: 7, scope: !29, atomGroup: 28, atomRank: 1)
!59 = distinct !{!59, !60}
!60 = !{!"llvm.loop.unroll.disable"}
!61 = !DILocation(line: 11, scope: !11, atomGroup: 10, atomRank: 1)
!62 = distinct !DISubprogram(name: "fvec_L1_ref", scope: !1, file: !1, line: 14, type: !12, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !63, keyInstructions: true)
!63 = !{!64, !65, !66, !67, !68, !69}
!64 = !DILocalVariable(name: "x", arg: 1, scope: !62, file: !1, line: 14, type: !15)
!65 = !DILocalVariable(name: "y", arg: 2, scope: !62, file: !1, line: 14, type: !15)
!66 = !DILocalVariable(name: "d", arg: 3, scope: !62, file: !1, line: 14, type: !17)
!67 = !DILocalVariable(name: "i", scope: !62, file: !1, line: 15, type: !17)
!68 = !DILocalVariable(name: "res", scope: !62, file: !1, line: 16, type: !14)
!69 = !DILocalVariable(name: "tmp", scope: !70, file: !1, line: 18, type: !16)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 17)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 17)
!72 = distinct !DILexicalBlock(scope: !62, file: !1, line: 17)
!73 = !DILocation(line: 0, scope: !62)
!74 = !DILocation(line: 17, scope: !71, atomGroup: 18, atomRank: 1)
!75 = !DILocation(line: 17, scope: !72, atomGroup: 19, atomRank: 1)
!76 = !DILocation(line: 17, scope: !72)
!77 = !DILocation(line: 18, scope: !70)
!78 = !DILocation(line: 18, scope: !70, atomGroup: 5, atomRank: 2)
!79 = !DILocation(line: 0, scope: !70)
!80 = !DILocation(line: 19, scope: !70)
!81 = !DILocation(line: 19, scope: !70, atomGroup: 6, atomRank: 2)
!82 = !DILocation(line: 17, scope: !71, atomGroup: 7, atomRank: 2)
!83 = !DILocation(line: 18, scope: !70, atomGroup: 49, atomRank: 2)
!84 = !DILocation(line: 19, scope: !70, atomGroup: 50, atomRank: 2)
!85 = !DILocation(line: 17, scope: !71, atomGroup: 51, atomRank: 2)
!86 = !DILocation(line: 18, scope: !70, atomGroup: 54, atomRank: 2)
!87 = !DILocation(line: 19, scope: !70, atomGroup: 55, atomRank: 2)
!88 = !DILocation(line: 17, scope: !71, atomGroup: 56, atomRank: 2)
!89 = !DILocation(line: 18, scope: !70, atomGroup: 59, atomRank: 2)
!90 = !DILocation(line: 19, scope: !70, atomGroup: 60, atomRank: 2)
!91 = !DILocation(line: 17, scope: !71, atomGroup: 61, atomRank: 2)
!92 = !DILocation(line: 17, scope: !72, atomGroup: 63, atomRank: 1)
!93 = distinct !{!93, !76, !94, !53}
!94 = !DILocation(line: 20, scope: !72)
!95 = !DILocation(line: 17, scope: !72, atomGroup: 4, atomRank: 1)
!96 = !DILocation(line: 18, scope: !70, atomGroup: 44, atomRank: 2)
!97 = !DILocation(line: 19, scope: !70, atomGroup: 45, atomRank: 2)
!98 = !DILocation(line: 17, scope: !71, atomGroup: 46, atomRank: 2)
!99 = !DILocation(line: 17, scope: !72, atomGroup: 48, atomRank: 1)
!100 = distinct !{!100, !60}
!101 = !DILocation(line: 21, scope: !62, atomGroup: 10, atomRank: 1)
!102 = distinct !DISubprogram(name: "fvec_inner_product_ref", scope: !1, file: !1, line: 24, type: !12, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !103, keyInstructions: true)
!103 = !{!104, !105, !106, !107, !108}
!104 = !DILocalVariable(name: "x", arg: 1, scope: !102, file: !1, line: 24, type: !15)
!105 = !DILocalVariable(name: "y", arg: 2, scope: !102, file: !1, line: 24, type: !15)
!106 = !DILocalVariable(name: "d", arg: 3, scope: !102, file: !1, line: 24, type: !17)
!107 = !DILocalVariable(name: "i", scope: !102, file: !1, line: 25, type: !17)
!108 = !DILocalVariable(name: "res", scope: !102, file: !1, line: 26, type: !14)
!109 = !DILocation(line: 0, scope: !102)
!110 = !DILocation(line: 27, scope: !111, atomGroup: 20, atomRank: 1)
!111 = distinct !DILexicalBlock(scope: !112, file: !1, line: 27)
!112 = distinct !DILexicalBlock(scope: !102, file: !1, line: 27)
!113 = !DILocation(line: 27, scope: !112, atomGroup: 21, atomRank: 1)
!114 = !DILocation(line: 27, scope: !112)
!115 = !DILocation(line: 28, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !1, line: 27)
!117 = !DILocation(line: 28, scope: !116, atomGroup: 5, atomRank: 2)
!118 = !DILocation(line: 27, scope: !111, atomGroup: 6, atomRank: 2)
!119 = !DILocation(line: 28, scope: !116, atomGroup: 68, atomRank: 2)
!120 = !DILocation(line: 27, scope: !111, atomGroup: 69, atomRank: 2)
!121 = !DILocation(line: 28, scope: !116, atomGroup: 72, atomRank: 2)
!122 = !DILocation(line: 27, scope: !111, atomGroup: 73, atomRank: 2)
!123 = !DILocation(line: 28, scope: !116, atomGroup: 76, atomRank: 2)
!124 = !DILocation(line: 27, scope: !111, atomGroup: 77, atomRank: 2)
!125 = !DILocation(line: 27, scope: !112, atomGroup: 79, atomRank: 1)
!126 = distinct !{!126, !114, !127, !53}
!127 = !DILocation(line: 29, scope: !112)
!128 = !DILocation(line: 27, scope: !112, atomGroup: 4, atomRank: 1)
!129 = !DILocation(line: 28, scope: !116, atomGroup: 64, atomRank: 2)
!130 = !DILocation(line: 27, scope: !111, atomGroup: 65, atomRank: 2)
!131 = !DILocation(line: 27, scope: !112, atomGroup: 67, atomRank: 1)
!132 = distinct !{!132, !60}
!133 = !DILocation(line: 30, scope: !102, atomGroup: 9, atomRank: 1)
!134 = distinct !DISubprogram(name: "cosine_distance_ref", scope: !1, file: !1, line: 34, type: !12, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !135, keyInstructions: true)
!135 = !{!136, !137, !138, !139, !140, !141, !142, !143}
!136 = !DILocalVariable(name: "x", arg: 1, scope: !134, file: !1, line: 34, type: !15)
!137 = !DILocalVariable(name: "y", arg: 2, scope: !134, file: !1, line: 34, type: !15)
!138 = !DILocalVariable(name: "d", arg: 3, scope: !134, file: !1, line: 34, type: !17)
!139 = !DILocalVariable(name: "res", scope: !134, file: !1, line: 36, type: !14)
!140 = !DILocalVariable(name: "dotpdt", scope: !134, file: !1, line: 36, type: !14)
!141 = !DILocalVariable(name: "mag_vx", scope: !134, file: !1, line: 36, type: !14)
!142 = !DILocalVariable(name: "mag_vy", scope: !134, file: !1, line: 36, type: !14)
!143 = !DILocalVariable(name: "i", scope: !144, file: !1, line: 37, type: !17)
!144 = distinct !DILexicalBlock(scope: !134, file: !1, line: 37)
!145 = !DILocation(line: 0, scope: !134)
!146 = !DILocation(line: 0, scope: !144)
!147 = !DILocation(line: 37, scope: !148, atomGroup: 22, atomRank: 1)
!148 = distinct !DILexicalBlock(scope: !144, file: !1, line: 37)
!149 = !DILocation(line: 37, scope: !144, atomGroup: 23, atomRank: 1)
!150 = !DILocation(line: 37, scope: !144)
!151 = !DILocation(line: 37, scope: !144, atomGroup: 7, atomRank: 1)
!152 = !DILocation(line: 39, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !1, line: 38)
!154 = !DILocation(line: 39, scope: !153, atomGroup: 80, atomRank: 2)
!155 = !DILocation(line: 40, scope: !153, atomGroup: 81, atomRank: 2)
!156 = !DILocation(line: 41, scope: !153, atomGroup: 82, atomRank: 2)
!157 = !DILocation(line: 37, scope: !148, atomGroup: 83, atomRank: 2)
!158 = !DILocation(line: 37, scope: !144, atomGroup: 85, atomRank: 1)
!159 = distinct !{!159, !60}
!160 = !DILocation(line: 39, scope: !153, atomGroup: 8, atomRank: 2)
!161 = !DILocation(line: 40, scope: !153, atomGroup: 9, atomRank: 2)
!162 = !DILocation(line: 41, scope: !153, atomGroup: 10, atomRank: 2)
!163 = !DILocation(line: 43, scope: !134)
!164 = !DILocation(line: 43, scope: !134, atomGroup: 13, atomRank: 3)
!165 = !DILocation(line: 43, scope: !134, atomGroup: 13, atomRank: 2)
!166 = !DILocation(line: 44, scope: !134, atomGroup: 15, atomRank: 1)
!167 = !DILocation(line: 37, scope: !148, atomGroup: 11, atomRank: 2)
!168 = !DILocation(line: 39, scope: !153, atomGroup: 86, atomRank: 2)
!169 = !DILocation(line: 40, scope: !153, atomGroup: 87, atomRank: 2)
!170 = !DILocation(line: 41, scope: !153, atomGroup: 88, atomRank: 2)
!171 = !DILocation(line: 37, scope: !148, atomGroup: 89, atomRank: 2)
!172 = !DILocation(line: 39, scope: !153, atomGroup: 92, atomRank: 2)
!173 = !DILocation(line: 40, scope: !153, atomGroup: 93, atomRank: 2)
!174 = !DILocation(line: 41, scope: !153, atomGroup: 94, atomRank: 2)
!175 = !DILocation(line: 37, scope: !148, atomGroup: 95, atomRank: 2)
!176 = !DILocation(line: 39, scope: !153, atomGroup: 98, atomRank: 2)
!177 = !DILocation(line: 40, scope: !153, atomGroup: 99, atomRank: 2)
!178 = !DILocation(line: 41, scope: !153, atomGroup: 100, atomRank: 2)
!179 = !DILocation(line: 37, scope: !148, atomGroup: 101, atomRank: 2)
!180 = !DILocation(line: 37, scope: !144, atomGroup: 103, atomRank: 1)
!181 = distinct !{!181, !150, !182, !53}
!182 = !DILocation(line: 42, scope: !144)
