import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.isDuplicationId,
    this.isValidId,
    this.isButtonActive = false,
    this.passwordCheck,
    this.profileId = 0,
    this.purpose = '',
    this.gender = '',
    this.birth = '',
    this.password = const ['', '', '', '', '', ''],
    this.rePassword = const ['', '', '', '', '', ''],
    this.id = '',
  });

  final bool? isDuplicationId;
  final bool? isValidId;
  final bool isButtonActive;
  final bool? passwordCheck;

  final int profileId;
  final String purpose;
  final String gender;
  final String birth;
  final List<String> password;
  final List<String> rePassword;
  final String id;

  SignUpState copyWith({
    bool? isDuplicationId,
    bool? isValidId,
    bool? isButtonActive,
    bool? passwordCheck,
    int? profileId,
    String? purpose,
    String? gender,
    String? birth,
    List<String>? password,
    List<String>? rePassword,
    String? id,
  }) {
    return SignUpState(
      isDuplicationId: isDuplicationId ?? this.isDuplicationId,
      isValidId: isValidId ?? this.isValidId,
      isButtonActive: isButtonActive ?? this.isButtonActive,
      passwordCheck: passwordCheck ?? this.passwordCheck,
      profileId: profileId ?? this.profileId,
      purpose: purpose ?? this.purpose,
      gender: gender ?? this.gender,
      birth: birth ?? this.birth,
      rePassword: rePassword ?? this.rePassword,
      password: password ?? this.password,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [
        isDuplicationId,
        isValidId,
        isButtonActive,
        passwordCheck,
        profileId,
        purpose,
        gender,
        birth,
        rePassword,
        password,
        id,
      ];
}
