import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpProgressEvent extends SignUpEvent {
  const SignUpProgressEvent({required this.context});

  final BuildContext context;

  @override
  List<Object?> get props => [context];
}

class ButtonPressedEvent extends SignUpEvent {
  const ButtonPressedEvent();

  @override
  List<Object?> get props => [];
}

class ButtonTapEvent extends SignUpEvent {
  const ButtonTapEvent({
    required this.context,
    required this.isNextPurposeLevel,
  });

  final BuildContext context;
  final bool isNextPurposeLevel;

  @override
  List<Object?> get props => [context, isNextPurposeLevel];
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
  const IdDuplicationCheck({required this.context});

  final BuildContext context;

  @override
  List<Object> get props => [context];
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

class CheckPasswordChangedEvent extends SignUpEvent {
  const CheckPasswordChangedEvent({
    required this.checkPassword,
    required this.index,
  });

  final String checkPassword;
  final int index;

  @override
  List<Object> get props => [checkPassword, index];
}

class BirthChangedEvent extends SignUpEvent {
  const BirthChangedEvent({required this.birth});

  final String birth;

  @override
  List<Object> get props => [birth];
}

class SexChangedEvent extends SignUpEvent {
  const SexChangedEvent({required this.sex});

  final String sex;

  @override
  List<Object> get props => [sex];
}

class PurposeChangedEvent extends SignUpEvent {
  const PurposeChangedEvent({required this.selectPurpose});

  final String selectPurpose;

  @override
  List<Object> get props => [selectPurpose];
}

class ProfileIdChangedEvent extends SignUpEvent {
  const ProfileIdChangedEvent({required this.profileId});

  final int profileId;

  @override
  List<Object> get props => [profileId];
}
