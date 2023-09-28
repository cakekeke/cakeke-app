import 'package:cakeke/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class AuthStateUnknown extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateAuthenticated extends AuthState {
  final User user;

  AuthStateAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
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
