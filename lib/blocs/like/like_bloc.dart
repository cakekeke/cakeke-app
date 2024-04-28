import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/providers/like_provider.dart';
import 'package:cakeke/data/repositories/like_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(const LikeState()) {
    on<LikeEventFetchLike>(handleFetchLike);
    on<LikeEventAddLike>(handleAddLike);
    on<LikeEventRemoveLike>(handleRemoveLike);
  }

  final LikeRepository likeRepository =
      LikeRepository(likeProvider: LikeProvider());

  void handleFetchLike(
      LikeEventFetchLike event, Emitter<LikeState> emit) async {
    final List<Store> storeList = await likeRepository.fetchLikeStoreList();
    emit(state.copyWith(likeStoreList: storeList));
  }

  void handleAddLike(LikeEventAddLike event, Emitter<LikeState> emit) async {
    await likeRepository.postStoreLike(event.store.id);
    List<Store> newLikeList = [...state.likeStoreList ?? [], event.store];

    emit(state.copyWith(
      likeStoreList: newLikeList,
    ));
  }

  void handleRemoveLike(
      LikeEventRemoveLike event, Emitter<LikeState> emit) async {
    await likeRepository.deleteStoreLike(event.store.id);
    List<Store> newLikeList = [...state.likeStoreList ?? [], event.store];
    if (state.likeStoreList != null) {
      newLikeList.removeWhere((store) => store.id == event.store.id);
    }

    emit(state.copyWith(
      likeStoreList: newLikeList,
    ));
  }
}
