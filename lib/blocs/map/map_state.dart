import 'package:equatable/equatable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';

class MapState extends Equatable {
  const MapState({
    this.location,
    this.mapController,
    this.makerList,
    this.selectMaker,
    this.searchText = '',
    this.selectedPage = 0,
    this.setMakerFlag = false,
  });

  final Location? location;
  final NaverMapController? mapController;
  final List<NMarker>? makerList;
  final NMarker? selectMaker;
  final String searchText;
  final int selectedPage;
  final bool setMakerFlag;

  MapState copyWith({
    Location? location,
    NaverMapController? mapController,
    List<NMarker>? makerList,
    NMarker? selectMaker,
    String? searchText,
    int? selectedPage,
    bool? setMakerFlag,
  }) {
    return MapState(
      location: location ?? this.location,
      mapController: mapController ?? this.mapController,
      makerList: makerList ?? this.makerList,
      selectMaker: selectMaker ?? this.selectMaker,
      searchText: searchText ?? this.searchText,
      selectedPage: selectedPage ?? this.selectedPage,
      setMakerFlag: setMakerFlag ?? this.setMakerFlag,
    );
  }

  @override
  List<Object?> get props => [
        location,
        mapController,
        makerList,
        selectMaker,
        searchText,
        selectedPage,
        setMakerFlag
      ];
}
