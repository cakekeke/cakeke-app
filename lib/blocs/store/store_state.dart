part of 'store_bloc.dart';

class StoreState extends Equatable {
  const StoreState({
    this.storeList,
    this.clickedStoreId,
    this.selectStore,
    this.fetching = true,
  });

  final List<Store>? storeList;
  final Store? selectStore;
  final int? clickedStoreId;
  final bool fetching;

  StoreState copyWith({
    List<Store>? storeList,
    Store? selectStore,
    int? clickedStoreId,
    bool? fetching,
  }) {
    return StoreState(
      storeList: storeList ?? this.storeList,
      selectStore: selectStore ?? this.selectStore,
      clickedStoreId: clickedStoreId ?? this.clickedStoreId,
      fetching: fetching ?? this.fetching,
    );
  }

  @override
  List<Object?> get props => [storeList, selectStore, clickedStoreId, fetching];
}
