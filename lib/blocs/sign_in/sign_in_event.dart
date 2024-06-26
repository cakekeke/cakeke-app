import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class IdChangedEvent extends SignInEvent {
  const IdChangedEvent({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

class PasswordChangedEvent extends SignInEvent {
  const PasswordChangedEvent({
    required this.password,
  });

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginEvent extends SignInEvent {
  const LoginEvent({
    required this.id,
    required this.password,
  });

  final String id;
  final String password;

  @override
  List<Object> get props => [id, password];
}

class LoginSucessEvent extends SignInEvent {
  const LoginSucessEvent();

  @override
  List<Object> get props => [];
}
