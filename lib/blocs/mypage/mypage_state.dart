import 'package:cakeke/data/models/user/user.dart';
import 'package:equatable/equatable.dart';

class MypageState extends Equatable {
  const MypageState({
    this.userName,
    this.profileImage,
    this.version,
    this.selectedPage = 0,
  });

  final String? userName;
  final String? profileImage;
  final String? version;
  final int selectedPage;

  MypageState copyWith({
    String? userName,
    String? profileImage,
    String? version,
    int? selectedPage,
  }) {
    return MypageState(
      userName: userName ?? this.userName,
      profileImage: profileImage ?? this.profileImage,
      version: version ?? this.version,
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }

  @override
  List<Object?> get props => [
        userName,
        profileImage,
        version,
        selectedPage,
      ];
}
