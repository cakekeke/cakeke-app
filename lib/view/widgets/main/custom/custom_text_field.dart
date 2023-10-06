import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onSubmitted,
    required this.controller,
  });

  final Function(String) onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: TextField(
              decoration: InputDecoration(
                hintText: '원하는 문구를 입력해주세요.',
                hintStyle: DesignSystem.typography.body(TextStyle(
                    color: DesignSystem.colors.textSecondary,
                    fontWeight: FontWeight.w400)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                border: InputBorder.none,
              ),
              maxLines: 1,
              onSubmitted: onSubmitted,
              controller: controller,
            )),
      ],
    );
  }
}
