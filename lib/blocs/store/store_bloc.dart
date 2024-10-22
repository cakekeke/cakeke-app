import 'package:cakeke/data/providers/store_provider.dart';
import 'package:cakeke/data/repositories/store_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cakeke/data/models/common/store.dart';
import 'package:equatable/equatable.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(const StoreState()) {
    on<StoreEventFetchLocal>(handleFetchLocal);
    on<StoreEventFetchSearch>(handleFetchSearch);
    on<StoreFetchComplete>(_handleStoreFetchComplete);
  }

  final StoreRepository storeRepository =
      StoreRepository(storeProvider: StoreProvider());

  Future<void> handleFetchLocal(
      StoreEventFetchLocal event, Emitter<StoreState> emit) async {
    final storeInfo = await storeRepository.fetchLocalStoreList(
      event.latitude,
      event.longitude,
    );
    emit(state.copyWith(storeList: storeInfo.storeList, fetching: true));
  }

  void handleFetchSearch(
      StoreEventFetchSearch event, Emitter<StoreState> emit) async {
    final storeList = await storeRepository.fetchSearchStoreList(event.search);
    event.onSearchComplete(storeList.centerLatitude, storeList.centerLongitude);
    emit(state.copyWith(storeList: storeList.storeList, fetching: true));
  }

  void _handleStoreFetchComplete(
      StoreFetchComplete event, Emitter<StoreState> emit) {
    emit(state.copyWith(fetching: false));
  }
}
