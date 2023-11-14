import 'package:cakeke/data/providers/custom_provider.dart';

import '../models/custom/custom_images.dart';

class CustomRepository {
  final CustomProvider customProvider;

  CustomRepository({required this.customProvider});

  Future<CustomImages> getCustomImages() async {
    return await customProvider.getCustomImages();
  }
}
