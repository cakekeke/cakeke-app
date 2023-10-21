import 'package:cakeke/blocs/sign_up/sign_up_bloc.dart';
import 'package:cakeke/blocs/sign_up/sign_up_event.dart';
import 'package:cakeke/blocs/sign_up/sign_up_state.dart';
import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/bottom_button.dart';
import 'package:cakeke/view/widgets/common/password_text_field.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/common/sign_text_field.dart';
import 'package:cakeke/view/widgets/sign_up/duplication_check_text.dart';
import 'package:cakeke/view/widgets/sign_up/hide_user_number_layout.dart';
import 'package:cakeke/view/widgets/sign_up/duplication_check_button.dart';
import 'package:cakeke/view/widgets/sign_up/profile_image_circle.dart';
import 'package:cakeke/view/widgets/sign_up/profile_list_view.dart';
import 'package:cakeke/view/widgets/sign_up/service_purpose_radio_layout.dart';
import 'package:cakeke/view/widgets/sign_up/visible_field_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SiginUpPage extends StatefulWidget {
  const SiginUpPage({super.key});

  @override
  State<SiginUpPage> createState() => _SiginUpPageState();
}

class _SiginUpPageState extends State<SiginUpPage> {
  int nowChapter = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
        appBarText: '회원가입',
        bodyWidget:
            BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
          return Column(
            children: [
              VisibleFieldLayout(
                  nowChapter: nowChapter,
                  thisChapter: 6,
                  leftPadding: 16,
                  fieldTitle: '프로필을 설정해주세요',
                  child: Column(
                    children: [
                      Container(
                          height: 130,
                          width: 130,
                          margin: const EdgeInsets.only(bottom: 15, top: 35),
                          child: ProfileImageCircle(index: state.profileId)),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        color: DesignSystem.colors.backgroundProfileList,
                        child: const ProfileListView(),
                      )
                    ],
                  )),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        VisibleFieldLayout(
                          nowChapter: nowChapter,
                          thisChapter: 5,
                          fieldTitle: '서비스 이용 목적을 알려주세요',
                          child: ServicePurposeRadioLayout(
                              selectPurpose: state.purpose,
                              onTap: (purpose) {
                                context
                                    .read<SignUpBloc>()
                                    .add(PurposeChangedEvent(purpose: purpose));
                              }),
                        ),
                        VisibleFieldLayout(
                            nowChapter: nowChapter,
                            thisChapter: 4,
                            fieldTitle: '생일과 성별을 알려주세요',
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 4,
                                  child: SignTextField(
                                    maxLength: 6,
                                    onChanged: (birth) {
                                      context
                                          .read<SignUpBloc>()
                                          .add(BirthChangedEvent(birth: birth));
                                    },
                                    hintText: '생년월일 입력',
                                    inputType: TextInputType.number,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Icon(
                                    Icons.remove,
                                    color: DesignSystem.colors.gray400,
                                  ),
                                ),
                                Flexible(
                                    child: SignTextField(
                                  maxLength: 1,
                                  onChanged: (gender) {
                                    context.read<SignUpBloc>().add(
                                        GenderChangedEvent(gender: gender));
                                  },
                                  inputType: TextInputType.number,
                                )),
                                const HideUserNumberLayout()
                              ],
                            )),
                        Visibility(
                          visible: nowChapter == 3,
                          child: VisibleFieldLayout(
                              nowChapter: nowChapter,
                              thisChapter: 3,
                              fieldTitle: '한 번 더 입력해 주세요',
                              child: PasswordTextField(
                                onChanged: (text, index) {
                                  context
                                      .read<SignUpBloc>()
                                      .add(RePasswordChangedEvent(
                                        index: index,
                                        rePassword: text,
                                      ));
                                },
                              )),
                        ),
                        VisibleFieldLayout(
                            nowChapter: nowChapter,
                            thisChapter: 2,
                            fieldTitle: '비밀번호를 만들어 주세요',
                            child: PasswordTextField(
                              enabled: nowChapter < 3,
                              onChanged: (text, index) {
                                context
                                    .read<SignUpBloc>()
                                    .add(PasswordChangedEvent(
                                      index: index,
                                      password: text,
                                    ));
                              },
                            )),
                        VisibleFieldLayout(
                          nowChapter: nowChapter,
                          thisChapter: 1,
                          fieldTitle: '아이디를 만들어 주세요',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: SignTextField(
                                      onChanged: (text) {
                                        context
                                            .read<SignUpBloc>()
                                            .add(IdChangedEvent(
                                              id: text,
                                            ));
                                      },
                                      enabled: nowChapter < 2,
                                      hintText: '아이디 입력',
                                    ),
                                  ),
                                  DuplicationCheckButton(
                                    onTap: () {
                                      context
                                          .read<SignUpBloc>()
                                          .add(const IdDuplicationCheck());
                                    },
                                    text: state.id,
                                  )
                                ],
                              ),
                              DuplicationCheckText(
                                color: state.isValidId == null
                                    ? DesignSystem.colors.textTertiary
                                    : (state.isValidId!
                                        ? DesignSystem.colors.allowedGreen
                                        : DesignSystem.colors.unacceptableRed),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomButton(
                buttonActive: state.isButtonActive,
                text: nowChapter <= 5 ? '다음' : '완료하기',
                onTap: () {
                  nowChapter++;
                  context
                      .read<SignUpBloc>()
                      .add(ButtonTapEvent(isLastSignLevel: nowChapter <= 6));
                },
              )
            ],
          );
        }));
  }
}
