import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class HomeProvider {
  final client = ApiClient.client;

  Future<List<Store>> getNewStoreList() async {
    try {
      final response = await client.dio.fetch(client.clientOptions(
        'GET',
        '/stores/new/all',
      ));
      return response.data!
          .map<Store>((dynamic i) => Store.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Store>> getPopularStore() async {
    try {
      final response = await client.dio.fetch(client.clientOptions(
        'GET',
        '/stores/rankings',
      ));
      return response.data!
          .map<Store>((dynamic i) => Store.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Store>> getStoreRanking(
      {required String city, required String district}) async {
    try {
      final response = await client.dio.fetch(client.clientOptions(
        'GET',
        '/stores/rankings-region/$city/$district',
      ));
      return response.data!
          .map<Store>((dynamic i) => Store.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
