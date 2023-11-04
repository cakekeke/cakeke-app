import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class StoreProvider {
  final client = ApiClient.client;

  Future<List<Store>> getLocalStoreList(
      double latitude, double longitude) async {
    try {
      final queryParameters = {
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
      };

      final response = await client.dio.fetch<List<dynamic>>(
          client.clientOptions('GET', '/stores/local',
              queryParameters: queryParameters));
      return response.data!
          .map<Store>((dynamic i) => Store.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Store> getStoreInfo(int storeId) async {
    try {
      final response = await client.dio
          .fetch<Store>(client.clientOptions('GET', '/stores/$storeId'));
      return Store.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Store>> getSearchStore(String searchText) async {
    try {
      final queryParameters = {
        "value": searchText,
      };

      final response = await client.dio.fetch<List<dynamic>>(
          client.clientOptions('GET', '/stores/search',
              queryParameters: queryParameters));
      return response.data!
          .map<Store>((dynamic i) => Store.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
