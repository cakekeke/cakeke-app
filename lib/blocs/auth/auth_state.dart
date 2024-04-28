import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthStateUnknown extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateAuthenticated extends AuthState {
  AuthStateAuthenticated();

  @override
  List<Object?> get props => [];
}

class AuthStateUnauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateError extends AuthState {
  final String message;

  AuthStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
