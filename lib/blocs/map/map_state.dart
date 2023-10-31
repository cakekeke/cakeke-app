import 'package:equatable/equatable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';

class MapState extends Equatable {
  const MapState(
      {this.location,
      this.mapController,
      this.searchText = '',
      this.selectedPage = 0});

  final Location? location;
  final NaverMapController? mapController;
  final String searchText;
  final int selectedPage;

  MapState copyWith(
      {Location? location,
      NaverMapController? mapController,
      String? searchText,
      int? selectedPage}) {
    return MapState(
      location: location ?? this.location,
      mapController: mapController ?? this.mapController,
      searchText: searchText ?? this.searchText,
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }

  @override
  List<Object?> get props => [
        location,
        mapController,
        searchText,
        selectedPage,
      ];
}
