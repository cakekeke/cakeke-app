import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/view/pages/main/mypage/mypage_main_page.dart';
import 'package:cakeke/view/pages/main/mypage/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        if (state.userName == null) {
          context.read<MypageBloc>().add(const MypageInitialEvent());
        }
        return IndexedStack(
          index: state.selectedPage,
          children: const [
            MypageMainPage(),
            SettingPage(),
          ],
        );
      },
    );
  }
}
