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

final class AuthEventWithdrawal extends AuthEvent {
  const AuthEventWithdrawal();

  @override
  List<Object> get props => [];
}
