class Signup {
  final String id;
  final String password;
  final String birth;
  final String gener;
  final String purpose;
  final int profileId;

  Signup({
    required this.id,
    required this.password,
    required this.birth,
    required this.gener,
    required this.purpose,
    required this.profileId,
  });

  Signup copyWith({
    String? id,
    String? password,
    String? birth,
    String? gener,
    String? purpose,
    int? profileId,
  }) {
    return Signup(
      id: id ?? this.id,
      password: password ?? this.password,
      birth: birth ?? this.birth,
      gener: gener ?? this.gener,
      purpose: purpose ?? this.purpose,
      profileId: profileId ?? this.profileId,
    );
  }
}
