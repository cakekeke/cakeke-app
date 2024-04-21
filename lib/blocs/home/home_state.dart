import 'package:cakeke/data/models/common/store.dart';
import 'package:equatable/equatable.dart';

enum HomeTab {
  main,
  list,
}

enum HomeStoreListType {
  newStore,
  popularStore,
}

class HomeState extends Equatable {
  const HomeState({
    this.newStore = const [],
    this.popularStore = const [],
    this.selectedPage = 0,
    this.prevPage = 0,
    this.regionStoreRanking = const [],
    this.storeListType = HomeStoreListType.newStore,
    this.city = "",
    this.district = "",
  });

  final List<Store> newStore;
  final List<Store> popularStore;
  final List<Store> regionStoreRanking;
  final int selectedPage;
  final int prevPage;
  final HomeStoreListType storeListType;
  final String city;
  final String district;

  HomeState copyWith({
    List<Store>? newStore,
    List<Store>? popularStore,
    int? selectedPage,
    int? prevPage,
    List<Store>? regionStoreRanking,
    HomeStoreListType? storeListType,
    String? city,
    String? district,
  }) {
    return HomeState(
      newStore: newStore ?? this.newStore,
      popularStore: popularStore ?? this.popularStore,
      selectedPage: selectedPage ?? this.selectedPage,
      prevPage: prevPage ?? this.prevPage,
      regionStoreRanking: regionStoreRanking ?? this.regionStoreRanking,
      storeListType: storeListType ?? this.storeListType,
      city: city ?? this.city,
      district: district ?? this.district,
    );
  }

  @override
  List<Object?> get props => [
        newStore,
        popularStore,
        selectedPage,
        prevPage,
        storeListType,
        regionStoreRanking,
        city,
        district,
      ];
}
