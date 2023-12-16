import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.score,
  });

  final double score;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int index = 0; index < 5; index++)
          if (score >= index + 1)
            const Icon(
              Icons.star_rounded,
              size: 20,
              color: Colors.amber,
            )
          else if (score >= index + 0.5)
            const Icon(
              Icons.star_half_rounded,
              size: 20,
              color: Colors.amber,
            )
          else
            const Icon(
              Icons.star_outline_rounded,
              size: 20,
              color: Colors.amber,
            ),
      ],
    );
  }
}
