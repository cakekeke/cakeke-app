import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/providers/store_provider.dart';

class StoreRepository {
  final StoreProvider storeProvider;

  StoreRepository({required this.storeProvider});

  Future<List<Store>> fetchLocalStoreList(
    double latitude,
    double longitude,
  ) async {
    return [
      Store(
          id: 1,
          name: '1번째 가게',
          latitude: '37.56661029999873',
          longitude: '126.97420395393493'),
      Store(
          id: 2,
          name: '2번째 가게',
          latitude: '37.56589053195666',
          longitude: '126.9790085106002'),
    ];
    // return await storeProvider.getLocalStoreList(latitude,longitude);
  }

  Future<List<Store>> fetchSearchStoreList(
    String search,
  ) async {
    return [
      Store(
          id: 1,
          name: '서치 1번째 가게',
          latitude: '37.56661029999873',
          longitude: '126.97420395393493'),
    ];
    //return await storeProvider.getSearchStore(search);
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
