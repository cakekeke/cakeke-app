import 'package:flutter/material.dart';

class DuplicationCheckIcon extends StatelessWidget {
  const DuplicationCheckIcon({
    super.key,
    required this.color,
    required this.isUnacceptable,
    this.isLeftPadding = true,
  });

  final Color color;
  final bool isUnacceptable;
  final bool isLeftPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isLeftPadding ? 6 : 0,
      right: isLeftPadding ? 0 : 6),
      child: Icon(
        isUnacceptable ? Icons.cancel : Icons.check_circle,
        size: 16,
        color: color,
      ),
    );
  }
}
