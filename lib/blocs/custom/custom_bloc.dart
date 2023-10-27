import 'dart:convert';
import 'dart:ui';

import 'package:cakeke/blocs/custom/custom_event.dart';
import 'package:cakeke/blocs/custom/custom_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/utils/permission_util.dart';
import 'package:cakeke/utils/utils.dart';
import 'package:cakeke/view/widgets/main/custom/custom_tutorial_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lindi_sticker_widget/lindi_controller.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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
    on<SetTutorialKeysEvent>(_handleSetTutorialKeysEvent);
    on<ShowTutorialEvent>(_handleShowTutorialEvent);
    on<SelectBackgroundEvent>(_handleSelectBackgroundEvent);
    on<SelectTextColorEvent>(_handleSelectTextColorEvent);
    on<AddCustomEvent>(_handleAddCustomEvent);
    on<DeleteCustomEvent>(_handleDeleteCustomEvent);
    on<AddPhotoEvent>(_handleAddPhotoEvent);
    on<DeletePhotoEvent>(_handleDeletePhotoEvent);
    on<CaptureAndSaveEvent>(_handleCaptureAndSaveEvent);
  }

  Future<void> _handleInitImagesEvent(
    InitImagesEvent event,
    Emitter<CustomState> emit,
  ) async {
    PermissionUtil.requestAll();
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

  void _handleSetTutorialKeysEvent(
    SetTutorialKeysEvent event,
    Emitter<CustomState> emit,
  ) {
    emit(state.copyWith(tutorialKeys: event.widgetKeys));
  }

  void _handleShowTutorialEvent(
    ShowTutorialEvent event,
    Emitter<CustomState> emit,
  ) {
    if (state.isTutorialProgress) {
      TutorialCoachMark tutorial = TutorialCoachMark(
        targets: [
          TargetFocus(
              keyTarget: state.tutorialKeys.first,
              shape: ShapeLightFocus.RRect,
              contents: [
                TargetContent(
                    align: ContentAlign.bottom,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const CustomTutorialText(
                            text: "카테고리 별로 원하는 꾸미기 요소를 골라보세요"),
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/icon_custom_tutorial_tab.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ))
              ]),
          TargetFocus(
              keyTarget: state.tutorialKeys.elementAtOrNull(1),
              shape: ShapeLightFocus.Circle,
              contents: [
                TargetContent(
                  align: ContentAlign.bottom,
                  child: const Align(
                      alignment: Alignment.bottomRight,
                      child: CustomTutorialText(
                        text: "이미지를 저장하고\n친구들에게 공유해보세요",
                        align: TextAlign.end,
                      )),
                )
              ]),
          TargetFocus(keyTarget: state.tutorialKeys.last, contents: [
            TargetContent(
              align: ContentAlign.bottom,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: CustomTutorialText(
                    text: "나만의 커스텀이미지를 꾸며보세요",
                    style: DesignSystem.typography.heading3(TextStyle(
                        fontWeight: FontWeight.w700,
                        color: DesignSystem.colors.white)),
                  ),
                ),
              ),
            )
          ]),
        ], // List<TargetFocus>
      );
      tutorial.show(context: event.context);

      emit(state.copyWith(isTutorialProgress: false));
    }
  }

  void _handleSelectBackgroundEvent(
    SelectBackgroundEvent event,
    Emitter<CustomState> emit,
  ) {
    emit(state.copyWith(selectBackground: event.selectBackground));
  }

  void _handleSelectTextColorEvent(
    SelectTextColorEvent event,
    Emitter<CustomState> emit,
  ) {
    emit(state.copyWith(selectTextColor: event.selectTextColor));
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

  Future<void> _handleCaptureAndSaveEvent(
    CaptureAndSaveEvent event,
    Emitter<CustomState> emit,
  ) async {
    if (event.globalKey.currentContext != null) {
      final RenderRepaintBoundary boundary = event.globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;

      final image = await boundary.toImage();
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      final pngBytes = byteData?.buffer.asUint8List();

      if (pngBytes != null) {
        final result =
            await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes));
        if (result != null && result.isNotEmpty) {
          Utils.showSnackBar(event.globalKey.currentContext!, '이미지가 저장되었습니다');
          return;
        }
      }
      Utils.showSnackBar(event.globalKey.currentContext!, '이미지을 실패하였습니다');
    }

    emit(state.copyWith());
  }
}
