import 'package:cakeke/blocs/map/map_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';

import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState(location: Location())) {
    on<SetMapControllerEvent>(_handleSetMapControllerEvent);
    on<SetCurrentLocationEvent>(_handleSetCurrentLocationEvent);
    on<SetLocationEvent>(_handleSetLocationEvent);
    on<SearchTextChangedEvent>(_handleSearchTextChangedEvent);
    on<SetMakerEvent>(_handleSetMakerEvent);
    on<UpdateMapStoreEvent>(_handleUpdateMapStoreEvent);
    on<OnMapCameraChangedEvent>(_handleOnMapCameraChangedEvent);
    on<MapPageChanged>(_handleMapPageChangedEvent);
  }

  bool isMapPageListChanged = false;

  void _handleSetMapControllerEvent(
    SetMapControllerEvent event,
    Emitter<MapState> emit,
  ) {
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
      for (final store in event.stores!) {
        final maker = NMarker(
            id: store.id.toString(),
            position: NLatLng(
                double.parse(store.latitude), double.parse(store.longitude)),
            icon: makerIcon)
          ..setOnTapListener((NMarker marker) => _handleSelectStoreMakerEvent(
              SelectStoreMakerEvent(maker: marker)));
        overlayList.add(maker);
        makerList.add(maker);
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

  void _handleSelectStoreMakerEvent(
    SelectStoreMakerEvent event,
  ) {
    const unSelectMaker = NOverlayImage.fromAssetImage(
        'assets/images/icon_map_maker_unselect.png');
    const selectMaker =
        NOverlayImage.fromAssetImage('assets/images/icon_map_maker_select.png');

    state.selectMaker?.setIcon(unSelectMaker);
    event.maker.setIcon(selectMaker);
    emit(state.copyWith(selectMaker: event.maker));
  }

  void _handleSearchTextChangedEvent(
    SearchTextChangedEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(searchText: event.searchText));
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
