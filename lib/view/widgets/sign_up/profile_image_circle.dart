import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImageCircle extends StatelessWidget {
  const ProfileImageCircle({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: SvgPicture.asset(
        'assets/images/profile_icon_${index + 1}.svg',
        fit: BoxFit.cover,
      ),
    );
  }
}
