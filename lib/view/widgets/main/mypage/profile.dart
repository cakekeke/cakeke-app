import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.name,
    required this.profileFile,
  });

  final String name;
  final String profileFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(65),
            child: SvgPicture.asset(
              profileFile,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(34),
                  color: Color(0xffF3F3F3)),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff373737),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
