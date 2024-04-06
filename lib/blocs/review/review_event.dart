part of 'review_bloc.dart';

sealed class ReviewEvent extends Equatable {
  const ReviewEvent();

  List<Object?> get props => [];
}

class NewStoreSetting extends ReviewEvent {
  const NewStoreSetting();

  @override
  List<Object> get props => [];
}

class StoreReviewFetch extends ReviewEvent {
  const StoreReviewFetch({
    required this.storeId,
  });

  final int storeId;

  @override
  List<Object> get props => [storeId];
}

class StoreReviewCountFetch extends ReviewEvent {
  const StoreReviewCountFetch({
    required this.storeId,
  });

  final int storeId;

  @override
  List<Object> get props => [storeId];
}
