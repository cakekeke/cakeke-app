import 'package:cakeke/data/models/user/user.dart';
import 'package:equatable/equatable.dart';

class MypageState extends Equatable {
  const MypageState({
    this.user,
    this.version,
  });

  final User? user;
  final String? version;

  MypageState copyWith({
    User? user,
    String? version,
  }) {
    return MypageState(
      user: user ?? this.user,
      version: version ?? this.version,
    );
  }

  @override
  List<Object?> get props => [
        user,
        version,
      ];
}
