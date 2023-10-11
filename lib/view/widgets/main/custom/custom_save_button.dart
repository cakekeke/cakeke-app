import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: DesignSystem.colors.white,
          border: Border.all(width: 1, color: DesignSystem.colors.dividerTab),
          borderRadius: BorderRadius.circular(34),
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 10,
            )
          ],
        ),
        child: Text('저장',
            style: DesignSystem.typography
                .body(const TextStyle(fontWeight: FontWeight.w500))),
      ),
    );
  }
}
