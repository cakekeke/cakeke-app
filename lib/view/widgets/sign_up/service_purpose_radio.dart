import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class ServicePurposeRadio extends StatelessWidget {
  const ServicePurposeRadio({
    super.key,
    required this.index,
    required this.selectPurpose,
    required this.purpose,
    required this.onTap,
  });

  final int index;
  final String selectPurpose;
  final String purpose;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(purpose),
      child: Padding(
        padding: EdgeInsets.only(top: index != 0 ? 18 : 0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: selectPurpose == purpose
                      ? DesignSystem.colors.appPrimary
                      : DesignSystem.colors.gray100,
                  borderRadius: BorderRadius.circular(999),
                  border:
                      Border.all(color: DesignSystem.colors.white, width: 3)),
            ),
            Text(
              purpose,
              style: DesignSystem.typography.body2(),
            )
          ],
        ),
      ),
    );
  }
}
