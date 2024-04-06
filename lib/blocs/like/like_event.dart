part of 'like_bloc.dart';

sealed class LikeEvent extends Equatable {
  const LikeEvent();

  List<Object?> get props => [];
}

class LikeEventFetchLike extends LikeEvent {
  const LikeEventFetchLike();

  @override
  List<Object> get props => [];
}

class LikeEventGetStoreLike extends LikeEvent {
  const LikeEventGetStoreLike({
    required this.storeId,
  });

  final int storeId;

  @override
  List<Object> get props => [storeId];
}

class LikeEventAddLike extends LikeEvent {
  const LikeEventAddLike({
    required this.store,
  });

  final Store store;

  @override
  List<Object> get props => [store];
}

class LikeEventRemoveLike extends LikeEvent {
  const LikeEventRemoveLike({
    required this.store,
  });

  final Store store;

  @override
  List<Object> get props => [store];
}
