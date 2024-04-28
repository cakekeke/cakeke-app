import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/data/models/sign_up/service_purpose.dart';
import 'package:flutter/material.dart';

class ServicePurposeRadioLayout extends StatelessWidget {
  const ServicePurposeRadioLayout({
    super.key,
    required this.selectPurpose,
    required this.purposeList,
    required this.onTap,
  });

  final String selectPurpose;
  final List<ServicePurpose> purposeList;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: DesignSystem.colors.backgroundDisabled,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            for (int index = 0; index < purposeList.length; index++)
              GestureDetector(
                onTap: () => onTap(purposeList[index].description),
                child: Padding(
                  padding: EdgeInsets.only(top: index != 0 ? 18 : 0),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color:
                                selectPurpose == purposeList[index].description
                                    ? DesignSystem.colors.appPrimary
                                    : DesignSystem.colors.gray100,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                                color: DesignSystem.colors.white, width: 3)),
                      ),
                      Text(
                        purposeList[index].description,
                        style: DesignSystem.typography.body2(),
                      )
                    ],
                  ),
                ),
              ),
          ],
        ));
  }
}
