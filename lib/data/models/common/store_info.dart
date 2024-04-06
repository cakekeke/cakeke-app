import 'package:cakeke/data/models/common/store.dart';

class StoreInfo {
  double centerLongitude = 0;
  double centerLatitude = 0;
  List<Store> storeList = [];

  StoreInfo({
    this.centerLongitude = 0,
    this.centerLatitude = 0,
    this.storeList = const [],
  });

  StoreInfo.fromJson(Map<String, dynamic> json) {
    centerLongitude =
        json['centerLongitude'] == "NaN" ? 0 : json['centerLongitude'];
    centerLatitude =
        json['centerLatitude'] == "NaN" ? 0 : json['centerLatitude'];
    if (json['storeList'] != null) {
      storeList = <Store>[];
      json['storeList'].forEach((v) {
        storeList.add(Store.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['centerLongitude'] = centerLongitude;
    data['centerLatitude'] = centerLatitude;
    data['storeList'] = storeList;
    return data;
  }

  StoreInfo copyWith({
    double? centerLongitude,
    double? centerLatitude,
    List<Store>? storeList,
  }) {
    return StoreInfo(
      centerLongitude: centerLongitude ?? this.centerLongitude,
      centerLatitude: centerLatitude ?? this.centerLatitude,
      storeList: storeList ?? this.storeList,
    );
  }
}
