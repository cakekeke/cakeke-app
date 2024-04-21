import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FilterEvent extends Equatable {
  const FilterEvent();
}

class FilterEventReset extends FilterEvent {
  const FilterEventReset();

  @override
  List<Object> get props => [];
}

class FilterEventSelectCity extends FilterEvent {
  const FilterEventSelectCity({
    required this.city,
  });

  final String city;

  @override
  List<Object> get props => [city];
}

class FilterEventSelectDistrict extends FilterEvent {
  const FilterEventSelectDistrict({
    required this.district,
  });

  final String district;

  @override
  List<Object> get props => [district];
}
