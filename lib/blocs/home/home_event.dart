import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SetMapControllerEvent extends HomeEvent {
  const SetMapControllerEvent({
    required this.mapController,
  });

  final NaverMapController mapController;

  @override
  List<Object?> get props => [mapController];
}

class SetCurrentLocationEvent extends HomeEvent {
  const SetCurrentLocationEvent();

  @override
  List<Object?> get props => [];
}

class SearchTextChangedEvent extends HomeEvent {
  const SearchTextChangedEvent({
    required this.searchText,
  });

  final String searchText;

  @override
  List<Object?> get props => [searchText];
}

class SearchTextEvent extends HomeEvent {
  const SearchTextEvent({
    this.searchText,
  });

  final String? searchText;

  @override
  List<Object?> get props => [searchText];
}
