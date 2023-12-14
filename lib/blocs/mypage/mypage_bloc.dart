import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/data/providers/user_provider.dart';
import 'package:cakeke/data/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MypageBloc extends Bloc<MypageEvent, MypageState> {
  MypageBloc() : super(const MypageState()) {
    on<MypageInitialEvent>(_onMypageStarted);
    on<MypagePageChanged>(_handlePageChanged);
  }

  final UserRepository userRepository =
      UserRepository(userProvider: UserProvider());
  bool isLoading = false;

  void _onMypageStarted(
      MypageInitialEvent event, Emitter<MypageState> emit) async {
    if (isLoading) return;
    isLoading = true;
    final userInfo = await userRepository.getUser();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    isLoading = false;
    emit(state.copyWith(user: userInfo, version: version));
  }

  void _handlePageChanged(MypagePageChanged event, Emitter<MypageState> emit) {
    emit(state.copyWith(selectedPage: event.selectedPage));
  }
}
