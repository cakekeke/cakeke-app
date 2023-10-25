import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/mypage/detail_page_button.dart';
import 'package:cakeke/view/widgets/main/mypage/mypage_sub_title.dart';
import 'package:cakeke/view/widgets/main/mypage/mypage_title.dart';
import 'package:cakeke/view/widgets/main/mypage/version_info.dart';
import 'package:cakeke/view/widgets/main/mypage/voc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        if (state.user == null) {
          context.read<MypageBloc>().add(const MypageInitialEvent());
        }
        return ScaffoldLayout(
          isSafeArea: true,
          bodyWidget: Column(
            children: [
              const MypageTitle(),
              MypageSubTitle(name: state.user?.name ?? ""),
              Container(
                height: 10,
                color: const Color(0xffF6F6F6),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DetailPageButton(
                      iconData: Icons.settings,
                      text: "설정",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    DetailPageButton(
                      iconData: Icons.favorite,
                      text: "찜 목록",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    VersionInfo(
                      version: state.version ?? "",
                    ),
                    const SizedBox(height: 24),
                    const VOCButton()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
