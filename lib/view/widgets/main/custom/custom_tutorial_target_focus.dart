import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

TargetFocus customTutorialTargetFocus(GlobalKey? keyTarget,Widget child,{ShapeLightFocus? shape}){
  return TargetFocus(
      keyTarget: keyTarget,
      shape: shape,
      pulseAnimationDuration: const Duration(seconds: 1),
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          child: child,
        )
      ]);
}

