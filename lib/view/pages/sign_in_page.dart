import 'package:cakeke/blocs/sign_in/sign_in_bloc.dart';
import 'package:cakeke/blocs/sign_in/sign_in_state.dart';
import 'package:cakeke/view/widgets/common/bottom_button.dart';
import 'package:cakeke/view/widgets/common/password_text_field.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/common/sign_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiginInPage extends StatelessWidget {
  const SiginInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
        appBarText: '로그인',
        bodyWidget:
            BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
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
                          onChanged: (text) {},
                          autoFocus: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '비밀번호',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 12),
                        PasswordTextField(
                          autoFocus: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 38),
                  ],
                ),
              ),
              BottomButton(
                buttonActive: true,
                text: "다음",
                onTap: () {},
              )
            ],
          );
        }));
  }
}
