import 'package:cakeke/data/models/sign_up/service_purpose.dart';
import 'package:cakeke/data/models/sign_up/user.dart';
import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  const SignUpState({
    required this.user,
    this.isDuplicationId,
    this.isValidId,
    this.isButtonActive = false,
    this.passwordCheck,
    this.purpose = const [],
    this.password = const ['', '', '', '', '', ''],
    this.checkPassword = const ['', '', '', '', '', ''],
    this.name = '',
  });

  final bool? isDuplicationId;
  final bool? isValidId;
  final bool isButtonActive;
  final bool? passwordCheck;

  final List<ServicePurpose> purpose;
  final List<String> password;
  final List<String> checkPassword;
  final String name;
  final User user;

  SignUpState copyWith({
    bool? isDuplicationId,
    bool? isValidId,
    bool? isButtonActive,
    bool? passwordCheck,
    List<ServicePurpose>? purpose,
    List<String>? password,
    List<String>? checkPassword,
    String? name,
    User? user,
  }) {
    return SignUpState(
      isDuplicationId: isDuplicationId ?? this.isDuplicationId,
      isValidId: isValidId ?? this.isValidId,
      isButtonActive: isButtonActive ?? this.isButtonActive,
      passwordCheck: passwordCheck ?? this.passwordCheck,
      purpose: purpose ?? this.purpose,
      checkPassword: checkPassword ?? this.checkPassword,
      password: password ?? this.password,
      name: name ?? this.name,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        isDuplicationId,
        isValidId,
        isButtonActive,
        passwordCheck,
        purpose,
        checkPassword,
        password,
        name,
        user,
      ];
}
