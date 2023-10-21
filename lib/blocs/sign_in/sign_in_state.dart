import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  const SignInState({
    this.password = const ['', '', '', '', '', ''],
    this.id = '',
  });

  final List<String> password;
  final String id;

  SignInState copyWith({
    List<String>? password,
    String? id,
  }) {
    return SignInState(
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        password,
        id,
      ];
}
