import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/data/arguments/webView.dart';
import 'package:cakeke/utils/webview.dart';
import 'package:cakeke/view/widgets/common/bottom_button.dart';
import 'package:cakeke/view/widgets/common/scaffold_layout.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final VoidCallback onPressed;

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  List<bool> checkBox = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      isSafeArea: true,
      bodyWidget: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.close,
                size: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              'assets/images/common/representative_character.png',
              width: 140,
              height: 140,
            ),
          ),
        ),
        Column(
          children: [
            CheckRow(
              isChecked: checkBox[1] && checkBox[2] && checkBox[3],
              text: '약관 전체 동의',
              onChanged: (value) {
                setState(() {
                  checkBox[1] = value;
                  checkBox[2] = value;
                  checkBox[3] = value;
                });
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 16,
              ),
              height: 1,
              color: const Color(0xFFEFEFEF),
            ),
            CheckRow(
              isChecked: checkBox[1],
              text: '개인정보 약관',
              isRequired: true,
              onChanged: (value) {
                setState(() {
                  checkBox[1] = value;
                });
              },
              url: "$webviewUrl/privacy",
            ),
            CheckRow(
              isChecked: checkBox[2],
              text: '서비스 이용약관',
              isRequired: true,
              onChanged: (value) {
                setState(() {
                  checkBox[2] = value;
                });
              },
              url: "$webviewUrl/terms",
            ),
            CheckRow(
              isChecked: checkBox[3],
              text: '위치기반 서비스 이용약관',
              isRequired: false,
              url: "$webviewUrl/location",
              onChanged: (value) {
                setState(() {
                  checkBox[3] = value;
                });
              },
            ),
          ],
        ),
        BottomButton(
          buttonActive: checkBox[1] && checkBox[2],
          text: widget.buttonText,
          onTap: widget.onPressed,
        )
      ]),
    );
  }
}

class CheckRow extends StatefulWidget {
  const CheckRow({
    super.key,
    required this.text,
    required this.onChanged,
    required this.isChecked,
    this.url,
    this.isRequired,
  });

  final String text;
  final Function(bool) onChanged;
  final String? url;
  final bool? isRequired;
  final bool isChecked;

  @override
  State<CheckRow> createState() => _CheckRowState();
}

class _CheckRowState extends State<CheckRow> {
  late bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.isChecked,
          checkColor: DesignSystem.colors.white,
          activeColor: DesignSystem.colors.appPrimary,
          side: const BorderSide(
            color: Color(0xffDBDBDB),
            width: 2,
          ),
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChanged(isChecked);
            });
          },
        ),
        Expanded(
            child: Text(widget.isRequired == null
                ? widget.text
                : "${widget.text} ${widget.isRequired! ? '(필수)' : '(선택)'}")),
        widget.url != null
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.webView,
                    arguments: WebViewScreenArguments(
                        url: widget.url!, title: widget.text),
                  );
                },
              )
            : Container()
      ],
    );
  }
}
