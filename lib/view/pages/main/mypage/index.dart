import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/view/pages/main/mypage/like_page.dart';
import 'package:cakeke/view/pages/main/mypage/setting_page.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/mypage/mypage_action_button.dart';
import 'package:cakeke/view/widgets/main/mypage/mypage_sub_title.dart';
import 'package:cakeke/view/widgets/main/mypage/mypage_title.dart';
import 'package:cakeke/view/widgets/main/mypage/version_info.dart';
import 'package:cakeke/view/widgets/main/mypage/voc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        if (state.user == null) {
          context.read<MypageBloc>().add(const MypageInitialEvent());
        }
        return IndexedStack(
          index: state.selectedPage,
          children: [
            ScaffoldLayout(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MypageActionButton(
                          iconData: Icons.settings_outlined,
                          text: "설정",
                          onPressed: () {
                            context
                                .read<MypageBloc>()
                                .add(const MypagePageChanged(
                                  selectedPage: 1,
                                ));
                          },
                        ),
                        MypageActionButton(
                          iconData: Icons.favorite_outline,
                          text: "찜 목록",
                          onPressed: () {
                            context
                                .read<MypageBloc>()
                                .add(const MypagePageChanged(
                                  selectedPage: 2,
                                ));
                          },
                        ),
                        VersionInfo(
                          version: state.version ?? "",
                        ),
                        const SizedBox(height: 12),
                        const VOCButton()
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SettingPage(),
            LikePage()
          ],
        );
      },
    );
  }
}
