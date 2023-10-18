import 'package:cakeke/data/models/sign_up/service_purpose.dart';
import 'package:cakeke/data/models/common/user.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class SignUpProvider {
  final client = ApiClient.client;

  Future<bool> signUp(Map<String, dynamic> body) async {
    final response = await client.dio
        .fetch<User>(client.clientOptions('POST', '/auth/signup', data: body));

    return response.statusCode ~/ 100 == 2;
  }

  Future<bool> checkIdDuplicate(String id) async {
    final body = {
      "userId": id,
    };

    final response = await client.dio.fetch<Map<String, dynamic>>(
        client.clientOptions('POST', '/auth/check-id', data: body));
    return response.data!["result"];
  }

  Future<List<ServicePurpose>> getServicePurpose() async {
    final response = await client.dio.fetch<List<dynamic>>(
        client.clientOptions('GET', '/auth/service-purpose'));

    return response.data!
        .map<ServicePurpose>(
            (dynamic i) => ServicePurpose.fromJson(i as Map<String, dynamic>))
        .toList();
  }
}
