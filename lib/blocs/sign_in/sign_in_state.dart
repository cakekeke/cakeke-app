import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  const SignInState({
    this.password = '',
    this.id = '',
    this.isValidId = false,
    this.isButtonActive = false,
    this.loginSuccess = false,
    this.loginFailure = false,
  });

  final String password;
  final String id;
  final bool isValidId;
  final bool isButtonActive;
  final bool loginSuccess;
  final bool loginFailure;

  SignInState copyWith({
    String? password,
    String? id,
    bool? isValidId,
    bool? isButtonActive,
    bool? loginSuccess,
    bool? loginFailure,
  }) {
    return SignInState(
      password: password ?? this.password,
      id: id ?? this.id,
      isValidId: isValidId ?? this.isValidId,
      isButtonActive: isButtonActive ?? this.isButtonActive,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      loginFailure: loginFailure ?? this.loginFailure,
    );
  }

  @override
  List<Object?> get props => [
        password,
        id,
        isValidId,
        isButtonActive,
        loginSuccess,
      ];
}
