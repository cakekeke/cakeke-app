import 'package:cakeke/view/widgets/common/sign_title_text.dart';
import 'package:flutter/material.dart';

class VisibleFieldLayout extends StatelessWidget {
  const VisibleFieldLayout({
    super.key,
    this.leftPadding = 0,
    required this.nowChapter,
    required this.thisChapter,
    required this.fieldTitle,
    required this.child,
  });

  final int nowChapter;
  final int thisChapter;
  final double leftPadding;
  final String fieldTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: nowChapter < 6
          ? nowChapter >= thisChapter
          : nowChapter == thisChapter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: leftPadding),
            child: SignTitleText(
              title: fieldTitle,
              nowChapter: nowChapter == thisChapter,
            ),
          ),
          child
        ],
      ),
    );
  }
}
