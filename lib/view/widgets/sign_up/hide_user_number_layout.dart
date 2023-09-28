import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class HideUserNumberLayout extends StatelessWidget {
  const HideUserNumberLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < 6; index++)
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              '●',
              style: DesignSystem.typography.title3(TextStyle(
                  color: DesignSystem.colors.gray400,
                  fontWeight: FontWeight.w500)),
            ),
          ),
      ],
    );
  }
}
