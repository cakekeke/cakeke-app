import 'dart:convert';

import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
    on<AddCustomEvent>(_handleAddCustomEvent);
    on<DeleteCustomEvent>(_handleDeleteCustomEvent);
    on<AddPhotoEvent>(_handleAddPhotoEvent);
    on<DeletePhotoEvent>(_handleDeletePhotoEvent);
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

  void _handleAddCustomEvent(
    AddCustomEvent event,
    Emitter<CustomState> emit,
  ) {
    if (event.widget != null) {
      state.controller.addWidget(event.widget!);
    } else {
      state.controller.addWidget(
        Image.asset(event.asset),
      );
    }

    final newCustomList = [...state.customList, event.asset];
    emit(state.copyWith(
        controller: state.controller, customList: newCustomList));
  }

  void _handleDeleteCustomEvent(
    DeleteCustomEvent event,
    Emitter<CustomState> emit,
  ) {
    final deleteIndex = state.customList.indexOf(event.asset);
    state.controller.widgets.removeAt(deleteIndex);
    state.controller.notifyListeners();

    final newCustomList = [...state.customList];
    newCustomList.removeAt(deleteIndex);

    emit(state.copyWith(
        controller: state.controller, customList: newCustomList));
  }

  Future<void> _handleAddPhotoEvent(
    AddPhotoEvent event,
    Emitter<CustomState> emit,
  ) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _handleAddCustomEvent(
          AddCustomEvent(asset: pickedImage.path, widget: null), emit);

      emit(state.copyWith(
        photoPath: pickedImage.path,
      ));
    }
  }

  void _handleDeletePhotoEvent(
    DeletePhotoEvent event,
    Emitter<CustomState> emit,
  ) {
    _handleDeleteCustomEvent(DeleteCustomEvent(asset: event.path), emit);

    emit(state.copyWith(photoPath: ''));
  }
}
