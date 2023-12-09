import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/source/local/storage.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class LikeProvider {
  final client = ApiClient.client;

  Future<List<Store>> getMyLikeStore() async {
    try {
      final userId = await Storage.read(Storage.uid);
      final response = await client.dio.fetch<Map<String, dynamic>>(client
          .clientOptions('GET', '/store/user/$userId/like', queryParameters: {
        "page": 0,
      }));

      return response.data!['storeList']
          .map<Store>((dynamic i) => Store.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> getStoreLike(int storeId) async {
    try {
      final response = await client.dio.fetch<Map<String, dynamic>>(
          client.clientOptions('GET', '/store/$storeId/like'));

      return response.data['count'];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> postStoreLike(int storeId) async {
    try {
      final userId = await Storage.read(Storage.uid);
      await client.dio.fetch<Map<String, dynamic>>(client.clientOptions(
          'POST', '/store/$storeId/like',
          headers: {'user_id': userId}));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteStoreLike(int storeId) async {
    try {
      final userId = await Storage.read(Storage.uid);
      await client.dio.fetch<Map<String, dynamic>>(client.clientOptions(
          'DELETE', '/store/$storeId/like',
          headers: {'user_id': userId}));
    } catch (e) {
      throw Exception(e);
    }
  }
}
