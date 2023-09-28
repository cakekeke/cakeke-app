import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

final class AppStarted extends AuthEvent {
  const AppStarted();

  @override
  List<Object> get props => [];
}

final class AuthEventSignin extends AuthEvent {
  const AuthEventSignin({
    required this.id,
    required this.password,
  });

  final String id;
  final String password;

  @override
  List<Object> get props => [id, password];
}

final class AuthEventSignout extends AuthEvent {
  const AuthEventSignout();

  @override
  List<Object> get props => [];
}

final class AuthEventSignup extends AuthEvent {
  const AuthEventSignup({
    required this.id,
    required this.password,
    required this.birth,
    required this.gener,
    required this.purpose,
    required this.profileId,
  });

  final String id;
  final String password;
  final String birth;
  final String gener;
  final String purpose;
  final int profileId;

  @override
  List<Object> get props => [id, password, birth, gener, purpose, profileId];
}
