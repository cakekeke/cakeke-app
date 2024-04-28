import 'package:cakeke/blocs/home/home_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitialEvent extends HomeEvent {
  const HomeInitialEvent();

  @override
  List<Object> get props => [];
}

class HomePageChanged extends HomeEvent {
  const HomePageChanged({
    required this.selectedPage,
  });

  final int selectedPage;

  @override
  List<Object> get props => [selectedPage];
}

class HomeStoreListFetch extends HomeEvent {
  const HomeStoreListFetch({
    required this.type,
  });

  final HomeStoreListType type;

  @override
  List<Object> get props => [type];
}

class HomeRegionStoreRankingFetch extends HomeEvent {
  const HomeRegionStoreRankingFetch(
      {required this.city, required this.district});

  final String city;
  final String district;

  @override
  List<Object> get props => [city, district];
}
