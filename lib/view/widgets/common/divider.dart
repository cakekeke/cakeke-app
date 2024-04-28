import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DesignSystem.colors.dividerCard,
            width: 1,
          ),
        ),
      ),
    );
  }
}
