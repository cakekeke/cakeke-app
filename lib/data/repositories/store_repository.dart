import 'package:cakeke/data/models/common/store.dart';

class StoreRepository {
  Future<List<Store>> fetchLocalStoreList(
    String latitude,
    String longitude,
  ) async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Store(
        id: 1,
        name: 'Store 1',
        description: 'Store 1 description',
      ),
      Store(
        id: 2,
        name: 'Store 2',
        description: 'Store 2 description',
      ),
      Store(
        id: 3,
        name: 'Store 3',
        description: 'Store 3 description',
      ),
      Store(
        id: 4,
        name: 'Store 4',
        description: 'Store 4 description',
      ),
      Store(
        id: 5,
        name: 'Store 5',
        description: 'Store 5 description',
      ),
    ];
  }

  Future<List<Store>> fetchSearchStoreList(
    String search,
  ) async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Store(
        id: 1,
        name: 'Store 1',
        description: 'Store 1 description',
      ),
      Store(
        id: 2,
        name: 'Store 2',
        description: 'Store 2 description',
      ),
      Store(
        id: 3,
        name: 'Store 3',
        description: 'Store 3 description',
      ),
      Store(
        id: 4,
        name: 'Store 4',
        description: 'Store 4 description',
      ),
      Store(
        id: 5,
        name: 'Store 5',
        description: 'Store 5 description',
      ),
    ];
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
