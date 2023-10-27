part of 'store_bloc.dart';

sealed class StoreEvent extends Equatable {
  const StoreEvent();

  @override
  List<Object> get props => [];
}

class StoreEventFetchLocal extends StoreEvent {
  const StoreEventFetchLocal({
    required this.latitude,
    required this.longitude,
  });

  final String latitude;
  final String longitude;

  @override
  List<Object> get props => [
        latitude,
        longitude,
      ];
}

class StoreEventFetchSearch extends StoreEvent {
  const StoreEventFetchSearch({
    required this.search,
  });

  final String search;

  @override
  List<Object> get props => [search];
}

class StoreEventFetchLike extends StoreEvent {
  const StoreEventFetchLike();

  @override
  List<Object> get props => [];
}

class StoreEventAddLike extends StoreEvent {
  const StoreEventAddLike({
    required this.storeId,
  });

  final int storeId;

  @override
  List<Object> get props => [storeId];
}

class StoreEventRemoveLike extends StoreEvent {
  const StoreEventRemoveLike({
    required this.storeId,
  });

  final int storeId;

  @override
  List<Object> get props => [storeId];
}
