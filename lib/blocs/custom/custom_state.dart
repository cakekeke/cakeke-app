import 'package:equatable/equatable.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';

class CustomState extends Equatable {
  const CustomState({
    required this.controller,
    this.sticker = const {},
    this.background = const [],
    this.selectBackground =
        'assets/images/background/background_version1_white.png',
  });

  final LindiController controller;
  final Map<String, List<String>> sticker;
  final List<String> background;
  final String selectBackground;

  CustomState copyWith(
      {LindiController? controller,
      Map<String, List<String>>? sticker,
      List<String>? background,
      String? selectBackground}) {
    return CustomState(
      controller: controller ?? this.controller,
      sticker: sticker ?? this.sticker,
      background: background ?? this.background,
      selectBackground: selectBackground ?? this.selectBackground,
    );
  }

  @override
  List<Object?> get props =>
      [controller, sticker, background, selectBackground];
}
