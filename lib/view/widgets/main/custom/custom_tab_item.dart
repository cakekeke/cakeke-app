import 'package:flutter/material.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({super.key, required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Tab(
        icon: Text(
      title,
    ));
  }
}
