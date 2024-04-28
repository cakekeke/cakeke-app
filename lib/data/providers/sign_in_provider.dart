import 'package:cakeke/data/models/auth/sign_in_response.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class SignInProvider {
  final client = ApiClient.client;

  Future<SignInResponse> signin({
    required String id,
    required String password,
  }) async {
    try {
      final response = await client.dio.post("/auth/login", data: {
        "userId": id,
        "password": password,
      });
      return SignInResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
