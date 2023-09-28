import 'package:cakeke/data/models/auth_model.dart';
import 'package:cakeke/data/models/signup_model.dart';
import 'package:cakeke/data/models/user_model.dart';

class AuthProvider {
  Future<Auth> signin({
    required String id,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 5));
    // 로그인 성공시 Auth를 반환하고, 실패시 Exception을 반환한다.
    // secure storage에 access token 저장
    return Auth(
      accessToken: "",
      refreshToken: "",
      expiresIn: 0,
      refreshTokenExpiresIn: 0,
    );
  }

  Future<Auth> signup(Signup singup) async {
    await Future.delayed(Duration(seconds: 5));
    // 회원가입 성공시 Auth를 반환하고, 실패시 Exception을 반환한다.
    // secure storage에 access token 저장
    return Auth(
      accessToken: "",
      refreshToken: "",
      expiresIn: 0,
      refreshTokenExpiresIn: 0,
    );
  }

  Future<bool> signout() async {
    await Future.delayed(Duration(seconds: 5));
    // secure storage에 access token 삭제
    return true;
  }

  Future<String?> checkToken() async {
    await Future.delayed(Duration(seconds: 5));
    // token이 유효하면 token을 반환하고, 유효하지 않거나 없으면 null을 반환한다.
    return "";
  }

  Future<User> getUser(String accessToken) async {
    await Future.delayed(Duration(seconds: 5));
    // secure storage에 저장된 access token을 이용하여 user 정보를 가져온다.
    // 유효하지 못한 토큰이면 Exception을 반환한다.
    return User(
      id: "12",
      name: '행복한 오징어',
      avatar: "1234",
    );
  }
}
