import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class GrayElevatedButton extends StatelessWidget {
  const GrayElevatedButton(
      {super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: DesignSystem.colors.backgroundDisabled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(0, 44),
        elevation: 0,
      ),
      onPressed: () => onTap(),
      child: Text(
        title,
        style: DesignSystem.typography.title1(TextStyle(
            fontWeight: FontWeight.w700,
            color: DesignSystem.colors.textPrimary)),
      ),
    );
  }
}
