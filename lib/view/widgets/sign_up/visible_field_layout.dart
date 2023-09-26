import 'package:cakeke/view/widgets/common/sign_title_text.dart';
import 'package:flutter/material.dart';

class VisibleFieldLayout extends StatelessWidget {
  const VisibleFieldLayout({
    super.key,
    required this.nowChapter,
    required this.thisChapter,
    required this.fieldTitle,
    required this.child,
  });

  final int nowChapter;
  final int thisChapter;
  final String fieldTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: nowChapter >= thisChapter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SignTitleText(
            title: fieldTitle,
            nowChapter: nowChapter == thisChapter,
          ),
          child
        ],
      ),
    );
  }
}
