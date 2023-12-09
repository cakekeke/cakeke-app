part of 'like_bloc.dart';

class LikeState extends Equatable {
  const LikeState({
    this.likeStoreList,
    this.page = 0,
  });

  final List<Store>? likeStoreList;
  final int page;

  LikeState copyWith({
    List<Store>? likeStoreList,
    int? page,
  }) {
    return LikeState(
      likeStoreList: likeStoreList ?? this.likeStoreList,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [likeStoreList, page];
}
