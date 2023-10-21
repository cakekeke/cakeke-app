import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  const SignInState(
      {this.password = const ['', '', '', '', '', ''],
      this.id = '',
      this.isValidId = false,
      this.isButtonActive = false});

  final List<String> password;
  final String id;
  final bool isValidId;
  final bool isButtonActive;

  SignInState copyWith({
    List<String>? password,
    String? id,
    bool? isValidId,
    bool? isButtonActive,
  }) {
    return SignInState(
      password: password ?? this.password,
      id: id ?? this.id,
      isValidId: isValidId ?? this.isValidId,
      isButtonActive: isButtonActive ?? this.isButtonActive,
    );
  }

  @override
  List<Object?> get props => [
        password,
        id,
        isValidId,
        isButtonActive,
      ];
}

class SignInStateLoading extends SignInState {
  const SignInStateLoading() : super();
}

class SignInStateSuccess extends SignInState {
  const SignInStateSuccess({
    this.message = '',
  }) : super();

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}

class SignInStateFailure extends SignInState {
  const SignInStateFailure({
    this.message = '',
  }) : super();

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}
