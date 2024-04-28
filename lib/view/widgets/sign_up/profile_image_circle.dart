import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImageCircle extends StatelessWidget {
  const ProfileImageCircle({super.key, required this.fileName});

  final String fileName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: SvgPicture.asset(
        'assets/images/${fileName.isEmpty ? 'profile_icon_1.svg' : fileName}',
        fit: BoxFit.cover,
      ),
    );
  }
}
