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

class AddStickerEvent extends CustomEvent {
  const AddStickerEvent({required this.asset});

  final String asset;

  @override
  List<Object?> get props => [asset];
}

class DeleteStickerEvent extends CustomEvent {
  const DeleteStickerEvent({required this.asset});

  final String asset;

  @override
  List<Object?> get props => [asset];
}
