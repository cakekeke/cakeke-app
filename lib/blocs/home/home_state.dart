import 'package:equatable/equatable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:location/location.dart';

class HomeState extends Equatable {
  const HomeState({
    this.location,
    this.mapController,
    this.searchText = '',
  });

  final Location? location;
  final NaverMapController? mapController;
  final String searchText;

  HomeState copyWith({
    Location? location,
    NaverMapController? mapController,
    String? searchText,
  }) {
    return HomeState(
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
