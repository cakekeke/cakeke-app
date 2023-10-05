import 'dart:convert';

import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';

class CustomBloc extends Bloc<CustomEvent, CustomState> {
  CustomBloc()
      : super(CustomState(
            controller: LindiController(
          borderColor: DesignSystem.colors.appPrimary,
          iconColor: DesignSystem.colors.white,
          showDone: true,
          showClose: true,
          shouldScale: true,
          shouldRotate: true,
          shouldMove: true,
          minScale: 0.5,
          maxScale: 4,
        ))) {
    on<InitImagesEvent>(_handleInitImagesEvent);
    on<SetBackgroundEvent>(_handleSetBackgroundEvent);
  }

  Future<void> _handleInitImagesEvent(
    InitImagesEvent event,
    Emitter<CustomState> emit,
  ) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final stickerPaths = manifestMap.keys
        .where((String key) => key.contains('images/sticker'))
        .toList();

    final backgroundPaths = manifestMap.keys
        .where((String key) => key.contains('images/background'))
        .toList();

    final candleImages =
        stickerPaths.where((element) => element.contains('candle_')).toList();
    final creamImages =
        stickerPaths.where((element) => element.contains('cream_')).toList();
    final fruitImages =
        stickerPaths.where((element) => element.contains('fruit_')).toList();
    final stickerImages =
        stickerPaths.where((element) => element.contains('sticker_')).toList();
    stickerImages.sort((b, a) => a.compareTo(b));

    final newImagesMap = {
      "candle": candleImages,
      "cream": creamImages,
      "fruit": fruitImages,
      "sticker": stickerImages,
    };
    emit(state.copyWith(sticker: newImagesMap, background: backgroundPaths));
  }

  void _handleSetBackgroundEvent(
    SetBackgroundEvent event,
    Emitter<CustomState> emit,
  ) {
    emit(state.copyWith(selectBackground: event.selectBackground));
  }
}
