import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class DuplicationCheckButton extends StatelessWidget {
  const DuplicationCheckButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: ShapeDecoration(
          color: text.isEmpty
              ? DesignSystem.colors.backgroundDisabled
              : DesignSystem.colors.appPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        child: Text(
          '중복확인',
          style: DesignSystem.typography.title3(TextStyle(
              color: text.isEmpty
                  ? DesignSystem.colors.textTertiary
                  : DesignSystem.colors.white,
              fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
