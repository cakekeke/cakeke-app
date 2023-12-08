import 'package:cakeke/data/models/common/store.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.newStore = const [],
    this.popularStore = const [],
  });

  final List<Store> newStore;
  final List<Store> popularStore;

  HomeState copyWith({List<Store>? newStore, List<Store>? popularStore}) {
    return HomeState(
      newStore: newStore ?? this.newStore,
      popularStore: popularStore ?? this.popularStore,
    );
  }

  @override
  List<Object?> get props => [
        newStore,
        popularStore,
      ];
}
