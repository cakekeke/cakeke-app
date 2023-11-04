import 'package:cakeke/blocs/map/map_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';

import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState(location: Location())) {
    on<SetMapControllerEvent>(_handleSetMapControllerEvent);
    on<SetCurrentLocationEvent>(_handleSetCurrentLocationEvent);
    on<SearchTextChangedEvent>(_handleSearchTextChangedEvent);
    on<SetMakerEvent>(_handleSetMakerEvent);
    on<OnMapCameraChangedEvent>(_handleOnMapCameraChangedEvent);
    on<SearchTextEvent>(_handleSearchTextEvent);
    on<MapPageChanged>(_handleMapPageChangedEvent);
  }

  void _handleSetMapControllerEvent(
    SetMapControllerEvent event,
    Emitter<MapState> emit,
  ) {
    emit(
        state.copyWith(mapController: event.mapController, setMakerFlag: true));
  }

  Future<void> _handleSetMakerEvent(
    SetMakerEvent event,
    Emitter<MapState> emit,
  ) async {
    if (event.stores != null) {
      const makerIcon = NOverlayImage.fromAssetImage(
          'assets/images/icon_map_maker_unselect.png');

      final makerList = <NAddableOverlay>{};
      for (final store in event.stores!) {
        final maker = NMarker(
            id: store.name,
            position: NLatLng(
                double.parse(store.latitude), double.parse(store.longitude)),
            icon: makerIcon)
          ..setOnTapListener((NMarker marker) => _handleSelectStoreMakerEvent(
              SelectStoreMakerEvent(maker: marker)));
        makerList.add(maker);
      }

      await state.mapController?.addOverlayAll(makerList);
    }
    emit(state.copyWith(setMakerFlag: false));
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

  Future<void> _handleOnMapCameraChangedEvent(
    OnMapCameraChangedEvent event,
    Emitter<MapState> emit,
  ) async {
    final nowPosition =
        await state.mapController?.getCameraPosition().then((p) => p.target);
    emit(state.copyWith());
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

  void _handleSearchTextEvent(
    SearchTextEvent event,
    Emitter<MapState> emit,
  ) {
    final searchText = event.searchText ?? state.searchText;

    // API 진행 후 결과 emit
    // emit(state.copyWith();
  }

  void _handleMapPageChangedEvent(
    MapPageChanged event,
    Emitter<MapState> emit,
  ) {
    final nextPage = event.selectedPage ?? state.selectedPage;
    emit(state.copyWith(
      selectedPage: nextPage,
    ));
  }
}
