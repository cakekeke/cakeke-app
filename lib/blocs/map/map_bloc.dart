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
    on<SearchTextEvent>(_handleSearchTextEvent);
  }

  void _handleSetMapControllerEvent(
    SetMapControllerEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(mapController: event.mapController));
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
}
