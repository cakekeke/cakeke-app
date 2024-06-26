import 'package:cakeke/blocs/map/map_event.dart';
import 'package:cakeke/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc()
      : super(MapState(
            location: Location(),
            itemScrollController: AutoScrollController(
              axis: Axis.horizontal,
            ))) {
    on<SetMapControllerEvent>(_handleSetMapControllerEvent);
    on<SetCurrentLocationEvent>(_handleSetCurrentLocationEvent);
    on<SetCameraRotationEvent>(_handleSetCameraRotationEvent);
    on<SetLocationEvent>(_handleSetLocationEvent);
    on<SearchTextChangedEvent>(_handleSearchTextChangedEvent);
    on<SetMakerEvent>(_handleSetMakerEvent);
    on<UpdateMapStoreEvent>(_handleUpdateMapStoreEvent);
    on<OnMapCameraChangedEvent>(_handleOnMapCameraChangedEvent);
    on<MapPageChanged>(_handleMapPageChangedEvent);
    on<SelectStoreMakerEvent>(_handleSelectStoreMakerEvent);
    on<ResearchFromMap>(_handleResearchFromMap);
    on<ResearchButtonVisible>(_handleResearchButtonVisible);
  }

  bool isMapPageListChanged = false;

  Future<void> _handleSetMapControllerEvent(
    SetMapControllerEvent event,
    Emitter<MapState> emit,
  ) async {
    emit(
        state.copyWith(mapController: event.mapController, setMakerFlag: true));
  }

  void _handleUpdateMapStoreEvent(
    UpdateMapStoreEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(setMakerFlag: true));
  }

  Future<void> _handleSetMakerEvent(
    SetMakerEvent event,
    Emitter<MapState> emit,
  ) async {
    final makerList = <NMarker>[];
    if (event.stores != null) {
      await state.mapController?.clearOverlays();
      const makerIcon = NOverlayImage.fromAssetImage(
          'assets/images/icon_map_maker_unselect.png');

      final overlayList = <NMarker>{};
      if (event.stores != null) {
        for (int index = 0; index < event.stores!.length; index++) {
          final store = event.stores!.elementAt(index);
          final maker = NMarker(
              id: store.id.toString(),
              position: NLatLng(
                  double.parse(store.latitude), double.parse(store.longitude)),
              icon: makerIcon,
              size: const Size(24, 32))
            ..setOnTapListener((NMarker marker) => _handleSelectStoreMakerEvent(
                SelectStoreMakerEvent(maker: marker, index: index), null));
          overlayList.add(maker);
          makerList.add(maker);
        }
      }

      await state.mapController?.addOverlayAll(overlayList);
    }
    emit(state.copyWith(makerList: makerList, setMakerFlag: false));
  }

  Future<void> _handleSetCurrentLocationEvent(
    SetCurrentLocationEvent event,
    Emitter<MapState> emit,
  ) async {
    try {
      final userLocation = await state.location?.getLocation();

      state.mapController?.updateCamera(NCameraUpdate.withParams(
          target: NLatLng(
        userLocation?.latitude ?? 0,
        userLocation?.longitude ?? 0,
      )));
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> _handleSetCameraRotationEvent(
    SetCameraRotationEvent event,
    Emitter<MapState> emit,
  ) async {
    try {
      state.mapController
          ?.updateCamera(NCameraUpdate.withParams(bearing: 0, tilt: 0));
    } catch (e) {
      print('Error Set Camera Rotation: $e');
    }
  }

  Future<void> _handleSetLocationEvent(
    SetLocationEvent event,
    Emitter<MapState> emit,
  ) async {
    try {
      state.mapController?.updateCamera(NCameraUpdate.withParams(
          target: NLatLng(
        event.latitude,
        event.longitude,
      )));
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  Future<void> _handleOnMapCameraChangedEvent(
    OnMapCameraChangedEvent event,
    Emitter<MapState> emit,
  ) async {
    // 추후 맵 이동 영역에 확인 기준 정한 후 진행 필요
    // emit(state.copyWith(setMakerFlag: true));
  }

  Future<void> _handleSelectStoreMakerEvent(
    SelectStoreMakerEvent event,
    Emitter<MapState>? emit,
  ) async {
    const unSelectMaker = NOverlayImage.fromAssetImage(
        'assets/images/icon_map_maker_unselect.png');
    const selectMaker =
        NOverlayImage.fromAssetImage('assets/images/icon_map_maker_select.png');

    state.selectMaker?.setIcon(unSelectMaker);
    state.selectMaker?.setSize(const Size(24, 32));
    event.maker.setIcon(selectMaker);
    event.maker.setSize(const Size(40, 54));
    Future.delayed(const Duration(milliseconds: 300), () {
      state.itemScrollController
          .scrollToIndex(event.index, preferPosition: AutoScrollPosition.begin);
    });

    this.emit(state.copyWith(
        selectMaker: event.maker, selectStoreIndex: event.index));
  }

  void _handleSearchTextChangedEvent(
    SearchTextChangedEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(searchText: event.searchText));
  }

  Future<void> _handleResearchFromMap(
    ResearchFromMap event,
    Emitter<MapState> emit,
  ) async {
    if (state.mapController != null) {
      final camera = await state.mapController!.getCameraPosition();
      final longitude = camera.target.longitude;
      final latitude = camera.target.latitude;

      event.afterSearch(longitude, latitude);
    }
  }

  Future<void> _handleResearchButtonVisible(
    ResearchButtonVisible event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(
      isMapCameraChanged: event.isVisible,
    ));
  }

  void _handleMapPageChangedEvent(
    MapPageChanged event,
    Emitter<MapState> emit,
  ) {
    final nextPage = event.selectedPage;
    emit(state.copyWith(
      selectedPage: isMapPageListChanged ? 1 : nextPage,
    ));

    isMapPageListChanged = event.isListChanged;
  }
}
