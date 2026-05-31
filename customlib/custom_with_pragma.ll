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
  br i1 %cmp7.not, label %for.end, label %iter.check, !dbg !32

iter.check:                                       ; preds = %entry
  %min.iters.check = icmp ult i64 %d, 4, !dbg !33
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check, !dbg !33

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check10 = icmp ult i64 %d, 32, !dbg !33
  br i1 %min.iters.check10, label %vec.epilog.ph, label %vector.ph, !dbg !33

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.mod.vf = and i64 %d, 28
  %n.vec = and i64 %d, -32
  br label %vector.body, !dbg !33

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !34
  %vec.phi = phi <4 x float> [ <float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %vector.ph ], [ %32, %vector.body ]
  %vec.phi11 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %33, %vector.body ]
  %vec.phi12 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %34, %vector.body ]
  %vec.phi13 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %35, %vector.body ]
  %vec.phi14 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %36, %vector.body ]
  %vec.phi15 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %37, %vector.body ]
  %vec.phi16 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %38, %vector.body ]
  %vec.phi17 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %39, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index, !dbg !35
  %1 = getelementptr inbounds nuw i8, ptr %0, i64 16, !dbg !35
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 32, !dbg !35
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 48, !dbg !35
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 64, !dbg !35
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 80, !dbg !35
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 96, !dbg !35
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 112, !dbg !35
  %wide.load = load <4 x float>, ptr %0, align 4, !dbg !35, !tbaa !36
  %wide.load18 = load <4 x float>, ptr %1, align 4, !dbg !35, !tbaa !36
  %wide.load19 = load <4 x float>, ptr %2, align 4, !dbg !35, !tbaa !36
  %wide.load20 = load <4 x float>, ptr %3, align 4, !dbg !35, !tbaa !36
  %wide.load21 = load <4 x float>, ptr %4, align 4, !dbg !35, !tbaa !36
  %wide.load22 = load <4 x float>, ptr %5, align 4, !dbg !35, !tbaa !36
  %wide.load23 = load <4 x float>, ptr %6, align 4, !dbg !35, !tbaa !36
  %wide.load24 = load <4 x float>, ptr %7, align 4, !dbg !35, !tbaa !36
  %8 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index, !dbg !35
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 16, !dbg !35
  %10 = getelementptr inbounds nuw i8, ptr %8, i64 32, !dbg !35
  %11 = getelementptr inbounds nuw i8, ptr %8, i64 48, !dbg !35
  %12 = getelementptr inbounds nuw i8, ptr %8, i64 64, !dbg !35
  %13 = getelementptr inbounds nuw i8, ptr %8, i64 80, !dbg !35
  %14 = getelementptr inbounds nuw i8, ptr %8, i64 96, !dbg !35
  %15 = getelementptr inbounds nuw i8, ptr %8, i64 112, !dbg !35
  %wide.load25 = load <4 x float>, ptr %8, align 4, !dbg !35, !tbaa !36
  %wide.load26 = load <4 x float>, ptr %9, align 4, !dbg !35, !tbaa !36
  %wide.load27 = load <4 x float>, ptr %10, align 4, !dbg !35, !tbaa !36
  %wide.load28 = load <4 x float>, ptr %11, align 4, !dbg !35, !tbaa !36
  %wide.load29 = load <4 x float>, ptr %12, align 4, !dbg !35, !tbaa !36
  %wide.load30 = load <4 x float>, ptr %13, align 4, !dbg !35, !tbaa !36
  %wide.load31 = load <4 x float>, ptr %14, align 4, !dbg !35, !tbaa !36
  %wide.load32 = load <4 x float>, ptr %15, align 4, !dbg !35, !tbaa !36
  %16 = fsub reassoc contract <4 x float> %wide.load, %wide.load25, !dbg !38
  %17 = fsub reassoc contract <4 x float> %wide.load18, %wide.load26, !dbg !38
  %18 = fsub reassoc contract <4 x float> %wide.load19, %wide.load27, !dbg !38
  %19 = fsub reassoc contract <4 x float> %wide.load20, %wide.load28, !dbg !38
  %20 = fsub reassoc contract <4 x float> %wide.load21, %wide.load29, !dbg !38
  %21 = fsub reassoc contract <4 x float> %wide.load22, %wide.load30, !dbg !38
  %22 = fsub reassoc contract <4 x float> %wide.load23, %wide.load31, !dbg !38
  %23 = fsub reassoc contract <4 x float> %wide.load24, %wide.load32, !dbg !38
  %24 = fmul reassoc contract <4 x float> %16, %16, !dbg !39
  %25 = fmul reassoc contract <4 x float> %17, %17, !dbg !39
  %26 = fmul reassoc contract <4 x float> %18, %18, !dbg !39
  %27 = fmul reassoc contract <4 x float> %19, %19, !dbg !39
  %28 = fmul reassoc contract <4 x float> %20, %20, !dbg !39
  %29 = fmul reassoc contract <4 x float> %21, %21, !dbg !39
  %30 = fmul reassoc contract <4 x float> %22, %22, !dbg !39
  %31 = fmul reassoc contract <4 x float> %23, %23, !dbg !39
  %32 = fadd reassoc contract <4 x float> %vec.phi, %24, !dbg !40
  %33 = fadd reassoc contract <4 x float> %vec.phi11, %25, !dbg !40
  %34 = fadd reassoc contract <4 x float> %vec.phi12, %26, !dbg !40
  %35 = fadd reassoc contract <4 x float> %vec.phi13, %27, !dbg !40
  %36 = fadd reassoc contract <4 x float> %vec.phi14, %28, !dbg !40
  %37 = fadd reassoc contract <4 x float> %vec.phi15, %29, !dbg !40
  %38 = fadd reassoc contract <4 x float> %vec.phi16, %30, !dbg !40
  %39 = fadd reassoc contract <4 x float> %vec.phi17, %31, !dbg !40
  %index.next = add nuw i64 %index, 32, !dbg !34
  %40 = icmp eq i64 %index.next, %n.vec, !dbg !41
  br i1 %40, label %middle.block, label %vector.body, !dbg !41, !llvm.loop !42

middle.block:                                     ; preds = %vector.body
  %bin.rdx = fadd reassoc contract <4 x float> %33, %32, !dbg !41
  %bin.rdx33 = fadd reassoc contract <4 x float> %34, %bin.rdx, !dbg !41
  %bin.rdx34 = fadd reassoc contract <4 x float> %35, %bin.rdx33, !dbg !41
  %bin.rdx35 = fadd reassoc contract <4 x float> %36, %bin.rdx34, !dbg !41
  %bin.rdx36 = fadd reassoc contract <4 x float> %37, %bin.rdx35, !dbg !41
  %bin.rdx37 = fadd reassoc contract <4 x float> %38, %bin.rdx36, !dbg !41
  %bin.rdx38 = fadd reassoc contract <4 x float> %39, %bin.rdx37, !dbg !41
  %41 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %bin.rdx38), !dbg !41
  %cmp.n = icmp eq i64 %d, %n.vec, !dbg !41
  br i1 %cmp.n, label %for.end, label %vec.epilog.iter.check, !dbg !41

vec.epilog.iter.check:                            ; preds = %middle.block
  %min.epilog.iters.check = icmp eq i64 %n.mod.vf, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph, !prof !46

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %bc.merge.rdx = phi float [ %41, %vec.epilog.iter.check ], [ 0.000000e+00, %vector.main.loop.iter.check ]
  %n.vec40 = and i64 %d, -4
  %42 = insertelement <4 x float> <float poison, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, float %bc.merge.rdx, i64 0
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index41 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next45, %vec.epilog.vector.body ], !dbg !34
  %vec.phi42 = phi <4 x float> [ %42, %vec.epilog.ph ], [ %47, %vec.epilog.vector.body ]
  %43 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index41, !dbg !35
  %wide.load43 = load <4 x float>, ptr %43, align 4, !dbg !35, !tbaa !36
  %44 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index41, !dbg !35
  %wide.load44 = load <4 x float>, ptr %44, align 4, !dbg !35, !tbaa !36
  %45 = fsub reassoc contract <4 x float> %wide.load43, %wide.load44, !dbg !38
  %46 = fmul reassoc contract <4 x float> %45, %45, !dbg !39
  %47 = fadd reassoc contract <4 x float> %vec.phi42, %46, !dbg !40
  %index.next45 = add nuw i64 %index41, 4, !dbg !34
  %48 = icmp eq i64 %index.next45, %n.vec40, !dbg !41
  br i1 %48, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !dbg !41, !llvm.loop !47

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %49 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %47), !dbg !41
  %cmp.n46 = icmp eq i64 %d, %n.vec40, !dbg !41
  br i1 %cmp.n46, label %for.end, label %for.body.preheader, !dbg !41

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %i.09.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec40, %vec.epilog.middle.block ]
  %res.08.ph = phi float [ 0.000000e+00, %iter.check ], [ %41, %vec.epilog.iter.check ], [ %49, %vec.epilog.middle.block ]
  br label %for.body, !dbg !41

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.09 = phi i64 [ %inc, %for.body ], [ %i.09.ph, %for.body.preheader ]
  %res.08 = phi float [ %add, %for.body ], [ %res.08.ph, %for.body.preheader ]
    #dbg_value(i64 %i.09, !24, !DIExpression(), !30)
    #dbg_value(float %res.08, !25, !DIExpression(), !30)
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.09, !dbg !35
  %50 = load float, ptr %arrayidx, align 4, !dbg !35, !tbaa !36
  %arrayidx1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.09, !dbg !35
  %51 = load float, ptr %arrayidx1, align 4, !dbg !35, !tbaa !36
  %sub = fsub reassoc contract float %50, %51, !dbg !38
    #dbg_value(float %sub, !26, !DIExpression(), !48)
  %mul = fmul reassoc contract float %sub, %sub, !dbg !39
  %add = fadd reassoc contract float %res.08, %mul, !dbg !40
    #dbg_value(float %add, !25, !DIExpression(), !30)
  %inc = add nuw i64 %i.09, 1, !dbg !34
    #dbg_value(i64 %inc, !24, !DIExpression(), !30)
  %exitcond.not = icmp eq i64 %inc, %d, !dbg !49
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !41, !llvm.loop !50

for.end:                                          ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  %res.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %49, %vec.epilog.middle.block ], [ %41, %middle.block ], [ %add, %for.body ], !dbg !30
  ret float %res.0.lcssa, !dbg !51
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define float @fvec_L1_ref(ptr noundef readonly captures(none) %x, ptr noundef readonly captures(none) %y, i64 noundef %d) local_unnamed_addr #0 !dbg !52 {
entry:
    #dbg_value(ptr %x, !54, !DIExpression(), !63)
    #dbg_value(ptr %y, !55, !DIExpression(), !63)
    #dbg_value(i64 %d, !56, !DIExpression(), !63)
    #dbg_value(float 0.000000e+00, !58, !DIExpression(), !63)
    #dbg_value(i64 0, !57, !DIExpression(), !63)
  %cmp8.not = icmp eq i64 %d, 0, !dbg !64
  br i1 %cmp8.not, label %for.end, label %iter.check, !dbg !65

iter.check:                                       ; preds = %entry
  %min.iters.check = icmp ult i64 %d, 4, !dbg !66
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check, !dbg !66

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check11 = icmp ult i64 %d, 32, !dbg !66
  br i1 %min.iters.check11, label %vec.epilog.ph, label %vector.ph, !dbg !66

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.mod.vf = and i64 %d, 28
  %n.vec = and i64 %d, -32
  br label %vector.body, !dbg !66

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !67
  %vec.phi = phi <4 x float> [ <float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %vector.ph ], [ %32, %vector.body ]
  %vec.phi12 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %33, %vector.body ]
  %vec.phi13 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %34, %vector.body ]
  %vec.phi14 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %35, %vector.body ]
  %vec.phi15 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %36, %vector.body ]
  %vec.phi16 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %37, %vector.body ]
  %vec.phi17 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %38, %vector.body ]
  %vec.phi18 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %39, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index, !dbg !68
  %1 = getelementptr inbounds nuw i8, ptr %0, i64 16, !dbg !68
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 32, !dbg !68
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 48, !dbg !68
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 64, !dbg !68
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 80, !dbg !68
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 96, !dbg !68
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 112, !dbg !68
  %wide.load = load <4 x float>, ptr %0, align 4, !dbg !68, !tbaa !36
  %wide.load19 = load <4 x float>, ptr %1, align 4, !dbg !68, !tbaa !36
  %wide.load20 = load <4 x float>, ptr %2, align 4, !dbg !68, !tbaa !36
  %wide.load21 = load <4 x float>, ptr %3, align 4, !dbg !68, !tbaa !36
  %wide.load22 = load <4 x float>, ptr %4, align 4, !dbg !68, !tbaa !36
  %wide.load23 = load <4 x float>, ptr %5, align 4, !dbg !68, !tbaa !36
  %wide.load24 = load <4 x float>, ptr %6, align 4, !dbg !68, !tbaa !36
  %wide.load25 = load <4 x float>, ptr %7, align 4, !dbg !68, !tbaa !36
  %8 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index, !dbg !68
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 16, !dbg !68
  %10 = getelementptr inbounds nuw i8, ptr %8, i64 32, !dbg !68
  %11 = getelementptr inbounds nuw i8, ptr %8, i64 48, !dbg !68
  %12 = getelementptr inbounds nuw i8, ptr %8, i64 64, !dbg !68
  %13 = getelementptr inbounds nuw i8, ptr %8, i64 80, !dbg !68
  %14 = getelementptr inbounds nuw i8, ptr %8, i64 96, !dbg !68
  %15 = getelementptr inbounds nuw i8, ptr %8, i64 112, !dbg !68
  %wide.load26 = load <4 x float>, ptr %8, align 4, !dbg !68, !tbaa !36
  %wide.load27 = load <4 x float>, ptr %9, align 4, !dbg !68, !tbaa !36
  %wide.load28 = load <4 x float>, ptr %10, align 4, !dbg !68, !tbaa !36
  %wide.load29 = load <4 x float>, ptr %11, align 4, !dbg !68, !tbaa !36
  %wide.load30 = load <4 x float>, ptr %12, align 4, !dbg !68, !tbaa !36
  %wide.load31 = load <4 x float>, ptr %13, align 4, !dbg !68, !tbaa !36
  %wide.load32 = load <4 x float>, ptr %14, align 4, !dbg !68, !tbaa !36
  %wide.load33 = load <4 x float>, ptr %15, align 4, !dbg !68, !tbaa !36
  %16 = fsub reassoc contract <4 x float> %wide.load, %wide.load26, !dbg !69
  %17 = fsub reassoc contract <4 x float> %wide.load19, %wide.load27, !dbg !69
  %18 = fsub reassoc contract <4 x float> %wide.load20, %wide.load28, !dbg !69
  %19 = fsub reassoc contract <4 x float> %wide.load21, %wide.load29, !dbg !69
  %20 = fsub reassoc contract <4 x float> %wide.load22, %wide.load30, !dbg !69
  %21 = fsub reassoc contract <4 x float> %wide.load23, %wide.load31, !dbg !69
  %22 = fsub reassoc contract <4 x float> %wide.load24, %wide.load32, !dbg !69
  %23 = fsub reassoc contract <4 x float> %wide.load25, %wide.load33, !dbg !69
  %24 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %16), !dbg !70
  %25 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %17), !dbg !70
  %26 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %18), !dbg !70
  %27 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %19), !dbg !70
  %28 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %20), !dbg !70
  %29 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %21), !dbg !70
  %30 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %22), !dbg !70
  %31 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %23), !dbg !70
  %32 = fadd reassoc contract <4 x float> %vec.phi, %24, !dbg !71
  %33 = fadd reassoc contract <4 x float> %vec.phi12, %25, !dbg !71
  %34 = fadd reassoc contract <4 x float> %vec.phi13, %26, !dbg !71
  %35 = fadd reassoc contract <4 x float> %vec.phi14, %27, !dbg !71
  %36 = fadd reassoc contract <4 x float> %vec.phi15, %28, !dbg !71
  %37 = fadd reassoc contract <4 x float> %vec.phi16, %29, !dbg !71
  %38 = fadd reassoc contract <4 x float> %vec.phi17, %30, !dbg !71
  %39 = fadd reassoc contract <4 x float> %vec.phi18, %31, !dbg !71
  %index.next = add nuw i64 %index, 32, !dbg !67
  %40 = icmp eq i64 %index.next, %n.vec, !dbg !72
  br i1 %40, label %middle.block, label %vector.body, !dbg !72, !llvm.loop !73

middle.block:                                     ; preds = %vector.body
  %bin.rdx = fadd reassoc contract <4 x float> %33, %32, !dbg !72
  %bin.rdx34 = fadd reassoc contract <4 x float> %34, %bin.rdx, !dbg !72
  %bin.rdx35 = fadd reassoc contract <4 x float> %35, %bin.rdx34, !dbg !72
  %bin.rdx36 = fadd reassoc contract <4 x float> %36, %bin.rdx35, !dbg !72
  %bin.rdx37 = fadd reassoc contract <4 x float> %37, %bin.rdx36, !dbg !72
  %bin.rdx38 = fadd reassoc contract <4 x float> %38, %bin.rdx37, !dbg !72
  %bin.rdx39 = fadd reassoc contract <4 x float> %39, %bin.rdx38, !dbg !72
  %41 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %bin.rdx39), !dbg !72
  %cmp.n = icmp eq i64 %d, %n.vec, !dbg !72
  br i1 %cmp.n, label %for.end, label %vec.epilog.iter.check, !dbg !72

vec.epilog.iter.check:                            ; preds = %middle.block
  %min.epilog.iters.check = icmp eq i64 %n.mod.vf, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph, !prof !46

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %bc.merge.rdx = phi float [ %41, %vec.epilog.iter.check ], [ 0.000000e+00, %vector.main.loop.iter.check ]
  %n.vec41 = and i64 %d, -4
  %42 = insertelement <4 x float> <float poison, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, float %bc.merge.rdx, i64 0
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index42 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next46, %vec.epilog.vector.body ], !dbg !67
  %vec.phi43 = phi <4 x float> [ %42, %vec.epilog.ph ], [ %47, %vec.epilog.vector.body ]
  %43 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index42, !dbg !68
  %wide.load44 = load <4 x float>, ptr %43, align 4, !dbg !68, !tbaa !36
  %44 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index42, !dbg !68
  %wide.load45 = load <4 x float>, ptr %44, align 4, !dbg !68, !tbaa !36
  %45 = fsub reassoc contract <4 x float> %wide.load44, %wide.load45, !dbg !69
  %46 = tail call <4 x float> @llvm.fabs.v4f32(<4 x float> %45), !dbg !70
  %47 = fadd reassoc contract <4 x float> %vec.phi43, %46, !dbg !71
  %index.next46 = add nuw i64 %index42, 4, !dbg !67
  %48 = icmp eq i64 %index.next46, %n.vec41, !dbg !72
  br i1 %48, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !dbg !72, !llvm.loop !74

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %49 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %47), !dbg !72
  %cmp.n47 = icmp eq i64 %d, %n.vec41, !dbg !72
  br i1 %cmp.n47, label %for.end, label %for.body.preheader, !dbg !72

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %i.010.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec41, %vec.epilog.middle.block ]
  %res.09.ph = phi float [ 0.000000e+00, %iter.check ], [ %41, %vec.epilog.iter.check ], [ %49, %vec.epilog.middle.block ]
  br label %for.body, !dbg !72

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.010 = phi i64 [ %inc, %for.body ], [ %i.010.ph, %for.body.preheader ]
  %res.09 = phi float [ %conv3, %for.body ], [ %res.09.ph, %for.body.preheader ]
    #dbg_value(i64 %i.010, !57, !DIExpression(), !63)
    #dbg_value(float %res.09, !58, !DIExpression(), !63)
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.010, !dbg !68
  %50 = load float, ptr %arrayidx, align 4, !dbg !68, !tbaa !36
  %arrayidx1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.010, !dbg !68
  %51 = load float, ptr %arrayidx1, align 4, !dbg !68, !tbaa !36
  %sub = fsub reassoc contract float %50, %51, !dbg !69
    #dbg_value(float %sub, !59, !DIExpression(), !75)
  %52 = tail call float @llvm.fabs.f32(float %sub), !dbg !70
  %conv3 = fadd reassoc contract float %res.09, %52, !dbg !71
    #dbg_value(float %conv3, !58, !DIExpression(), !63)
  %inc = add nuw i64 %i.010, 1, !dbg !67
    #dbg_value(i64 %inc, !57, !DIExpression(), !63)
  %exitcond.not = icmp eq i64 %inc, %d, !dbg !76
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !72, !llvm.loop !77

for.end:                                          ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  %res.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %49, %vec.epilog.middle.block ], [ %41, %middle.block ], [ %conv3, %for.body ], !dbg !63
  ret float %res.0.lcssa, !dbg !78
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read)
define float @fvec_inner_product_ref(ptr noundef readonly captures(none) %x, ptr noundef readonly captures(none) %y, i64 noundef %d) local_unnamed_addr #0 !dbg !79 {
entry:
    #dbg_value(ptr %x, !81, !DIExpression(), !86)
    #dbg_value(ptr %y, !82, !DIExpression(), !86)
    #dbg_value(i64 %d, !83, !DIExpression(), !86)
    #dbg_value(float 0.000000e+00, !85, !DIExpression(), !86)
    #dbg_value(i64 0, !84, !DIExpression(), !86)
  %cmp6.not = icmp eq i64 %d, 0, !dbg !87
  br i1 %cmp6.not, label %for.end, label %iter.check, !dbg !90

iter.check:                                       ; preds = %entry
  %min.iters.check = icmp ult i64 %d, 4, !dbg !91
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check, !dbg !91

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check9 = icmp ult i64 %d, 32, !dbg !91
  br i1 %min.iters.check9, label %vec.epilog.ph, label %vector.ph, !dbg !91

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.mod.vf = and i64 %d, 28
  %n.vec = and i64 %d, -32
  br label %vector.body, !dbg !91

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !92
  %vec.phi = phi <4 x float> [ <float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %vector.ph ], [ %24, %vector.body ]
  %vec.phi10 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %25, %vector.body ]
  %vec.phi11 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %26, %vector.body ]
  %vec.phi12 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %27, %vector.body ]
  %vec.phi13 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %28, %vector.body ]
  %vec.phi14 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %29, %vector.body ]
  %vec.phi15 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %30, %vector.body ]
  %vec.phi16 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %31, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index, !dbg !93
  %1 = getelementptr inbounds nuw i8, ptr %0, i64 16, !dbg !93
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 32, !dbg !93
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 48, !dbg !93
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 64, !dbg !93
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 80, !dbg !93
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 96, !dbg !93
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 112, !dbg !93
  %wide.load = load <4 x float>, ptr %0, align 4, !dbg !93, !tbaa !36
  %wide.load17 = load <4 x float>, ptr %1, align 4, !dbg !93, !tbaa !36
  %wide.load18 = load <4 x float>, ptr %2, align 4, !dbg !93, !tbaa !36
  %wide.load19 = load <4 x float>, ptr %3, align 4, !dbg !93, !tbaa !36
  %wide.load20 = load <4 x float>, ptr %4, align 4, !dbg !93, !tbaa !36
  %wide.load21 = load <4 x float>, ptr %5, align 4, !dbg !93, !tbaa !36
  %wide.load22 = load <4 x float>, ptr %6, align 4, !dbg !93, !tbaa !36
  %wide.load23 = load <4 x float>, ptr %7, align 4, !dbg !93, !tbaa !36
  %8 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index, !dbg !93
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 16, !dbg !93
  %10 = getelementptr inbounds nuw i8, ptr %8, i64 32, !dbg !93
  %11 = getelementptr inbounds nuw i8, ptr %8, i64 48, !dbg !93
  %12 = getelementptr inbounds nuw i8, ptr %8, i64 64, !dbg !93
  %13 = getelementptr inbounds nuw i8, ptr %8, i64 80, !dbg !93
  %14 = getelementptr inbounds nuw i8, ptr %8, i64 96, !dbg !93
  %15 = getelementptr inbounds nuw i8, ptr %8, i64 112, !dbg !93
  %wide.load24 = load <4 x float>, ptr %8, align 4, !dbg !93, !tbaa !36
  %wide.load25 = load <4 x float>, ptr %9, align 4, !dbg !93, !tbaa !36
  %wide.load26 = load <4 x float>, ptr %10, align 4, !dbg !93, !tbaa !36
  %wide.load27 = load <4 x float>, ptr %11, align 4, !dbg !93, !tbaa !36
  %wide.load28 = load <4 x float>, ptr %12, align 4, !dbg !93, !tbaa !36
  %wide.load29 = load <4 x float>, ptr %13, align 4, !dbg !93, !tbaa !36
  %wide.load30 = load <4 x float>, ptr %14, align 4, !dbg !93, !tbaa !36
  %wide.load31 = load <4 x float>, ptr %15, align 4, !dbg !93, !tbaa !36
  %16 = fmul reassoc contract <4 x float> %wide.load, %wide.load24, !dbg !93
  %17 = fmul reassoc contract <4 x float> %wide.load17, %wide.load25, !dbg !93
  %18 = fmul reassoc contract <4 x float> %wide.load18, %wide.load26, !dbg !93
  %19 = fmul reassoc contract <4 x float> %wide.load19, %wide.load27, !dbg !93
  %20 = fmul reassoc contract <4 x float> %wide.load20, %wide.load28, !dbg !93
  %21 = fmul reassoc contract <4 x float> %wide.load21, %wide.load29, !dbg !93
  %22 = fmul reassoc contract <4 x float> %wide.load22, %wide.load30, !dbg !93
  %23 = fmul reassoc contract <4 x float> %wide.load23, %wide.load31, !dbg !93
  %24 = fadd reassoc contract <4 x float> %vec.phi, %16, !dbg !95
  %25 = fadd reassoc contract <4 x float> %vec.phi10, %17, !dbg !95
  %26 = fadd reassoc contract <4 x float> %vec.phi11, %18, !dbg !95
  %27 = fadd reassoc contract <4 x float> %vec.phi12, %19, !dbg !95
  %28 = fadd reassoc contract <4 x float> %vec.phi13, %20, !dbg !95
  %29 = fadd reassoc contract <4 x float> %vec.phi14, %21, !dbg !95
  %30 = fadd reassoc contract <4 x float> %vec.phi15, %22, !dbg !95
  %31 = fadd reassoc contract <4 x float> %vec.phi16, %23, !dbg !95
  %index.next = add nuw i64 %index, 32, !dbg !92
  %32 = icmp eq i64 %index.next, %n.vec, !dbg !96
  br i1 %32, label %middle.block, label %vector.body, !dbg !96, !llvm.loop !97

middle.block:                                     ; preds = %vector.body
  %bin.rdx = fadd reassoc contract <4 x float> %25, %24, !dbg !96
  %bin.rdx32 = fadd reassoc contract <4 x float> %26, %bin.rdx, !dbg !96
  %bin.rdx33 = fadd reassoc contract <4 x float> %27, %bin.rdx32, !dbg !96
  %bin.rdx34 = fadd reassoc contract <4 x float> %28, %bin.rdx33, !dbg !96
  %bin.rdx35 = fadd reassoc contract <4 x float> %29, %bin.rdx34, !dbg !96
  %bin.rdx36 = fadd reassoc contract <4 x float> %30, %bin.rdx35, !dbg !96
  %bin.rdx37 = fadd reassoc contract <4 x float> %31, %bin.rdx36, !dbg !96
  %33 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %bin.rdx37), !dbg !96
  %cmp.n = icmp eq i64 %d, %n.vec, !dbg !96
  br i1 %cmp.n, label %for.end, label %vec.epilog.iter.check, !dbg !96

vec.epilog.iter.check:                            ; preds = %middle.block
  %min.epilog.iters.check = icmp eq i64 %n.mod.vf, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph, !prof !46

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %bc.merge.rdx = phi float [ %33, %vec.epilog.iter.check ], [ 0.000000e+00, %vector.main.loop.iter.check ]
  %n.vec39 = and i64 %d, -4
  %34 = insertelement <4 x float> <float poison, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, float %bc.merge.rdx, i64 0
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index40 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next44, %vec.epilog.vector.body ], !dbg !92
  %vec.phi41 = phi <4 x float> [ %34, %vec.epilog.ph ], [ %38, %vec.epilog.vector.body ]
  %35 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index40, !dbg !93
  %wide.load42 = load <4 x float>, ptr %35, align 4, !dbg !93, !tbaa !36
  %36 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index40, !dbg !93
  %wide.load43 = load <4 x float>, ptr %36, align 4, !dbg !93, !tbaa !36
  %37 = fmul reassoc contract <4 x float> %wide.load42, %wide.load43, !dbg !93
  %38 = fadd reassoc contract <4 x float> %vec.phi41, %37, !dbg !95
  %index.next44 = add nuw i64 %index40, 4, !dbg !92
  %39 = icmp eq i64 %index.next44, %n.vec39, !dbg !96
  br i1 %39, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !dbg !96, !llvm.loop !98

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %40 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %38), !dbg !96
  %cmp.n45 = icmp eq i64 %d, %n.vec39, !dbg !96
  br i1 %cmp.n45, label %for.end, label %for.body.preheader, !dbg !96

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %res.08.ph = phi float [ 0.000000e+00, %iter.check ], [ %33, %vec.epilog.iter.check ], [ %40, %vec.epilog.middle.block ]
  %i.07.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec39, %vec.epilog.middle.block ]
  br label %for.body, !dbg !96

for.body:                                         ; preds = %for.body.preheader, %for.body
  %res.08 = phi float [ %add, %for.body ], [ %res.08.ph, %for.body.preheader ]
  %i.07 = phi i64 [ %inc, %for.body ], [ %i.07.ph, %for.body.preheader ]
    #dbg_value(float %res.08, !85, !DIExpression(), !86)
    #dbg_value(i64 %i.07, !84, !DIExpression(), !86)
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.07, !dbg !93
  %41 = load float, ptr %arrayidx, align 4, !dbg !93, !tbaa !36
  %arrayidx1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.07, !dbg !93
  %42 = load float, ptr %arrayidx1, align 4, !dbg !93, !tbaa !36
  %mul = fmul reassoc contract float %41, %42, !dbg !93
  %add = fadd reassoc contract float %res.08, %mul, !dbg !95
    #dbg_value(float %add, !85, !DIExpression(), !86)
  %inc = add nuw i64 %i.07, 1, !dbg !92
    #dbg_value(i64 %inc, !84, !DIExpression(), !86)
  %exitcond.not = icmp eq i64 %inc, %d, !dbg !99
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !96, !llvm.loop !100

for.end:                                          ; preds = %for.body, %middle.block, %vec.epilog.middle.block, %entry
  %res.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %40, %vec.epilog.middle.block ], [ %33, %middle.block ], [ %add, %for.body ], !dbg !86
  ret float %res.0.lcssa, !dbg !101
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read, errnomem: write)
define float @cosine_distance_ref(ptr noundef readonly captures(none) %x, ptr noundef readonly captures(none) %y, i64 noundef %d) local_unnamed_addr #1 !dbg !102 {
entry:
    #dbg_value(ptr %x, !104, !DIExpression(), !113)
    #dbg_value(ptr %y, !105, !DIExpression(), !113)
    #dbg_value(i64 %d, !106, !DIExpression(), !113)
    #dbg_value(float 0.000000e+00, !107, !DIExpression(), !113)
    #dbg_value(float 0.000000e+00, !108, !DIExpression(), !113)
    #dbg_value(float 0.000000e+00, !109, !DIExpression(), !113)
    #dbg_value(float 0.000000e+00, !110, !DIExpression(), !113)
    #dbg_value(i64 0, !111, !DIExpression(), !114)
  %cmp27.not = icmp eq i64 %d, 0, !dbg !115
  br i1 %cmp27.not, label %for.cond.cleanup, label %iter.check, !dbg !117

iter.check:                                       ; preds = %entry
  %min.iters.check = icmp ult i64 %d, 4, !dbg !118
  br i1 %min.iters.check, label %for.body.preheader, label %vector.main.loop.iter.check, !dbg !118

vector.main.loop.iter.check:                      ; preds = %iter.check
  %min.iters.check34 = icmp ult i64 %d, 32, !dbg !118
  br i1 %min.iters.check34, label %vec.epilog.ph, label %vector.ph, !dbg !118

vector.ph:                                        ; preds = %vector.main.loop.iter.check
  %n.mod.vf = and i64 %d, 28
  %n.vec = and i64 %d, -32
  br label %vector.body, !dbg !118

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !119
  %vec.phi = phi <4 x float> [ <float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %vector.ph ], [ %56, %vector.body ]
  %vec.phi35 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %57, %vector.body ]
  %vec.phi36 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %58, %vector.body ]
  %vec.phi37 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %59, %vector.body ]
  %vec.phi38 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %60, %vector.body ]
  %vec.phi39 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %61, %vector.body ]
  %vec.phi40 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %62, %vector.body ]
  %vec.phi41 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %63, %vector.body ]
  %vec.phi42 = phi <4 x float> [ <float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %vector.ph ], [ %40, %vector.body ]
  %vec.phi43 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %41, %vector.body ]
  %vec.phi44 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %42, %vector.body ]
  %vec.phi45 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %43, %vector.body ]
  %vec.phi46 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %44, %vector.body ]
  %vec.phi47 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %45, %vector.body ]
  %vec.phi48 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %46, %vector.body ]
  %vec.phi49 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %47, %vector.body ]
  %vec.phi50 = phi <4 x float> [ <float 0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %vector.ph ], [ %24, %vector.body ]
  %vec.phi51 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %25, %vector.body ]
  %vec.phi52 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %26, %vector.body ]
  %vec.phi53 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %27, %vector.body ]
  %vec.phi54 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %28, %vector.body ]
  %vec.phi55 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %29, %vector.body ]
  %vec.phi56 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %30, %vector.body ]
  %vec.phi57 = phi <4 x float> [ splat (float -0.000000e+00), %vector.ph ], [ %31, %vector.body ]
  %0 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index, !dbg !120
  %1 = getelementptr inbounds nuw i8, ptr %0, i64 16, !dbg !120
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 32, !dbg !120
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 48, !dbg !120
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 64, !dbg !120
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 80, !dbg !120
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 96, !dbg !120
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 112, !dbg !120
  %wide.load = load <4 x float>, ptr %0, align 4, !dbg !120, !tbaa !36
  %wide.load58 = load <4 x float>, ptr %1, align 4, !dbg !120, !tbaa !36
  %wide.load59 = load <4 x float>, ptr %2, align 4, !dbg !120, !tbaa !36
  %wide.load60 = load <4 x float>, ptr %3, align 4, !dbg !120, !tbaa !36
  %wide.load61 = load <4 x float>, ptr %4, align 4, !dbg !120, !tbaa !36
  %wide.load62 = load <4 x float>, ptr %5, align 4, !dbg !120, !tbaa !36
  %wide.load63 = load <4 x float>, ptr %6, align 4, !dbg !120, !tbaa !36
  %wide.load64 = load <4 x float>, ptr %7, align 4, !dbg !120, !tbaa !36
  %8 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index, !dbg !120
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 16, !dbg !120
  %10 = getelementptr inbounds nuw i8, ptr %8, i64 32, !dbg !120
  %11 = getelementptr inbounds nuw i8, ptr %8, i64 48, !dbg !120
  %12 = getelementptr inbounds nuw i8, ptr %8, i64 64, !dbg !120
  %13 = getelementptr inbounds nuw i8, ptr %8, i64 80, !dbg !120
  %14 = getelementptr inbounds nuw i8, ptr %8, i64 96, !dbg !120
  %15 = getelementptr inbounds nuw i8, ptr %8, i64 112, !dbg !120
  %wide.load65 = load <4 x float>, ptr %8, align 4, !dbg !120, !tbaa !36
  %wide.load66 = load <4 x float>, ptr %9, align 4, !dbg !120, !tbaa !36
  %wide.load67 = load <4 x float>, ptr %10, align 4, !dbg !120, !tbaa !36
  %wide.load68 = load <4 x float>, ptr %11, align 4, !dbg !120, !tbaa !36
  %wide.load69 = load <4 x float>, ptr %12, align 4, !dbg !120, !tbaa !36
  %wide.load70 = load <4 x float>, ptr %13, align 4, !dbg !120, !tbaa !36
  %wide.load71 = load <4 x float>, ptr %14, align 4, !dbg !120, !tbaa !36
  %wide.load72 = load <4 x float>, ptr %15, align 4, !dbg !120, !tbaa !36
  %16 = fmul reassoc contract <4 x float> %wide.load, %wide.load65, !dbg !120
  %17 = fmul reassoc contract <4 x float> %wide.load58, %wide.load66, !dbg !120
  %18 = fmul reassoc contract <4 x float> %wide.load59, %wide.load67, !dbg !120
  %19 = fmul reassoc contract <4 x float> %wide.load60, %wide.load68, !dbg !120
  %20 = fmul reassoc contract <4 x float> %wide.load61, %wide.load69, !dbg !120
  %21 = fmul reassoc contract <4 x float> %wide.load62, %wide.load70, !dbg !120
  %22 = fmul reassoc contract <4 x float> %wide.load63, %wide.load71, !dbg !120
  %23 = fmul reassoc contract <4 x float> %wide.load64, %wide.load72, !dbg !120
  %24 = fadd reassoc contract <4 x float> %vec.phi50, %16, !dbg !122
  %25 = fadd reassoc contract <4 x float> %vec.phi51, %17, !dbg !122
  %26 = fadd reassoc contract <4 x float> %vec.phi52, %18, !dbg !122
  %27 = fadd reassoc contract <4 x float> %vec.phi53, %19, !dbg !122
  %28 = fadd reassoc contract <4 x float> %vec.phi54, %20, !dbg !122
  %29 = fadd reassoc contract <4 x float> %vec.phi55, %21, !dbg !122
  %30 = fadd reassoc contract <4 x float> %vec.phi56, %22, !dbg !122
  %31 = fadd reassoc contract <4 x float> %vec.phi57, %23, !dbg !122
  %32 = fmul reassoc contract <4 x float> %wide.load, %wide.load, !dbg !123
  %33 = fmul reassoc contract <4 x float> %wide.load58, %wide.load58, !dbg !123
  %34 = fmul reassoc contract <4 x float> %wide.load59, %wide.load59, !dbg !123
  %35 = fmul reassoc contract <4 x float> %wide.load60, %wide.load60, !dbg !123
  %36 = fmul reassoc contract <4 x float> %wide.load61, %wide.load61, !dbg !123
  %37 = fmul reassoc contract <4 x float> %wide.load62, %wide.load62, !dbg !123
  %38 = fmul reassoc contract <4 x float> %wide.load63, %wide.load63, !dbg !123
  %39 = fmul reassoc contract <4 x float> %wide.load64, %wide.load64, !dbg !123
  %40 = fadd reassoc contract <4 x float> %vec.phi42, %32, !dbg !124
  %41 = fadd reassoc contract <4 x float> %vec.phi43, %33, !dbg !124
  %42 = fadd reassoc contract <4 x float> %vec.phi44, %34, !dbg !124
  %43 = fadd reassoc contract <4 x float> %vec.phi45, %35, !dbg !124
  %44 = fadd reassoc contract <4 x float> %vec.phi46, %36, !dbg !124
  %45 = fadd reassoc contract <4 x float> %vec.phi47, %37, !dbg !124
  %46 = fadd reassoc contract <4 x float> %vec.phi48, %38, !dbg !124
  %47 = fadd reassoc contract <4 x float> %vec.phi49, %39, !dbg !124
  %48 = fmul reassoc contract <4 x float> %wide.load65, %wide.load65, !dbg !125
  %49 = fmul reassoc contract <4 x float> %wide.load66, %wide.load66, !dbg !125
  %50 = fmul reassoc contract <4 x float> %wide.load67, %wide.load67, !dbg !125
  %51 = fmul reassoc contract <4 x float> %wide.load68, %wide.load68, !dbg !125
  %52 = fmul reassoc contract <4 x float> %wide.load69, %wide.load69, !dbg !125
  %53 = fmul reassoc contract <4 x float> %wide.load70, %wide.load70, !dbg !125
  %54 = fmul reassoc contract <4 x float> %wide.load71, %wide.load71, !dbg !125
  %55 = fmul reassoc contract <4 x float> %wide.load72, %wide.load72, !dbg !125
  %56 = fadd reassoc contract <4 x float> %vec.phi, %48, !dbg !126
  %57 = fadd reassoc contract <4 x float> %vec.phi35, %49, !dbg !126
  %58 = fadd reassoc contract <4 x float> %vec.phi36, %50, !dbg !126
  %59 = fadd reassoc contract <4 x float> %vec.phi37, %51, !dbg !126
  %60 = fadd reassoc contract <4 x float> %vec.phi38, %52, !dbg !126
  %61 = fadd reassoc contract <4 x float> %vec.phi39, %53, !dbg !126
  %62 = fadd reassoc contract <4 x float> %vec.phi40, %54, !dbg !126
  %63 = fadd reassoc contract <4 x float> %vec.phi41, %55, !dbg !126
  %index.next = add nuw i64 %index, 32, !dbg !119
  %64 = icmp eq i64 %index.next, %n.vec, !dbg !127
  br i1 %64, label %middle.block, label %vector.body, !dbg !127, !llvm.loop !128

middle.block:                                     ; preds = %vector.body
  %bin.rdx = fadd reassoc contract <4 x float> %57, %56, !dbg !127
  %bin.rdx73 = fadd reassoc contract <4 x float> %58, %bin.rdx, !dbg !127
  %bin.rdx74 = fadd reassoc contract <4 x float> %59, %bin.rdx73, !dbg !127
  %bin.rdx75 = fadd reassoc contract <4 x float> %60, %bin.rdx74, !dbg !127
  %bin.rdx76 = fadd reassoc contract <4 x float> %61, %bin.rdx75, !dbg !127
  %bin.rdx77 = fadd reassoc contract <4 x float> %62, %bin.rdx76, !dbg !127
  %bin.rdx78 = fadd reassoc contract <4 x float> %63, %bin.rdx77, !dbg !127
  %65 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %bin.rdx78), !dbg !127
  %bin.rdx79 = fadd reassoc contract <4 x float> %41, %40, !dbg !127
  %bin.rdx80 = fadd reassoc contract <4 x float> %42, %bin.rdx79, !dbg !127
  %bin.rdx81 = fadd reassoc contract <4 x float> %43, %bin.rdx80, !dbg !127
  %bin.rdx82 = fadd reassoc contract <4 x float> %44, %bin.rdx81, !dbg !127
  %bin.rdx83 = fadd reassoc contract <4 x float> %45, %bin.rdx82, !dbg !127
  %bin.rdx84 = fadd reassoc contract <4 x float> %46, %bin.rdx83, !dbg !127
  %bin.rdx85 = fadd reassoc contract <4 x float> %47, %bin.rdx84, !dbg !127
  %66 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %bin.rdx85), !dbg !127
  %bin.rdx86 = fadd reassoc contract <4 x float> %25, %24, !dbg !127
  %bin.rdx87 = fadd reassoc contract <4 x float> %26, %bin.rdx86, !dbg !127
  %bin.rdx88 = fadd reassoc contract <4 x float> %27, %bin.rdx87, !dbg !127
  %bin.rdx89 = fadd reassoc contract <4 x float> %28, %bin.rdx88, !dbg !127
  %bin.rdx90 = fadd reassoc contract <4 x float> %29, %bin.rdx89, !dbg !127
  %bin.rdx91 = fadd reassoc contract <4 x float> %30, %bin.rdx90, !dbg !127
  %bin.rdx92 = fadd reassoc contract <4 x float> %31, %bin.rdx91, !dbg !127
  %67 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %bin.rdx92), !dbg !127
  %cmp.n = icmp eq i64 %d, %n.vec, !dbg !127
  br i1 %cmp.n, label %for.cond.cleanup.loopexit, label %vec.epilog.iter.check, !dbg !127

vec.epilog.iter.check:                            ; preds = %middle.block
  %min.epilog.iters.check = icmp eq i64 %n.mod.vf, 0
  br i1 %min.epilog.iters.check, label %for.body.preheader, label %vec.epilog.ph, !prof !46

vec.epilog.ph:                                    ; preds = %vector.main.loop.iter.check, %vec.epilog.iter.check
  %vec.epilog.resume.val = phi i64 [ %n.vec, %vec.epilog.iter.check ], [ 0, %vector.main.loop.iter.check ]
  %bc.merge.rdx = phi float [ %65, %vec.epilog.iter.check ], [ 0.000000e+00, %vector.main.loop.iter.check ]
  %bc.merge.rdx93 = phi float [ %66, %vec.epilog.iter.check ], [ 0.000000e+00, %vector.main.loop.iter.check ]
  %bc.merge.rdx94 = phi float [ %67, %vec.epilog.iter.check ], [ 0.000000e+00, %vector.main.loop.iter.check ]
  %n.vec96 = and i64 %d, -4
  %68 = insertelement <4 x float> <float poison, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, float %bc.merge.rdx, i64 0
  %69 = insertelement <4 x float> <float poison, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, float %bc.merge.rdx93, i64 0
  %70 = insertelement <4 x float> <float poison, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, float %bc.merge.rdx94, i64 0
  br label %vec.epilog.vector.body

vec.epilog.vector.body:                           ; preds = %vec.epilog.vector.body, %vec.epilog.ph
  %index97 = phi i64 [ %vec.epilog.resume.val, %vec.epilog.ph ], [ %index.next103, %vec.epilog.vector.body ], !dbg !119
  %vec.phi98 = phi <4 x float> [ %68, %vec.epilog.ph ], [ %78, %vec.epilog.vector.body ]
  %vec.phi99 = phi <4 x float> [ %69, %vec.epilog.ph ], [ %76, %vec.epilog.vector.body ]
  %vec.phi100 = phi <4 x float> [ %70, %vec.epilog.ph ], [ %74, %vec.epilog.vector.body ]
  %71 = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %index97, !dbg !120
  %wide.load101 = load <4 x float>, ptr %71, align 4, !dbg !120, !tbaa !36
  %72 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %index97, !dbg !120
  %wide.load102 = load <4 x float>, ptr %72, align 4, !dbg !120, !tbaa !36
  %73 = fmul reassoc contract <4 x float> %wide.load101, %wide.load102, !dbg !120
  %74 = fadd reassoc contract <4 x float> %vec.phi100, %73, !dbg !122
  %75 = fmul reassoc contract <4 x float> %wide.load101, %wide.load101, !dbg !123
  %76 = fadd reassoc contract <4 x float> %vec.phi99, %75, !dbg !124
  %77 = fmul reassoc contract <4 x float> %wide.load102, %wide.load102, !dbg !125
  %78 = fadd reassoc contract <4 x float> %vec.phi98, %77, !dbg !126
  %index.next103 = add nuw i64 %index97, 4, !dbg !119
  %79 = icmp eq i64 %index.next103, %n.vec96, !dbg !127
  br i1 %79, label %vec.epilog.middle.block, label %vec.epilog.vector.body, !dbg !127, !llvm.loop !129

vec.epilog.middle.block:                          ; preds = %vec.epilog.vector.body
  %80 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %78), !dbg !127
  %81 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %76), !dbg !127
  %82 = tail call reassoc contract float @llvm.vector.reduce.fadd.v4f32(float -0.000000e+00, <4 x float> %74), !dbg !127
  %cmp.n104 = icmp eq i64 %d, %n.vec96, !dbg !127
  br i1 %cmp.n104, label %for.cond.cleanup.loopexit, label %for.body.preheader, !dbg !127

for.body.preheader:                               ; preds = %iter.check, %vec.epilog.iter.check, %vec.epilog.middle.block
  %i.031.ph = phi i64 [ 0, %iter.check ], [ %n.vec, %vec.epilog.iter.check ], [ %n.vec96, %vec.epilog.middle.block ]
  %mag_vy.030.ph = phi float [ 0.000000e+00, %iter.check ], [ %65, %vec.epilog.iter.check ], [ %80, %vec.epilog.middle.block ]
  %mag_vx.029.ph = phi float [ 0.000000e+00, %iter.check ], [ %66, %vec.epilog.iter.check ], [ %81, %vec.epilog.middle.block ]
  %dotpdt.028.ph = phi float [ 0.000000e+00, %iter.check ], [ %67, %vec.epilog.iter.check ], [ %82, %vec.epilog.middle.block ]
  br label %for.body, !dbg !127

for.cond.cleanup.loopexit:                        ; preds = %for.body, %vec.epilog.middle.block, %middle.block
  %add.lcssa = phi float [ %82, %vec.epilog.middle.block ], [ %67, %middle.block ], [ %add, %for.body ], !dbg !122
  %add5.lcssa = phi float [ %81, %vec.epilog.middle.block ], [ %66, %middle.block ], [ %add5, %for.body ], !dbg !124
  %add9.lcssa = phi float [ %80, %vec.epilog.middle.block ], [ %65, %middle.block ], [ %add9, %for.body ], !dbg !126
  %83 = fpext reassoc contract float %add.lcssa to double, !dbg !130
  %84 = fmul reassoc contract float %add5.lcssa, %add9.lcssa, !dbg !130
  %85 = fpext reassoc contract float %84 to double, !dbg !130
  br label %for.cond.cleanup, !dbg !130

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %dotpdt.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %83, %for.cond.cleanup.loopexit ], !dbg !113
  %mul10 = phi double [ 0.000000e+00, %entry ], [ %85, %for.cond.cleanup.loopexit ], !dbg !130
  %call = tail call reassoc contract double @sqrt(double noundef %mul10) #4, !dbg !130, !tbaa !7
  %div = fdiv reassoc contract double %dotpdt.0.lcssa, %call, !dbg !130
  %sub = fsub reassoc contract double 1.000000e+00, %div, !dbg !131
  %conv12 = fptrunc reassoc contract double %sub to float, !dbg !132
    #dbg_value(float %conv12, !107, !DIExpression(), !113)
  ret float %conv12, !dbg !133

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.031 = phi i64 [ %inc, %for.body ], [ %i.031.ph, %for.body.preheader ]
  %mag_vy.030 = phi float [ %add9, %for.body ], [ %mag_vy.030.ph, %for.body.preheader ]
  %mag_vx.029 = phi float [ %add5, %for.body ], [ %mag_vx.029.ph, %for.body.preheader ]
  %dotpdt.028 = phi float [ %add, %for.body ], [ %dotpdt.028.ph, %for.body.preheader ]
    #dbg_value(i64 %i.031, !111, !DIExpression(), !114)
    #dbg_value(float %mag_vy.030, !110, !DIExpression(), !113)
    #dbg_value(float %mag_vx.029, !109, !DIExpression(), !113)
    #dbg_value(float %dotpdt.028, !108, !DIExpression(), !113)
  %arrayidx = getelementptr inbounds nuw [4 x i8], ptr %x, i64 %i.031, !dbg !120
  %86 = load float, ptr %arrayidx, align 4, !dbg !120, !tbaa !36
  %arrayidx1 = getelementptr inbounds nuw [4 x i8], ptr %y, i64 %i.031, !dbg !120
  %87 = load float, ptr %arrayidx1, align 4, !dbg !120, !tbaa !36
  %mul = fmul reassoc contract float %86, %87, !dbg !120
  %add = fadd reassoc contract float %dotpdt.028, %mul, !dbg !122
    #dbg_value(float %add, !108, !DIExpression(), !113)
  %mul4 = fmul reassoc contract float %86, %86, !dbg !123
  %add5 = fadd reassoc contract float %mag_vx.029, %mul4, !dbg !124
    #dbg_value(float %add5, !109, !DIExpression(), !113)
  %mul8 = fmul reassoc contract float %87, %87, !dbg !125
  %add9 = fadd reassoc contract float %mag_vy.030, %mul8, !dbg !126
    #dbg_value(float %add9, !110, !DIExpression(), !113)
  %inc = add nuw i64 %i.031, 1, !dbg !119
    #dbg_value(i64 %inc, !111, !DIExpression(), !114)
  %exitcond.not = icmp eq i64 %inc, %d, !dbg !134
  br i1 %exitcond.not, label %for.cond.cleanup.loopexit, label %for.body, !dbg !127, !llvm.loop !135
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(errnomem: write)
declare double @sqrt(double noundef) local_unnamed_addr #2

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.vector.reduce.fadd.v4f32(float, <4 x float>) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fabs.v4f32(<4 x float>) #3

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pwr7" "target-features"="+64bit-support,+allow-unaligned-fp-access,+altivec,+bpermd,+cmpb,+extdiv,+fcpsgn,+fpcvt,+fprnd,+fpu,+fre,+fres,+frsqrte,+frsqrtes,+fsqrt,+hard-float,+isa-v206-instructions,+isel,+ldbrx,+lfiwax,+mfocrf,+modern-aix-as,+popcntd,+recipprec,+stfiwx,+two-const-nr,+vsx" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: read, errnomem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pwr7" "target-features"="+64bit-support,+allow-unaligned-fp-access,+altivec,+bpermd,+cmpb,+extdiv,+fcpsgn,+fpcvt,+fprnd,+fpu,+fre,+fres,+frsqrte,+frsqrtes,+fsqrt,+hard-float,+isa-v206-instructions,+isel,+ldbrx,+lfiwax,+mfocrf,+modern-aix-as,+popcntd,+recipprec,+stfiwx,+two-const-nr,+vsx" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(errnomem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="pwr7" "target-features"="+64bit-support,+allow-unaligned-fp-access,+altivec,+bpermd,+cmpb,+extdiv,+fcpsgn,+fpcvt,+fprnd,+fpu,+fre,+fres,+frsqrte,+frsqrtes,+fsqrt,+hard-float,+isa-v206-instructions,+isel,+ldbrx,+lfiwax,+mfocrf,+modern-aix-as,+popcntd,+recipprec,+stfiwx,+two-const-nr,+vsx" }
attributes #3 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5}
!llvm.ident = !{!6}
!llvm.errno.tbaa = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "IBM Open XL C/C++ for AIX 17.1.5 (5725-C72, 5765-J18), version 17.1.5.0, clang version 23.0.0git (ssh://git@github.ibm.com:22/compiler/llvm-project.git 7913f6f24d01489cf96d2e3ed4b0b03036d0f4f8)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "custom.c", directory: "/home/curtisd/pragma_test/annoy/customlib")
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
!24 = !DILocalVariable(name: "i", scope: !11, file: !1, line: 8, type: !17)
!25 = !DILocalVariable(name: "res", scope: !11, file: !1, line: 9, type: !14)
!26 = !DILocalVariable(name: "tmp", scope: !27, file: !1, line: 11, type: !16)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 10)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 10)
!29 = distinct !DILexicalBlock(scope: !11, file: !1, line: 10)
!30 = !DILocation(line: 0, scope: !11)
!31 = !DILocation(line: 10, scope: !28, atomGroup: 16, atomRank: 1)
!32 = !DILocation(line: 10, scope: !29, atomGroup: 17, atomRank: 1)
!33 = !DILocation(line: 10, scope: !29)
!34 = !DILocation(line: 10, scope: !28, atomGroup: 7, atomRank: 2)
!35 = !DILocation(line: 11, scope: !27)
!36 = !{!37, !37, i64 0}
!37 = !{!"float", !9, i64 0}
!38 = !DILocation(line: 11, scope: !27, atomGroup: 5, atomRank: 2)
!39 = !DILocation(line: 12, scope: !27)
!40 = !DILocation(line: 12, scope: !27, atomGroup: 6, atomRank: 2)
!41 = !DILocation(line: 10, scope: !29, atomGroup: 4, atomRank: 1)
!42 = distinct !{!42, !43, !44, !45}
!43 = !{!"llvm.loop.mustprogress"}
!44 = !{!"llvm.loop.isvectorized", i32 1}
!45 = !{!"llvm.loop.unroll.runtime.disable"}
!46 = !{!"branch_weights", i32 4, i32 28}
!47 = distinct !{!47, !43, !44, !45}
!48 = !DILocation(line: 0, scope: !27)
!49 = !DILocation(line: 10, scope: !28, atomGroup: 3, atomRank: 1)
!50 = distinct !{!50, !43, !45, !44}
!51 = !DILocation(line: 14, scope: !11, atomGroup: 10, atomRank: 1)
!52 = distinct !DISubprogram(name: "fvec_L1_ref", scope: !1, file: !1, line: 17, type: !12, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !53, keyInstructions: true)
!53 = !{!54, !55, !56, !57, !58, !59}
!54 = !DILocalVariable(name: "x", arg: 1, scope: !52, file: !1, line: 17, type: !15)
!55 = !DILocalVariable(name: "y", arg: 2, scope: !52, file: !1, line: 17, type: !15)
!56 = !DILocalVariable(name: "d", arg: 3, scope: !52, file: !1, line: 17, type: !17)
!57 = !DILocalVariable(name: "i", scope: !52, file: !1, line: 21, type: !17)
!58 = !DILocalVariable(name: "res", scope: !52, file: !1, line: 22, type: !14)
!59 = !DILocalVariable(name: "tmp", scope: !60, file: !1, line: 24, type: !16)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 23)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 23)
!62 = distinct !DILexicalBlock(scope: !52, file: !1, line: 23)
!63 = !DILocation(line: 0, scope: !52)
!64 = !DILocation(line: 23, scope: !61, atomGroup: 18, atomRank: 1)
!65 = !DILocation(line: 23, scope: !62, atomGroup: 19, atomRank: 1)
!66 = !DILocation(line: 23, scope: !62)
!67 = !DILocation(line: 23, scope: !61, atomGroup: 7, atomRank: 2)
!68 = !DILocation(line: 24, scope: !60)
!69 = !DILocation(line: 24, scope: !60, atomGroup: 5, atomRank: 2)
!70 = !DILocation(line: 25, scope: !60)
!71 = !DILocation(line: 25, scope: !60, atomGroup: 6, atomRank: 2)
!72 = !DILocation(line: 23, scope: !62, atomGroup: 4, atomRank: 1)
!73 = distinct !{!73, !43, !44, !45}
!74 = distinct !{!74, !43, !44, !45}
!75 = !DILocation(line: 0, scope: !60)
!76 = !DILocation(line: 23, scope: !61, atomGroup: 3, atomRank: 1)
!77 = distinct !{!77, !43, !45, !44}
!78 = !DILocation(line: 27, scope: !52, atomGroup: 10, atomRank: 1)
!79 = distinct !DISubprogram(name: "fvec_inner_product_ref", scope: !1, file: !1, line: 30, type: !12, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !80, keyInstructions: true)
!80 = !{!81, !82, !83, !84, !85}
!81 = !DILocalVariable(name: "x", arg: 1, scope: !79, file: !1, line: 30, type: !15)
!82 = !DILocalVariable(name: "y", arg: 2, scope: !79, file: !1, line: 30, type: !15)
!83 = !DILocalVariable(name: "d", arg: 3, scope: !79, file: !1, line: 30, type: !17)
!84 = !DILocalVariable(name: "i", scope: !79, file: !1, line: 34, type: !17)
!85 = !DILocalVariable(name: "res", scope: !79, file: !1, line: 35, type: !14)
!86 = !DILocation(line: 0, scope: !79)
!87 = !DILocation(line: 36, scope: !88, atomGroup: 20, atomRank: 1)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 36)
!89 = distinct !DILexicalBlock(scope: !79, file: !1, line: 36)
!90 = !DILocation(line: 36, scope: !89, atomGroup: 21, atomRank: 1)
!91 = !DILocation(line: 36, scope: !89)
!92 = !DILocation(line: 36, scope: !88, atomGroup: 6, atomRank: 2)
!93 = !DILocation(line: 37, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !1, line: 36)
!95 = !DILocation(line: 37, scope: !94, atomGroup: 5, atomRank: 2)
!96 = !DILocation(line: 36, scope: !89, atomGroup: 4, atomRank: 1)
!97 = distinct !{!97, !43, !44, !45}
!98 = distinct !{!98, !43, !44, !45}
!99 = !DILocation(line: 36, scope: !88, atomGroup: 3, atomRank: 1)
!100 = distinct !{!100, !43, !45, !44}
!101 = !DILocation(line: 39, scope: !79, atomGroup: 9, atomRank: 1)
!102 = distinct !DISubprogram(name: "cosine_distance_ref", scope: !1, file: !1, line: 43, type: !12, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !103, keyInstructions: true)
!103 = !{!104, !105, !106, !107, !108, !109, !110, !111}
!104 = !DILocalVariable(name: "x", arg: 1, scope: !102, file: !1, line: 43, type: !15)
!105 = !DILocalVariable(name: "y", arg: 2, scope: !102, file: !1, line: 43, type: !15)
!106 = !DILocalVariable(name: "d", arg: 3, scope: !102, file: !1, line: 43, type: !17)
!107 = !DILocalVariable(name: "res", scope: !102, file: !1, line: 48, type: !14)
!108 = !DILocalVariable(name: "dotpdt", scope: !102, file: !1, line: 48, type: !14)
!109 = !DILocalVariable(name: "mag_vx", scope: !102, file: !1, line: 48, type: !14)
!110 = !DILocalVariable(name: "mag_vy", scope: !102, file: !1, line: 48, type: !14)
!111 = !DILocalVariable(name: "i", scope: !112, file: !1, line: 49, type: !17)
!112 = distinct !DILexicalBlock(scope: !102, file: !1, line: 49)
!113 = !DILocation(line: 0, scope: !102)
!114 = !DILocation(line: 0, scope: !112)
!115 = !DILocation(line: 49, scope: !116, atomGroup: 22, atomRank: 1)
!116 = distinct !DILexicalBlock(scope: !112, file: !1, line: 49)
!117 = !DILocation(line: 49, scope: !112, atomGroup: 23, atomRank: 1)
!118 = !DILocation(line: 49, scope: !112)
!119 = !DILocation(line: 49, scope: !116, atomGroup: 11, atomRank: 2)
!120 = !DILocation(line: 51, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !1, line: 50)
!122 = !DILocation(line: 51, scope: !121, atomGroup: 8, atomRank: 2)
!123 = !DILocation(line: 52, scope: !121)
!124 = !DILocation(line: 52, scope: !121, atomGroup: 9, atomRank: 2)
!125 = !DILocation(line: 53, scope: !121)
!126 = !DILocation(line: 53, scope: !121, atomGroup: 10, atomRank: 2)
!127 = !DILocation(line: 49, scope: !112, atomGroup: 7, atomRank: 1)
!128 = distinct !{!128, !43, !44, !45}
!129 = distinct !{!129, !43, !44, !45}
!130 = !DILocation(line: 55, scope: !102)
!131 = !DILocation(line: 55, scope: !102, atomGroup: 13, atomRank: 3)
!132 = !DILocation(line: 55, scope: !102, atomGroup: 13, atomRank: 2)
!133 = !DILocation(line: 56, scope: !102, atomGroup: 15, atomRank: 1)
!134 = !DILocation(line: 49, scope: !116, atomGroup: 6, atomRank: 1)
!135 = distinct !{!135, !43, !45, !44}
