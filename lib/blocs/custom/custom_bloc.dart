import 'dart:convert';

import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';

class CustomBloc extends Bloc<CustomEvent, CustomState> {
  CustomBloc()
      : super(CustomState(
            controller: LindiController(
              borderColor: DesignSystem.colors.appPrimary,
              iconColor: DesignSystem.colors.white,
              showClose: false,
              minScale: 0.5,
              maxScale: 4,
            ),
            textController: TextEditingController())) {
    on<InitImagesEvent>(_handleInitImagesEvent);
    on<SetBackgroundEvent>(_handleSetBackgroundEvent);
    on<AddStickerEvent>(_handleAddStickerEvent);
    on<DeleteStickerEvent>(_handleDeleteStickerEvent);
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

  void _handleAddStickerEvent(
    AddStickerEvent event,
    Emitter<CustomState> emit,
  ) {
    state.controller.addWidget(
      Image.asset(event.asset),
    );
    final newStickerList = [...state.stickerList, event.asset];
    emit(state.copyWith(
        controller: state.controller, stickerList: newStickerList));
  }

  void _handleDeleteStickerEvent(
    DeleteStickerEvent event,
    Emitter<CustomState> emit,
  ) {
    final deleteIndex = state.stickerList.indexOf(event.asset);
    state.controller.widgets.removeAt(deleteIndex);
    state.controller.notifyListeners();

    final newStickerList = [...state.stickerList];
    newStickerList.removeAt(deleteIndex);

    emit(state.copyWith(
        controller: state.controller, stickerList: newStickerList));
  }
}
