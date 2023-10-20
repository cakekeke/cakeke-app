class Token {
  String grantType = '';
  String accessToken = '';
  String refreshToken = '';

  Token({this.grantType = '', this.accessToken = '', this.refreshToken = ''});

  Token.fromJson(Map<String, dynamic> json) {
    grantType = json['grantType'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grantType'] = grantType;
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
