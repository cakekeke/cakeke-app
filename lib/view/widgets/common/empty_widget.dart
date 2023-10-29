import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/common/empty.svg',
          width: 143,
          height: 162,
        ),
        const SizedBox(height: 32),
        Text(message ?? '데이터가 없습니다',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff797979),
            ))
      ],
    );
  }
}
