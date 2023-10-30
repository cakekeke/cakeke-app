import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomTutorialText extends StatelessWidget {
  const CustomTutorialText(
      {super.key, required this.text, this.style, this.align});

  final String text;
  final TextStyle? style;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          DesignSystem.typography.body2(TextStyle(
            fontWeight: FontWeight.w400,
            color: DesignSystem.colors.white,
          )),
      textAlign: align,
    );
  }
}
