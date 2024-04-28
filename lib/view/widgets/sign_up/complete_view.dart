import 'package:cakeke/config/design_system/design_system.dart';
import 'package:cakeke/view/widgets/sign_up/profile_image_circle.dart';
import 'package:flutter/material.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({super.key, required this.imageName, required this.name});

  final String imageName;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileImageCircle(fileName: imageName),
          Padding(
            padding: const EdgeInsets.only(bottom: 49, top: 12),
            child: Text(
              name,
              style: DesignSystem.typography.title1(),
            ),
          ),
          Text(
            '케이크에크에 오신 것을\n환영합니다.',
            textAlign: TextAlign.center,
            style: DesignSystem.typography.heading1(),
          )
        ],
      ),
    );
  }
}
