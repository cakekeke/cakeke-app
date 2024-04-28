import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.score,
    this.size = 20,
  });

  final double score;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < 5; index++)
          if (score >= index + 1)
            Icon(
              Icons.star_rounded,
              size: size,
              color: Colors.amber,
            )
          else if (score >= index + 0.5)
            Icon(
              Icons.star_half_rounded,
              size: size,
              color: Colors.amber,
            )
          else
            Icon(
              Icons.star_outline_rounded,
              size: size,
              color: Colors.amber,
            ),
      ],
    );
  }
}
