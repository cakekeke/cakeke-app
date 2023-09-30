import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc()
      : super(const TabInitial(
          tabIndex: 0,
        )) {
    on<TabChanged>(_onTabChanged);
  }

  void _onTabChanged(TabChanged event, Emitter<TabState> emit) {
    emit(CurrentTab(tabIndex: event.selectedIndex));
  }
}
