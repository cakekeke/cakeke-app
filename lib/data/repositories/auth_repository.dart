import 'package:cakeke/data/repositories/token_repository.dart';

class AuthRepository {
  final TokenRepository tokenRepository = TokenRepository();

  AuthRepository();

  Future<String?> checkToken() async {
    final accessToken = await tokenRepository.getAccessToken();
    if (accessToken != null) {
      return accessToken;
    } else {
      return null;
    }
  }
}
