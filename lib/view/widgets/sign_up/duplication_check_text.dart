import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/sign_up/duplication_check_icon.dart';
import 'package:flutter/material.dart';

class DuplicationCheckText extends StatelessWidget {
  const DuplicationCheckText(
      {super.key,
      required this.color,
      this.text = '영문, 숫자 포함 8자리 이상',
      this.isUnacceptable = false,
      this.isAfterDuplicationCheck = false});

  final Color color;
  final String text;
  final bool isUnacceptable;
  final bool isAfterDuplicationCheck;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: DesignSystem.typography
                  .title3(TextStyle(color: color, fontWeight: FontWeight.w500)),
            ),
            DuplicationCheckIcon(color: color, isUnacceptable: isUnacceptable)
          ],
        ));
  }
}
