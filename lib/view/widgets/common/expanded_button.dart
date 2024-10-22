import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton(
      {super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.expand_more,
              size: 24,
            )
          ],
        ));
  }
}
