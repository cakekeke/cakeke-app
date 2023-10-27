import 'package:flutter/material.dart';

class ScaffoldMainAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ScaffoldMainAppbar({
    super.key,
    required this.appBarText,
  });

  final String appBarText;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 51,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          appBarText,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
