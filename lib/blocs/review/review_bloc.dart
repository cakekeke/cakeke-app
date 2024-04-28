import 'package:cakeke/data/models/review/review.dart';
import 'package:cakeke/data/providers/review_provider.dart';
import 'package:cakeke/data/repositories/review_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(const ReviewState()) {
    on<NewStoreSetting>(handleNewStoreSetting);
    on<StoreReviewFetch>(handleStoreReviewFetch);
    on<StoreReviewCountFetch>(handleStoreReviewCountFetch);
  }

  final ReviewRepository reviewRepository =
      ReviewRepository(reviewProvider: ReviewProvider());

  void handleNewStoreSetting(
      NewStoreSetting event, Emitter<ReviewState> emit) async {
    emit(state.copyWith(storeReviewList: null, reviewCount: 0, page: 0));
  }

  void handleStoreReviewFetch(
      StoreReviewFetch event, Emitter<ReviewState> emit) async {
    final List<Review> reviewList =
        await reviewRepository.fetchSearchStoreList(event.storeId);
    emit(state.copyWith(storeReviewList: reviewList));
  }

  void handleStoreReviewCountFetch(
      StoreReviewCountFetch event, Emitter<ReviewState> emit) async {
    final count = await reviewRepository.fetchReviewCount(event.storeId);

    emit(state.copyWith(reviewCount: count));
  }
}
