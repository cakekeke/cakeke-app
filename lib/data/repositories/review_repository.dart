import 'package:cakeke/data/models/review/review.dart';
import 'package:cakeke/data/providers/review_provider.dart';

class ReviewRepository {
  final ReviewProvider reviewProvider;

  ReviewRepository({required this.reviewProvider});

  Future<int> fetchReviewCount(
    int storeId,
  ) async {
    return await reviewProvider.getReviewCount(storeId);
  }

  Future<List<Review>> fetchSearchStoreList(int storeId, {int page = 1}) async {
    return await reviewProvider.getStoreReviews(storeId, page);
  }
}
