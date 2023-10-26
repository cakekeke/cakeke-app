import 'package:cakeke/blocs/sign_in/sign_in_bloc.dart';
import 'package:cakeke/blocs/sign_in/sign_in_event.dart';
import 'package:cakeke/blocs/sign_in/sign_in_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/view/widgets/common/bottom_button.dart';
import 'package:cakeke/view/widgets/common/password_text_field.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/common/sign_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiginInPage extends StatelessWidget {
  SiginInPage({super.key});

  final passwordController = [
    for (int index = 0; index < 6; index++) TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
        appBarText: '로그인',
        isDetailPage: true,
        bodyWidget:
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
          if (state.loginSuccess == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<SignInBloc>().add(const LoginSucessEvent());
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.main, (route) => false);
            });
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const SizedBox(height: 38),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '아이디',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SignTextField(
                          hintText: "아이디 입력",
                          onChanged: (text) {
                            context
                                .read<SignInBloc>()
                                .add(IdChangedEvent(id: text));
                          },
                          autoFocus: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '비밀번호',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        PasswordTextField(
                          autoFocus: false,
                          controllerList: passwordController,
                          onChanged: (text, index) {
                            context.read<SignInBloc>().add(PasswordChangedEvent(
                                password: text, index: index));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                    if (state.loginFailure == true)
                      Center(
                        child: Text(
                          "아이디 혹은 비밀번호가 일치하지 않습니다.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: DesignSystem.colors.textError),
                        ),
                      )
                  ],
                ),
              ),
              BottomButton(
                buttonActive: state.isButtonActive,
                text: "다음",
                onTap: () {
                  context.read<SignInBloc>().add(LoginEvent(
                      id: state.id, password: state.password.join()));
                },
              )
            ],
          );
        }));
  }
}
