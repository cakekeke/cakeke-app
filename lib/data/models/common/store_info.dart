import 'package:cakeke/data/models/common/store.dart';

class StoreInfo {
  String centerLongitude = '';
  String centerLatitude = '';
  List<Store> storeList = [];

  StoreInfo({
    this.centerLongitude = '',
    this.centerLatitude = '',
    this.storeList = const [],
  });

  StoreInfo.fromJson(Map<String, dynamic> json) {
    centerLongitude = json['centerLongitude'];
    centerLatitude = json['centerLatitude'];
    if (json['storeList'] != null) {
      storeList = <Store>[];
      json['storeList'].forEach((v) {
        storeList!.add(Store.fromJson(v));
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
    String? centerLongitude,
    String? centerLatitude,
    List<Store>? storeList,
  }) {
    return StoreInfo(
      centerLongitude: centerLongitude ?? this.centerLongitude,
      centerLatitude: centerLatitude ?? this.centerLatitude,
      storeList: storeList ?? this.storeList,
    );
  }
}
