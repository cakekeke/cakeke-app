import 'package:flutter/material.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({
    super.key,
    required this.version,
  });

  final String version;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.phone_iphone,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
            child: Row(
          children: [
            const Text(
              "현재버전",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              version,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffC1C1C1)),
            ),
          ],
        )),
      ],
    );
  }
}
