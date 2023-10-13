import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomStrokeText extends StatelessWidget {
  final String text;
  final Color color;

  const CustomStrokeText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 200
                ..color = DesignSystem.colors.black),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
