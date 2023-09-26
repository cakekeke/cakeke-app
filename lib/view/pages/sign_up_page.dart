import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/common/bottom_button.dart';
import 'package:cakeke/view/widgets/common/password_text_field.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:cakeke/view/widgets/common/sign_text_field.dart';
import 'package:cakeke/view/widgets/sign_up/service_purpose_radio.dart';
import 'package:cakeke/view/widgets/sign_up/visible_field_layout.dart';
import 'package:flutter/material.dart';

class SiginUpPage extends StatefulWidget {
  const SiginUpPage({super.key});

  @override
  State<SiginUpPage> createState() => _SiginUpPageState();
}

class _SiginUpPageState extends State<SiginUpPage> {
  final serviceUsePurpose = ["케이크 예약", "케이크 디자인 정보 탐색", "재미"];
  final _idTextController = TextEditingController();
  final _birthDateTextController = TextEditingController();
  final _genderDateTextController = TextEditingController();
  final _pwTextControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  int nowChapter = 1;
  String selectPurpose = '';
  bool nextButtonActive = false;

  void purposeOnTap(String purpose) {
    setState(() {
      selectPurpose = purpose;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      appBarText: '회원가입',
      bodyWidget: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    VisibleFieldLayout(
                        nowChapter: nowChapter,
                        thisChapter: 4,
                        fieldTitle: '서비스 이용 목적을 알려주세요',
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: DesignSystem.colors.backgroundDisabled,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              for (int index = 0;
                                  index < serviceUsePurpose.length;
                                  index++)
                                ServicePurposeRadio(
                                    index: index,
                                    selectPurpose: selectPurpose,
                                    purpose: serviceUsePurpose[index],
                                    onTap: purposeOnTap)
                            ],
                          ),
                        )),
                    VisibleFieldLayout(
                        nowChapter: nowChapter,
                        thisChapter: 3,
                        fieldTitle: '생일과 성별을 알려주세요',
                        child: Row(
                          children: [
                            Flexible(
                              flex: 4,
                              child: SignTextField(
                                textController: _birthDateTextController,
                                hintText: '생년월일 입력',
                                inputType: TextInputType.number,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(
                                Icons.remove,
                                color: DesignSystem.colors.gray400,
                              ),
                            ),
                            Flexible(
                                child: SignTextField(
                              textController: _genderDateTextController,
                              inputType: TextInputType.number,
                            )),
                            for (int index = 0; index < 6; index++)
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  '●',
                                  style: DesignSystem.typography.title3(
                                      TextStyle(
                                          color: DesignSystem.colors.gray400,
                                          fontWeight: FontWeight.w500)),
                                ),
                              )
                          ],
                        )),
                    VisibleFieldLayout(
                        nowChapter: nowChapter,
                        thisChapter: 2,
                        fieldTitle: '비밀번호를 만들어 주세요',
                        child: PasswordTextField(
                          contorllerList: _pwTextControllerList,
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
                                  textController: _idTextController,
                                  hintText: '아이디 입력',
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: ShapeDecoration(
                                  color: _idTextController.text.isEmpty
                                      ? DesignSystem.colors.backgroundDisabled
                                      : DesignSystem.colors.appPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                ),
                                child: Text(
                                  '중복확인',
                                  style: DesignSystem.typography.title3(
                                      TextStyle(
                                          color: _idTextController.text.isEmpty
                                              ? DesignSystem.colors.textTertiary
                                              : DesignSystem.colors.white,
                                          fontWeight: FontWeight.w700)),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '영문, 숫자 포함 8자리 이상',
                              style: DesignSystem.typography.title3(TextStyle(
                                  color: DesignSystem.colors.textTertiary,
                                  fontWeight: FontWeight.w500)),
                            ),
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
            buttonActive: nextButtonActive,
            text: '다음',
            onTap: () {
              setState(() {
                nowChapter++;
              });
              if (nowChapter < 6 && nextButtonActive) {
                setState(() {
                  nowChapter++;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
