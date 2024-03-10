class RefreshTokenResponse {
  final String grantType;
  final String accessToken;
  final String refreshToken;

  RefreshTokenResponse({
    required this.grantType,
    required this.accessToken,
    required this.refreshToken,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponse(
      grantType: json['grantType'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
