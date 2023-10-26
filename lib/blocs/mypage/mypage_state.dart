import 'package:cakeke/data/models/user/user.dart';
import 'package:equatable/equatable.dart';

class MypageState extends Equatable {
  const MypageState({
    this.user,
    this.version,
    this.selectedPage = 0,
  });

  final User? user;
  final String? version;
  final int selectedPage;

  MypageState copyWith({
    User? user,
    String? version,
    int? selectedPage,
  }) {
    return MypageState(
      user: user ?? this.user,
      version: version ?? this.version,
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }

  @override
  List<Object?> get props => [
        user,
        version,
        selectedPage,
      ];
}
