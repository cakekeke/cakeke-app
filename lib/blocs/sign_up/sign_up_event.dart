import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class ButtonPressedEvent extends SignUpEvent {
  const ButtonPressedEvent();

  @override
  List<Object?> get props => [];
}

class ButtonTapEvent extends SignUpEvent {
  const ButtonTapEvent({
    required this.isLastSignLevel,
  });

  final bool isLastSignLevel;

  @override
  List<Object?> get props => [isLastSignLevel];
}

class IdChangedEvent extends SignUpEvent {
  const IdChangedEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

class IdDuplicationCheck extends SignUpEvent {
  const IdDuplicationCheck();

  @override
  List<Object> get props => [];
}

class PasswordChangedEvent extends SignUpEvent {
  const PasswordChangedEvent({
    required this.password,
    required this.index,
  });

  final String password;
  final int index;

  @override
  List<Object> get props => [password, index];
}

class RePasswordChangedEvent extends SignUpEvent {
  const RePasswordChangedEvent({
    required this.rePassword,
    required this.index,
  });

  final String rePassword;
  final int index;

  @override
  List<Object> get props => [rePassword, index];
}

class BirthChangedEvent extends SignUpEvent {
  const BirthChangedEvent({required this.birth});

  final String birth;

  @override
  List<Object> get props => [birth];
}

class GenderChangedEvent extends SignUpEvent {
  const GenderChangedEvent({required this.gender});

  final String gender;

  @override
  List<Object> get props => [gender];
}

class PurposeChangedEvent extends SignUpEvent {
  const PurposeChangedEvent({required this.purpose});

  final String purpose;

  @override
  List<Object> get props => [purpose];
}
