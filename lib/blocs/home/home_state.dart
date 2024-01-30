import 'package:cakeke/data/models/common/store.dart';
import 'package:equatable/equatable.dart';

enum HomeTab {
  main,
  list,
  detail,
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
    this.storeList = const [],
    this.storeListType = HomeStoreListType.newStore,
    this.city = "",
    this.district = "",
  });

  final List<Store> newStore;
  final List<Store> popularStore;
  final int selectedPage;
  final int prevPage;
  final List<Store> storeList;
  final HomeStoreListType storeListType;
  final String city;
  final String district;

  HomeState copyWith({
    List<Store>? newStore,
    List<Store>? popularStore,
    int? selectedPage,
    int? prevPage,
    List<Store>? storeList,
    HomeStoreListType? storeListType,
  }) {
    return HomeState(
      newStore: newStore ?? this.newStore,
      popularStore: popularStore ?? this.popularStore,
      selectedPage: selectedPage ?? this.selectedPage,
      prevPage: prevPage ?? this.prevPage,
      storeList: storeList ?? this.storeList,
      storeListType: storeListType ?? this.storeListType,
    );
  }

  @override
  List<Object?> get props => [
        newStore,
        popularStore,
        selectedPage,
        prevPage,
        storeList,
        storeListType,
      ];
}
