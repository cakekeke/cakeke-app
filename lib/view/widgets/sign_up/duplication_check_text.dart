import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/sign_up/duplication_check_icon.dart';
import 'package:flutter/material.dart';

class DuplicationCheckText extends StatelessWidget {
  const DuplicationCheckText(
      {super.key,
      required this.color,
      this.isUnacceptable = false,
      this.isDuplicationId});

  final Color color;
  final bool isUnacceptable;
  final bool? isDuplicationId;

  @override
  Widget build(BuildContext context) {
    final availableId = (isDuplicationId != null && isDuplicationId == false);
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
                visible: availableId,
                child: DuplicationCheckIcon(
                  color: color,
                  isUnacceptable: isUnacceptable,
                  isLeftPadding: false,
                )),
            Text(
              availableId ? '사용 가능한 아이디입니다' : '영문, 숫자 포함 8자리 이상',
              style: DesignSystem.typography
                  .title3(TextStyle(color: color, fontWeight: FontWeight.w500)),
            ),
            Visibility(
                visible: !availableId,
                child: DuplicationCheckIcon(
                    color: color, isUnacceptable: isUnacceptable))
          ],
        ));
  }
}
