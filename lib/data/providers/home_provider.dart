import 'package:cakeke/data/models/common/store.dart';
import 'package:cakeke/data/source/network/client_dio.dart';

class HomeProvider {
  final client = ApiClient.client;

  Future<List<Store>> getNewStoreList() async {
    try {
      //TODO: api 추가
      return [
        Store(
          id: 0,
          name: '오늘은 윤날',
          roadAddress: '서울시 성동구',
          latitude: 'mock',
          longitude: 'mock',
          description: 'mock',
          startTime: 'mock',
          endTime: 'mock',
          phoneNumber: 'mock',
          reservationLink: 'mock',
          numberOfReviews: 0,
          imgUrlList: [],
        ),
        Store(
          id: 1,
          name: '오늘은 윤날',
          roadAddress: '서울시 성동구',
          latitude: 'mock',
          longitude: 'mock',
          description: 'mock',
          startTime: 'mock',
          endTime: 'mock',
          phoneNumber: 'mock',
          reservationLink: 'mock',
          numberOfReviews: 0,
          imgUrlList: [],
        ),
        Store(
          id: 3,
          name: '오늘은 윤날',
          roadAddress: '서울시 성동구',
          latitude: 'mock',
          longitude: 'mock',
          description: 'mock',
          startTime: 'mock',
          endTime: 'mock',
          phoneNumber: 'mock',
          reservationLink: 'mock',
          numberOfReviews: 0,
          imgUrlList: [],
        ),
      ];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Store>> getPopularStore() async {
    try {
      //TODO: api 추가
      return [
        Store(
          id: 0,
          name: '오늘은 윤날',
          roadAddress: '서울시 성동구',
          latitude: 'mock',
          longitude: 'mock',
          description: 'mock',
          startTime: 'mock',
          endTime: 'mock',
          phoneNumber: 'mock',
          reservationLink: 'mock',
          numberOfReviews: 0,
          imgUrlList: [],
        ),
        Store(
          id: 1,
          name: '오늘은 윤날',
          roadAddress: '서울시 성동구',
          latitude: 'mock',
          longitude: 'mock',
          description: 'mock',
          startTime: 'mock',
          endTime: 'mock',
          phoneNumber: 'mock',
          reservationLink: 'mock',
          numberOfReviews: 0,
          imgUrlList: [],
        ),
        Store(
          id: 2,
          name: '오늘은 윤날',
          roadAddress: '서울시 성동구',
          latitude: 'mock',
          longitude: 'mock',
          description: 'mock',
          startTime: 'mock',
          endTime: 'mock',
          phoneNumber: 'mock',
          reservationLink: 'mock',
          numberOfReviews: 0,
          imgUrlList: [],
        ),
      ];
    } catch (e) {
      throw Exception(e);
    }
  }
}
