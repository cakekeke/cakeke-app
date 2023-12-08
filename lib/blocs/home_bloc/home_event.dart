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
