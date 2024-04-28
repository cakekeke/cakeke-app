part of 'review_bloc.dart';

class ReviewState extends Equatable {
  const ReviewState({
    this.storeReviewList,
    this.reviewCount = 0,
    this.page = 0,
  });

  final List<Review>? storeReviewList;
  final int reviewCount;
  final int page;

  ReviewState copyWith({
    List<Review>? storeReviewList,
    int? reviewCount,
    int? page,
  }) {
    return ReviewState(
      storeReviewList: storeReviewList ?? this.storeReviewList,
      reviewCount: reviewCount ?? this.reviewCount,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [storeReviewList, reviewCount, page];
}
