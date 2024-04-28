import 'package:cakeke/data/providers/user_provider.dart';
import 'package:cakeke/data/repositories/token_repository.dart';

class AuthRepository {
  final UserProvider userProvider = UserProvider();
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

  Future<void> signout() async {
    await userProvider.signout();
    tokenRepository.deleteAccessToken();
  }

  Future<void> withdrawal() async {
    await userProvider.withdrawal();
    tokenRepository.deleteAccessToken();
  }
}
