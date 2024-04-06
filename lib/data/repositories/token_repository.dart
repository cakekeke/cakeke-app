import 'package:cakeke/data/source/local/storage.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class TokenRepository {
  Future<void> saveAccessToken(String accessToken) async {
    try {
      ApiClient.client.setClientUpdateToken(accessToken);
      Storage.write(Storage.accessToken, accessToken);
    } catch (e) {
      throw Exception('액세스 토큰을 저장하는 동안 오류가 발생했습니다: $e');
    }
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    try {
      Storage.write(Storage.refreshToken, refreshToken);
    } catch (e) {
      throw Exception('리프레시 토큰을 저장하는 동안 오류가 발생했습니다: $e');
    }
  }

  Future<String?> getAccessToken() async {
    try {
      return Storage.read(Storage.accessToken);
    } catch (e) {
      throw Exception('액세스 토큰을 가져오는 동안 오류가 발생했습니다: $e');
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      return Storage.read(Storage.refreshToken);
    } catch (e) {
      throw Exception('리프레시 토큰을 가져오는 동안 오류가 발생했습니다: $e');
    }
  }

  void deleteAccessToken() async {
    try {
      Storage.delete(Storage.accessToken);
    } catch (e) {
      throw Exception('액세스 토큰을 삭제하는 동안 오류가 발생했습니다: $e');
    }
  }
}
