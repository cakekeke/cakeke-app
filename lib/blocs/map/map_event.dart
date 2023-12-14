import 'package:cakeke/data/models/common/store.dart';
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

class CompleteSetMapControllerEvent extends MapEvent {
  const CompleteSetMapControllerEvent();

  @override
  List<Object?> get props => [];
}

class UpdateMapStoreEvent extends MapEvent {
  const UpdateMapStoreEvent();

  @override
  List<Object?> get props => [];
}

class SetCurrentLocationEvent extends MapEvent {
  const SetCurrentLocationEvent();

  @override
  List<Object?> get props => [];
}

class SetLocationEvent extends MapEvent {
  const SetLocationEvent({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [latitude, longitude];
}

class OnMapCameraChangedEvent extends MapEvent {
  const OnMapCameraChangedEvent();

  @override
  List<Object?> get props => [];
}

class SetMakerEvent extends MapEvent {
  const SetMakerEvent({
    required this.context,
    required this.stores,
  });

  final BuildContext context;
  final List<Store>? stores;

  @override
  List<Object?> get props => [context, stores];
}

class SelectStoreMakerEvent extends MapEvent {
  const SelectStoreMakerEvent({required this.maker, required this.index});

  final NMarker maker;
  final int index;

  @override
  List<Object?> get props => [maker, index];
}

class SearchTextChangedEvent extends MapEvent {
  const SearchTextChangedEvent({
    required this.searchText,
  });

  final String searchText;

  @override
  List<Object?> get props => [searchText];
}

class MapPageChanged extends MapEvent {
  const MapPageChanged({
    required this.selectedPage,
    this.isListChanged = false,
  });

  final int selectedPage;
  final bool isListChanged;

  @override
  List<Object> get props => [selectedPage, isListChanged];
}
