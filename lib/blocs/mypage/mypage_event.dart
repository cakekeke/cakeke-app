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
