part of 'store_bloc.dart';

class StoreState extends Equatable {
  StoreState({
    this.storeList,
    this.clickedStoreId,
    this.fetching = true,
  });

  final List<Store>? storeList;
  final int? clickedStoreId;
  final bool fetching;

  StoreState copyWith({
    List<Store>? storeList,
    int? clickedStoreId,
    bool? fetching,
  }) {
    return StoreState(
      storeList: storeList ?? this.storeList,
      clickedStoreId: clickedStoreId ?? this.clickedStoreId,
      fetching: fetching ?? this.fetching,
    );
  }

  @override
  List<Object?> get props => [storeList, clickedStoreId, fetching];
}
