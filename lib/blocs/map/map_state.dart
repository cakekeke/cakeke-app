import 'package:equatable/equatable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';

class MapState extends Equatable {
  const MapState({
    this.location,
    this.mapController,
    this.searchText = '',
  });

  final Location? location;
  final NaverMapController? mapController;
  final String searchText;

  MapState copyWith({
    Location? location,
    NaverMapController? mapController,
    String? searchText,
  }) {
    return MapState(
      location: location ?? this.location,
      mapController: mapController ?? this.mapController,
      searchText: searchText ?? this.searchText,
    );
  }

  @override
  List<Object?> get props => [
        location,
        mapController,
        searchText,
      ];
}
