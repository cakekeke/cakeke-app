import 'package:cakeke/data/models/common/store_info.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/providers/store_provider.dart';

class StoreRepository {
  final StoreProvider storeProvider;

  StoreRepository({required this.storeProvider});

  Future<StoreInfo> fetchLocalStoreList(
    double latitude,
    double longitude,
  ) async {
    return await storeProvider.getLocalStoreList(latitude, longitude);
  }

  Future<StoreInfo> fetchSearchStoreList(
    String search,
  ) async {
    return await storeProvider.getSearchStore(search);
  }

  Future<Store> getStoreInfoFromId(
    int storeId,
  ) async {
    return await storeProvider.getStoreInfo(storeId);
  }

  Future<List<Store>> fetchLikeStoreList() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Store(
        id: 9,
        name: 'Store 9',
        description: 'Store 9 description',
      ),
      Store(
        id: 10,
        name: 'Store 10',
        description: 'Store 10 description',
      ),
    ];
  }

  Future<Store> addLike(int storeId) async {
    await Future.delayed(Duration(seconds: 1));
    return Store(
      id: storeId,
      name: 'Store $storeId',
      description: 'Store $storeId description',
    );
  }

  Future<Store> removeLike(int storeId) async {
    await Future.delayed(Duration(seconds: 1));
    return Store(
      id: storeId,
      name: 'Store $storeId',
      description: 'Store $storeId description',
    );
  }
}
