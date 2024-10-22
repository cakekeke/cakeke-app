import 'package:cakeke/blocs/filter/filter_event.dart';
import 'package:cakeke/blocs/filter/filter_state.dart';
import 'package:cakeke/utils/city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<FilterEventReset>(handleReset);
    on<FilterEventSelectCity>(handleSelectCity);
    on<FilterEventSelectDistrict>(handleSelectDistrict);
  }

  void handleReset(FilterEventReset event, Emitter<FilterState> emit) {
    emit(const FilterState());
  }

  void handleSelectCity(
      FilterEventSelectCity event, Emitter<FilterState> emit) async {
    final List<String> districtList = cityDistricts[event.city] ?? [];
    final String selectedDistrict = districtList.first;

    emit(state.copyWith(
      selectedCity: event.city,
      selectedDistrict: selectedDistrict,
    ));
  }

  void handleSelectDistrict(
      FilterEventSelectDistrict event, Emitter<FilterState> emit) {
    emit(state.copyWith(
      selectedDistrict: event.district,
    ));
  }
}
