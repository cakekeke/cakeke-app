import 'package:cakeke/blocs/auth/auth_bloc.dart';
import 'package:cakeke/blocs/auth/auth_event.dart';
import 'package:cakeke/blocs/mypage/mypage_bloc.dart';
import 'package:cakeke/blocs/mypage/mypage_event.dart';
import 'package:cakeke/blocs/mypage/mypage_state.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/data/arguments/webView.dart';
import 'package:cakeke/utils/webview.dart';
import 'package:cakeke/view/widgets/common/confirm_dialog.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/main/mypage/mypage_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MypageBloc, MypageState>(
      builder: (context, state) {
        return ScaffoldLayout(
            appBarText: "설정",
            isDetailPage: true,
            onBackButtonPressed: () {
              context.read<MypageBloc>().add(MypagePageChanged(
                    selectedPage: MypageTab.main.index,
                  ));
            },
            isSafeArea: true,
            bodyWidget: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: ListView(
                children: [
                  MypageActionButton(
                    iconData: Icons.feed_outlined,
                    text: "이용약관",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.webView,
                          arguments: WebViewScreenArguments(
                            url: "$webviewUrl/terms",
                            title: "이용약관",
                          ));
                    },
                  ),
                  MypageActionButton(
                    iconData: Icons.policy_outlined,
                    text: "개인정보 처리방침",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.webView,
                          arguments: WebViewScreenArguments(
                            url: "$webviewUrl/privacy",
                            title: "개인정보 처리방침",
                          ));
                    },
                  ),
                  MypageActionButton(
                    iconData: Icons.logout,
                    text: "로그아웃",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ConfirmDialog(
                            confirmText: "정말 로그아웃 하시겠습니까?",
                            leftButtonText: "로그아웃",
                            onLeftButtonPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEventSignout());
                            },
                            rightButtonText: "계속 이용하기",
                            onRightButtonPressed: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  ),
                  MypageActionButton(
                    iconData: Icons.sentiment_dissatisfied_outlined,
                    text: "회원탈퇴",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ConfirmDialog(
                            confirmText: "탈퇴 시 모든 계정정보가 삭제됩니다.\n정말 탈퇴하시겠습니까?",
                            leftButtonText: "탈퇴",
                            onLeftButtonPressed: () {
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEventWithdrawal());
                            },
                            rightButtonText: "계속 이용하기",
                            onRightButtonPressed: () {
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
