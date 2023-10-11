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

class AddCustomEvent extends CustomEvent {
  const AddCustomEvent({
    required this.asset,
    required this.widget,
  });

  final String asset;
  final Widget? widget;

  @override
  List<Object?> get props => [asset, widget];
}

class DeleteCustomEvent extends CustomEvent {
  const DeleteCustomEvent({required this.asset});

  final String asset;

  @override
  List<Object?> get props => [asset];
}

class AddTextEvent extends CustomEvent {
  const AddTextEvent({required this.asset});

  final String asset;

  @override
  List<Object?> get props => [asset];
}

class DeleteTextEvent extends CustomEvent {
  const DeleteTextEvent({required this.asset});

  final String asset;

  @override
  List<Object?> get props => [asset];
}

class AddPhotoEvent extends CustomEvent {
  const AddPhotoEvent();

  @override
  List<Object?> get props => [];
}

class DeletePhotoEvent extends CustomEvent {
  const DeletePhotoEvent({required this.path});

  final String path;

  @override
  List<Object?> get props => [path];
}

class CaptureAndSaveEvent extends CustomEvent {
  const CaptureAndSaveEvent({required this.globalKey});

  final GlobalKey globalKey;

  @override
  List<Object?> get props => [globalKey];
}
