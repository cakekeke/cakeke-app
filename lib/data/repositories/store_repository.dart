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
}
