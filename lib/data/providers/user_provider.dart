import 'package:cakeke/data/models/user/user.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class UserProvider {
  final client = ApiClient.client;

  Future<User> getUser() async {
    try {
      final response = await client.dio
          .fetch<Map<String, dynamic>>(client.clientOptions('GET', '/users'));
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }


  Future<void> withdrawal() async {
    try {
      await client.dio.fetch(client.clientOptions('DELETE', '/users'));
    } catch (e) {
      throw Exception(e);
    }
  }
}
