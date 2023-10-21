import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenRepository {
  final _storage = const FlutterSecureStorage();

  Future<void> saveAccessToken(String accessToken) async {
    try {
      await _storage.write(key: 'access_token', value: accessToken);
    } catch (e) {
      throw Exception('액세스 토큰을 저장하는 동안 오류가 발생했습니다: $e');
    }
  }

  Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: 'access_token');
    } catch (e) {
      throw Exception('액세스 토큰을 가져오는 동안 오류가 발생했습니다: $e');
    }
  }

  Future<void> deleteAccessToken() async {
    try {
      await _storage.delete(key: 'access_token');
    } catch (e) {
      throw Exception('액세스 토큰을 삭제하는 동안 오류가 발생했습니다: $e');
    }
  }
}
