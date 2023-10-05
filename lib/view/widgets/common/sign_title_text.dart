import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class SignTitleText extends StatelessWidget {
  const SignTitleText({
    super.key,
    required this.title,
    required this.nowChapter,
  });

  final String title;
  final bool nowChapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38, bottom: 30),
      child: Text(
        title,
        style: nowChapter
            ? DesignSystem.typography.heading2()
            : DesignSystem.typography.title3(TextStyle(
                color: DesignSystem.colors.textSecondary,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
