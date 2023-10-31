import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

@immutable
abstract class MapEvent extends Equatable {
  const MapEvent();
}

class SetMapControllerEvent extends MapEvent {
  const SetMapControllerEvent({
    required this.mapController,
  });

  final NaverMapController mapController;

  @override
  List<Object?> get props => [mapController];
}

class SetCurrentLocationEvent extends MapEvent {
  const SetCurrentLocationEvent();

  @override
  List<Object?> get props => [];
}

class SearchTextChangedEvent extends MapEvent {
  const SearchTextChangedEvent({
    required this.searchText,
  });

  final String searchText;

  @override
  List<Object?> get props => [searchText];
}

class SearchTextEvent extends MapEvent {
  const SearchTextEvent({
    this.searchText,
  });

  final String? searchText;

  @override
  List<Object?> get props => [searchText];
}

class MapPageChanged extends MapEvent {
  const MapPageChanged({
    required this.selectedPage,
  });

  final int selectedPage;

  @override
  List<Object> get props => [
        selectedPage,
      ];
}
