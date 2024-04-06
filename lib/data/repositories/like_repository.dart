import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/providers/like_provider.dart';

class LikeRepository {
  final LikeProvider likeProvider;

  LikeRepository({required this.likeProvider});

  Future<List<Store>> fetchLikeStoreList() async {
    return await likeProvider.getMyLikeStore();
  }

  Future<int> getStoreLike(int storeId) async {
    return await likeProvider.getStoreLike(storeId);
  }

  Future<void> postStoreLike(int storeId) async {
    return await likeProvider.postStoreLike(storeId);
  }

  Future<void> deleteStoreLike(int storeId) async {
    return await likeProvider.deleteStoreLike(storeId);
  }
}
