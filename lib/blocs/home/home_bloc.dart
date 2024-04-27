import 'package:cakeke/blocs/home/home_event.dart';
import 'package:cakeke/blocs/home/home_state.dart';
import 'package:cakeke/data/providers/home_provider.dart';
import 'package:cakeke/data/repositories/home_repository.dart';
import 'package:cakeke/utils/city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInitialEvent>(_onHomeStarted);
    on<HomePageChanged>(_onHomePageChanged);
    on<HomeStoreListFetch>(_onHomeStoreListFetch);
    on<HomeRegionStoreRankingFetch>(_onHomeRegionStoreRankingFetch);
  }

  final HomeRepository homeRepository =
      HomeRepository(homeProvider: HomeProvider());

  void _onHomeStarted(HomeInitialEvent event, Emitter<HomeState> emit) async {
    final newStore = await homeRepository.getNewStoreList();
    final popularStore = await homeRepository.getPopularStore();
    final storeList = await homeRepository.getStoreRanking(
        city: cities.first, district: cityDistricts[cities.first]!.first);
    emit(state.copyWith(
      newStore: newStore,
      popularStore: popularStore,
      regionStoreRanking: storeList,
    ));
  }

  void _onHomePageChanged(HomePageChanged event, Emitter<HomeState> emit) {
    emit(state.copyWith(
        selectedPage: event.selectedPage, prevPage: state.selectedPage));
  }

  void _onHomeStoreListFetch(
      HomeStoreListFetch event, Emitter<HomeState> emit) {
    emit(state.copyWith(storeListType: event.type));
  }

  void _onHomeRegionStoreRankingFetch(
      HomeRegionStoreRankingFetch event, Emitter<HomeState> emit) async {
    final storeList = await homeRepository.getStoreRanking(
        city: event.city, district: event.district);
    emit(state.copyWith(
      regionStoreRanking: storeList,
      city: event.city,
      district: event.district,
    ));
  }
}
