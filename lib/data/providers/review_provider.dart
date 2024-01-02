import 'package:cakeke/data/models/review/review.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class ReviewProvider {
  final client = ApiClient.client;

  Future<int> getReviewCount(int storeId) async {
    try {
      final response = await client.dio.fetch<Map<String, dynamic>>(
          client.clientOptions('GET', '/store/$storeId/review/count'));
      return response.data["count"] ?? 0;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Review>> getStoreReviews(int storeId, int page) async {
    try {
      final queryParameters = {
        "page": page,
        "size": 20,
      };

      final response = await client.dio.fetch<Map<String, dynamic>>(
          client.clientOptions('GET', '/store/$storeId/review/list',
              queryParameters: queryParameters));

      return response.data!['reviewDTOList']
          .map<Review>(
              (dynamic i) => Review.fromJson(i as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
