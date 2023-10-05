import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CustomEvent extends Equatable {
  const CustomEvent();
}

class InitImagesEvent extends CustomEvent {
  const InitImagesEvent();

  @override
  List<Object?> get props => [];
}

class SetBackgroundEvent extends CustomEvent {
  const SetBackgroundEvent({required this.selectBackground});

  final String selectBackground;

  @override
  List<Object?> get props => [selectBackground];
}
