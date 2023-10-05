class Auth {
  String accessToken;
  int expiresIn;
  String refreshToken;
  int refreshTokenExpiresIn;

  Auth({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiresIn,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      refreshToken: json['refresh_token'],
      refreshTokenExpiresIn: json['refresh_token_expires_in'],
    );
  }
}
