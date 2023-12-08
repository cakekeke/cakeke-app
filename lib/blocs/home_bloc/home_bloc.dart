import 'package:cakeke/blocs/home_bloc/home_event.dart';
import 'package:cakeke/blocs/home_bloc/home_state.dart';
import 'package:cakeke/data/providers/home_provider.dart';
import 'package:cakeke/data/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInitialEvent>(_onHomeStarted);
  }

  final HomeRepository homeRepository =
      HomeRepository(homeProvider: HomeProvider());

  void _onHomeStarted(HomeInitialEvent event, Emitter<HomeState> emit) async {
    final newStore = await homeRepository.getNewStoreList();
    final popularStore = await homeRepository.getPopularStore();

    emit(state.copyWith(
      newStore: newStore,
      popularStore: popularStore,
    ));
  }
}
