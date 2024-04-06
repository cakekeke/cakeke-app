import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MypageEvent extends Equatable {
  const MypageEvent();
}

class MypageInitialEvent extends MypageEvent {
  const MypageInitialEvent();

  @override
  List<Object> get props => [];
}

class MypagePageChanged extends MypageEvent {
  const MypagePageChanged({
    required this.selectedPage,
  });

  final int selectedPage;

  @override
  List<Object> get props => [
        selectedPage,
      ];
}
