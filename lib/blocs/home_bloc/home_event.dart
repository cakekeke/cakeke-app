import 'package:cakeke/blocs/home_bloc/home_state.dart';
import 'package:cakeke/data/models/common/store.dart';
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
    this.prevPage = 0,
  });

  final int selectedPage;
  final int prevPage;

  @override
  List<Object> get props => [selectedPage, prevPage];
}

class HomeStoreListFetch extends HomeEvent {
  const HomeStoreListFetch({
    required this.type,
    required this.storeList,
  });

  final HomeStoreListType type;
  final List<Store> storeList;

  @override
  List<Object> get props => [type, storeList];
}
