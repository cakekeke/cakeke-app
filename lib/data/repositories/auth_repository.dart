import 'package:cakeke/data/models/auth_model.dart';
import 'package:cakeke/data/models/user_model.dart';
import 'package:cakeke/data/providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider authProvider;

  AuthRepository({required this.authProvider});

  Future<bool> signout() async {
    return await authProvider.signout();
  }

  Future<String?> checkToken() async {
    return await authProvider.checkToken();
  }

  Future<User> getUser({
    required String accessToken,
  }) async {
    return await authProvider.getUser(accessToken);
  }

  Future<Auth> signin({
    required String id,
    required String password,
  }) async {
    return await authProvider.signin(id: id, password: password);
  }
}
