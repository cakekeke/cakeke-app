class SignInResponse {
  final String grantType;
  final String accessToken;
  final String refreshToken;

  SignInResponse({
    required this.grantType,
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      grantType: json['grantType'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
