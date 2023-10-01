part of 'tab_bloc.dart';

sealed class TabState extends Equatable {
  const TabState({
    required this.tabIndex,
  });

  final int tabIndex;

  @override
  List<Object?> get props => [tabIndex];
}

final class TabInitial extends TabState {
  const TabInitial({required super.tabIndex});
}

final class CurrentTab extends TabState {
  const CurrentTab({required super.tabIndex});
}
