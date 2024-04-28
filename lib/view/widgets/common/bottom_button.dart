import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.buttonActive,
    required this.text,
    required this.onTap,
  });

  final bool buttonActive;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buttonActive ? onTap() : null,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 40, top: 12),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: ShapeDecoration(
          color: buttonActive
              ? DesignSystem.colors.appPrimary
              : DesignSystem.colors.backgroundDisabled,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: DesignSystem.typography.title1(TextStyle(
              color: buttonActive
                  ? DesignSystem.colors.white
                  : DesignSystem.colors.textTertiary,
              fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
