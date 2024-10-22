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
