import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';

class CustomState extends Equatable {
  const CustomState({
    required this.controller,
    required this.textController,
    this.sticker = const {},
    this.customList = const [],
    this.background = const [],
    this.photoPath = '',
    this.selectBackground =
        'assets/images/background/background_version1_white.png',
  });

  final LindiController controller;
  final TextEditingController textController;
  final Map<String, List<String>> sticker;
  final List<String> customList;
  final List<String> background;
  final String photoPath;
  final String selectBackground;

  CustomState copyWith(
      {LindiController? controller,
      TextEditingController? textController,
      Map<String, List<String>>? sticker,
      List<String>? background,
      List<String>? customList,
      String? photoPath,
      String? selectBackground}) {
    return CustomState(
      controller: controller ?? this.controller,
      textController: textController ?? this.textController,
      sticker: sticker ?? this.sticker,
      customList: customList ?? this.customList,
      photoPath: photoPath ?? this.photoPath,
      background: background ?? this.background,
      selectBackground: selectBackground ?? this.selectBackground,
    );
  }

  @override
  List<Object?> get props => [
        controller,
        textController,
        sticker,
        customList,
        photoPath,
        background,
        selectBackground
      ];
}
