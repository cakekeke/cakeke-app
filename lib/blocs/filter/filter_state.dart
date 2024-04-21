import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  const FilterState({
    this.selectedCity = "서울",
    this.selectedDistrict = "강남구",
  });

  final String selectedCity;
  final String selectedDistrict;

  FilterState copyWith({
    String? selectedCity,
    String? selectedDistrict,
    List<String>? districtList,
  }) {
    return FilterState(
      selectedCity: selectedCity ?? this.selectedCity,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
    );
  }

  @override
  List<Object?> get props => [
        selectedCity,
        selectedDistrict,
      ];
}
