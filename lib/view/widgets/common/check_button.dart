import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  const CheckButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.value,
  });

  final Function()? onTap;
  final String text;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffF3F3F3),
                width: 3,
              ),
              color: value ? DesignSystem.colors.appPrimary : Colors.white,
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, height: 1.0),
          ),
        ],
      ),
    );
  }
}
