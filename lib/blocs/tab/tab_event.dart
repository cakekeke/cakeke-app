part of 'tab_bloc.dart';

sealed class TabEvent extends Equatable {}

class TabChanged extends TabEvent {
  final int selectedIndex;

  TabChanged({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}
