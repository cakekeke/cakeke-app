import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';

class CustomState extends Equatable {
  const CustomState({
    required this.controller,
    required this.textController,
    this.sticker = const {},
    this.tutorialKeys = const [],
    this.customList = const [],
    this.background = const [],
    this.photoPath = '',
    this.selectBackground =
        'assets/images/background/background_version1_white.png',
    this.selectTextColor = Colors.white,
    this.isTutorialProgress = true,
  });

  final LindiController controller;
  final TextEditingController textController;
  final Map<String, List<String>> sticker;
  final List<GlobalKey> tutorialKeys;
  final List<String> customList;
  final List<String> background;

  final String photoPath;
  final String selectBackground;
  final Color selectTextColor;

  final bool isTutorialProgress;

  CustomState copyWith({
    LindiController? controller,
    TextEditingController? textController,
    Map<String, List<String>>? sticker,
    List<GlobalKey>? tutorialKeys,
    List<String>? background,
    List<String>? customList,
    String? photoPath,
    Color? selectTextColor,
    String? selectBackground,
    bool? isTutorialProgress,
  }) {
    return CustomState(
      controller: controller ?? this.controller,
      textController: textController ?? this.textController,
      tutorialKeys: tutorialKeys ?? this.tutorialKeys,
      sticker: sticker ?? this.sticker,
      customList: customList ?? this.customList,
      photoPath: photoPath ?? this.photoPath,
      background: background ?? this.background,
      selectTextColor: selectTextColor ?? this.selectTextColor,
      selectBackground: selectBackground ?? this.selectBackground,
      isTutorialProgress: isTutorialProgress ?? this.isTutorialProgress,
    );
  }

  @override
  List<Object?> get props => [
        controller,
        textController,
        tutorialKeys,
        sticker,
        customList,
        photoPath,
        background,
        selectTextColor,
        selectBackground,
        isTutorialProgress
      ];
}
