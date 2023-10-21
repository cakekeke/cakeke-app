import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class ButtonPressedEvent extends SignInEvent {
  const ButtonPressedEvent();

  @override
  List<Object?> get props => [];
}
