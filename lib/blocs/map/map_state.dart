import 'package:equatable/equatable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MapState extends Equatable {
  const MapState({
    this.location,
    this.mapController,
    required this.itemScrollController,
    this.makerList,
    this.selectMaker,
    this.searchText = '',
    this.selectedPage = 0,
    this.selectStoreIndex = 0,
    this.setMakerFlag = false,
    this.isMapCameraChanged = false,
  });

  final Location? location;
  final NaverMapController? mapController;
  final AutoScrollController itemScrollController;
  final List<NMarker>? makerList;
  final NMarker? selectMaker;
  final String searchText;
  final int selectedPage;
  final int selectStoreIndex;
  final bool setMakerFlag;
  final bool isMapCameraChanged;

  MapState copyWith({
    Location? location,
    NaverMapController? mapController,
    AutoScrollController? itemScrollController,
    List<NMarker>? makerList,
    NMarker? selectMaker,
    String? searchText,
    int? selectedPage,
    int? selectStoreIndex,
    int? displayingStoreIndex,
    bool? setMakerFlag,
    bool? isMapCameraChanged,
  }) {
    return MapState(
      location: location ?? this.location,
      mapController: mapController ?? this.mapController,
      itemScrollController: itemScrollController ?? this.itemScrollController,
      makerList: makerList ?? this.makerList,
      selectMaker: selectMaker ?? this.selectMaker,
      searchText: searchText ?? this.searchText,
      selectedPage: selectedPage ?? this.selectedPage,
      selectStoreIndex: selectStoreIndex ?? this.selectStoreIndex,
      setMakerFlag: setMakerFlag ?? this.setMakerFlag,
      isMapCameraChanged: isMapCameraChanged ?? this.isMapCameraChanged,
    );
  }

  @override
  List<Object?> get props => [
        location,
        mapController,
        itemScrollController,
        makerList,
        selectMaker,
        searchText,
        selectedPage,
        selectStoreIndex,
        setMakerFlag,
        isMapCameraChanged
      ];
}
