import 'package:cakeke/data/models/custom/custom_images.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class CustomProvider {
  final client = ApiClient.client;

  Future<CustomImages> getCustomImages() async {
    try {
      final response = await client.dio.fetch<Map<String, dynamic>>(
          client.clientOptions('GET', '/cake/sticker/url'));

      return CustomImages.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
