import 'package:flutter/material.dart';

class DuplicationCheckIcon extends StatelessWidget {
  const DuplicationCheckIcon({
    super.key,
    required this.color,
    required this.isUnacceptable,
  });

  final Color color;
  final bool isUnacceptable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Icon(
        isUnacceptable ? Icons.cancel : Icons.check_circle,
        size: 16,
        color: color,
      ),
    );
  }
}
