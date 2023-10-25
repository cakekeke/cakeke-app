import 'package:cakeke/view/widgets/main/mypage/profile.dart';
import 'package:flutter/material.dart';

class MypageSubTitle extends StatelessWidget {
  const MypageSubTitle({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Container(
            height: 24,
            alignment: Alignment.centerLeft,
            child: const Text(
              "내 프로필",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Profile(name: name)
        ],
      ),
    );
  }
}
