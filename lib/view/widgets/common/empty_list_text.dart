import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class EmptyListText extends StatelessWidget {
  const EmptyListText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '목록이 비어있습니다.',
        style: DesignSystem.typography.body(TextStyle(
            color: DesignSystem.colors.gray400, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
